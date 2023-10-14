
(SDEFUN |INTPAR2;prim?| ((|k| |Kernel| F) (|x| |Symbol|) ($ |Boolean|))
        (COND ((SPADCALL |k| '|log| (QREFELT $ 13)) 'T)
              ('T
               (SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 8)
                         (QREFELT $ 16))))) 

(SDEFUN |INTPAR2;csolve2|
        ((|m| |Matrix| F) ($ |List| (|Vector| (|Fraction| (|Integer|)))))
        (SPROG ((|v| (|Vector| F)) (|n| (|NonNegativeInteger|)))
               (SEQ (LETT |n| (ANROWS |m|) . #1=(|INTPAR2;csolve2|))
                    (LETT |v| (MAKEARR1 |n| (|spadConstant| $ 18)) . #1#)
                    (EXIT (QCDR (SPADCALL |m| |v| (QREFELT $ 24))))))) 

(SDEFUN |INTPAR2;primlogextint|
        ((|x| |Symbol|) (|k| |Kernel| F) (|l| |List| (|Kernel| F))
         (|lg| |List| F)
         ($ |Record| (|:| |logands| (|List| F))
          (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
        (SPROG
         ((#1=#:G163 NIL) (|le| NIL) (#2=#:G162 NIL)
          (|bl| #3=(|List| (|Vector| (|Fraction| (|Integer|)))))
          (|ll| #4=(|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|#G11|
           (|Record|
            (|:| |logands|
                 (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
          (#5=#:G161 NIL) (|g| NIL) (#6=#:G160 NIL)
          (|uf|
           (|Mapping| (|Factored| (|SparseUnivariatePolynomial| F))
                      (|SparseUnivariatePolynomial| F)))
          (|der|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|d1| (|Mapping| F F))
          (|rec|
           (|Mapping| (|Record| (|:| |logands| #4#) (|:| |basis| #3#))
                      (|List| (|SparseUnivariatePolynomial| F))))
          (|rec1|
           (|Mapping|
            (|Record| (|:| |logands| (|List| F))
                      (|:| |basis|
                           (|List| (|Vector| (|Fraction| (|Integer|))))))
            (|List| F))))
         (SEQ
          (LETT |rec1| (CONS #'|INTPAR2;primlogextint!0| (VECTOR $ |l| |x|))
                . #7=(|INTPAR2;primlogextint|))
          (LETT |rec| (CONS #'|INTPAR2;primlogextint!1| (VECTOR |rec1| $))
                . #7#)
          (LETT |d1| (CONS #'|INTPAR2;primlogextint!2| (VECTOR $ |x|)) . #7#)
          (LETT |der|
                (CONS #'|INTPAR2;primlogextint!3| (VECTOR |x| $ |k| |d1|))
                . #7#)
          (LETT |uf| (ELT $ 44) . #7#)
          (PROGN
           (LETT |#G11|
                 (SPADCALL |der| |uf| (CONS (|function| |INTPAR2;csolve2|) $)
                           |rec|
                           (PROGN
                            (LETT #6# NIL . #7#)
                            (SEQ (LETT |g| NIL . #7#) (LETT #5# |lg| . #7#)
                                 G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT |g| (CAR #5#) . #7#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #6#
                                         (CONS
                                          (SPADCALL |g| |k| (QREFELT $ 46))
                                          #6#)
                                         . #7#)))
                                 (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                                 (EXIT (NREVERSE #6#))))
                           (QREFELT $ 51))
                 . #7#)
           (LETT |ll| (QCAR |#G11|) . #7#)
           (LETT |bl| (QCDR |#G11|) . #7#)
           |#G11|)
          (EXIT
           (CONS
            (PROGN
             (LETT #2# NIL . #7#)
             (SEQ (LETT |le| NIL . #7#) (LETT #1# |ll| . #7#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |le| (CAR #1#) . #7#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |le| |k| (QREFELT $ 54)) #2#)
                          . #7#)))
                  (LETT #1# (CDR #1#) . #7#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            |bl|))))) 

(SDEFUN |INTPAR2;primlogextint!3| ((|x1| NIL) ($$ NIL))
        (PROG (|d1| |k| $ |x|)
          (LETT |d1| (QREFELT $$ 3) . #1=(|INTPAR2;primlogextint|))
          (LETT |k| (QREFELT $$ 2) . #1#)
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| |d1|
                      (SPADCALL
                       (SPADCALL (SPADCALL |k| (QREFELT $ 37)) |x|
                                 (QREFELT $ 35))
                       (QREFELT $ 39))
                      (QREFELT $ 41)))))) 

(SDEFUN |INTPAR2;primlogextint!2| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTPAR2;primlogextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 35)))))) 

(SDEFUN |INTPAR2;primlogextint!1| ((|lg2| NIL) ($$ NIL))
        (PROG ($ |rec1|)
          (LETT $ (QREFELT $$ 1) . #1=(|INTPAR2;primlogextint|))
          (LETT |rec1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |lg2| (CONS (|function| |INTPAR2;csolve2|) $) |rec1|
                      (QREFELT $ 34)))))) 

(SDEFUN |INTPAR2;primlogextint!0| ((|lg1| NIL) ($$ NIL))
        (PROG (|x| |l| $)
          (LETT |x| (QREFELT $$ 2) . #1=(|INTPAR2;primlogextint|))
          (LETT |l| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |l| |lg1| (QREFELT $ 28)))))) 

(SDEFUN |INTPAR2;explogextint1|
        ((|lg| |List| (|SparseUnivariatePolynomial| F)) (|eta| F)
         (|rec1| |Mapping|
          (|Record| (|:| |logands| (|List| F))
                    (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
          (|List| F))
         ($ |Record|
          (|:| |logands|
               (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
        (SPROG
         ((|ll1| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|bl| (|List| (|Vector| (|Fraction| (|Integer|)))))
          (|ll| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|#G17|
           (|Record|
            (|:| |logands|
                 (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
          (|lg1| (|List| (|SparseUnivariatePolynomial| F))))
         (SEQ
          (LETT |lg1|
                (SPADCALL |lg| (SPADCALL |eta| (QREFELT $ 39)) (QREFELT $ 55))
                . #1=(|INTPAR2;explogextint1|))
          (PROGN
           (LETT |#G17|
                 (SPADCALL |lg1| (CONS (|function| |INTPAR2;csolve2|) $) |rec1|
                           (QREFELT $ 34))
                 . #1#)
           (LETT |ll| (QCAR |#G17|) . #1#)
           (LETT |bl| (QCDR |#G17|) . #1#)
           |#G17|)
          (LETT |ll1|
                (CONS
                 (SPADCALL (SPADCALL (|spadConstant| $ 57) 1 (QREFELT $ 59))
                           (QREFELT $ 60))
                 |ll|)
                . #1#)
          (EXIT (CONS |ll1| |bl|))))) 

(SDEFUN |INTPAR2;explogextint|
        ((|x| |Symbol|) (|k| |Kernel| F) (|l| |List| (|Kernel| F))
         (|lg| |List| F)
         ($ |Record| (|:| |logands| (|List| F))
          (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
        (SPROG
         ((#1=#:G187 NIL) (|le| NIL) (#2=#:G186 NIL)
          (|bl| (|List| (|Vector| (|Fraction| (|Integer|)))))
          (|ll| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|#G22|
           (|Record|
            (|:| |logands|
                 (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
          (#3=#:G185 NIL) (|g| NIL) (#4=#:G184 NIL)
          (|uf|
           (|Mapping| (|Factored| (|SparseUnivariatePolynomial| F))
                      (|SparseUnivariatePolynomial| F)))
          (|rec|
           (|Mapping|
            (|Record|
             (|:| |logands|
                  (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
             (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|))))))
            (|List| (|SparseUnivariatePolynomial| F))))
          (|rec1|
           (|Mapping|
            (|Record| (|:| |logands| (|List| F))
                      (|:| |basis|
                           (|List| (|Vector| (|Fraction| (|Integer|))))))
            (|List| F)))
          (|der|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|d1| (|Mapping| F F)) (|eta| (F)))
         (SEQ
          (LETT |eta|
                (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT $ 61))) |x|
                          (QREFELT $ 35))
                . #5=(|INTPAR2;explogextint|))
          (LETT |d1| (CONS #'|INTPAR2;explogextint!0| (VECTOR $ |x|)) . #5#)
          (LETT |der| (CONS #'|INTPAR2;explogextint!1| (VECTOR $ |eta| |d1|))
                . #5#)
          (LETT |rec1| (CONS #'|INTPAR2;explogextint!2| (VECTOR $ |l| |x|))
                . #5#)
          (LETT |rec| (CONS #'|INTPAR2;explogextint!3| (VECTOR $ |rec1| |eta|))
                . #5#)
          (LETT |uf| (ELT $ 44) . #5#)
          (PROGN
           (LETT |#G22|
                 (SPADCALL |der| |uf| (CONS (|function| |INTPAR2;csolve2|) $)
                           |rec|
                           (PROGN
                            (LETT #4# NIL . #5#)
                            (SEQ (LETT |g| NIL . #5#) (LETT #3# |lg| . #5#)
                                 G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT |g| (CAR #3#) . #5#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #4#
                                         (CONS
                                          (SPADCALL |g| |k| (QREFELT $ 46))
                                          #4#)
                                         . #5#)))
                                 (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                 (EXIT (NREVERSE #4#))))
                           (QREFELT $ 51))
                 . #5#)
           (LETT |ll| (QCAR |#G22|) . #5#)
           (LETT |bl| (QCDR |#G22|) . #5#)
           |#G22|)
          (EXIT
           (CONS
            (PROGN
             (LETT #2# NIL . #5#)
             (SEQ (LETT |le| NIL . #5#) (LETT #1# |ll| . #5#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |le| (CAR #1#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |le| |k| (QREFELT $ 54)) #2#)
                          . #5#)))
                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            |bl|))))) 

(SDEFUN |INTPAR2;explogextint!3| ((|lg2| NIL) ($$ NIL))
        (PROG (|eta| |rec1| $)
          (LETT |eta| (QREFELT $$ 2) . #1=(|INTPAR2;explogextint|))
          (LETT |rec1| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTPAR2;explogextint1| |lg2| |eta| |rec1| $))))) 

(SDEFUN |INTPAR2;explogextint!2| ((|lg1| NIL) ($$ NIL))
        (PROG (|x| |l| $)
          (LETT |x| (QREFELT $$ 2) . #1=(|INTPAR2;explogextint|))
          (LETT |l| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |l| |lg1| (QREFELT $ 28)))))) 

(SDEFUN |INTPAR2;explogextint!1| ((|x1| NIL) ($$ NIL))
        (PROG (|d1| |eta| $)
          (LETT |d1| (QREFELT $$ 2) . #1=(|INTPAR2;explogextint|))
          (LETT |eta| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| |d1|
                      (SPADCALL |eta| (|spadConstant| $ 62) (QREFELT $ 59))
                      (QREFELT $ 41)))))) 

(SDEFUN |INTPAR2;explogextint!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTPAR2;explogextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 35)))))) 

(SDEFUN |INTPAR2;alglogextint|
        ((|x| |Symbol|) (|k| |Kernel| F) (|l| |List| (|Kernel| F))
         (|lg| |List| F)
         ($ |Record| (|:| |logands| (|List| F))
          (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
        (SPROG NIL
               (COND
                ((SPADCALL (CONS #'|INTPAR2;alglogextint!0| (VECTOR $ |k|))
                           |lg| (QREFELT $ 69))
                 (SPADCALL |x| |l| |lg| (QREFELT $ 28)))
                ('T (|error| "alglogextint: unimplemented"))))) 

(SDEFUN |INTPAR2;alglogextint!0| ((|g| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1) . #1=(|INTPAR2;alglogextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |k| (SPADCALL |g| (QREFELT $ 64)) (QREFELT $ 65))
              (|spadConstant| $ 66))
             ('T (|spadConstant| $ 67))))))) 

(SDEFUN |INTPAR2;logextint;SLLR;7|
        ((|x| |Symbol|) (|l| |List| (|Kernel| F)) (|lg| |List| F)
         ($ |Record| (|:| |logands| (|List| F))
          (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
        (SPROG
         ((#1=#:G212 NIL) (|k1| NIL) (#2=#:G211 NIL) (|k| (|Kernel| F))
          (|cb| (|List| (|Vector| (|Fraction| (|Integer|))))))
         (SEQ
          (COND
           ((NULL |l|)
            (SEQ
             (LETT |cb|
                   (|INTPAR2;csolve2| (SPADCALL (LIST |lg|) (QREFELT $ 71)) $)
                   . #3=(|INTPAR2;logextint;SLLR;7|))
             (EXIT (CONS NIL |cb|))))
           (#4='T
            (SEQ (LETT |k| (SPADCALL |l| (QREFELT $ 73)) . #3#)
                 (LETT |l|
                       (PROGN
                        (LETT #2# NIL . #3#)
                        (SEQ (LETT |k1| NIL . #3#) (LETT #1# |l| . #3#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |k1| (CAR #1#) . #3#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |k1| |k| (QREFELT $ 74))
                                 (LETT #2# (CONS |k1| #2#) . #3#)))))
                             (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       . #3#)
                 (COND
                  ((OR (QEQCAR (SPADCALL |k| (QREFELT $ 76)) 0)
                       (|INTPAR2;prim?| |k| |x| $))
                   (EXIT (|INTPAR2;primlogextint| |x| |k| |l| |lg| $))))
                 (EXIT
                  (COND
                   ((SPADCALL |k| '|exp| (QREFELT $ 13))
                    (|INTPAR2;explogextint| |x| |k| |l| |lg| $))
                   ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 9)
                              (QREFELT $ 16))
                    (|INTPAR2;alglogextint| |x| |k| |l| |lg| $))
                   (#4# (|error| "logextint: unhandled kernel")))))))))) 

(SDEFUN |INTPAR2;extendedint;FSLR;8|
        ((|f| F) (|x| |Symbol|) (|lg| |List| F)
         ($ |Record|
          (|:| |particular|
               (|Union|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))
                "failed"))
          (|:| |basis|
               (|List|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))))
        (SPROG ((|l| (|List| (|Kernel| F))))
               (SEQ
                (LETT |l|
                      (SPADCALL
                       (SPADCALL
                        (CONS (SPADCALL |x| (QREFELT $ 77)) (CONS |f| |lg|))
                        (QREFELT $ 79))
                       |x| (QREFELT $ 80))
                      |INTPAR2;extendedint;FSLR;8|)
                (EXIT (SPADCALL |f| |x| |l| |lg| (QREFELT $ 84)))))) 

(SDEFUN |INTPAR2;extendedint;SLLL;9|
        ((|x| |Symbol|) (|l| |List| (|Kernel| F)) (|lg| |List| F)
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G234 NIL) (|k1| NIL) (#2=#:G233 NIL) (|k| (|Kernel| F))
          (#3=#:G232 NIL) (|kv| NIL) (#4=#:G231 NIL)
          (|cb| (|List| (|Vector| F))))
         (SEQ
          (COND
           ((NULL |l|)
            (SEQ
             (LETT |cb|
                   (SPADCALL (SPADCALL (LIST |lg|) (QREFELT $ 71))
                             (QREFELT $ 87))
                   . #5=(|INTPAR2;extendedint;SLLL;9|))
             (EXIT
              (PROGN
               (LETT #4# NIL . #5#)
               (SEQ (LETT |kv| NIL . #5#) (LETT #3# |cb| . #5#) G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |kv| (CAR #3#) . #5#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #4# (CONS (CONS (|spadConstant| $ 18) |kv|) #4#)
                            . #5#)))
                    (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                    (EXIT (NREVERSE #4#)))))))
           (#6='T
            (SEQ (LETT |k| (SPADCALL |l| (QREFELT $ 73)) . #5#)
                 (LETT |l|
                       (PROGN
                        (LETT #2# NIL . #5#)
                        (SEQ (LETT |k1| NIL . #5#) (LETT #1# |l| . #5#) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |k1| (CAR #1#) . #5#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |k1| |k| (QREFELT $ 74))
                                 (LETT #2# (CONS |k1| #2#) . #5#)))))
                             (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       . #5#)
                 (COND
                  ((OR (QEQCAR (SPADCALL |k| (QREFELT $ 76)) 0)
                       (|INTPAR2;prim?| |k| |x| $))
                   (EXIT (|INTPAR2;primextint| |x| |k| |l| |lg| $))))
                 (EXIT
                  (COND
                   ((SPADCALL |k| '|exp| (QREFELT $ 13))
                    (|INTPAR2;expextint| |x| |k| |l| |lg| $))
                   ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 9)
                              (QREFELT $ 16))
                    (|INTPAR2;algextint| |x| |k| |l| |lg| $))
                   ((SPADCALL |k| '|%diff| (QREFELT $ 13))
                    (|INTPAR2;diffextint| |x| |k| |l| |lg| $))
                   (#6# (|INTPAR2;unkextint| |x| |k| |l| |lg| $)))))))))) 

(SDEFUN |INTPAR2;extendedint;FSLLR;10|
        ((|f| F) (|x| |Symbol|) (|l| |List| (|Kernel| F)) (|lg| |List| F)
         ($ |Record|
          (|:| |particular|
               (|Union|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))
                "failed"))
          (|:| |basis|
               (|List|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))))
        (SPADCALL
         (SPADCALL |x| |l| (CONS (SPADCALL |f| (QREFELT $ 90)) |lg|)
                   (QREFELT $ 89))
         (QREFELT $ 92))) 

(SDEFUN |INTPAR2;csolve1|
        ((|m| |Matrix| F) (|d1| |Mapping| F F) ($ |List| (|Vector| F)))
        (QCDR
         (SPADCALL |m| (MAKEARR1 (ANROWS |m|) (|spadConstant| $ 18))
                   (LIST |d1|) (QREFELT $ 97)))) 

(SDEFUN |INTPAR2;wrapfn|
        ((|fn| |Mapping|
          (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|List| F))
         (|k| |Kernel| F)
         ($ |Mapping|
          (|List|
           (|Record|
            (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coeffs| (|Vector| F))))
          (|List| (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG NIL (SEQ (CONS #'|INTPAR2;wrapfn!0| (VECTOR |fn| $ |k|))))) 

(SDEFUN |INTPAR2;wrapfn!0| ((|lrf| NIL) ($$ NIL))
        (PROG (|k| $ |fn|)
          (LETT |k| (QREFELT $$ 2) . #1=(|INTPAR2;wrapfn|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |fn| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((#2=#:G254 NIL) (|a| NIL) (#3=#:G255 NIL) (|be| NIL)
              (#4=#:G253 NIL) (|la| NIL) (#5=#:G252 NIL) (#6=#:G251 NIL)
              (|r1| NIL) (|lf| NIL) (#7=#:G250 NIL) (|rf| NIL) (#8=#:G249 NIL))
             (SEQ
              (LETT |lf|
                    (PROGN
                     (LETT #8# NIL NIL)
                     (SEQ (LETT |rf| NIL NIL) (LETT #7# |lrf| NIL) G190
                          (COND
                           ((OR (ATOM #7#)
                                (PROGN (LETT |rf| (CAR #7#) NIL) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #8#
                                  (CONS (SPADCALL |rf| |k| (QREFELT $ 54)) #8#)
                                  NIL)))
                          (LETT #7# (CDR #7#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #8#))))
                    NIL)
              (LETT |r1| (SPADCALL |lf| |fn|) NIL)
              (LETT |la|
                    (PROGN
                     (LETT #6# NIL NIL)
                     (SEQ (LETT |be| NIL NIL) (LETT #5# |r1| NIL) G190
                          (COND
                           ((OR (ATOM #5#)
                                (PROGN (LETT |be| (CAR #5#) NIL) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #6#
                                  (CONS
                                   (SPADCALL (QCAR |be|) |k| (QREFELT $ 46))
                                   #6#)
                                  NIL)))
                          (LETT #5# (CDR #5#) NIL) (GO G190) G191
                          (EXIT (NREVERSE #6#))))
                    NIL)
              (EXIT
               (PROGN
                (LETT #4# NIL NIL)
                (SEQ (LETT |be| NIL NIL) (LETT #3# |r1| NIL) (LETT |a| NIL NIL)
                     (LETT #2# |la| NIL) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) NIL) NIL)
                           (ATOM #3#) (PROGN (LETT |be| (CAR #3#) NIL) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT (LETT #4# (CONS (CONS |a| (QCDR |be|)) #4#) NIL)))
                     (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) NIL)) NIL)
                     (GO G190) G191 (EXIT (NREVERSE #4#))))))))))) 

(SDEFUN |INTPAR2;algextint|
        ((|x| |Symbol|) (|k| |Kernel| F) (|l| |List| (|Kernel| F))
         (|lg| |List| F)
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G398 NIL) (|be| NIL) (#2=#:G397 NIL)
          (|res1|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|lg1| (|List| F)) (#3=#:G396 NIL) (|g| NIL) (#4=#:G395 NIL)
          (|nk| (F)) (|nk1| (F)) (|yk| #5=(|Kernel| F)) (|y| (F))
          (|rec|
           (|Record| (|:| |primelt| F)
                     (|:| |pol1| (|SparseUnivariatePolynomial| F))
                     (|:| |pol2| (|SparseUnivariatePolynomial| F))
                     (|:| |prim| (|SparseUnivariatePolynomial| F))))
          (#6=#:G393 NIL) (|a1| NIL) (#7=#:G394 NIL) (|bv| NIL) (#8=#:G392 NIL)
          (|cb| (|List| (|Vector| F))) (|ncb| (|List| (|Vector| F)))
          (#9=#:G391 NIL) (#10=#:G390 NIL) (|ca| (|List| F)) (|nca| (|List| F))
          (#11=#:G388 NIL) (#12=#:G389 NIL) (#13=#:G387 NIL) (|na1| (|List| F))
          (#14=#:G386 NIL) (#15=#:G385 NIL) (#16=#:G384 NIL) (#17=#:G383 NIL)
          (|oroot| (F)) (|nrr| #5#) (#18=#:G382 NIL) (#19=#:G381 NIL)
          (#20=#:G380 NIL) (#21=#:G378 NIL) (|i| NIL) (#22=#:G379 NIL)
          (#23=#:G377 NIL) (#24=#:G376 NIL) (#25=#:G375 NIL) (#26=#:G374 NIL)
          (|n| (|NonNegativeInteger|))
          (|al|
           (|List|
            (|Record| (|:| |funs| (|List| F)) (|:| |nroot| F)
                      (|:| |npow1| (|Integer|)) (|:| |npow2| (|Integer|)))))
          (#27=#:G373 NIL) (|k2| NIL) (#28=#:G372 NIL)
          (|rde2|
           (|Mapping|
            (|List|
             (|Record|
              (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
              (|:| |coeffs| (|Vector| F))))
            (|Fraction| (|SparseUnivariatePolynomial| F))
            (|List| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|rde1|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))) F
            (|List| F)))
          (|logi|
           (|Mapping|
            (|Record| (|:| |logands| (|List| F))
                      (|:| |basis|
                           (|List| (|Vector| (|Fraction| (|Integer|))))))
            (|List| (|Kernel| F)) (|List| F)))
          (|ext2|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| (|Kernel| F)) (|List| F)))
          (|ext1|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| F)))
          (|der1|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|dk| (|SparseUnivariatePolynomial| F))
          (|cs1| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
          (|d1| (|Mapping| F F)) (#29=#:G371 NIL) (#30=#:G370 NIL)
          (|k1| (|Kernel| F)))
         (SEQ
          (LETT |k1| (SPADCALL |l| (QREFELT $ 73)) . #31=(|INTPAR2;algextint|))
          (LETT |l|
                (PROGN
                 (LETT #30# NIL . #31#)
                 (SEQ (LETT |k2| NIL . #31#) (LETT #29# |l| . #31#) G190
                      (COND
                       ((OR (ATOM #29#)
                            (PROGN (LETT |k2| (CAR #29#) . #31#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |k2| |k1| (QREFELT $ 74))
                          (LETT #30# (CONS |k2| #30#) . #31#)))))
                      (LETT #29# (CDR #29#) . #31#) (GO G190) G191
                      (EXIT (NREVERSE #30#))))
                . #31#)
          (COND
           ((OR (QEQCAR (SPADCALL |k1| (QREFELT $ 76)) 0)
                (OR (|INTPAR2;prim?| |k1| |x| $)
                    (SPADCALL |k1| '|exp| (QREFELT $ 13))))
            (EXIT
             (SEQ
              (LETT |d1| (CONS #'|INTPAR2;algextint!0| (VECTOR $ |x|)) . #31#)
              (LETT |cs1| (CONS #'|INTPAR2;algextint!1| (VECTOR $ |d1|))
                    . #31#)
              (LETT |dk|
                    (COND
                     ((SPADCALL |k1| '|exp| (QREFELT $ 13))
                      (SPADCALL
                       (SPADCALL (|SPADfirst| (SPADCALL |k1| (QREFELT $ 61)))
                                 |x| (QREFELT $ 35))
                       1 (QREFELT $ 59)))
                     (#32='T
                      (SPADCALL
                       (SPADCALL (SPADCALL |k1| (QREFELT $ 37)) |x|
                                 (QREFELT $ 35))
                       (QREFELT $ 39))))
                    . #31#)
              (LETT |der1| (CONS #'|INTPAR2;algextint!2| (VECTOR $ |dk| |d1|))
                    . #31#)
              (EXIT
               (COND
                ((QEQCAR (SPADCALL |k1| (QREFELT $ 76)) 0)
                 (SPADCALL |k1| |k| |der1| |cs1| |lg| (QREFELT $ 100)))
                (#32#
                 (SEQ
                  (LETT |ext1|
                        (CONS #'|INTPAR2;algextint!3| (VECTOR $ |l| |k1| |x|))
                        . #31#)
                  (LETT |ext2| (CONS #'|INTPAR2;algextint!4| (VECTOR $ |x|))
                        . #31#)
                  (LETT |logi| (CONS #'|INTPAR2;algextint!5| (VECTOR $ |x|))
                        . #31#)
                  (LETT |rde1|
                        (CONS #'|INTPAR2;algextint!6|
                              (VECTOR |logi| |ext2| $ |l| |k1| |x|))
                        . #31#)
                  (LETT |rde2|
                        (CONS #'|INTPAR2;algextint!8| (VECTOR |k1| $ |rde1|))
                        . #31#)
                  (EXIT
                   (SPADCALL |k1| |k| |der1| (|INTPAR2;wrapfn| |ext1| |k1| $)
                             |rde2| |cs1| |lg| (QREFELT $ 109)))))))))))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |k1| (QREFELT $ 15)) (QREFELT $ 9)
                       (QREFELT $ 16))
             (SEQ
              (COND
               ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) '|nthRoot|
                          (QREFELT $ 110))
                (COND
                 ((SPADCALL (SPADCALL |k1| (QREFELT $ 15)) '|nthRoot|
                            (QREFELT $ 110))
                  (COND
                   ((NULL
                     (SPADCALL |k1|
                               (SPADCALL (SPADCALL |k| (QREFELT $ 37))
                                         (QREFELT $ 111))
                               (QREFELT $ 65)))
                    (EXIT
                     (SEQ
                      (LETT |l|
                            (PROGN
                             (LETT #28# NIL . #31#)
                             (SEQ (LETT |k2| NIL . #31#) (LETT #27# |l| . #31#)
                                  G190
                                  (COND
                                   ((OR (ATOM #27#)
                                        (PROGN
                                         (LETT |k2| (CAR #27#) . #31#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL |k2| |k1| (QREFELT $ 74))
                                      (LETT #28# (CONS |k2| #28#) . #31#)))))
                                  (LETT #27# (CDR #27#) . #31#) (GO G190) G191
                                  (EXIT (NREVERSE #28#))))
                            . #31#)
                      (LETT |al| (SPADCALL |lg| |k| |k1| (QREFELT $ 115))
                            . #31#)
                      (LETT |n| (LENGTH |lg|) . #31#)
                      (LETT |ca|
                            (PROGN
                             (LETT #26# NIL . #31#)
                             (SEQ (LETT |i| 1 . #31#) (LETT #25# |n| . #31#)
                                  G190
                                  (COND ((|greater_SI| |i| #25#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #26#
                                          (CONS (|spadConstant| $ 18) #26#)
                                          . #31#)))
                                  (LETT |i| (|inc_SI| |i|) . #31#) (GO G190)
                                  G191 (EXIT (NREVERSE #26#))))
                            . #31#)
                      (LETT |cb|
                            (PROGN
                             (LETT #24# NIL . #31#)
                             (SEQ (LETT |i| 1 . #31#) (LETT #23# |n| . #31#)
                                  G190
                                  (COND ((|greater_SI| |i| #23#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #24#
                                          (CONS
                                           (MAKEARR1 |n| (|spadConstant| $ 18))
                                           #24#)
                                          . #31#)))
                                  (LETT |i| (|inc_SI| |i|) . #31#) (GO G190)
                                  G191 (EXIT (NREVERSE #24#))))
                            . #31#)
                      (SEQ (LETT |bv| NIL . #31#) (LETT #22# |cb| . #31#)
                           (LETT |i| 1 . #31#) (LETT #21# |n| . #31#) G190
                           (COND
                            ((OR (|greater_SI| |i| #21#) (ATOM #22#)
                                 (PROGN (LETT |bv| (CAR #22#) . #31#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |bv| |i| (|spadConstant| $ 57)
                                       (QREFELT $ 117))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|)
                                   (LETT #22# (CDR #22#) . #31#))
                                 . #31#)
                           (GO G190) G191 (EXIT NIL))
                      (SEQ (LETT |rec| NIL . #31#) (LETT #20# |al| . #31#) G190
                           (COND
                            ((OR (ATOM #20#)
                                 (PROGN (LETT |rec| (CAR #20#) . #31#) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |lg1|
                                  (PROGN
                                   (LETT #19# NIL . #31#)
                                   (SEQ (LETT |bv| NIL . #31#)
                                        (LETT #18# |cb| . #31#) G190
                                        (COND
                                         ((OR (ATOM #18#)
                                              (PROGN
                                               (LETT |bv| (CAR #18#) . #31#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #19#
                                                (CONS
                                                 (SPADCALL |bv| (QVELT |rec| 0)
                                                           (QREFELT $ 118))
                                                 #19#)
                                                . #31#)))
                                        (LETT #18# (CDR #18#) . #31#) (GO G190)
                                        G191 (EXIT (NREVERSE #19#))))
                                  . #31#)
                            (COND
                             ((SPADCALL (+ (QVELT |rec| 2) (QVELT |rec| 3)) 0
                                        (QREFELT $ 119))
                              (SEQ
                               (LETT |nrr|
                                     (SPADCALL (QVELT |rec| 1) (QREFELT $ 120))
                                     . #31#)
                               (LETT |res1|
                                     (SPADCALL |x| (CONS |nrr| |l|) |lg1|
                                               (QREFELT $ 89))
                                     . #31#)
                               (LETT |oroot|
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |k| (QREFELT $ 37))
                                                (QVELT |rec| 2)
                                                (QREFELT $ 121))
                                      (SPADCALL (SPADCALL |k1| (QREFELT $ 37))
                                                (QVELT |rec| 3)
                                                (QREFELT $ 121))
                                      (QREFELT $ 122))
                                     . #31#)
                               (EXIT
                                (LETT |na1|
                                      (PROGN
                                       (LETT #17# NIL . #31#)
                                       (SEQ (LETT |be| NIL . #31#)
                                            (LETT #16# |res1| . #31#) G190
                                            (COND
                                             ((OR (ATOM #16#)
                                                  (PROGN
                                                   (LETT |be| (CAR #16#)
                                                         . #31#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #17#
                                                    (CONS
                                                     (SPADCALL (QCAR |be|)
                                                               |nrr| |oroot|
                                                               (QREFELT $ 123))
                                                     #17#)
                                                    . #31#)))
                                            (LETT #16# (CDR #16#) . #31#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #17#))))
                                      . #31#))))
                             ('T
                              (SEQ
                               (LETT |res1|
                                     (SPADCALL |x| |l| |lg1| (QREFELT $ 89))
                                     . #31#)
                               (EXIT
                                (LETT |na1|
                                      (PROGN
                                       (LETT #15# NIL . #31#)
                                       (SEQ (LETT |be| NIL . #31#)
                                            (LETT #14# |res1| . #31#) G190
                                            (COND
                                             ((OR (ATOM #14#)
                                                  (PROGN
                                                   (LETT |be| (CAR #14#)
                                                         . #31#)
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #15#
                                                    (CONS (QCAR |be|) #15#)
                                                    . #31#)))
                                            (LETT #14# (CDR #14#) . #31#)
                                            (GO G190) G191
                                            (EXIT (NREVERSE #15#))))
                                      . #31#)))))
                            (LETT |nca|
                                  (PROGN
                                   (LETT #13# NIL . #31#)
                                   (SEQ (LETT |a1| NIL . #31#)
                                        (LETT #12# |na1| . #31#)
                                        (LETT |be| NIL . #31#)
                                        (LETT #11# |res1| . #31#) G190
                                        (COND
                                         ((OR (ATOM #11#)
                                              (PROGN
                                               (LETT |be| (CAR #11#) . #31#)
                                               NIL)
                                              (ATOM #12#)
                                              (PROGN
                                               (LETT |a1| (CAR #12#) . #31#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #13#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL (QCDR |be|) |ca|
                                                            (QREFELT $ 118))
                                                  |a1| (QREFELT $ 124))
                                                 #13#)
                                                . #31#)))
                                        (LETT #11#
                                              (PROG1 (CDR #11#)
                                                (LETT #12# (CDR #12#) . #31#))
                                              . #31#)
                                        (GO G190) G191 (EXIT (NREVERSE #13#))))
                                  . #31#)
                            (LETT |ca| |nca| . #31#)
                            (LETT |ncb|
                                  (PROGN
                                   (LETT #10# NIL . #31#)
                                   (SEQ (LETT |be| NIL . #31#)
                                        (LETT #9# |res1| . #31#) G190
                                        (COND
                                         ((OR (ATOM #9#)
                                              (PROGN
                                               (LETT |be| (CAR #9#) . #31#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #10#
                                                (CONS
                                                 (SPADCALL (QCDR |be|) |cb|
                                                           (QREFELT $ 125))
                                                 #10#)
                                                . #31#)))
                                        (LETT #9# (CDR #9#) . #31#) (GO G190)
                                        G191 (EXIT (NREVERSE #10#))))
                                  . #31#)
                            (EXIT (LETT |cb| |ncb| . #31#)))
                           (LETT #20# (CDR #20#) . #31#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (PROGN
                        (LETT #8# NIL . #31#)
                        (SEQ (LETT |bv| NIL . #31#) (LETT #7# |cb| . #31#)
                             (LETT |a1| NIL . #31#) (LETT #6# |ca| . #31#) G190
                             (COND
                              ((OR (ATOM #6#)
                                   (PROGN (LETT |a1| (CAR #6#) . #31#) NIL)
                                   (ATOM #7#)
                                   (PROGN (LETT |bv| (CAR #7#) . #31#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #8# (CONS (CONS |a1| |bv|) #8#) . #31#)))
                             (LETT #6#
                                   (PROG1 (CDR #6#)
                                     (LETT #7# (CDR #7#) . #31#))
                                   . #31#)
                             (GO G190) G191 (EXIT (NREVERSE #8#)))))))))))))
              (LETT |rec|
                    (SPADCALL (SPADCALL |k1| (QREFELT $ 37))
                              (SPADCALL |k| (QREFELT $ 37)) (QREFELT $ 128))
                    . #31#)
              (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 130)) . #31#)
              (LETT |yk| (SPADCALL |y| (QREFELT $ 120)) . #31#)
              (LETT |nk1| (SPADCALL (QVELT |rec| 1) |y| (QREFELT $ 131))
                    . #31#)
              (LETT |nk| (SPADCALL (QVELT |rec| 2) |y| (QREFELT $ 131)) . #31#)
              (LETT |lg1|
                    (PROGN
                     (LETT #4# NIL . #31#)
                     (SEQ (LETT |g| NIL . #31#) (LETT #3# |lg| . #31#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |g| (CAR #3#) . #31#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (SPADCALL |g| (LIST |k1| |k|)
                                             (LIST |nk1| |nk|) (QREFELT $ 132))
                                   #4#)
                                  . #31#)))
                          (LETT #3# (CDR #3#) . #31#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #31#)
              (LETT |res1| (|INTPAR2;algextint| |x| |yk| |l| |lg1| $) . #31#)
              (EXIT
               (PROGN
                (LETT #2# NIL . #31#)
                (SEQ (LETT |be| NIL . #31#) (LETT #1# |res1| . #31#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |be| (CAR #1#) . #31#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (CONS
                               (SPADCALL (QCAR |be|) |yk| (QVELT |rec| 0)
                                         (QREFELT $ 123))
                               (QCDR |be|))
                              #2#)
                             . #31#)))
                     (LETT #1# (CDR #1#) . #31#) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))
            (#32# (|error| "algextint unimplemented kernel"))))))) 

(SDEFUN |INTPAR2;algextint!8| ((|x5| NIL) (|x4| NIL) ($$ NIL))
        (PROG (|rde1| $ |k1|)
          (LETT |rde1| (QREFELT $$ 2) . #1=(|INTPAR2;algextint|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |k1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |x4|
                             (|INTPAR2;wrapfn|
                              (CONS #'|INTPAR2;algextint!7|
                                    (VECTOR |rde1| $ |k1| |x5|))
                              |k1| $))))))) 

(SDEFUN |INTPAR2;algextint!7| ((|x3| NIL) ($$ NIL))
        (PROG (|x5| |k1| $ |rde1|)
          (LETT |x5| (QREFELT $$ 3) NIL)
          (LETT |k1| (QREFELT $$ 2) NIL)
          (LETT $ (QREFELT $$ 1) NIL)
          (LETT |rde1| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN (SPADCALL (SPADCALL |x5| |k1| (QREFELT $ 54)) |x3| |rde1|))))) 

(SDEFUN |INTPAR2;algextint!6| ((|x6| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|x| |k1| |l| $ |ext2| |logi|)
          (LETT |x| (QREFELT $$ 5) . #1=(|INTPAR2;algextint|))
          (LETT |k1| (QREFELT $$ 4) . #1#)
          (LETT |l| (QREFELT $$ 3) . #1#)
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |ext2| (QREFELT $$ 1) . #1#)
          (LETT |logi| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x6| |x3| |x| (SPADCALL |k1| |l| (QREFELT $ 101)) |ext2|
                      |logi| (QREFELT $ 105)))))) 

(SDEFUN |INTPAR2;algextint!5| ((|x2| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTPAR2;algextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |x2| |x3| (QREFELT $ 28)))))) 

(SDEFUN |INTPAR2;algextint!4| ((|x4| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTPAR2;algextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |x4| |x3| (QREFELT $ 89)))))) 

(SDEFUN |INTPAR2;algextint!3| ((|x3| NIL) ($$ NIL))
        (PROG (|x| |k1| |l| $)
          (LETT |x| (QREFELT $$ 3) . #1=(|INTPAR2;algextint|))
          (LETT |k1| (QREFELT $$ 2) . #1#)
          (LETT |l| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x| (SPADCALL |k1| |l| (QREFELT $ 101)) |x3|
                      (QREFELT $ 89)))))) 

(SDEFUN |INTPAR2;algextint!2| ((|x1| NIL) ($$ NIL))
        (PROG (|d1| |dk| $)
          (LETT |d1| (QREFELT $$ 2) . #1=(|INTPAR2;algextint|))
          (LETT |dk| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |d1| |dk| (QREFELT $ 41)))))) 

(SDEFUN |INTPAR2;algextint!1| ((|x2| NIL) ($$ NIL))
        (PROG (|d1| $)
          (LETT |d1| (QREFELT $$ 1) . #1=(|INTPAR2;algextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTPAR2;csolve1| |x2| |d1| $))))) 

(SDEFUN |INTPAR2;algextint!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTPAR2;algextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 35)))))) 

(SDEFUN |INTPAR2;primextint|
        ((|x| |Symbol|) (|k| |Kernel| F) (|l| |List| (|Kernel| F))
         (|lu| |List| F)
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G417 NIL) (|si| NIL) (#2=#:G416 NIL)
          (|res1|
           (|List|
            (|Record|
             (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |coeffs| (|Vector| F)))))
          (#3=#:G415 NIL) (|u| NIL) (#4=#:G414 NIL)
          (|cs1| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
          (|ext|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| F)))
          (|der|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|d1| (|Mapping| F F)))
         (SEQ
          (LETT |d1| (CONS #'|INTPAR2;primextint!0| (VECTOR $ |x|))
                . #5=(|INTPAR2;primextint|))
          (LETT |der| (CONS #'|INTPAR2;primextint!1| (VECTOR |x| $ |k| |d1|))
                . #5#)
          (LETT |ext| (CONS #'|INTPAR2;primextint!2| (VECTOR $ |l| |x|)) . #5#)
          (LETT |cs1| (CONS #'|INTPAR2;primextint!3| (VECTOR $ |d1|)) . #5#)
          (LETT |res1|
                (SPADCALL |der| |ext| |cs1|
                          (PROGN
                           (LETT #4# NIL . #5#)
                           (SEQ (LETT |u| NIL . #5#) (LETT #3# |lu| . #5#) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |u| (CAR #3#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS (SPADCALL |u| |k| (QREFELT $ 46))
                                              #4#)
                                        . #5#)))
                                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (QREFELT $ 135))
                . #5#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #5#)
            (SEQ (LETT |si| NIL . #5#) (LETT #1# |res1| . #5#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |si| (CAR #1#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (CONS (SPADCALL (QCAR |si|) |k| (QREFELT $ 54))
                                (QCDR |si|))
                          #2#)
                         . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |INTPAR2;primextint!3| ((|x4| NIL) ($$ NIL))
        (PROG (|d1| $)
          (LETT |d1| (QREFELT $$ 1) . #1=(|INTPAR2;primextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTPAR2;csolve1| |x4| |d1| $))))) 

(SDEFUN |INTPAR2;primextint!2| ((|x3| NIL) ($$ NIL))
        (PROG (|x| |l| $)
          (LETT |x| (QREFELT $$ 2) . #1=(|INTPAR2;primextint|))
          (LETT |l| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |l| |x3| (QREFELT $ 89)))))) 

(SDEFUN |INTPAR2;primextint!1| ((|x1| NIL) ($$ NIL))
        (PROG (|d1| |k| $ |x|)
          (LETT |d1| (QREFELT $$ 3) . #1=(|INTPAR2;primextint|))
          (LETT |k| (QREFELT $$ 2) . #1#)
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| |d1|
                      (SPADCALL
                       (SPADCALL (SPADCALL |k| (QREFELT $ 37)) |x|
                                 (QREFELT $ 35))
                       (QREFELT $ 39))
                      (QREFELT $ 41)))))) 

(SDEFUN |INTPAR2;primextint!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTPAR2;primextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 35)))))) 

(SDEFUN |INTPAR2;expextint|
        ((|x| |Symbol|) (|k| |Kernel| F) (|l| |List| (|Kernel| F))
         (|lu| |List| F)
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G443 NIL) (|si| NIL) (#2=#:G442 NIL)
          (|res1|
           (|List|
            (|Record|
             (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |coeffs| (|Vector| F)))))
          (#3=#:G441 NIL) (|u| NIL) (#4=#:G440 NIL)
          (|cs1| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
          (|rde|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|Integer|) (|List| F)))
          (|logi|
           (|Mapping|
            (|Record| (|:| |logands| (|List| F))
                      (|:| |basis|
                           (|List| (|Vector| (|Fraction| (|Integer|))))))
            (|List| (|Kernel| F)) (|List| F)))
          (|ext|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| (|Kernel| F)) (|List| F)))
          (|der|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|d1| (|Mapping| F F)) (|eta| (F)))
         (SEQ
          (LETT |eta| (|SPADfirst| (SPADCALL |k| (QREFELT $ 61)))
                . #5=(|INTPAR2;expextint|))
          (LETT |d1| (CONS #'|INTPAR2;expextint!0| (VECTOR $ |x|)) . #5#)
          (LETT |der| (CONS #'|INTPAR2;expextint!1| (VECTOR $ |x| |eta| |d1|))
                . #5#)
          (LETT |ext| (CONS #'|INTPAR2;expextint!2| (VECTOR $ |x|)) . #5#)
          (LETT |logi| (CONS #'|INTPAR2;expextint!3| (VECTOR $ |x|)) . #5#)
          (LETT |rde|
                (CONS #'|INTPAR2;expextint!4|
                      (VECTOR $ |logi| |ext| |l| |x| |eta|))
                . #5#)
          (LETT |cs1| (CONS #'|INTPAR2;expextint!5| (VECTOR $ |d1|)) . #5#)
          (LETT |res1|
                (SPADCALL |der| |rde| |cs1|
                          (PROGN
                           (LETT #4# NIL . #5#)
                           (SEQ (LETT |u| NIL . #5#) (LETT #3# |lu| . #5#) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |u| (CAR #3#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS (SPADCALL |u| |k| (QREFELT $ 46))
                                              #4#)
                                        . #5#)))
                                (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (QREFELT $ 138))
                . #5#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #5#)
            (SEQ (LETT |si| NIL . #5#) (LETT #1# |res1| . #5#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |si| (CAR #1#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (CONS (SPADCALL (QCAR |si|) |k| (QREFELT $ 54))
                                (QCDR |si|))
                          #2#)
                         . #5#)))
                 (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |INTPAR2;expextint!5| ((|x4| NIL) ($$ NIL))
        (PROG (|d1| $)
          (LETT |d1| (QREFELT $$ 1) . #1=(|INTPAR2;expextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTPAR2;csolve1| |x4| |d1| $))))) 

(SDEFUN |INTPAR2;expextint!4| ((|x1| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|eta| |x| |l| |ext| |logi| $)
          (LETT |eta| (QREFELT $$ 5) . #1=(|INTPAR2;expextint|))
          (LETT |x| (QREFELT $$ 4) . #1#)
          (LETT |l| (QREFELT $$ 3) . #1#)
          (LETT |ext| (QREFELT $$ 2) . #1#)
          (LETT |logi| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| |eta| |x3| |x| |l| |ext| |logi| (QREFELT $ 136)))))) 

(SDEFUN |INTPAR2;expextint!3| ((|x2| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTPAR2;expextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |x2| |x3| (QREFELT $ 28)))))) 

(SDEFUN |INTPAR2;expextint!2| ((|x2| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTPAR2;expextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |x2| |x3| (QREFELT $ 89)))))) 

(SDEFUN |INTPAR2;expextint!1| ((|x1| NIL) ($$ NIL))
        (PROG (|d1| |eta| |x| $)
          (LETT |d1| (QREFELT $$ 3) . #1=(|INTPAR2;expextint|))
          (LETT |eta| (QREFELT $$ 2) . #1#)
          (LETT |x| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| |d1|
                      (SPADCALL (SPADCALL |eta| |x| (QREFELT $ 35))
                                (|spadConstant| $ 62) (QREFELT $ 59))
                      (QREFELT $ 41)))))) 

(SDEFUN |INTPAR2;expextint!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTPAR2;expextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 35)))))) 

(SDEFUN |INTPAR2;constant_subspace|
        ((|b| |List| (|Vector| F)) (|d1| |Mapping| F F)
         ($ |Record| (|:| |transform| (|Matrix| F))
          (|:| |basis| (|List| (|Vector| F)))))
        (SPROG
         ((#1=#:G481 NIL) (|bv| NIL) (#2=#:G480 NIL) (|m2| #3=(|Matrix| F))
          (#4=#:G479 NIL) (|i| NIL) (#5=#:G478 NIL) (#6=#:G477 NIL)
          (#7=#:G476 NIL) (|l3| (|List| (|Vector| F))) (#8=#:G475 NIL)
          (#9=#:G474 NIL) (|s1| (|List| (|Vector| F))) (|v0| (|Vector| F))
          (|m| (|Matrix| F)) (|lr| (|List| (|Vector| F)))
          (|ll| (|List| (|List| F))) (|ll1| (|List| F))
          (|lpiv1| (|List| (|Integer|))) (|kk| (|Integer|)) (#10=#:G473 NIL)
          (|j| NIL) (#11=#:G472 NIL) (|lpiv| (|List| (|Integer|)))
          (|lri| (|List| (|Integer|))) (|k| #12=(|Integer|)) (|k1| #12#)
          (#13=#:G471 NIL) (|m1| (|Matrix| F)) (|m0| (|Matrix| F)) (|m0b| #3#)
          (#14=#:G470 NIL) (#15=#:G469 NIL) (|nr| (|NonNegativeInteger|))
          (|nc| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((NULL |b|) (CONS (MAKE_MATRIX1 0 0 (|spadConstant| $ 57)) NIL))
           ('T
            (SEQ
             (LETT |nc| (QVSIZE (|SPADfirst| |b|))
                   . #16=(|INTPAR2;constant_subspace|))
             (LETT |nr| (LENGTH |b|) . #16#)
             (LETT |m0b|
                   (SPADCALL
                    (PROGN
                     (LETT #15# NIL . #16#)
                     (SEQ (LETT |bv| NIL . #16#) (LETT #14# |b| . #16#) G190
                          (COND
                           ((OR (ATOM #14#)
                                (PROGN (LETT |bv| (CAR #14#) . #16#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #15#
                                  (CONS (SPADCALL |bv| (QREFELT $ 139)) #15#)
                                  . #16#)))
                          (LETT #14# (CDR #14#) . #16#) (GO G190) G191
                          (EXIT (NREVERSE #15#))))
                    (QREFELT $ 71))
                   . #16#)
             (LETT |m0|
                   (SPADCALL |m0b|
                             (SPADCALL |nr| (|spadConstant| $ 57)
                                       (QREFELT $ 140))
                             (QREFELT $ 141))
                   . #16#)
             (LETT |m1| (SPADCALL |m0| (QREFELT $ 142)) . #16#)
             (LETT |k| 1 . #16#) (LETT |lpiv| NIL . #16#)
             (LETT |lri| NIL . #16#)
             (SEQ (LETT |i| 1 . #16#) (LETT #13# (ANROWS |m1|) . #16#) G190
                  (COND ((|greater_SI| |i| #13#) (GO G191)))
                  (SEQ (LETT |k1| |k| . #16#)
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND
                                ((SPADCALL
                                  (SPADCALL |m1| |i| |k1| (QREFELT $ 143))
                                  (|spadConstant| $ 18) (QREFELT $ 144))
                                 (SPADCALL |k1| |nc| (QREFELT $ 145)))
                                ('T 'NIL)))
                              (GO G191)))
                            (SEQ (EXIT (LETT |k1| (+ |k1| 1) . #16#))) NIL
                            (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (COND ((< |nc| |k1|) "iterate")
                              ('T
                               (SEQ (LETT |k| |k1| . #16#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL |m1| |i| |k| (QREFELT $ 143))
                                        (|spadConstant| $ 57) (QREFELT $ 146))
                                       (|error| "impossible"))
                                      ('T
                                       (SEQ
                                        (LETT |lri| (CONS |i| |lri|) . #16#)
                                        (EXIT
                                         (LETT |lpiv| (CONS |k| |lpiv|)
                                               . #16#)))))))))))
                  (LETT |i| (|inc_SI| |i|) . #16#) (GO G190) G191 (EXIT NIL))
             (LETT |lpiv| (CONS (+ |nc| 1) |lpiv|) . #16#)
             (LETT |lpiv| (NREVERSE |lpiv|) . #16#) (LETT |lr| NIL . #16#)
             (LETT |ll| NIL . #16#)
             (SEQ (LETT |i| NIL . #16#) (LETT #11# |lri| . #16#) G190
                  (COND
                   ((OR (ATOM #11#) (PROGN (LETT |i| (CAR #11#) . #16#) NIL))
                    (GO G191)))
                  (SEQ (LETT |lpiv1| |lpiv| . #16#)
                       (LETT |kk| (|SPADfirst| |lpiv1|) . #16#)
                       (LETT |lpiv1| (CDR |lpiv1|) . #16#)
                       (LETT |ll1| NIL . #16#)
                       (SEQ (LETT |j| 1 . #16#) (LETT #10# |nc| . #16#) G190
                            (COND ((|greater_SI| |j| #10#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((EQL |j| |kk|)
                                (SEQ (LETT |kk| (|SPADfirst| |lpiv1|) . #16#)
                                     (EXIT
                                      (LETT |lpiv1| (CDR |lpiv1|) . #16#))))
                               ('T
                                (LETT |ll1|
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL |m1| |i| |j| (QREFELT $ 143))
                                        |d1|)
                                       |ll1|)
                                      . #16#)))))
                            (LETT |j| (|inc_SI| |j|) . #16#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |ll| (CONS |ll1| |ll|) . #16#)
                       (EXIT
                        (LETT |lr|
                              (CONS (SPADCALL |m1| |i| (QREFELT $ 147)) |lr|)
                              . #16#)))
                  (LETT #11# (CDR #11#) . #16#) (GO G190) G191 (EXIT NIL))
             (LETT |m|
                   (SPADCALL (SPADCALL |ll| (QREFELT $ 71)) (QREFELT $ 148))
                   . #16#)
             (LETT |v0| (MAKEARR1 (ANCOLS |m|) (|spadConstant| $ 18)) . #16#)
             (LETT |s1| (QCDR (SPADCALL |m| |v0| (LIST |d1|) (QREFELT $ 97)))
                   . #16#)
             (LETT |l3|
                   (PROGN
                    (LETT #9# NIL . #16#)
                    (SEQ (LETT |bv| NIL . #16#) (LETT #8# |s1| . #16#) G190
                         (COND
                          ((OR (ATOM #8#)
                               (PROGN (LETT |bv| (CAR #8#) . #16#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #9#
                                 (CONS (SPADCALL |bv| |lr| (QREFELT $ 125))
                                       #9#)
                                 . #16#)))
                         (LETT #8# (CDR #8#) . #16#) (GO G190) G191
                         (EXIT (NREVERSE #9#))))
                   . #16#)
             (LETT |m2|
                   (SPADCALL
                    (PROGN
                     (LETT #7# NIL . #16#)
                     (SEQ (LETT |bv| NIL . #16#) (LETT #6# |l3| . #16#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |bv| (CAR #6#) . #16#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (PROGN
                                    (LETT #5# NIL . #16#)
                                    (SEQ (LETT |i| (+ |nc| 1) . #16#)
                                         (LETT #4# (ANCOLS |m0|) . #16#) G190
                                         (COND ((> |i| #4#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #5#
                                                 (CONS
                                                  (SPADCALL |bv| |i|
                                                            (QREFELT $ 149))
                                                  #5#)
                                                 . #16#)))
                                         (LETT |i| (+ |i| 1) . #16#) (GO G190)
                                         G191 (EXIT (NREVERSE #5#))))
                                   #7#)
                                  . #16#)))
                          (LETT #6# (CDR #6#) . #16#) (GO G190) G191
                          (EXIT (NREVERSE #7#))))
                    (QREFELT $ 71))
                   . #16#)
             (EXIT
              (CONS |m2|
                    (PROGN
                     (LETT #2# NIL . #16#)
                     (SEQ (LETT |bv| NIL . #16#) (LETT #1# |l3| . #16#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |bv| (CAR #1#) . #16#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (SPADCALL |bv|
                                             (SPADCALL 1 |nc| (QREFELT $ 151))
                                             (QREFELT $ 152))
                                   #2#)
                                  . #16#)))
                          (LETT #1# (CDR #1#) . #16#) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))))))))) 

(SDEFUN |INTPAR2;diffextint1|
        ((|lup| |List| (|SparseUnivariatePolynomial| F)) (|x| |Symbol|)
         (|k| |Kernel| F) (|lk| |List| (|Kernel| F))
         (|csolve| |Mapping| #1=(|List| (|Vector| F)) (|Matrix| F))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#2=#:G543 NIL) (|i| NIL) (#3=#:G544 NIL) (|ba| NIL) (#4=#:G545 NIL)
          (|bv| NIL) (#5=#:G542 NIL) (|nlca| (|List| F)) (#6=#:G541 NIL)
          (#7=#:G540 NIL) (|ncb| (|List| (|Vector| F))) (#8=#:G539 NIL)
          (#9=#:G538 NIL) (|v3| (|Vector| F)) (|v2| (|Vector| F))
          (#10=#:G537 NIL) (|be| NIL) (#11=#:G536 NIL)
          (|cb1| (|List| (|Vector| F))) (|m2| (|Matrix| F))
          (|#G121|
           (|Record| (|:| |transform| (|Matrix| F))
                     (|:| |basis| (|List| (|Vector| F)))))
          (|d1| (|Mapping| F F)) (|cb0| (|List| #12=(|Vector| F)))
          (#13=#:G535 NIL) (#14=#:G534 NIL)
          (|res2|
           #15=(|List|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|nlg| (|List| F)) (|ng| (F)) (#16=#:G512 NIL)
          (|nu| (|SparseUnivariatePolynomial| F))
          (|du| (|Fraction| (|SparseUnivariatePolynomial| F))) (#17=#:G531 NIL)
          (|ca| NIL) (#18=#:G532 NIL) (|g1| NIL) (#19=#:G533 NIL) (|g0| NIL)
          (|lca| (|List| F)) (|nlg0| (|List| F)) (#20=#:G530 NIL)
          (#21=#:G529 NIL) (|lg3| (|List| F)) (#22=#:G528 NIL) (#23=#:G527 NIL)
          (|cb| (|List| #12#)) (#24=#:G526 NIL) (#25=#:G525 NIL)
          (#26=#:G524 NIL) (#27=#:G523 NIL) (|res1| #15#)
          (|lk1| (|List| (|Kernel| F))) (|lek| (|List| F)) (#28=#:G522 NIL)
          (|ki| NIL) (#29=#:G521 NIL) (|lg2| (|List| F)) (#30=#:G520 NIL)
          (|g| NIL) (#31=#:G519 NIL) (|dvf| (F)) (|dv| (|Symbol|)) (|k1| (F))
          (|lg1| (|List| F)) (#32=#:G518 NIL) (|up| NIL) (#33=#:G517 NIL)
          (|lg0| (|List| F)) (#34=#:G516 NIL) (#35=#:G515 NIL) (#36=#:G514 NIL)
          (#37=#:G513 NIL) (|b0| #1#) (|rs1| (|Matrix| F))
          (|m1| (|Matrix| (|SparseUnivariatePolynomial| F))) (|da3| (F))
          (|arg3| (F)) (|args| (|List| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |args| (SPADCALL |k| (QREFELT $ 61))
                  . #38=(|INTPAR2;diffextint1|))
            (EXIT
             (COND
              ((SPADCALL (LENGTH |args|) 3 (QREFELT $ 153))
               (|error| "internal error, k is not a diff"))
              (#39='T
               (SEQ (LETT |arg3| (SPADCALL |args| 3 (QREFELT $ 154)) . #38#)
                    (LETT |da3| (SPADCALL |arg3| |x| (QREFELT $ 35)) . #38#)
                    (EXIT
                     (COND
                      ((SPADCALL |da3| (|spadConstant| $ 18) (QREFELT $ 144))
                       (SEQ
                        (LETT |m1| (SPADCALL (LIST |lup|) (QREFELT $ 157))
                              . #38#)
                        (LETT |rs1| (SPADCALL |m1| (QREFELT $ 159)) . #38#)
                        (LETT |b0| (SPADCALL |rs1| |csolve|) . #38#)
                        (EXIT
                         (PROGN
                          (LETT #37# NIL . #38#)
                          (SEQ (LETT |bv| NIL . #38#) (LETT #36# |b0| . #38#)
                               G190
                               (COND
                                ((OR (ATOM #36#)
                                     (PROGN (LETT |bv| (CAR #36#) . #38#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #37#
                                       (CONS (CONS (|spadConstant| $ 18) |bv|)
                                             #37#)
                                       . #38#)))
                               (LETT #36# (CDR #36#) . #38#) (GO G190) G191
                               (EXIT (NREVERSE #37#)))))))
                      (#39#
                       (SEQ
                        (LETT |lg0|
                              (PROGN
                               (LETT #35# NIL . #38#)
                               (SEQ (LETT |up| NIL . #38#)
                                    (LETT #34# |lup| . #38#) G190
                                    (COND
                                     ((OR (ATOM #34#)
                                          (PROGN
                                           (LETT |up| (CAR #34#) . #38#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #35#
                                            (CONS
                                             (SPADCALL |up| 0 (QREFELT $ 160))
                                             #35#)
                                            . #38#)))
                                    (LETT #34# (CDR #34#) . #38#) (GO G190)
                                    G191 (EXIT (NREVERSE #35#))))
                              . #38#)
                        (LETT |lg1|
                              (PROGN
                               (LETT #33# NIL . #38#)
                               (SEQ (LETT |up| NIL . #38#)
                                    (LETT #32# |lup| . #38#) G190
                                    (COND
                                     ((OR (ATOM #32#)
                                          (PROGN
                                           (LETT |up| (CAR #32#) . #38#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #33#
                                            (CONS
                                             (SPADCALL |up| 1 (QREFELT $ 160))
                                             #33#)
                                            . #38#)))
                                    (LETT #32# (CDR #32#) . #38#) (GO G190)
                                    G191 (EXIT (NREVERSE #33#))))
                              . #38#)
                        (LETT |k1|
                              (SPADCALL (SPADCALL |args| 1 (QREFELT $ 154))
                                        (SPADCALL
                                         (SPADCALL |args| 2 (QREFELT $ 154))
                                         (QREFELT $ 120))
                                        |arg3| (QREFELT $ 123))
                              . #38#)
                        (LETT |dv| (SPADCALL (QREFELT $ 161)) . #38#)
                        (LETT |dvf| (SPADCALL |dv| (QREFELT $ 77)) . #38#)
                        (LETT |lg2|
                              (PROGN
                               (LETT #31# NIL . #38#)
                               (SEQ (LETT |g| NIL . #38#)
                                    (LETT #30# |lg1| . #38#) G190
                                    (COND
                                     ((OR (ATOM #30#)
                                          (PROGN
                                           (LETT |g| (CAR #30#) . #38#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #31#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL |g| |da3|
                                                        (QREFELT $ 162))
                                              |k1| |dvf| (QREFELT $ 163))
                                             #31#)
                                            . #38#)))
                                    (LETT #30# (CDR #30#) . #38#) (GO G190)
                                    G191 (EXIT (NREVERSE #31#))))
                              . #38#)
                        (LETT |lek|
                              (PROGN
                               (LETT #29# NIL . #38#)
                               (SEQ (LETT |ki| NIL . #38#)
                                    (LETT #28# |lk| . #38#) G190
                                    (COND
                                     ((OR (ATOM #28#)
                                          (PROGN
                                           (LETT |ki| (CAR #28#) . #38#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #29#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL |ki| (QREFELT $ 37))
                                              |k1| |dvf| (QREFELT $ 163))
                                             #29#)
                                            . #38#)))
                                    (LETT #28# (CDR #28#) . #38#) (GO G190)
                                    G191 (EXIT (NREVERSE #29#))))
                              . #38#)
                        (LETT |lk1|
                              (SPADCALL
                               (SPADCALL (CONS |dvf| (APPEND |lg2| |lek|))
                                         (QREFELT $ 79))
                               |dv| (QREFELT $ 80))
                              . #38#)
                        (LETT |res1| (SPADCALL |dv| |lk1| |lg2| (QREFELT $ 89))
                              . #38#)
                        (EXIT
                         (COND ((NULL |res1|) NIL)
                               (#39#
                                (SEQ
                                 (LETT |lca|
                                       (PROGN
                                        (LETT #27# NIL . #38#)
                                        (SEQ (LETT |be| NIL . #38#)
                                             (LETT #26# |res1| . #38#) G190
                                             (COND
                                              ((OR (ATOM #26#)
                                                   (PROGN
                                                    (LETT |be| (CAR #26#)
                                                          . #38#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #27#
                                                     (CONS (QCAR |be|) #27#)
                                                     . #38#)))
                                             (LETT #26# (CDR #26#) . #38#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #27#))))
                                       . #38#)
                                 (LETT |cb|
                                       (PROGN
                                        (LETT #25# NIL . #38#)
                                        (SEQ (LETT |be| NIL . #38#)
                                             (LETT #24# |res1| . #38#) G190
                                             (COND
                                              ((OR (ATOM #24#)
                                                   (PROGN
                                                    (LETT |be| (CAR #24#)
                                                          . #38#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #25#
                                                     (CONS (QCDR |be|) #25#)
                                                     . #38#)))
                                             (LETT #24# (CDR #24#) . #38#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #25#))))
                                       . #38#)
                                 (LETT |lg3|
                                       (PROGN
                                        (LETT #23# NIL . #38#)
                                        (SEQ (LETT |bv| NIL . #38#)
                                             (LETT #22# |cb| . #38#) G190
                                             (COND
                                              ((OR (ATOM #22#)
                                                   (PROGN
                                                    (LETT |bv| (CAR #22#)
                                                          . #38#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #23#
                                                     (CONS
                                                      (SPADCALL |bv| |lg1|
                                                                (QREFELT $
                                                                         118))
                                                      #23#)
                                                     . #38#)))
                                             (LETT #22# (CDR #22#) . #38#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #23#))))
                                       . #38#)
                                 (LETT |nlg0|
                                       (PROGN
                                        (LETT #21# NIL . #38#)
                                        (SEQ (LETT |bv| NIL . #38#)
                                             (LETT #20# |cb| . #38#) G190
                                             (COND
                                              ((OR (ATOM #20#)
                                                   (PROGN
                                                    (LETT |bv| (CAR #20#)
                                                          . #38#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #21#
                                                     (CONS
                                                      (SPADCALL |bv| |lg0|
                                                                (QREFELT $
                                                                         118))
                                                      #21#)
                                                     . #38#)))
                                             (LETT #20# (CDR #20#) . #38#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #21#))))
                                       . #38#)
                                 (LETT |lca|
                                       (SPADCALL
                                        (CONS #'|INTPAR2;diffextint1!0|
                                              (VECTOR |k1| $ |dv|))
                                        |lca| (QREFELT $ 165))
                                       . #38#)
                                 (LETT |nlg| NIL . #38#)
                                 (SEQ (LETT |g0| NIL . #38#)
                                      (LETT #19# |nlg0| . #38#)
                                      (LETT |g1| NIL . #38#)
                                      (LETT #18# |lg3| . #38#)
                                      (LETT |ca| NIL . #38#)
                                      (LETT #17# |lca| . #38#) G190
                                      (COND
                                       ((OR (ATOM #17#)
                                            (PROGN
                                             (LETT |ca| (CAR #17#) . #38#)
                                             NIL)
                                            (ATOM #18#)
                                            (PROGN
                                             (LETT |g1| (CAR #18#) . #38#)
                                             NIL)
                                            (ATOM #19#)
                                            (PROGN
                                             (LETT |g0| (CAR #19#) . #38#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |du|
                                             (SPADCALL
                                              (SPADCALL |ca| |x|
                                                        (QREFELT $ 35))
                                              |k| (QREFELT $ 46))
                                             . #38#)
                                       (LETT |nu|
                                             (SPADCALL |du| (QREFELT $ 166))
                                             . #38#)
                                       (COND
                                        ((OR
                                          (SPADCALL
                                           (SPADCALL |du| (QREFELT $ 167))
                                           (|spadConstant| $ 168)
                                           (QREFELT $ 169))
                                          (SPADCALL
                                           (SPADCALL |nu| (QREFELT $ 170)) 1
                                           (QREFELT $ 171)))
                                         (EXIT
                                          (PROGN
                                           (LETT #16# NIL . #38#)
                                           (GO #40=#:G511)))))
                                       (EXIT
                                        (COND
                                         ((SPADCALL
                                           (SPADCALL |g|
                                                     (SPADCALL |nu| 1
                                                               (QREFELT $ 160))
                                                     (QREFELT $ 124))
                                           (|spadConstant| $ 18)
                                           (QREFELT $ 146))
                                          (PROGN
                                           (LETT #16# NIL . #38#)
                                           (GO #40#)))
                                         ('T
                                          (SEQ
                                           (LETT |ng|
                                                 (SPADCALL |g0|
                                                           (SPADCALL |nu| 0
                                                                     (QREFELT $
                                                                              160))
                                                           (QREFELT $ 124))
                                                 . #38#)
                                           (EXIT
                                            (LETT |nlg| (CONS |ng| |nlg|)
                                                  . #38#)))))))
                                      (LETT #17#
                                            (PROG1 (CDR #17#)
                                              (LETT #18#
                                                    (PROG1 (CDR #18#)
                                                      (LETT #19# (CDR #19#)
                                                            . #38#))
                                                    . #38#))
                                            . #38#)
                                      (GO G190) G191 (EXIT NIL))
                                 (LETT |nlg| (NREVERSE |nlg|) . #38#)
                                 (LETT |res2|
                                       (SPADCALL |x| |lk| |nlg| (QREFELT $ 89))
                                       . #38#)
                                 (LETT |cb0|
                                       (PROGN
                                        (LETT #14# NIL . #38#)
                                        (SEQ (LETT |be| NIL . #38#)
                                             (LETT #13# |res2| . #38#) G190
                                             (COND
                                              ((OR (ATOM #13#)
                                                   (PROGN
                                                    (LETT |be| (CAR #13#)
                                                          . #38#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #14#
                                                     (CONS (QCDR |be|) #14#)
                                                     . #38#)))
                                             (LETT #13# (CDR #13#) . #38#)
                                             (GO G190) G191
                                             (EXIT (NREVERSE #14#))))
                                       . #38#)
                                 (LETT |d1|
                                       (CONS #'|INTPAR2;diffextint1!1|
                                             (VECTOR $ |x|))
                                       . #38#)
                                 (PROGN
                                  (LETT |#G121|
                                        (|INTPAR2;constant_subspace| |cb0| |d1|
                                         $)
                                        . #38#)
                                  (LETT |m2| (QCAR |#G121|) . #38#)
                                  (LETT |cb1| (QCDR |#G121|) . #38#)
                                  |#G121|)
                                 (EXIT
                                  (COND ((NULL |cb1|) NIL)
                                        (#39#
                                         (SEQ
                                          (LETT |v2|
                                                (SPADCALL
                                                 (PROGN
                                                  (LETT #11# NIL . #38#)
                                                  (SEQ (LETT |be| NIL . #38#)
                                                       (LETT #10# |res2|
                                                             . #38#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #10#)
                                                             (PROGN
                                                              (LETT |be|
                                                                    (CAR #10#)
                                                                    . #38#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #11#
                                                               (CONS
                                                                (QCAR |be|)
                                                                #11#)
                                                               . #38#)))
                                                       (LETT #10# (CDR #10#)
                                                             . #38#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #11#))))
                                                 (QREFELT $ 172))
                                                . #38#)
                                          (LETT |v3|
                                                (SPADCALL |m2| |v2|
                                                          (QREFELT $ 173))
                                                . #38#)
                                          (LETT |ncb|
                                                (PROGN
                                                 (LETT #9# NIL . #38#)
                                                 (SEQ (LETT |bv| NIL . #38#)
                                                      (LETT #8# |cb1| . #38#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #8#)
                                                            (PROGN
                                                             (LETT |bv|
                                                                   (CAR #8#)
                                                                   . #38#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #9#
                                                              (CONS
                                                               (SPADCALL |bv|
                                                                         |cb|
                                                                         (QREFELT
                                                                          $
                                                                          125))
                                                               #9#)
                                                              . #38#)))
                                                      (LETT #8# (CDR #8#)
                                                            . #38#)
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #9#))))
                                                . #38#)
                                          (LETT |nlca|
                                                (PROGN
                                                 (LETT #7# NIL . #38#)
                                                 (SEQ (LETT |bv| NIL . #38#)
                                                      (LETT #6# |cb1| . #38#)
                                                      G190
                                                      (COND
                                                       ((OR (ATOM #6#)
                                                            (PROGN
                                                             (LETT |bv|
                                                                   (CAR #6#)
                                                                   . #38#)
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #7#
                                                              (CONS
                                                               (SPADCALL |bv|
                                                                         |lca|
                                                                         (QREFELT
                                                                          $
                                                                          118))
                                                               #7#)
                                                              . #38#)))
                                                      (LETT #6# (CDR #6#)
                                                            . #38#)
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #7#))))
                                                . #38#)
                                          (EXIT
                                           (PROGN
                                            (LETT #5# NIL . #38#)
                                            (SEQ (LETT |bv| NIL . #38#)
                                                 (LETT #4# |ncb| . #38#)
                                                 (LETT |ba| NIL . #38#)
                                                 (LETT #3# |nlca| . #38#)
                                                 (LETT |i| 1 . #38#)
                                                 (LETT #2# (QVSIZE |v3|)
                                                       . #38#)
                                                 G190
                                                 (COND
                                                  ((OR (|greater_SI| |i| #2#)
                                                       (ATOM #3#)
                                                       (PROGN
                                                        (LETT |ba| (CAR #3#)
                                                              . #38#)
                                                        NIL)
                                                       (ATOM #4#)
                                                       (PROGN
                                                        (LETT |bv| (CAR #4#)
                                                              . #38#)
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #5#
                                                         (CONS
                                                          (CONS
                                                           (SPADCALL
                                                            (SPADCALL |v3| |i|
                                                                      (QREFELT
                                                                       $ 149))
                                                            |ba|
                                                            (QREFELT $ 124))
                                                           |bv|)
                                                          #5#)
                                                         . #38#)))
                                                 (LETT |i|
                                                       (PROG1 (|inc_SI| |i|)
                                                         (LETT #3#
                                                               (PROG1 (CDR #3#)
                                                                 (LETT #4#
                                                                       (CDR
                                                                        #4#)
                                                                       . #38#))
                                                               . #38#))
                                                       . #38#)
                                                 (GO G190) G191
                                                 (EXIT
                                                  (NREVERSE
                                                   #5#)))))))))))))))))))))))
          #40# (EXIT #16#)))) 

(SDEFUN |INTPAR2;diffextint1!1| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTPAR2;diffextint1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 35)))))) 

(SDEFUN |INTPAR2;diffextint1!0| ((|x1| NIL) ($$ NIL))
        (PROG (|dv| $ |k1|)
          (LETT |dv| (QREFELT $$ 2) . #1=(|INTPAR2;diffextint1|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |k1| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |x1| (SPADCALL |dv| (QREFELT $ 164)) |k1|
                      (QREFELT $ 123)))))) 

(SDEFUN |INTPAR2;diffextint|
        ((|x| |Symbol|) (|k| |Kernel| F) (|l| |List| (|Kernel| F))
         (|lg| |List| F)
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G557 NIL) (|u| NIL) (#2=#:G556 NIL)
          (|diffi1|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| (|SparseUnivariatePolynomial| F))))
          (|cs1| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
          (|d1| (|Mapping| F F)))
         (SEQ
          (LETT |d1| (CONS #'|INTPAR2;diffextint!0| (VECTOR $ |x|))
                . #3=(|INTPAR2;diffextint|))
          (LETT |cs1| (CONS #'|INTPAR2;diffextint!1| (VECTOR $ |d1|)) . #3#)
          (LETT |diffi1|
                (CONS #'|INTPAR2;diffextint!2| (VECTOR $ |cs1| |l| |k| |x|))
                . #3#)
          (EXIT
           (SPADCALL |diffi1| |cs1|
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |u| NIL . #3#) (LETT #1# |lg| . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL |u| |k| (QREFELT $ 46)) #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 175)))))) 

(SDEFUN |INTPAR2;diffextint!2| ((|x1| NIL) ($$ NIL))
        (PROG (|x| |k| |l| |cs1| $)
          (LETT |x| (QREFELT $$ 4) . #1=(|INTPAR2;diffextint|))
          (LETT |k| (QREFELT $$ 3) . #1#)
          (LETT |l| (QREFELT $$ 2) . #1#)
          (LETT |cs1| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTPAR2;diffextint1| |x1| |x| |k| |l| |cs1| $))))) 

(SDEFUN |INTPAR2;diffextint!1| ((|x4| NIL) ($$ NIL))
        (PROG (|d1| $)
          (LETT |d1| (QREFELT $$ 1) . #1=(|INTPAR2;diffextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTPAR2;csolve1| |x4| |d1| $))))) 

(SDEFUN |INTPAR2;diffextint!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTPAR2;diffextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 35)))))) 

(SDEFUN |INTPAR2;unkextint|
        ((|x| |Symbol|) (|k| |Kernel| F) (|l| |List| (|Kernel| F))
         (|lg| |List| F)
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G568 NIL) (|u| NIL) (#2=#:G567 NIL)
          (|ext|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| F)))
          (|cs1| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
          (|d1| (|Mapping| F F)))
         (SEQ
          (LETT |d1| (CONS #'|INTPAR2;unkextint!0| (VECTOR $ |x|))
                . #3=(|INTPAR2;unkextint|))
          (LETT |cs1| (CONS #'|INTPAR2;unkextint!1| (VECTOR $ |d1|)) . #3#)
          (LETT |ext| (CONS #'|INTPAR2;unkextint!2| (VECTOR $ |l| |x|)) . #3#)
          (EXIT
           (SPADCALL |ext| |cs1|
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |u| NIL . #3#) (LETT #1# |lg| . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS (SPADCALL |u| |k| (QREFELT $ 46)) #2#)
                                   . #3#)))
                           (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 176)))))) 

(SDEFUN |INTPAR2;unkextint!2| ((|x3| NIL) ($$ NIL))
        (PROG (|x| |l| $)
          (LETT |x| (QREFELT $$ 2) . #1=(|INTPAR2;unkextint|))
          (LETT |l| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x| |l| |x3| (QREFELT $ 89)))))) 

(SDEFUN |INTPAR2;unkextint!1| ((|x4| NIL) ($$ NIL))
        (PROG (|d1| $)
          (LETT |d1| (QREFELT $$ 1) . #1=(|INTPAR2;unkextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|INTPAR2;csolve1| |x4| |d1| $))))) 

(SDEFUN |INTPAR2;unkextint!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|INTPAR2;unkextint|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 35)))))) 

(DECLAIM (NOTINLINE |ParametricIntegration;|)) 

(DEFUN |ParametricIntegration| (&REST #1=#:G569)
  (SPROG NIL
         (PROG (#2=#:G570)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ParametricIntegration|)
                                               '|domainEqualList|)
                    . #3=(|ParametricIntegration|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ParametricIntegration;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ParametricIntegration|)))))))))) 

(DEFUN |ParametricIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ParametricIntegration|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ParametricIntegration| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 177) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ParametricIntegration|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|prim|)
          (QSETREFV $ 9 '|%alg|)
          $))) 

(MAKEPROP '|ParametricIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'PRIM
              'ALGOP (|Boolean|) (|Symbol|) (|Kernel| 7) (0 . |is?|)
              (|BasicOperator|) (6 . |operator|) (11 . |has?|) (17 . |Zero|)
              (21 . |Zero|) (|Union| (|Vector| (|Fraction| 116)) '"failed")
              (|Record| (|:| |particular| 19)
                        (|:| |basis| (|List| (|Vector| (|Fraction| 116)))))
              (|Matrix| 7) (|Vector| 7) (|IntegerLinearDependence| 7)
              (25 . |solveLinearlyOverQ|)
              (|Record| (|:| |logands| 27)
                        (|:| |basis| (|List| (|Vector| (|Fraction| 116)))))
              (|List| 12) (|List| 7) |INTPAR2;logextint;SLLR;7|
              (|Record| (|:| |logands| 50)
                        (|:| |basis| (|List| (|Vector| (|Fraction| 116)))))
              (|List| 38) (|Mapping| (|List| (|Vector| (|Fraction| 116))) 21)
              (|Mapping| 25 27) (|ParametricTranscendentalIntegration| 7 38)
              (31 . |monologextint|) (38 . |differentiate|) (|Kernel| $)
              (44 . |coerce|) (|SparseUnivariatePolynomial| 7) (49 . |coerce|)
              (|Mapping| 7 7) (54 . |differentiate|) (|Factored| 38)
              (|ExpressionFactorPolynomial| 6 7) (61 . |factorPolynomial|)
              (|Fraction| 129) (66 . |univariate|) (|Mapping| 38 38)
              (|Mapping| 42 38) (|Mapping| 29 30) (|List| 52)
              (72 . |logextint|) (|Fraction| 38)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 12) 12
                                                     6
                                                     (|SparseMultivariatePolynomial|
                                                      6 12)
                                                     7)
              (81 . |multivariate|) (87 . |concat|) (93 . |One|) (97 . |One|)
              (|NonNegativeInteger|) (101 . |monomial|) (107 . |coerce|)
              (112 . |argument|) (117 . |One|) (|List| 36) (121 . |kernels|)
              (126 . |member?|) (132 . |false|) (136 . |true|) (|Mapping| 10 7)
              (140 . |every?|) (|List| 27) (146 . |matrix|)
              (|IntegrationTools| 6 7) (151 . |kmax|) (156 . ~=)
              (|Union| 11 '"failed") (162 . |symbolIfCan|) (167 . |coerce|)
              (|List| $) (172 . |tower|) (177 . |varselect|)
              (|Record| (|:| |ratpart| 7) (|:| |coeffs| 22))
              (|Union| 81 '"failed")
              (|Record| (|:| |particular| 82) (|:| |basis| 88))
              |INTPAR2;extendedint;FSLLR;10| |INTPAR2;extendedint;FSLR;8|
              (|List| 22) (183 . |nullSpace|) (|List| 81)
              |INTPAR2;extendedint;SLLL;9| (188 . -)
              (|LinearCombinationUtilities| 7 38) (193 . |dehomogenize|)
              (|Union| 22 '"failed")
              (|Record| (|:| |particular| 93) (|:| |basis| 86)) (|List| 40)
              (|ConstantLinearDependence| 6 7)
              (198 . |solveLinearOverConstants|) (|Mapping| 86 21)
              (|AlgebraicIntegration| 6 7) (205 . |algextint_base|)
              (214 . |cons|) (|Mapping| 88 26 27) (|Mapping| 25 26 27)
              (|ParametricRischDE| 6 7) (220 . |param_rde2|)
              (|Record| (|:| |ratpart| 52) (|:| |coeffs| 22))
              (|Mapping| 133 50) (|Mapping| 133 52 50) (230 . |algextint|)
              (241 . |is?|) (247 . |tower|)
              (|Record| (|:| |funs| 27) (|:| |nroot| 7) (|:| |npow1| 116)
                        (|:| |npow2| 116))
              (|List| 112) (|RootFSSplit| 6 7) (252 . |alg_split_roots|)
              (|Integer|) (259 . |setelt!|) (266 . |lin_comb|) (272 . >)
              (278 . |retract|) (283 . ^) (289 . *) (295 . |eval|) (302 . +)
              (308 . |lin_comb|)
              (|Record| (|:| |primelt| 7) (|:| |pol1| 38) (|:| |pol2| 38)
                        (|:| |prim| 38))
              (|FunctionSpacePrimitiveElement| 6 7) (314 . |primitiveElement|)
              (|SparseUnivariatePolynomial| $) (320 . |rootOf|) (325 . |elt|)
              (331 . |eval|) (|List| 106) (|Mapping| 88 27)
              (338 . |primextint|) (346 . |param_rde|) (|Mapping| 88 116 27)
              (357 . |expextint|) (365 . |entries|) (370 . |scalarMatrix|)
              (376 . |horizConcat|) (382 . |rowEchelon|) (387 . |elt|)
              (394 . =) (400 . <=) (406 . ~=) (412 . |row|) (418 . |transpose|)
              (423 . |elt|) (|UniversalSegment| 116) (429 . SEGMENT)
              (435 . |elt|) (441 . ~=) (447 . |elt|) (|List| 30) (|Matrix| 38)
              (453 . |matrix|) (|Matrix| $) (458 . |reducedSystem|)
              (463 . |coefficient|) (469 . |new|) (473 . /) (479 . |eval|)
              (486 . |kernel|) (491 . |map|) (497 . |numer|) (502 . |denom|)
              (507 . |One|) (511 . ~=) (517 . |degree|) (522 . >)
              (528 . |vector|) (533 . *) (|Mapping| 88 30) (539 . |diffextint|)
              (546 . |unkextint|))
           '#(|logextint| 553 |extendedint| 560) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 176
                                                 '(2 12 10 0 11 13 1 12 14 0 15
                                                   2 14 10 0 11 16 0 6 0 17 0 7
                                                   0 18 2 23 20 21 22 24 3 33
                                                   29 30 31 32 34 2 7 0 0 11 35
                                                   1 7 0 36 37 1 38 0 7 39 3 38
                                                   0 0 40 0 41 1 43 42 38 44 2
                                                   7 45 0 36 46 5 33 29 47 48
                                                   31 49 50 51 2 53 7 52 12 54
                                                   2 30 0 0 38 55 0 6 0 56 0 7
                                                   0 57 2 38 0 7 58 59 1 52 0
                                                   38 60 1 12 27 0 61 0 58 0 62
                                                   1 7 63 0 64 2 26 10 12 0 65
                                                   0 10 0 66 0 10 0 67 2 27 10
                                                   68 0 69 1 21 0 70 71 1 72 12
                                                   26 73 2 12 10 0 0 74 1 12 75
                                                   0 76 1 7 0 11 77 1 7 63 78
                                                   79 2 72 26 26 11 80 1 21 86
                                                   0 87 1 7 0 0 90 1 91 83 88
                                                   92 3 96 94 21 22 95 97 5 99
                                                   88 12 12 47 98 27 100 2 26 0
                                                   12 0 101 6 104 88 7 27 11 26
                                                   102 103 105 7 99 88 12 12 47
                                                   107 108 98 27 109 2 14 10 0
                                                   11 110 1 7 63 0 111 3 114
                                                   113 27 12 12 115 3 22 7 0
                                                   116 7 117 2 91 7 22 27 118 2
                                                   116 10 0 0 119 1 7 36 0 120
                                                   2 7 0 0 116 121 2 7 0 0 0
                                                   122 3 7 0 0 36 0 123 2 7 0 0
                                                   0 124 2 91 22 22 86 125 2
                                                   127 126 7 7 128 1 7 0 129
                                                   130 2 38 7 0 7 131 3 7 0 0
                                                   63 78 132 4 33 133 47 134 98
                                                   50 135 7 104 88 116 7 27 11
                                                   26 102 103 136 4 33 133 47
                                                   137 98 50 138 1 22 27 0 139
                                                   2 21 0 58 7 140 2 21 0 0 0
                                                   141 1 21 0 0 142 3 21 7 0
                                                   116 116 143 2 7 10 0 0 144 2
                                                   116 10 0 0 145 2 7 10 0 0
                                                   146 2 21 22 0 116 147 1 21 0
                                                   0 148 2 22 7 0 116 149 2 150
                                                   0 116 116 151 2 22 0 0 150
                                                   152 2 58 10 0 0 153 2 27 7 0
                                                   116 154 1 156 0 155 157 1 38
                                                   21 158 159 2 38 7 0 58 160 0
                                                   11 0 161 2 7 0 0 0 162 3 7 0
                                                   0 0 0 163 1 12 0 11 164 2 27
                                                   0 40 0 165 1 52 38 0 166 1
                                                   52 38 0 167 0 38 0 168 2 38
                                                   10 0 0 169 1 38 58 0 170 2
                                                   58 10 0 0 171 1 22 0 27 172
                                                   2 21 22 0 22 173 3 33 88 174
                                                   98 50 175 3 33 88 134 98 50
                                                   176 3 0 25 11 26 27 28 4 0
                                                   83 7 11 26 27 84 3 0 88 11
                                                   26 27 89 3 0 83 7 11 27
                                                   85)))))
           '|lookupComplete|)) 
