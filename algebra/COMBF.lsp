
(SDEFUN |COMBF;factorial;2F;1| ((|x| (F)) (% (F)))
        (SPADCALL (QREFELT % 13) |x| (QREFELT % 23))) 

(SDEFUN |COMBF;binomial;3F;2| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 15) (LIST |x| |y|) (QREFELT % 26))) 

(SDEFUN |COMBF;permutation;3F;3| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 14) (LIST |x| |y|) (QREFELT % 26))) 

(SDEFUN |COMBF;^;3F;4| ((|x| (F)) (|y| (F)) (% (F)))
        (SPADCALL (QREFELT % 20) (LIST |x| |y|) (QREFELT % 26))) 

(SDEFUN |COMBF;belong?;BoB;5| ((|op| (|BasicOperator|)) (% (|Boolean|)))
        (SPADCALL |op| (QREFELT % 8) (QREFELT % 31))) 

(SDEFUN |COMBF;fourth| ((|l| (|List| F)) (% (F)))
        (SPADCALL (CDR |l|) (QREFELT % 34))) 

(SDEFUN |COMBF;dvpow1| ((|l| (|List| F)) (% (F)))
        (SPADCALL (SPADCALL |l| (QREFELT % 35))
                  (SPADCALL (|SPADfirst| |l|)
                            (SPADCALL (SPADCALL |l| (QREFELT % 35))
                                      (|spadConstant| % 36) (QREFELT % 37))
                            (QREFELT % 29))
                  (QREFELT % 38))) 

(SDEFUN |COMBF;factorials;2F;8| ((|x| (F)) (% (F)))
        (|COMBF;facts| |x| (SPADCALL |x| (QREFELT % 40)) %)) 

(SDEFUN |COMBF;factorials;FSF;9| ((|x| (F)) (|v| (|Symbol|)) (% (F)))
        (|COMBF;facts| |x| (LIST |v|) %)) 

(SDEFUN |COMBF;facts| ((|x| (F)) (|l| (|List| (|Symbol|))) (% (F)))
        (SPADCALL (|COMBF;smpfact| (SPADCALL |x| (QREFELT % 44)) |l| %)
                  (|COMBF;smpfact| (SPADCALL |x| (QREFELT % 45)) |l| %)
                  (QREFELT % 46))) 

(SDEFUN |COMBF;summand| ((|l| (|List| F)) (% (F)))
        (SPADCALL (|SPADfirst| |l|)
                  (SPADCALL (SPADCALL |l| (QREFELT % 35)) (QREFELT % 48))
                  (SPADCALL |l| (QREFELT % 34)) (QREFELT % 49))) 

(SDEFUN |COMBF;product;FSF;12| ((|x| (F)) (|i| (|Symbol|)) (% (F)))
        (SPROG ((|k| (|Kernel| F)) (|dm| (F)))
               (SEQ
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT % 50)) (QREFELT % 51)))
                (EXIT
                 (SPADCALL (QREFELT % 18)
                           (LIST
                            (SPADCALL |x|
                                      (LETT |k| (SPADCALL |i| (QREFELT % 53)))
                                      |dm| (QREFELT % 49))
                            |dm| (SPADCALL |k| (QREFELT % 54)))
                           (QREFELT % 26)))))) 

(SDEFUN |COMBF;summation;FSF;13| ((|x| (F)) (|i| (|Symbol|)) (% (F)))
        (SPROG ((|k| (|Kernel| F)) (|dm| (F)))
               (SEQ
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT % 50)) (QREFELT % 51)))
                (EXIT
                 (SPADCALL (QREFELT % 16)
                           (LIST
                            (SPADCALL |x|
                                      (LETT |k| (SPADCALL |i| (QREFELT % 53)))
                                      |dm| (QREFELT % 49))
                            |dm| (SPADCALL |k| (QREFELT % 54)))
                           (QREFELT % 26)))))) 

(SDEFUN |COMBF;dvsum| ((|l| (|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPADCALL (QREFELT % 16)
                  (LIST (SPADCALL (|SPADfirst| |l|) |x| (QREFELT % 57))
                        (SPADCALL |l| (QREFELT % 35))
                        (SPADCALL |l| (QREFELT % 34)))
                  (QREFELT % 26))) 

(SDEFUN |COMBF;dvdsum| ((|l| (|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPROG
         ((|dh| (F)) (|dg| (F)) (|dm| (F)) (|r1| (F)) (|h| (F)) (|g| (F))
          (|v| (F)) (|f| (F)) (|y| (F)))
         (SEQ
          (COND
           ((EQUAL |x|
                   (SPADCALL (LETT |y| (SPADCALL |l| (QREFELT % 34)))
                             (QREFELT % 58)))
            (|spadConstant| % 59))
           ('T
            (SEQ (LETT |f| (|SPADfirst| |l|))
                 (LETT |v| (SPADCALL |l| (QREFELT % 35)))
                 (LETT |g| (SPADCALL |l| 4 (QREFELT % 61)))
                 (LETT |h| (SPADCALL |l| 5 (QREFELT % 61)))
                 (LETT |r1|
                       (SPADCALL (QREFELT % 17)
                                 (LIST (SPADCALL |f| |x| (QREFELT % 57)) |v|
                                       |y| |g| |h|)
                                 (QREFELT % 26)))
                 (COND
                  ((OR
                    (SPADCALL |x| (SPADCALL |h| (QREFELT % 40)) (QREFELT % 62))
                    (SPADCALL |x| (SPADCALL |g| (QREFELT % 40))
                              (QREFELT % 62)))
                   (EXIT
                    (SEQ
                     (LETT |dm|
                           (SPADCALL (SPADCALL (QREFELT % 50)) (QREFELT % 51)))
                     (LETT |dg|
                           (SPADCALL (QREFELT % 22)
                                     (LIST
                                      (SPADCALL (QREFELT % 17)
                                                (LIST |f| |v| |y| |dm| |h|)
                                                (QREFELT % 26))
                                      |dm| |g|)
                                     (QREFELT % 63)))
                     (LETT |dh|
                           (SPADCALL (QREFELT % 22)
                                     (LIST
                                      (SPADCALL (QREFELT % 17)
                                                (LIST |f| |v| |y| |g| |dm|)
                                                (QREFELT % 26))
                                      |dm| |h|)
                                     (QREFELT % 63)))
                     (EXIT
                      (SPADCALL
                       (SPADCALL |r1|
                                 (SPADCALL (SPADCALL |g| |x| (QREFELT % 57))
                                           |dg| (QREFELT % 38))
                                 (QREFELT % 64))
                       (SPADCALL (SPADCALL |h| |x| (QREFELT % 57)) |dh|
                                 (QREFELT % 38))
                       (QREFELT % 64)))))))
                 (EXIT |r1|))))))) 

(SDEFUN |COMBF;dvprod| ((|l| (|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPROG ((|p| (F)) (|f| (F)) (|dm| (|Symbol|)))
               (SEQ
                (LETT |dm|
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT % 50)) (QREFELT % 51))
                       (QREFELT % 58)))
                (LETT |f|
                      (SPADCALL (|SPADfirst| |l|)
                                (SPADCALL (SPADCALL |l| (QREFELT % 35))
                                          (QREFELT % 48))
                                (SPADCALL |dm| (QREFELT % 51)) (QREFELT % 49)))
                (LETT |p| (SPADCALL |f| |dm| (QREFELT % 55)))
                (EXIT
                 (SPADCALL (QREFELT % 16)
                           (LIST
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|SPADfirst| |l|) |x| (QREFELT % 57))
                              (|SPADfirst| |l|) (QREFELT % 46))
                             |p| (QREFELT % 38))
                            (SPADCALL |l| (QREFELT % 35))
                            (SPADCALL |l| (QREFELT % 34)))
                           (QREFELT % 26)))))) 

(SDEFUN |COMBF;dvdprod| ((|l| (|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPROG ((|g| (F)) (|h| (F)) (|y| (F)))
               (COND
                ((EQUAL |x|
                        (SPADCALL (LETT |y| (SPADCALL |l| (QREFELT % 34)))
                                  (QREFELT % 58)))
                 (|spadConstant| % 59))
                ((OR
                  (SPADCALL |x|
                            (SPADCALL
                             (LETT |h|
                                   (SPADCALL (CDR (CDR |l|)) (QREFELT % 34)))
                             (QREFELT % 40))
                            (QREFELT % 62))
                  (SPADCALL |x|
                            (SPADCALL
                             (LETT |g| (SPADCALL (CDR |l|) (QREFELT % 34)))
                             (QREFELT % 40))
                            (QREFELT % 62)))
                 (|error|
                  "a product cannot be differentiated with respect to a bound"))
                ('T
                 (SPADCALL
                  (SPADCALL (QREFELT % 17)
                            (CONS
                             (SPADCALL
                              (SPADCALL (|SPADfirst| |l|) |x| (QREFELT % 57))
                              (|SPADfirst| |l|) (QREFELT % 46))
                             (CDR |l|))
                            (QREFELT % 26))
                  (SPADCALL (QREFELT % 19) |l| (QREFELT % 26))
                  (QREFELT % 38)))))) 

(SDEFUN |COMBF;dprod| ((|l| (|List| F)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL (|COMBF;summand| |l| %) (QREFELT % 66))
                  (SPADCALL (SPADCALL |l| (QREFELT % 34)) (QREFELT % 66))
                  (QREFELT % 67))) 

(SDEFUN |COMBF;ddprod| ((|l| (|List| F)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL (|COMBF;summand| |l| %) (QREFELT % 66))
                  (SPADCALL
                   (SPADCALL (SPADCALL |l| (QREFELT % 34)) (QREFELT % 66))
                   (SPADCALL (|COMBF;fourth| |l| %) (QREFELT % 66))
                   (QREFELT % 68))
                  (SPADCALL (|COMBF;fourth| (CDR |l|) %) (QREFELT % 66))
                  (QREFELT % 69))) 

(SDEFUN |COMBF;dsum| ((|l| (|List| F)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL (|COMBF;summand| |l| %) (QREFELT % 66))
                  (SPADCALL (SPADCALL |l| (QREFELT % 34)) (QREFELT % 66))
                  (QREFELT % 70))) 

(SDEFUN |COMBF;ddsum| ((|l| (|List| F)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL (|COMBF;summand| |l| %) (QREFELT % 66))
                  (SPADCALL
                   (SPADCALL (SPADCALL |l| (QREFELT % 34)) (QREFELT % 66))
                   (SPADCALL (|COMBF;fourth| |l| %) (QREFELT % 66))
                   (QREFELT % 68))
                  (SPADCALL (|COMBF;fourth| (CDR |l|) %) (QREFELT % 66))
                  (QREFELT % 71))) 

(SDEFUN |COMBF;equalsumprod|
        ((|s1| (|Kernel| F)) (|s2| (|Kernel| F)) (% (|Boolean|)))
        (SPROG ((|l2| #1=(|List| F)) (|l1| #1#))
               (SEQ (LETT |l1| (SPADCALL |s1| (QREFELT % 72)))
                    (LETT |l2| (SPADCALL |s2| (QREFELT % 72)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (|SPADfirst| |l1|)
                                (SPADCALL (SPADCALL |l1| (QREFELT % 35))
                                          (QREFELT % 48))
                                (SPADCALL |l2| (QREFELT % 35)) (QREFELT % 49))
                      (|SPADfirst| |l2|) (QREFELT % 73)))))) 

(SDEFUN |COMBF;equaldsumprod|
        ((|s1| (|Kernel| F)) (|s2| (|Kernel| F)) (% (|Boolean|)))
        (SPROG ((|l2| #1=(|List| F)) (|l1| #1#))
               (SEQ (LETT |l1| (SPADCALL |s1| (QREFELT % 72)))
                    (LETT |l2| (SPADCALL |s2| (QREFELT % 72)))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL (CDR |l1|) (QREFELT % 34))
                                 (SPADCALL (CDR |l2|) (QREFELT % 34))
                                 (QREFELT % 73))
                       (COND
                        ((SPADCALL (SPADCALL (CDR (CDR |l1|)) (QREFELT % 34))
                                   (SPADCALL (CDR (CDR |l2|)) (QREFELT % 34))
                                   (QREFELT % 73))
                         (SPADCALL
                          (SPADCALL (|SPADfirst| |l1|)
                                    (SPADCALL (SPADCALL |l1| (QREFELT % 35))
                                              (QREFELT % 48))
                                    (SPADCALL |l2| (QREFELT % 35))
                                    (QREFELT % 49))
                          (|SPADfirst| |l2|) (QREFELT % 73)))
                        (#2='T NIL)))
                      (#2# NIL)))))) 

(SDEFUN |COMBF;product;FSbF;24| ((|x| (F)) (|s| (|SegmentBinding| F)) (% (F)))
        (SPROG ((|dm| (F)) (|k| (|Kernel| F)))
               (SEQ
                (LETT |k|
                      (SPADCALL (SPADCALL |s| (QREFELT % 75)) (QREFELT % 53)))
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT % 50)) (QREFELT % 51)))
                (EXIT
                 (SPADCALL (QREFELT % 19)
                           (LIST (SPADCALL |x| |k| |dm| (QREFELT % 49)) |dm|
                                 (SPADCALL |k| (QREFELT % 54))
                                 (SPADCALL (SPADCALL |s| (QREFELT % 77))
                                           (QREFELT % 78))
                                 (SPADCALL (SPADCALL |s| (QREFELT % 77))
                                           (QREFELT % 79)))
                           (QREFELT % 26)))))) 

(SDEFUN |COMBF;summation;FSbF;25|
        ((|x| (F)) (|s| (|SegmentBinding| F)) (% (F)))
        (SPROG ((|dm| (F)) (|k| (|Kernel| F)))
               (SEQ
                (LETT |k|
                      (SPADCALL (SPADCALL |s| (QREFELT % 75)) (QREFELT % 53)))
                (LETT |dm| (SPADCALL (SPADCALL (QREFELT % 50)) (QREFELT % 51)))
                (EXIT
                 (SPADCALL (QREFELT % 17)
                           (LIST (SPADCALL |x| |k| |dm| (QREFELT % 49)) |dm|
                                 (SPADCALL |k| (QREFELT % 54))
                                 (SPADCALL (SPADCALL |s| (QREFELT % 77))
                                           (QREFELT % 78))
                                 (SPADCALL (SPADCALL |s| (QREFELT % 77))
                                           (QREFELT % 79)))
                           (QREFELT % 26)))))) 

(SDEFUN |COMBF;smpfact|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (|l| (|List| (|Symbol|))) (% (F)))
        (SPROG NIL
               (SPADCALL (CONS #'|COMBF;smpfact!0| (VECTOR % |l|)) (ELT % 82)
                         |p| (QREFELT % 87)))) 

(SDEFUN |COMBF;smpfact!0| ((|x| NIL) ($$ NIL))
        (PROG (|l| %)
          (LETT |l| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|COMBF;K2fact| |x| |l| %))))) 

(SDEFUN |COMBF;K2fact| ((|k| (|Kernel| F)) (|l| (|List| (|Symbol|))) (% (F)))
        (SPROG
         ((|p| (F)) (|n| (F)) (|args| (|List| F)) (#1=#:G200 NIL) (|a| NIL)
          (#2=#:G199 NIL) (#3=#:G198 NIL) (|kf| (F)) (|v| NIL) (#4=#:G197 NIL))
         (SEQ
          (COND
           ((OR
             (NULL
              (PROGN
               (LETT #4# NIL)
               (SEQ (LETT |v| NIL)
                    (LETT #3#
                          (SPADCALL (LETT |kf| (SPADCALL |k| (QREFELT % 54)))
                                    (QREFELT % 40)))
                    G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL |v| |l| (QREFELT % 62))
                        (LETT #4# (CONS |v| #4#))))))
                    (LETT #3# (CDR #3#)) (GO G190) G191
                    (EXIT (NREVERSE #4#)))))
             (NULL
              (LETT |args|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |a| NIL)
                          (LETT #1# (SPADCALL |k| (QREFELT % 72))) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (|COMBF;facts| |a| |l| %) #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))))
            |kf|)
           ((SPADCALL |k| (QREFELT % 14) (QREFELT % 88))
            (SPADCALL (SPADCALL (LETT |n| (|SPADfirst| |args|)) (QREFELT % 24))
                      (SPADCALL
                       (SPADCALL |n| (SPADCALL |args| (QREFELT % 35))
                                 (QREFELT % 37))
                       (QREFELT % 24))
                      (QREFELT % 46)))
           ((SPADCALL |k| (QREFELT % 15) (QREFELT % 88))
            (SEQ (LETT |n| (|SPADfirst| |args|))
                 (LETT |p| (SPADCALL |args| (QREFELT % 35)))
                 (EXIT
                  (SPADCALL (SPADCALL |n| (QREFELT % 24))
                            (SPADCALL (SPADCALL |p| (QREFELT % 24))
                                      (SPADCALL
                                       (SPADCALL |n| |p| (QREFELT % 37))
                                       (QREFELT % 24))
                                      (QREFELT % 38))
                            (QREFELT % 46)))))
           ('T
            (SPADCALL (SPADCALL |k| (QREFELT % 89)) |args| (QREFELT % 26))))))) 

(SDEFUN |COMBF;operator;2Bo;28|
        ((|op| (|BasicOperator|)) (% (|BasicOperator|)))
        (COND ((SPADCALL |op| '|factorial| (QREFELT % 90)) (QREFELT % 13))
              ((SPADCALL |op| '|permutation| (QREFELT % 90)) (QREFELT % 14))
              ((SPADCALL |op| '|binomial| (QREFELT % 90)) (QREFELT % 15))
              ((SPADCALL |op| '|summation| (QREFELT % 90)) (QREFELT % 16))
              ((SPADCALL |op| '|%defsum| (QREFELT % 90)) (QREFELT % 17))
              ((SPADCALL |op| '|product| (QREFELT % 90)) (QREFELT % 18))
              ((SPADCALL |op| '|%defprod| (QREFELT % 90)) (QREFELT % 19))
              ((SPADCALL |op| '|%power| (QREFELT % 90)) (QREFELT % 20))
              ('T (|error| "Not a combinatorial operator")))) 

(SDEFUN |COMBF;iprod| ((|l| (|List| F)) (% (F)))
        (COND
         ((SPADCALL (|SPADfirst| |l|) (QREFELT % 92)) (|spadConstant| % 59))
         ((SPADCALL (|SPADfirst| |l|) (|spadConstant| % 36) (QREFELT % 73))
          (|spadConstant| % 36))
         ('T (SPADCALL (QREFELT % 18) |l| (QREFELT % 63))))) 

(SDEFUN |COMBF;isum| ((|l| (|List| F)) (% (F)))
        (COND
         ((SPADCALL (|SPADfirst| |l|) (QREFELT % 92)) (|spadConstant| % 59))
         ('T (SPADCALL (QREFELT % 16) |l| (QREFELT % 63))))) 

(SDEFUN |COMBF;idprod| ((|l| (|List| F)) (% (F)))
        (COND
         ((SPADCALL (SPADCALL (SPADCALL |l| (QREFELT % 35)) (QREFELT % 58))
                    (SPADCALL (|SPADfirst| |l|) (QREFELT % 40)) (QREFELT % 62))
          (SPADCALL (QREFELT % 19) |l| (QREFELT % 63)))
         ('T
          (SPADCALL (|SPADfirst| |l|)
                    (SPADCALL
                     (SPADCALL (|COMBF;fourth| (CDR |l|) %)
                               (|COMBF;fourth| |l| %) (QREFELT % 37))
                     (|spadConstant| % 36) (QREFELT % 64))
                    (QREFELT % 29))))) 

(SDEFUN |COMBF;idsum| ((|l| (|List| F)) (% (F)))
        (COND
         ((SPADCALL (SPADCALL (SPADCALL |l| (QREFELT % 35)) (QREFELT % 58))
                    (SPADCALL (|SPADfirst| |l|) (QREFELT % 40)) (QREFELT % 62))
          (SPADCALL (QREFELT % 17) |l| (QREFELT % 63)))
         ('T
          (SPADCALL (|SPADfirst| |l|)
                    (SPADCALL
                     (SPADCALL (|COMBF;fourth| (CDR |l|) %)
                               (|COMBF;fourth| |l| %) (QREFELT % 37))
                     (|spadConstant| % 36) (QREFELT % 64))
                    (QREFELT % 38))))) 

(SDEFUN |COMBF;ifact| ((|x| (F)) (% (F)))
        (COND
         ((OR (SPADCALL |x| (QREFELT % 92))
              (SPADCALL |x| (|spadConstant| % 36) (QREFELT % 73)))
          (|spadConstant| % 36))
         ('T (SPADCALL (QREFELT % 13) |x| (QREFELT % 94))))) 

(SDEFUN |COMBF;ibinom| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G226 NIL) (|p| (F)) (|n| (F)))
               (SEQ
                (EXIT
                 (SEQ (LETT |n| (|SPADfirst| |l|))
                      (SEQ (LETT |p| (SPADCALL |l| (QREFELT % 35)))
                           (EXIT
                            (COND
                             ((OR
                               (SPADCALL |p| (|spadConstant| % 59)
                                         (QREFELT % 73))
                               (SPADCALL |p| |n| (QREFELT % 73)))
                              (PROGN
                               (LETT #1# (|spadConstant| % 36))
                               (GO #2=#:G224))))))
                      (COND
                       ((OR (SPADCALL |p| (|spadConstant| % 36) (QREFELT % 73))
                            (SPADCALL |p|
                                      (SPADCALL |n| (|spadConstant| % 36)
                                                (QREFELT % 37))
                                      (QREFELT % 73)))
                        (EXIT |n|)))
                      (EXIT (SPADCALL (QREFELT % 15) |l| (QREFELT % 63)))))
                #2# (EXIT #1#)))) 

(SDEFUN |COMBF;iperm| ((|l| (|List| F)) (% (F)))
        (COND
         ((SPADCALL (SPADCALL |l| (QREFELT % 35)) (QREFELT % 92))
          (|spadConstant| % 36))
         ('T (SPADCALL (QREFELT % 14) |l| (QREFELT % 63))))) 

(SDEFUN |COMBF;iidsum;LF;36| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((#1=#:G239 NIL) (#2=#:G238 (F)) (#3=#:G240 (F)) (#4=#:G244 NIL)
          (|i| NIL) (#5=#:G243 NIL) (|k| (|Union| (|Kernel| F) #6="failed"))
          (|r2| #7=(|Union| (|Integer|) #6#)) (|r1| #7#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |r1| (SPADCALL (|COMBF;fourth| |l| %) (QREFELT % 97)))
                 (EXIT
                  (COND
                   ((QEQCAR |r1| 1)
                    (PROGN (LETT #5# (|COMBF;idsum| |l| %)) (GO #8=#:G241)))
                   (#9='T
                    (SEQ
                     (LETT |r2|
                           (SPADCALL (|COMBF;fourth| (CDR |l|) %)
                                     (QREFELT % 97)))
                     (EXIT
                      (COND
                       ((QEQCAR |r2| 1)
                        (PROGN (LETT #5# (|COMBF;idsum| |l| %)) (GO #8#)))
                       (#9#
                        (SEQ
                         (LETT |k|
                               (SPADCALL (SPADCALL |l| (QREFELT % 35))
                                         (QREFELT % 99)))
                         (EXIT
                          (COND
                           ((QEQCAR |k| 1)
                            (PROGN
                             (LETT #5# (|COMBF;idsum| |l| %))
                             (GO #8#))))))))))))))
            (EXIT
             (PROGN
              (LETT #1# NIL)
              (SEQ (LETT |i| (QCDR |r1|)) (LETT #4# (QCDR |r2|)) G190
                   (COND ((> |i| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3#
                            (SPADCALL (|SPADfirst| |l|) (QCDR |k|)
                                      (SPADCALL |i| (QREFELT % 100))
                                      (QREFELT % 49)))
                      (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 64))))
                            ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#9# (|spadConstant| % 59)))))))
          #8# (EXIT #5#)))) 

(SDEFUN |COMBF;iidprod;LF;37| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((#1=#:G255 NIL) (#2=#:G254 (F)) (#3=#:G256 (F)) (#4=#:G260 NIL)
          (|i| NIL) (#5=#:G259 NIL) (|k| (|Union| (|Kernel| F) #6="failed"))
          (|r2| #7=(|Union| (|Integer|) #6#)) (|r1| #7#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |r1| (SPADCALL (|COMBF;fourth| |l| %) (QREFELT % 97)))
                 (EXIT
                  (COND
                   ((QEQCAR |r1| 1)
                    (PROGN (LETT #5# (|COMBF;idprod| |l| %)) (GO #8=#:G257)))
                   (#9='T
                    (SEQ
                     (LETT |r2|
                           (SPADCALL (|COMBF;fourth| (CDR |l|) %)
                                     (QREFELT % 97)))
                     (EXIT
                      (COND
                       ((QEQCAR |r2| 1)
                        (PROGN (LETT #5# (|COMBF;idprod| |l| %)) (GO #8#)))
                       (#9#
                        (SEQ
                         (LETT |k|
                               (SPADCALL (SPADCALL |l| (QREFELT % 35))
                                         (QREFELT % 99)))
                         (EXIT
                          (COND
                           ((QEQCAR |k| 1)
                            (PROGN
                             (LETT #5# (|COMBF;idprod| |l| %))
                             (GO #8#))))))))))))))
            (EXIT
             (PROGN
              (LETT #1# NIL)
              (SEQ (LETT |i| (QCDR |r1|)) (LETT #4# (QCDR |r2|)) G190
                   (COND ((> |i| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #3#
                            (SPADCALL (|SPADfirst| |l|) (QCDR |k|)
                                      (SPADCALL |i| (QREFELT % 100))
                                      (QREFELT % 49)))
                      (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 38))))
                            ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) (#9# (|spadConstant| % 36)))))))
          #8# (EXIT #5#)))) 

(SDEFUN |COMBF;iiipow| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|r| (|Union| (|Fraction| (|Integer|)) "failed")) (|y| (F))
          (|rec|
           (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|)))
            "failed"))
          (|x| (F)))
         (SEQ
          (LETT |u|
                (SPADCALL (LETT |x| (|SPADfirst| |l|)) '|exp| (QREFELT % 105)))
          (EXIT
           (COND ((QEQCAR |u| 1) (SPADCALL (QREFELT % 20) |l| (QREFELT % 63)))
                 (#1='T
                  (SEQ (LETT |rec| (QCDR |u|))
                       (LETT |y|
                             (|SPADfirst|
                              (SPADCALL (QCAR |rec|) (QREFELT % 72))))
                       (LETT |r| (SPADCALL |y| (QREFELT % 107)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1)
                          (SPADCALL (QREFELT % 20) |l| (QREFELT % 63)))
                         (#1#
                          (SPADCALL (SPADCALL (QCAR |rec|) (QREFELT % 89))
                                    (SPADCALL
                                     (SPADCALL (QCDR |rec|) |y|
                                               (QREFELT % 108))
                                     (SPADCALL |l| (QREFELT % 35))
                                     (QREFELT % 38))
                                    (QREFELT % 23)))))))))))) 

(SDEFUN |COMBF;ipow;LF;39| ((|l| (|List| F)) (% (F)))
        (SPROG ((|r| (|Union| (|Fraction| (|Integer|)) "failed")))
               (SEQ
                (LETT |r|
                      (SPADCALL (SPADCALL |l| (QREFELT % 35)) (QREFELT % 107)))
                (EXIT
                 (COND ((QEQCAR |r| 1) (|COMBF;iiipow| |l| %))
                       ('T
                        (SPADCALL (|SPADfirst| |l|) (QCDR |r|)
                                  (QREFELT % 110)))))))) 

(SDEFUN |COMBF;ipow;LF;40| ((|l| (|List| F)) (% (F)))
        (SPROG ((|r| (|Union| (|Integer|) "failed")))
               (SEQ
                (LETT |r|
                      (SPADCALL (SPADCALL |l| (QREFELT % 35)) (QREFELT % 97)))
                (EXIT
                 (COND ((QEQCAR |r| 1) (|COMBF;iiipow| |l| %))
                       ('T
                        (SPADCALL (|SPADfirst| |l|) (QCDR |r|)
                                  (QREFELT % 112)))))))) 

(SDEFUN |COMBF;ipow;LF;41| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((#1=#:G294 NIL) (|y| (F))
          (|rec|
           (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|)))
            "failed"))
          (|n| (F)) (|x| (F)))
         (SEQ
          (COND
           ((SPADCALL (LETT |x| (|SPADfirst| |l|)) (QREFELT % 92))
            (COND
             ((SPADCALL (SPADCALL |l| (QREFELT % 35)) (QREFELT % 92))
              (|error| "0 ^ 0"))
             (#2='T (|spadConstant| % 59))))
           ((OR (SPADCALL |x| (|spadConstant| % 36) (QREFELT % 73))
                (SPADCALL (LETT |n| (SPADCALL |l| (QREFELT % 35)))
                          (QREFELT % 92)))
            (|spadConstant| % 36))
           ('T
            (COND ((SPADCALL |n| (|spadConstant| % 36) (QREFELT % 73)) |x|)
                  (#2#
                   (SEQ (LETT |u| (SPADCALL |x| '|exp| (QREFELT % 105)))
                        (EXIT
                         (COND
                          ((QEQCAR |u| 1)
                           (SPADCALL (QREFELT % 20) |l| (QREFELT % 63)))
                          (#2#
                           (SEQ
                            (EXIT
                             (SEQ (LETT |rec| (QCDR |u|))
                                  (SEQ
                                   (LETT |y|
                                         (|SPADfirst|
                                          (SPADCALL (QCAR |rec|)
                                                    (QREFELT % 72))))
                                   (EXIT
                                    (COND
                                     ((OR
                                       (SPADCALL |y| (|spadConstant| % 36)
                                                 (QREFELT % 73))
                                       (SPADCALL |y|
                                                 (SPADCALL
                                                  (|spadConstant| % 36)
                                                  (QREFELT % 113))
                                                 (QREFELT % 73)))
                                      (PROGN
                                       (LETT #1#
                                             (SPADCALL
                                              (SPADCALL (QCAR |rec|)
                                                        (QREFELT % 89))
                                              (SPADCALL
                                               (SPADCALL (QCDR |rec|) |y|
                                                         (QREFELT % 108))
                                               |n| (QREFELT % 38))
                                              (QREFELT % 23)))
                                       (GO #3=#:G289))))))
                                  (EXIT
                                   (SPADCALL (QREFELT % 20) |l|
                                             (QREFELT % 63)))))
                            #3# (EXIT #1#))))))))))))) 

(SDEFUN |COMBF;iifact;2F;42| ((|x| (F)) (% (F)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 115)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (|COMBF;ifact| |x| %))
                           ('T
                            (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 116))
                                      (QREFELT % 82)))))))) 

(SDEFUN |COMBF;iiperm;LF;43| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G307 NIL) (|r2| #2=(|Union| R "failed")) (|r1| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r1| (SPADCALL (|SPADfirst| |l|) (QREFELT % 115)))
                       (EXIT
                        (COND
                         ((QEQCAR |r1| 1)
                          (PROGN
                           (LETT #1# (|COMBF;iperm| |l| %))
                           (GO #3=#:G305)))
                         ('T
                          (SEQ
                           (LETT |r2|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 35))
                                           (QREFELT % 115)))
                           (EXIT
                            (COND
                             ((QEQCAR |r2| 1)
                              (PROGN
                               (LETT #1# (|COMBF;iperm| |l| %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r1|) (QCDR |r2|) (QREFELT % 118))
                             (QREFELT % 82)))))
                #3# (EXIT #1#)))) 

(SDEFUN |COMBF;iibinom;LF;44| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((#1=#:G328 NIL) (|r2| #2=(|Union| R #3="failed")) (|r1| #2#)
          (|ans| (F)) (#4=#:G330 NIL) (|i| NIL) (|t| (|Union| (|Integer|) #3#))
          (|s| #2#) (#5=#:G329 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |s|
                   (SPADCALL (SPADCALL |l| (QREFELT % 35)) (QREFELT % 115)))
             (EXIT
              (COND
               ((QEQCAR |s| 0)
                (SEQ (LETT |t| (SPADCALL (QCDR |s|) (QREFELT % 120)))
                     (EXIT
                      (COND
                       ((QEQCAR |t| 0)
                        (COND
                         ((> (QCDR |t|) 0)
                          (PROGN
                           (LETT #1#
                                 (SEQ (LETT |ans| (|spadConstant| % 36))
                                      (SEQ (LETT |i| 0)
                                           (LETT #5# (- (QCDR |t|) 1)) G190
                                           (COND
                                            ((|greater_SI| |i| #5#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT |ans|
                                                   (SPADCALL |ans|
                                                             (SPADCALL
                                                              (|SPADfirst| |l|)
                                                              (SPADCALL
                                                               (SPADCALL |i|
                                                                         (QREFELT
                                                                          %
                                                                          121))
                                                               (QREFELT % 82))
                                                              (QREFELT % 37))
                                                             (QREFELT % 38)))))
                                           (LETT |i| (|inc_SI| |i|)) (GO G190)
                                           G191 (EXIT NIL))
                                      (EXIT
                                       (SPADCALL
                                        (SPADCALL 1
                                                  (SPADCALL (QCDR |t|)
                                                            (QREFELT % 122))
                                                  (QREFELT % 123))
                                        |ans| (QREFELT % 124)))))
                           (GO #6=#:G326))))))))))))
            (SEQ
             (LETT |s|
                   (SPADCALL
                    (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 35))
                              (QREFELT % 37))
                    (QREFELT % 115)))
             (EXIT
              (COND
               ((QEQCAR |s| 0)
                (SEQ (LETT |t| (SPADCALL (QCDR |s|) (QREFELT % 120)))
                     (EXIT
                      (COND
                       ((QEQCAR |t| 0)
                        (COND
                         ((> (QCDR |t|) 0)
                          (PROGN
                           (LETT #1#
                                 (SEQ (LETT |ans| (|spadConstant| % 36))
                                      (SEQ (LETT |i| 1) (LETT #4# (QCDR |t|))
                                           G190
                                           (COND
                                            ((|greater_SI| |i| #4#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT |ans|
                                                   (SPADCALL |ans|
                                                             (SPADCALL
                                                              (SPADCALL |l|
                                                                        (QREFELT
                                                                         % 35))
                                                              (SPADCALL
                                                               (SPADCALL |i|
                                                                         (QREFELT
                                                                          %
                                                                          121))
                                                               (QREFELT % 82))
                                                              (QREFELT % 64))
                                                             (QREFELT % 38)))))
                                           (LETT |i| (|inc_SI| |i|)) (GO G190)
                                           G191 (EXIT NIL))
                                      (EXIT
                                       (SPADCALL
                                        (SPADCALL 1
                                                  (SPADCALL (QCDR |t|)
                                                            (QREFELT % 122))
                                                  (QREFELT % 123))
                                        |ans| (QREFELT % 124)))))
                           (GO #6#))))))))))))
            (SEQ (LETT |r1| (SPADCALL (|SPADfirst| |l|) (QREFELT % 115)))
                 (EXIT
                  (COND
                   ((QEQCAR |r1| 1)
                    (PROGN (LETT #1# (|COMBF;ibinom| |l| %)) (GO #6#)))
                   ('T
                    (SEQ
                     (LETT |r2|
                           (SPADCALL (SPADCALL |l| (QREFELT % 35))
                                     (QREFELT % 115)))
                     (EXIT
                      (COND
                       ((QEQCAR |r2| 1)
                        (PROGN
                         (LETT #1# (|COMBF;ibinom| |l| %))
                         (GO #6#))))))))))
            (EXIT
             (SPADCALL (SPADCALL (QCDR |r1|) (QCDR |r2|) (QREFELT % 125))
                       (QREFELT % 82)))))
          #6# (EXIT #1#)))) 

(SDEFUN |COMBF;iibinom;LF;45| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G338 NIL) (|r2| #2=(|Union| R "failed")) (|r1| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r1| (SPADCALL (|SPADfirst| |l|) (QREFELT % 115)))
                       (EXIT
                        (COND
                         ((QEQCAR |r1| 1)
                          (PROGN
                           (LETT #1# (|COMBF;ibinom| |l| %))
                           (GO #3=#:G336)))
                         ('T
                          (SEQ
                           (LETT |r2|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 35))
                                           (QREFELT % 115)))
                           (EXIT
                            (COND
                             ((QEQCAR |r2| 1)
                              (PROGN
                               (LETT #1# (|COMBF;ibinom| |l| %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r1|) (QCDR |r2|) (QREFELT % 125))
                             (QREFELT % 82)))))
                #3# (EXIT #1#)))) 

(SDEFUN |COMBF;iibinom;LF;46| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G346 NIL) (|r2| #2=(|Union| R "failed")) (|r1| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r1| (SPADCALL (|SPADfirst| |l|) (QREFELT % 115)))
                       (EXIT
                        (COND
                         ((QEQCAR |r1| 1)
                          (PROGN
                           (LETT #1# (|COMBF;ibinom| |l| %))
                           (GO #3=#:G344)))
                         ('T
                          (SEQ
                           (LETT |r2|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 35))
                                           (QREFELT % 115)))
                           (EXIT
                            (COND
                             ((QEQCAR |r2| 1)
                              (PROGN
                               (LETT #1# (|COMBF;ibinom| |l| %))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r1|) (QCDR |r2|) (QREFELT % 125))
                             (QREFELT % 82)))))
                #3# (EXIT #1#)))) 

(SDEFUN |COMBF;iifact;2F;47| ((|x| (F)) (% (F))) (|COMBF;ifact| |x| %)) 

(SDEFUN |COMBF;iibinom;LF;48| ((|l| (|List| F)) (% (F))) (|COMBF;ibinom| |l| %)) 

(SDEFUN |COMBF;iiperm;LF;49| ((|l| (|List| F)) (% (F))) (|COMBF;iperm| |l| %)) 

(SDEFUN |COMBF;iipow;LF;50| ((|l| (|List| F)) (% (F)))
        (SPROG ((#1=#:G357 NIL) (|r2| #2=(|Union| R "failed")) (|r1| #2#))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |r1| (SPADCALL (|SPADfirst| |l|) (QREFELT % 115)))
                       (EXIT
                        (COND
                         ((QEQCAR |r1| 1)
                          (PROGN
                           (LETT #1# (SPADCALL |l| (QREFELT % 111)))
                           (GO #3=#:G355)))
                         ('T
                          (SEQ
                           (LETT |r2|
                                 (SPADCALL (SPADCALL |l| (QREFELT % 35))
                                           (QREFELT % 115)))
                           (EXIT
                            (COND
                             ((QEQCAR |r2| 1)
                              (PROGN
                               (LETT #1# (SPADCALL |l| (QREFELT % 111)))
                               (GO #3#))))))))))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |r1|) (QCDR |r2|) (QREFELT % 127))
                             (QREFELT % 82)))))
                #3# (EXIT #1#)))) 

(SDEFUN |COMBF;iipow;LF;51| ((|l| (|List| F)) (% (F)))
        (SPADCALL |l| (QREFELT % 111))) 

(SDEFUN |COMBF;dvpow2| ((|l| (|List| F)) (% (F)))
        (COND
         ((SPADCALL (|SPADfirst| |l|) (QREFELT % 92)) (|spadConstant| % 59))
         ('T
          (SPADCALL (SPADCALL (|SPADfirst| |l|) (QREFELT % 129))
                    (SPADCALL (|SPADfirst| |l|) (SPADCALL |l| (QREFELT % 35))
                              (QREFELT % 29))
                    (QREFELT % 38))))) 

(DECLAIM (NOTINLINE |CombinatorialFunction;|)) 

(DEFUN |CombinatorialFunction| (&REST #1=#:G412)
  (SPROG NIL
         (PROG (#2=#:G413)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|CombinatorialFunction|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |CombinatorialFunction;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|CombinatorialFunction|)))))))))) 

(DEFUN |CombinatorialFunction;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|CombinatorialFunction| DV$1 DV$2))
          (LETT % (GETREFV 139))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CombinatorialFunction|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8 '|comb|)
          (QSETREFV % 13 (SPADCALL '|factorial| (QREFELT % 12)))
          (QSETREFV % 14 (SPADCALL '|permutation| (QREFELT % 12)))
          (QSETREFV % 15 (SPADCALL '|binomial| (QREFELT % 12)))
          (QSETREFV % 16 (SPADCALL '|summation| (QREFELT % 12)))
          (QSETREFV % 17 (SPADCALL '|%defsum| (QREFELT % 12)))
          (QSETREFV % 18 (SPADCALL '|product| (QREFELT % 12)))
          (QSETREFV % 19 (SPADCALL '|%defprod| (QREFELT % 12)))
          (QSETREFV % 20 (SPADCALL '|%power| (QREFELT % 12)))
          (QSETREFV % 22
                    (SPADCALL (SPADCALL '|%diff| (QREFELT % 12))
                              (QREFELT % 21)))
          (COND
           ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
            (PROGN
             (QSETREFV % 101
                       (CONS (|dispatchFunction| |COMBF;iidsum;LF;36|) %))
             (QSETREFV % 102
                       (CONS (|dispatchFunction| |COMBF;iidprod;LF;37|) %))
             (COND
              ((|HasCategory| |#2| '(|RadicalCategory|))
               (QSETREFV % 111
                         (CONS (|dispatchFunction| |COMBF;ipow;LF;39|) %)))
              ('T
               (QSETREFV % 111
                         (CONS (|dispatchFunction| |COMBF;ipow;LF;40|) %))))))
           ('T
            (QSETREFV % 111 (CONS (|dispatchFunction| |COMBF;ipow;LF;41|) %))))
          (COND
           ((|HasCategory| |#1| '(|CombinatorialFunctionCategory|))
            (PROGN
             (QSETREFV % 117
                       (CONS (|dispatchFunction| |COMBF;iifact;2F;42|) %))
             (QSETREFV % 119
                       (CONS (|dispatchFunction| |COMBF;iiperm;LF;43|) %))
             (COND
              ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
               (COND
                ((|HasCategory| |#2| '(|Algebra| (|Fraction| (|Integer|))))
                 (QSETREFV % 126
                           (CONS (|dispatchFunction| |COMBF;iibinom;LF;44|)
                                 %)))
                ('T
                 (QSETREFV % 126
                           (CONS (|dispatchFunction| |COMBF;iibinom;LF;45|)
                                 %)))))
              ('T
               (QSETREFV % 126
                         (CONS (|dispatchFunction| |COMBF;iibinom;LF;46|)
                               %))))))
           ('T
            (PROGN
             (QSETREFV % 117
                       (CONS (|dispatchFunction| |COMBF;iifact;2F;47|) %))
             (QSETREFV % 126
                       (CONS (|dispatchFunction| |COMBF;iibinom;LF;48|) %))
             (QSETREFV % 119
                       (CONS (|dispatchFunction| |COMBF;iiperm;LF;49|) %)))))
          (COND
           ((|HasCategory| |#1| '(|ElementaryFunctionCategory|))
            (QSETREFV % 128 (CONS (|dispatchFunction| |COMBF;iipow;LF;50|) %)))
           ('T
            (QSETREFV % 128
                      (CONS (|dispatchFunction| |COMBF;iipow;LF;51|) %))))
          (SPADCALL (QREFELT % 13) (ELT % 117) (QREFELT % 132))
          (SPADCALL (QREFELT % 20) (ELT % 128) (QREFELT % 134))
          (SPADCALL (QREFELT % 14) (ELT % 119) (QREFELT % 134))
          (SPADCALL (QREFELT % 15) (ELT % 126) (QREFELT % 134))
          (SPADCALL (QREFELT % 16) (CONS (|function| |COMBF;isum|) %)
                    (QREFELT % 134))
          (SPADCALL (QREFELT % 17) (ELT % 101) (QREFELT % 134))
          (SPADCALL (QREFELT % 18) (CONS (|function| |COMBF;iprod|) %)
                    (QREFELT % 134))
          (SPADCALL (QREFELT % 19) (ELT % 102) (QREFELT % 134))
          (SPADCALL (QREFELT % 20)
                    (LIST (CONS (|function| |COMBF;dvpow1|) %)
                          (CONS (|function| |COMBF;dvpow2|) %))
                    (QREFELT % 136))
          (SPADCALL (QREFELT % 16) '|%specialDiff|
                    (CONS (|function| |COMBF;dvsum|) %) (QREFELT % 138))
          (SPADCALL (QREFELT % 17) '|%specialDiff|
                    (CONS (|function| |COMBF;dvdsum|) %) (QREFELT % 138))
          (SPADCALL (QREFELT % 18) '|%specialDiff|
                    (CONS (|function| |COMBF;dvprod|) %) (QREFELT % 138))
          (SPADCALL (QREFELT % 19) '|%specialDiff|
                    (CONS (|function| |COMBF;dvdprod|) %) (QREFELT % 138))
          (SPADCALL (QREFELT % 16) '|%specialDisp|
                    (CONS (|function| |COMBF;dsum|) %) (QREFELT % 138))
          (SPADCALL (QREFELT % 17) '|%specialDisp|
                    (CONS (|function| |COMBF;ddsum|) %) (QREFELT % 138))
          (SPADCALL (QREFELT % 18) '|%specialDisp|
                    (CONS (|function| |COMBF;dprod|) %) (QREFELT % 138))
          (SPADCALL (QREFELT % 19) '|%specialDisp|
                    (CONS (|function| |COMBF;ddprod|) %) (QREFELT % 138))
          (SPADCALL (QREFELT % 16) '|%specialEqual|
                    (CONS (|function| |COMBF;equalsumprod|) %) (QREFELT % 138))
          (SPADCALL (QREFELT % 17) '|%specialEqual|
                    (CONS (|function| |COMBF;equaldsumprod|) %)
                    (QREFELT % 138))
          (SPADCALL (QREFELT % 18) '|%specialEqual|
                    (CONS (|function| |COMBF;equalsumprod|) %) (QREFELT % 138))
          (SPADCALL (QREFELT % 19) '|%specialEqual|
                    (CONS (|function| |COMBF;equaldsumprod|) %)
                    (QREFELT % 138))
          %))) 

(MAKEPROP '|CombinatorialFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'COMB
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              '|opfact| '|opperm| '|opbinom| '|opsum| '|opdsum| '|opprod|
              '|opdprod| '|oppow| (5 . |operator|) '|opdiff| (10 . |elt|)
              |COMBF;factorial;2F;1| (|List| %) (16 . |elt|)
              |COMBF;binomial;3F;2| |COMBF;permutation;3F;3| |COMBF;^;3F;4|
              (|Boolean|) (22 . |has?|) |COMBF;belong?;BoB;5| (|List| 7)
              (28 . |third|) (33 . |second|) (38 . |One|) (42 . -) (48 . *)
              (|List| 10) (54 . |variables|) |COMBF;factorials;2F;8|
              |COMBF;factorials;FSF;9| (|SparseMultivariatePolynomial| 6 47)
              (59 . |numer|) (64 . |denom|) (69 . /) (|Kernel| %)
              (75 . |retract|) (80 . |eval|) (87 . |new|) (91 . |coerce|)
              (|Kernel| 7) (96 . |kernel|) (101 . |coerce|)
              |COMBF;product;FSF;12| |COMBF;summation;FSF;13|
              (106 . |differentiate|) (112 . |retract|) (117 . |Zero|)
              (|Integer|) (121 . |elt|) (127 . |member?|) (133 . |kernel|)
              (139 . +) (|OutputForm|) (145 . |coerce|) (150 . |prod|)
              (156 . =) (162 . |prod|) (169 . |sum|) (175 . |sum|)
              (182 . |argument|) (187 . =) (|SegmentBinding| 7)
              (193 . |variable|) (|Segment| 7) (198 . |segment|) (203 . |low|)
              (208 . |high|) |COMBF;product;FSbF;24| |COMBF;summation;FSbF;25|
              (213 . |coerce|) (|Mapping| 7 52) (|Mapping| 7 6)
              (|SparseMultivariatePolynomial| 6 52)
              (|PolynomialCategoryLifting| (|IndexedExponents| 52) 52 6 85 7)
              (218 . |map|) (225 . |is?|) (231 . |operator|) (236 . |is?|)
              |COMBF;operator;2Bo;28| (242 . |zero?|) (247 . |One|)
              (251 . |kernel|) (257 . |Zero|) (|Union| 60 '#1="failed")
              (261 . |retractIfCan|) (|Union| 47 '#1#) (266 . |retractIfCan|)
              (271 . |coerce|) (276 . |iidsum|) (281 . |iidprod|)
              (|Record| (|:| |var| 47) (|:| |exponent| 60))
              (|Union| 103 '"failed") (286 . |isExpt|) (|Union| 109 '#1#)
              (292 . |retractIfCan|) (297 . *) (|Fraction| 60) (303 . ^)
              (309 . |ipow|) (314 . ^) (320 . -) (|Union| 6 '#1#)
              (325 . |retractIfCan|) (330 . |factorial|) (335 . |iifact|)
              (340 . |permutation|) (346 . |iiperm|) (351 . |retractIfCan|)
              (356 . |coerce|) (361 . |factorial|) (366 . /) (372 . *)
              (378 . |binomial|) (384 . |iibinom|) (389 . ^) (395 . |iipow|)
              (400 . |log|) (|Mapping| 7 7) (|BasicOperatorFunctions1| 7)
              (405 . |evaluate|) (|Mapping| 7 33) (411 . |evaluate|)
              (|List| 133) (417 . |derivative|) (|None|) (423 . |setProperty|))
           '#(|summation| 430 |product| 442 |permutation| 454 |operator| 460
              |ipow| 465 |iipow| 470 |iiperm| 475 |iifact| 480 |iidsum| 485
              |iidprod| 490 |iibinom| 495 |factorials| 500 |factorial| 511
              |binomial| 516 |belong?| 522 ^ 527)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|belong?| ((|Boolean|) (|BasicOperator|))) T)
                              '((|operator|
                                 ((|BasicOperator|) (|BasicOperator|)))
                                T)
                              '((^ (|#2| |#2| |#2|)) T)
                              '((|binomial| (|#2| |#2| |#2|)) T)
                              '((|permutation| (|#2| |#2| |#2|)) T)
                              '((|factorial| (|#2| |#2|)) T)
                              '((|factorials| (|#2| |#2|)) T)
                              '((|factorials| (|#2| |#2| (|Symbol|))) T)
                              '((|summation| (|#2| |#2| (|Symbol|))) T)
                              '((|summation|
                                 (|#2| |#2| (|SegmentBinding| |#2|)))
                                T)
                              '((|product| (|#2| |#2| (|Symbol|))) T)
                              '((|product| (|#2| |#2| (|SegmentBinding| |#2|)))
                                T)
                              '((|iifact| (|#2| |#2|)) T)
                              '((|iibinom| (|#2| (|List| |#2|))) T)
                              '((|iiperm| (|#2| (|List| |#2|))) T)
                              '((|iipow| (|#2| (|List| |#2|))) T)
                              '((|iidsum| (|#2| (|List| |#2|))) T)
                              '((|iidprod| (|#2| (|List| |#2|))) T)
                              '((|ipow| (|#2| (|List| |#2|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 138
                                            '(1 11 9 10 12 1 7 9 9 21 2 7 0 9 0
                                              23 2 7 0 9 25 26 2 9 30 0 10 31 1
                                              33 7 0 34 1 33 7 0 35 0 7 0 36 2
                                              7 0 0 0 37 2 7 0 0 0 38 1 7 39 0
                                              40 1 7 43 0 44 1 7 43 0 45 2 7 0
                                              0 0 46 1 7 47 0 48 3 7 0 0 47 0
                                              49 0 10 0 50 1 7 0 10 51 1 52 0
                                              10 53 1 7 0 47 54 2 7 0 0 10 57 1
                                              7 10 0 58 0 7 0 59 2 33 7 0 60 61
                                              2 39 30 10 0 62 2 7 0 9 25 63 2 7
                                              0 0 0 64 1 7 65 0 66 2 65 0 0 0
                                              67 2 65 0 0 0 68 3 65 0 0 0 0 69
                                              2 65 0 0 0 70 3 65 0 0 0 0 71 1
                                              52 33 0 72 2 7 30 0 0 73 1 74 10
                                              0 75 1 74 76 0 77 1 76 7 0 78 1
                                              76 7 0 79 1 7 0 6 82 3 86 7 83 84
                                              85 87 2 52 30 0 9 88 1 52 9 0 89
                                              2 9 30 0 10 90 1 7 30 0 92 0 6 0
                                              93 2 7 0 9 0 94 0 6 0 95 1 7 96 0
                                              97 1 7 98 0 99 1 7 0 60 100 1 0 7
                                              33 101 1 0 7 33 102 2 7 104 0 10
                                              105 1 7 106 0 107 2 7 0 60 0 108
                                              2 7 0 0 109 110 1 0 7 33 111 2 7
                                              0 0 60 112 1 7 0 0 113 1 7 114 0
                                              115 1 6 0 0 116 1 0 7 7 117 2 6 0
                                              0 0 118 1 0 7 33 119 1 6 96 0 120
                                              1 6 0 60 121 1 60 0 0 122 2 109 0
                                              60 60 123 2 7 0 109 0 124 2 6 0 0
                                              0 125 1 0 7 33 126 2 6 0 0 0 127
                                              1 0 7 33 128 1 7 0 0 129 2 131 9
                                              9 130 132 2 131 9 9 133 134 2 131
                                              9 9 135 136 3 9 0 0 10 137 138 2
                                              0 7 7 10 56 2 0 7 7 74 81 2 0 7 7
                                              10 55 2 0 7 7 74 80 2 0 7 7 7 28
                                              1 0 9 9 91 1 0 7 33 111 1 0 7 33
                                              128 1 0 7 33 119 1 0 7 7 117 1 0
                                              7 33 101 1 0 7 33 102 1 0 7 33
                                              126 1 0 7 7 41 2 0 7 7 10 42 1 0
                                              7 7 24 2 0 7 7 7 27 1 0 30 9 32 2
                                              0 7 7 7 29)))))
           '|lookupComplete|)) 
