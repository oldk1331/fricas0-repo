
(SDEFUN |INTPAR2;prim?| ((|k| |Kernel| F) (|x| |Symbol|) ($ |Boolean|))
        (COND ((SPADCALL |k| '|log| (QREFELT $ 13)) 'T)
              ('T
               (SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 8)
                         (QREFELT $ 16))))) 

(SDEFUN |INTPAR2;csolve2|
        ((|m| |Matrix| F) ($ |List| (|Vector| (|Fraction| (|Integer|)))))
        (SPROG ((|v| (|Vector| F)) (|n| (|NonNegativeInteger|)))
               (SEQ (LETT |n| (ANROWS |m|))
                    (LETT |v| (MAKEARR1 |n| (|spadConstant| $ 18)))
                    (EXIT (QCDR (SPADCALL |m| |v| (QREFELT $ 24))))))) 

(SDEFUN |INTPAR2;primlogextint|
        ((|x| |Symbol|) (|k| |Kernel| F) (|l| |List| (|Kernel| F))
         (|lg| |List| F)
         ($ |Record| (|:| |logands| (|List| F))
          (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
        (SPROG
         ((#1=#:G162 NIL) (|le| NIL) (#2=#:G161 NIL)
          (|bl| #3=(|List| (|Vector| (|Fraction| (|Integer|)))))
          (|ll| #4=(|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|#G11|
           (|Record|
            (|:| |logands|
                 (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
          (#5=#:G160 NIL) (|g| NIL) (#6=#:G159 NIL)
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
          (LETT |rec1| (CONS #'|INTPAR2;primlogextint!0| (VECTOR $ |l| |x|)))
          (LETT |rec| (CONS #'|INTPAR2;primlogextint!1| (VECTOR |rec1| $)))
          (LETT |d1| (CONS #'|INTPAR2;primlogextint!2| (VECTOR $ |x|)))
          (LETT |der|
                (CONS #'|INTPAR2;primlogextint!3| (VECTOR |x| $ |k| |d1|)))
          (LETT |uf| (ELT $ 44))
          (PROGN
           (LETT |#G11|
                 (SPADCALL |der| |uf| (CONS (|function| |INTPAR2;csolve2|) $)
                           |rec|
                           (PROGN
                            (LETT #6# NIL)
                            (SEQ (LETT |g| NIL) (LETT #5# |lg|) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT |g| (CAR #5#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #6#
                                         (CONS
                                          (SPADCALL |g| |k| (QREFELT $ 46))
                                          #6#))))
                                 (LETT #5# (CDR #5#)) (GO G190) G191
                                 (EXIT (NREVERSE #6#))))
                           (QREFELT $ 51)))
           (LETT |ll| (QCAR |#G11|))
           (LETT |bl| (QCDR |#G11|))
           |#G11|)
          (EXIT
           (CONS
            (PROGN
             (LETT #2# NIL)
             (SEQ (LETT |le| NIL) (LETT #1# |ll|) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |le| (CAR #1#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |le| |k| (QREFELT $ 54)) #2#))))
                  (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT (NREVERSE #2#))))
            |bl|))))) 

(SDEFUN |INTPAR2;primlogextint!3| ((|x1| NIL) ($$ NIL))
        (PROG (|d1| |k| $ |x|)
          (LETT |d1| (QREFELT $$ 3))
          (LETT |k| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
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
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 35)))))) 

(SDEFUN |INTPAR2;primlogextint!1| ((|lg2| NIL) ($$ NIL))
        (PROG ($ |rec1|)
          (LETT $ (QREFELT $$ 1))
          (LETT |rec1| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |lg2| (CONS (|function| |INTPAR2;csolve2|) $) |rec1|
                      (QREFELT $ 34)))))) 

(SDEFUN |INTPAR2;primlogextint!0| ((|lg1| NIL) ($$ NIL))
        (PROG (|x| |l| $)
          (LETT |x| (QREFELT $$ 2))
          (LETT |l| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
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
                (SPADCALL |lg| (SPADCALL |eta| (QREFELT $ 39)) (QREFELT $ 55)))
          (PROGN
           (LETT |#G17|
                 (SPADCALL |lg1| (CONS (|function| |INTPAR2;csolve2|) $) |rec1|
                           (QREFELT $ 34)))
           (LETT |ll| (QCAR |#G17|))
           (LETT |bl| (QCDR |#G17|))
           |#G17|)
          (LETT |ll1|
                (CONS
                 (SPADCALL (SPADCALL (|spadConstant| $ 57) 1 (QREFELT $ 59))
                           (QREFELT $ 60))
                 |ll|))
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
                          (QREFELT $ 35)))
          (LETT |d1| (CONS #'|INTPAR2;explogextint!0| (VECTOR $ |x|)))
          (LETT |der| (CONS #'|INTPAR2;explogextint!1| (VECTOR $ |eta| |d1|)))
          (LETT |rec1| (CONS #'|INTPAR2;explogextint!2| (VECTOR $ |l| |x|)))
          (LETT |rec|
                (CONS #'|INTPAR2;explogextint!3| (VECTOR $ |rec1| |eta|)))
          (LETT |uf| (ELT $ 44))
          (PROGN
           (LETT |#G22|
                 (SPADCALL |der| |uf| (CONS (|function| |INTPAR2;csolve2|) $)
                           |rec|
                           (PROGN
                            (LETT #4# NIL)
                            (SEQ (LETT |g| NIL) (LETT #3# |lg|) G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT |g| (CAR #3#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #4#
                                         (CONS
                                          (SPADCALL |g| |k| (QREFELT $ 46))
                                          #4#))))
                                 (LETT #3# (CDR #3#)) (GO G190) G191
                                 (EXIT (NREVERSE #4#))))
                           (QREFELT $ 51)))
           (LETT |ll| (QCAR |#G22|))
           (LETT |bl| (QCDR |#G22|))
           |#G22|)
          (EXIT
           (CONS
            (PROGN
             (LETT #2# NIL)
             (SEQ (LETT |le| NIL) (LETT #1# |ll|) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |le| (CAR #1#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |le| |k| (QREFELT $ 54)) #2#))))
                  (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT (NREVERSE #2#))))
            |bl|))))) 

(SDEFUN |INTPAR2;explogextint!3| ((|lg2| NIL) ($$ NIL))
        (PROG (|eta| |rec1| $)
          (LETT |eta| (QREFELT $$ 2))
          (LETT |rec1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|INTPAR2;explogextint1| |lg2| |eta| |rec1| $))))) 

(SDEFUN |INTPAR2;explogextint!2| ((|lg1| NIL) ($$ NIL))
        (PROG (|x| |l| $)
          (LETT |x| (QREFELT $$ 2))
          (LETT |l| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |l| |lg1| (QREFELT $ 28)))))) 

(SDEFUN |INTPAR2;explogextint!1| ((|x1| NIL) ($$ NIL))
        (PROG (|d1| |eta| $)
          (LETT |d1| (QREFELT $$ 2))
          (LETT |eta| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |x1| |d1|
                      (SPADCALL |eta| (|spadConstant| $ 62) (QREFELT $ 59))
                      (QREFELT $ 41)))))) 

(SDEFUN |INTPAR2;explogextint!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 35)))))) 

(SDEFUN |INTPAR2;alglogextint|
        ((|x| |Symbol|) (|k| |Kernel| F) (|l| |List| (|Kernel| F))
         (|lg| |List| F)
         ($ |Record| (|:| |logands| (|List| F))
          (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
        (SPROG NIL
               (COND
                ((SPADCALL (CONS #'|INTPAR2;alglogextint!0| (VECTOR $ |k|))
                           |lg| (QREFELT $ 67))
                 (SPADCALL |x| |l| |lg| (QREFELT $ 28)))
                ('T (|error| "alglogextint: unimplemented"))))) 

(SDEFUN |INTPAR2;alglogextint!0| ((|g| NIL) ($$ NIL))
        (PROG (|k| $)
          (LETT |k| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (NULL
             (SPADCALL |k| (SPADCALL |g| (QREFELT $ 64)) (QREFELT $ 65))))))) 

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
                   (|INTPAR2;csolve2| (SPADCALL (LIST |lg|) (QREFELT $ 69)) $))
             (EXIT (CONS NIL |cb|))))
           (#3='T
            (SEQ (LETT |k| (SPADCALL |l| (QREFELT $ 71)))
                 (LETT |l|
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |k1| NIL) (LETT #1# |l|) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |k1| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |k1| |k| (QREFELT $ 72))
                                 (LETT #2# (CONS |k1| #2#))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#)))))
                 (COND
                  ((OR (QEQCAR (SPADCALL |k| (QREFELT $ 74)) 0)
                       (|INTPAR2;prim?| |k| |x| $))
                   (EXIT (|INTPAR2;primlogextint| |x| |k| |l| |lg| $))))
                 (EXIT
                  (COND
                   ((SPADCALL |k| '|exp| (QREFELT $ 13))
                    (|INTPAR2;explogextint| |x| |k| |l| |lg| $))
                   ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) (QREFELT $ 9)
                              (QREFELT $ 16))
                    (|INTPAR2;alglogextint| |x| |k| |l| |lg| $))
                   (#3# (|error| "logextint: unhandled kernel")))))))))) 

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
                        (CONS (SPADCALL |x| (QREFELT $ 75)) (CONS |f| |lg|))
                        (QREFELT $ 77))
                       |x| (QREFELT $ 78)))
                (EXIT (SPADCALL |f| |x| |l| |lg| (QREFELT $ 82)))))) 

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
                   (SPADCALL (SPADCALL (LIST |lg|) (QREFELT $ 69))
                             (QREFELT $ 85)))
             (EXIT
              (PROGN
               (LETT #4# NIL)
               (SEQ (LETT |kv| NIL) (LETT #3# |cb|) G190
                    (COND
                     ((OR (ATOM #3#) (PROGN (LETT |kv| (CAR #3#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #4# (CONS (CONS (|spadConstant| $ 18) |kv|) #4#))))
                    (LETT #3# (CDR #3#)) (GO G190) G191
                    (EXIT (NREVERSE #4#)))))))
           (#5='T
            (SEQ (LETT |k| (SPADCALL |l| (QREFELT $ 71)))
                 (LETT |l|
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |k1| NIL) (LETT #1# |l|) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |k1| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |k1| |k| (QREFELT $ 72))
                                 (LETT #2# (CONS |k1| #2#))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT (NREVERSE #2#)))))
                 (COND
                  ((OR (QEQCAR (SPADCALL |k| (QREFELT $ 74)) 0)
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
                   (#5# (|INTPAR2;unkextint| |x| |k| |l| |lg| $)))))))))) 

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
         (SPADCALL |x| |l| (CONS (SPADCALL |f| (QREFELT $ 88)) |lg|)
                   (QREFELT $ 87))
         (QREFELT $ 90))) 

(SDEFUN |INTPAR2;csolve1|
        ((|m| |Matrix| F) (|d1| |Mapping| F F) ($ |List| (|Vector| F)))
        (SPADCALL |m| (LIST |d1|) (QREFELT $ 93))) 

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
          (LETT |k| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |fn| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((#1=#:G252 NIL) (|a| NIL) (#2=#:G253 NIL) (|be| NIL)
              (#3=#:G251 NIL) (|la| NIL) (#4=#:G250 NIL) (#5=#:G249 NIL)
              (|r1| NIL) (|lf| NIL) (#6=#:G248 NIL) (|rf| NIL) (#7=#:G247 NIL))
             (SEQ
              (LETT |lf|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |rf| NIL) (LETT #6# |lrf|) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |rf| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS (SPADCALL |rf| |k| (QREFELT $ 54))
                                        #7#))))
                          (LETT #6# (CDR #6#)) (GO G190) G191
                          (EXIT (NREVERSE #7#)))))
              (LETT |r1| (SPADCALL |lf| |fn|))
              (LETT |la|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |be| NIL) (LETT #4# |r1|) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |be| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS
                                   (SPADCALL (QCAR |be|) |k| (QREFELT $ 46))
                                   #5#))))
                          (LETT #4# (CDR #4#)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (EXIT
               (PROGN
                (LETT #3# NIL)
                (SEQ (LETT |be| NIL) (LETT #2# |r1|) (LETT |a| NIL)
                     (LETT #1# |la|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL)
                           (ATOM #2#) (PROGN (LETT |be| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ (EXIT (LETT #3# (CONS (CONS |a| (QCDR |be|)) #3#))))
                     (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                     (GO G190) G191 (EXIT (NREVERSE #3#))))))))))) 

(SDEFUN |INTPAR2;algextint|
        ((|x| |Symbol|) (|k| |Kernel| F) (|l| |List| (|Kernel| F))
         (|lg| |List| F)
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G396 NIL) (|be| NIL) (#2=#:G395 NIL)
          (|res1|
           (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|lg1| (|List| F)) (#3=#:G394 NIL) (|g| NIL) (#4=#:G393 NIL)
          (|nk| (F)) (|nk1| (F)) (|yk| #5=(|Kernel| F)) (|y| (F))
          (|rec|
           (|Record| (|:| |primelt| F)
                     (|:| |pol1| (|SparseUnivariatePolynomial| F))
                     (|:| |pol2| (|SparseUnivariatePolynomial| F))
                     (|:| |prim| (|SparseUnivariatePolynomial| F))))
          (#6=#:G391 NIL) (|a1| NIL) (#7=#:G392 NIL) (|bv| NIL) (#8=#:G390 NIL)
          (|cb| (|List| (|Vector| F))) (|ncb| (|List| (|Vector| F)))
          (#9=#:G389 NIL) (#10=#:G388 NIL) (|ca| (|List| F)) (|nca| (|List| F))
          (#11=#:G386 NIL) (#12=#:G387 NIL) (#13=#:G385 NIL) (|na1| (|List| F))
          (#14=#:G384 NIL) (#15=#:G383 NIL) (#16=#:G382 NIL) (#17=#:G381 NIL)
          (|oroot| (F)) (|nrr| #5#) (#18=#:G380 NIL) (#19=#:G379 NIL)
          (#20=#:G378 NIL) (#21=#:G376 NIL) (|i| NIL) (#22=#:G377 NIL)
          (#23=#:G375 NIL) (#24=#:G374 NIL) (#25=#:G373 NIL) (#26=#:G372 NIL)
          (|n| (|NonNegativeInteger|))
          (|al|
           (|List|
            (|Record| (|:| |funs| (|List| F)) (|:| |nroot| F)
                      (|:| |npow1| (|Integer|)) (|:| |npow2| (|Integer|)))))
          (#27=#:G371 NIL) (|k2| NIL) (#28=#:G370 NIL)
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
          (|d1| (|Mapping| F F)) (#29=#:G369 NIL) (#30=#:G368 NIL)
          (|k1| (|Kernel| F)))
         (SEQ (LETT |k1| (SPADCALL |l| (QREFELT $ 71)))
              (LETT |l|
                    (PROGN
                     (LETT #30# NIL)
                     (SEQ (LETT |k2| NIL) (LETT #29# |l|) G190
                          (COND
                           ((OR (ATOM #29#) (PROGN (LETT |k2| (CAR #29#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |k2| |k1| (QREFELT $ 72))
                              (LETT #30# (CONS |k2| #30#))))))
                          (LETT #29# (CDR #29#)) (GO G190) G191
                          (EXIT (NREVERSE #30#)))))
              (COND
               ((OR (QEQCAR (SPADCALL |k1| (QREFELT $ 74)) 0)
                    (OR (|INTPAR2;prim?| |k1| |x| $)
                        (SPADCALL |k1| '|exp| (QREFELT $ 13))))
                (EXIT
                 (SEQ (LETT |d1| (CONS #'|INTPAR2;algextint!0| (VECTOR $ |x|)))
                      (LETT |cs1|
                            (CONS #'|INTPAR2;algextint!1| (VECTOR $ |d1|)))
                      (LETT |dk|
                            (COND
                             ((SPADCALL |k1| '|exp| (QREFELT $ 13))
                              (SPADCALL
                               (SPADCALL
                                (|SPADfirst| (SPADCALL |k1| (QREFELT $ 61)))
                                |x| (QREFELT $ 35))
                               1 (QREFELT $ 59)))
                             (#31='T
                              (SPADCALL
                               (SPADCALL (SPADCALL |k1| (QREFELT $ 37)) |x|
                                         (QREFELT $ 35))
                               (QREFELT $ 39)))))
                      (LETT |der1|
                            (CONS #'|INTPAR2;algextint!2|
                                  (VECTOR $ |dk| |d1|)))
                      (EXIT
                       (COND
                        ((QEQCAR (SPADCALL |k1| (QREFELT $ 74)) 0)
                         (SPADCALL |k1| |k| |der1| |cs1| |lg| (QREFELT $ 96)))
                        (#31#
                         (SEQ
                          (LETT |ext1|
                                (CONS #'|INTPAR2;algextint!3|
                                      (VECTOR $ |l| |k1| |x|)))
                          (LETT |ext2|
                                (CONS #'|INTPAR2;algextint!4| (VECTOR $ |x|)))
                          (LETT |logi|
                                (CONS #'|INTPAR2;algextint!5| (VECTOR $ |x|)))
                          (LETT |rde1|
                                (CONS #'|INTPAR2;algextint!6|
                                      (VECTOR |logi| |ext2| $ |l| |k1| |x|)))
                          (LETT |rde2|
                                (CONS #'|INTPAR2;algextint!8|
                                      (VECTOR |k1| $ |rde1|)))
                          (EXIT
                           (SPADCALL |k1| |k| |der1|
                                     (|INTPAR2;wrapfn| |ext1| |k1| $) |rde2|
                                     |cs1| |lg| (QREFELT $ 105)))))))))))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |k1| (QREFELT $ 15)) (QREFELT $ 9)
                           (QREFELT $ 16))
                 (SEQ
                  (COND
                   ((SPADCALL (SPADCALL |k| (QREFELT $ 15)) '|nthRoot|
                              (QREFELT $ 106))
                    (COND
                     ((SPADCALL (SPADCALL |k1| (QREFELT $ 15)) '|nthRoot|
                                (QREFELT $ 106))
                      (COND
                       ((NULL
                         (SPADCALL |k1|
                                   (SPADCALL (SPADCALL |k| (QREFELT $ 37))
                                             (QREFELT $ 107))
                                   (QREFELT $ 65)))
                        (EXIT
                         (SEQ
                          (LETT |l|
                                (PROGN
                                 (LETT #28# NIL)
                                 (SEQ (LETT |k2| NIL) (LETT #27# |l|) G190
                                      (COND
                                       ((OR (ATOM #27#)
                                            (PROGN (LETT |k2| (CAR #27#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL |k2| |k1| (QREFELT $ 72))
                                          (LETT #28# (CONS |k2| #28#))))))
                                      (LETT #27# (CDR #27#)) (GO G190) G191
                                      (EXIT (NREVERSE #28#)))))
                          (LETT |al| (SPADCALL |lg| |k| |k1| (QREFELT $ 111)))
                          (LETT |n| (LENGTH |lg|))
                          (LETT |ca|
                                (PROGN
                                 (LETT #26# NIL)
                                 (SEQ (LETT |i| 1) (LETT #25# |n|) G190
                                      (COND
                                       ((|greater_SI| |i| #25#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #26#
                                              (CONS (|spadConstant| $ 18)
                                                    #26#))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT (NREVERSE #26#)))))
                          (LETT |cb|
                                (PROGN
                                 (LETT #24# NIL)
                                 (SEQ (LETT |i| 1) (LETT #23# |n|) G190
                                      (COND
                                       ((|greater_SI| |i| #23#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #24#
                                              (CONS
                                               (MAKEARR1 |n|
                                                         (|spadConstant| $ 18))
                                               #24#))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT (NREVERSE #24#)))))
                          (SEQ (LETT |bv| NIL) (LETT #22# |cb|) (LETT |i| 1)
                               (LETT #21# |n|) G190
                               (COND
                                ((OR (|greater_SI| |i| #21#) (ATOM #22#)
                                     (PROGN (LETT |bv| (CAR #22#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (SPADCALL |bv| |i| (|spadConstant| $ 57)
                                           (QREFELT $ 113))))
                               (LETT |i|
                                     (PROG1 (|inc_SI| |i|)
                                       (LETT #22# (CDR #22#))))
                               (GO G190) G191 (EXIT NIL))
                          (SEQ (LETT |rec| NIL) (LETT #20# |al|) G190
                               (COND
                                ((OR (ATOM #20#)
                                     (PROGN (LETT |rec| (CAR #20#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |lg1|
                                      (PROGN
                                       (LETT #19# NIL)
                                       (SEQ (LETT |bv| NIL) (LETT #18# |cb|)
                                            G190
                                            (COND
                                             ((OR (ATOM #18#)
                                                  (PROGN
                                                   (LETT |bv| (CAR #18#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #19#
                                                    (CONS
                                                     (SPADCALL |bv|
                                                               (QVELT |rec| 0)
                                                               (QREFELT $ 114))
                                                     #19#))))
                                            (LETT #18# (CDR #18#)) (GO G190)
                                            G191 (EXIT (NREVERSE #19#)))))
                                (COND
                                 ((SPADCALL (+ (QVELT |rec| 2) (QVELT |rec| 3))
                                            0 (QREFELT $ 115))
                                  (SEQ
                                   (LETT |nrr|
                                         (SPADCALL (QVELT |rec| 1)
                                                   (QREFELT $ 116)))
                                   (LETT |res1|
                                         (SPADCALL |x| (CONS |nrr| |l|) |lg1|
                                                   (QREFELT $ 87)))
                                   (LETT |oroot|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |k| (QREFELT $ 37))
                                           (QVELT |rec| 2) (QREFELT $ 117))
                                          (SPADCALL
                                           (SPADCALL |k1| (QREFELT $ 37))
                                           (QVELT |rec| 3) (QREFELT $ 117))
                                          (QREFELT $ 118)))
                                   (EXIT
                                    (LETT |na1|
                                          (PROGN
                                           (LETT #17# NIL)
                                           (SEQ (LETT |be| NIL)
                                                (LETT #16# |res1|) G190
                                                (COND
                                                 ((OR (ATOM #16#)
                                                      (PROGN
                                                       (LETT |be| (CAR #16#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #17#
                                                        (CONS
                                                         (SPADCALL (QCAR |be|)
                                                                   |nrr|
                                                                   |oroot|
                                                                   (QREFELT $
                                                                            119))
                                                         #17#))))
                                                (LETT #16# (CDR #16#))
                                                (GO G190) G191
                                                (EXIT (NREVERSE #17#))))))))
                                 ('T
                                  (SEQ
                                   (LETT |res1|
                                         (SPADCALL |x| |l| |lg1|
                                                   (QREFELT $ 87)))
                                   (EXIT
                                    (LETT |na1|
                                          (PROGN
                                           (LETT #15# NIL)
                                           (SEQ (LETT |be| NIL)
                                                (LETT #14# |res1|) G190
                                                (COND
                                                 ((OR (ATOM #14#)
                                                      (PROGN
                                                       (LETT |be| (CAR #14#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #15#
                                                        (CONS (QCAR |be|)
                                                              #15#))))
                                                (LETT #14# (CDR #14#))
                                                (GO G190) G191
                                                (EXIT (NREVERSE #15#)))))))))
                                (LETT |nca|
                                      (PROGN
                                       (LETT #13# NIL)
                                       (SEQ (LETT |a1| NIL) (LETT #12# |na1|)
                                            (LETT |be| NIL) (LETT #11# |res1|)
                                            G190
                                            (COND
                                             ((OR (ATOM #11#)
                                                  (PROGN
                                                   (LETT |be| (CAR #11#))
                                                   NIL)
                                                  (ATOM #12#)
                                                  (PROGN
                                                   (LETT |a1| (CAR #12#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #13#
                                                    (CONS
                                                     (SPADCALL
                                                      (SPADCALL (QCDR |be|)
                                                                |ca|
                                                                (QREFELT $
                                                                         114))
                                                      |a1| (QREFELT $ 120))
                                                     #13#))))
                                            (LETT #11#
                                                  (PROG1 (CDR #11#)
                                                    (LETT #12# (CDR #12#))))
                                            (GO G190) G191
                                            (EXIT (NREVERSE #13#)))))
                                (LETT |ca| |nca|)
                                (LETT |ncb|
                                      (PROGN
                                       (LETT #10# NIL)
                                       (SEQ (LETT |be| NIL) (LETT #9# |res1|)
                                            G190
                                            (COND
                                             ((OR (ATOM #9#)
                                                  (PROGN
                                                   (LETT |be| (CAR #9#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #10#
                                                    (CONS
                                                     (SPADCALL (QCDR |be|) |cb|
                                                               (QREFELT $ 121))
                                                     #10#))))
                                            (LETT #9# (CDR #9#)) (GO G190) G191
                                            (EXIT (NREVERSE #10#)))))
                                (EXIT (LETT |cb| |ncb|)))
                               (LETT #20# (CDR #20#)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (PROGN
                            (LETT #8# NIL)
                            (SEQ (LETT |bv| NIL) (LETT #7# |cb|)
                                 (LETT |a1| NIL) (LETT #6# |ca|) G190
                                 (COND
                                  ((OR (ATOM #6#)
                                       (PROGN (LETT |a1| (CAR #6#)) NIL)
                                       (ATOM #7#)
                                       (PROGN (LETT |bv| (CAR #7#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #8# (CONS (CONS |a1| |bv|) #8#))))
                                 (LETT #6#
                                       (PROG1 (CDR #6#) (LETT #7# (CDR #7#))))
                                 (GO G190) G191
                                 (EXIT (NREVERSE #8#)))))))))))))
                  (LETT |rec|
                        (SPADCALL (SPADCALL |k1| (QREFELT $ 37))
                                  (SPADCALL |k| (QREFELT $ 37))
                                  (QREFELT $ 124)))
                  (LETT |y| (SPADCALL (QVELT |rec| 3) (QREFELT $ 126)))
                  (LETT |yk| (SPADCALL |y| (QREFELT $ 116)))
                  (LETT |nk1| (SPADCALL (QVELT |rec| 1) |y| (QREFELT $ 127)))
                  (LETT |nk| (SPADCALL (QVELT |rec| 2) |y| (QREFELT $ 127)))
                  (LETT |lg1|
                        (PROGN
                         (LETT #4# NIL)
                         (SEQ (LETT |g| NIL) (LETT #3# |lg|) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |g| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #4#
                                      (CONS
                                       (SPADCALL |g| (LIST |k1| |k|)
                                                 (LIST |nk1| |nk|)
                                                 (QREFELT $ 128))
                                       #4#))))
                              (LETT #3# (CDR #3#)) (GO G190) G191
                              (EXIT (NREVERSE #4#)))))
                  (LETT |res1| (|INTPAR2;algextint| |x| |yk| |l| |lg1| $))
                  (EXIT
                   (PROGN
                    (LETT #2# NIL)
                    (SEQ (LETT |be| NIL) (LETT #1# |res1|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |be| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (CONS
                                   (SPADCALL (QCAR |be|) |yk| (QVELT |rec| 0)
                                             (QREFELT $ 119))
                                   (QCDR |be|))
                                  #2#))))
                         (LETT #1# (CDR #1#)) (GO G190) G191
                         (EXIT (NREVERSE #2#)))))))
                (#31# (|error| "algextint unimplemented kernel"))))))) 

(SDEFUN |INTPAR2;algextint!8| ((|x5| NIL) (|x4| NIL) ($$ NIL))
        (PROG (|rde1| $ |k1|)
          (LETT |rde1| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |k1| (QREFELT $$ 0))
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
          (LETT |x5| (QREFELT $$ 3))
          (LETT |k1| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |rde1| (QREFELT $$ 0))
          (RETURN
           (PROGN (SPADCALL (SPADCALL |x5| |k1| (QREFELT $ 54)) |x3| |rde1|))))) 

(SDEFUN |INTPAR2;algextint!6| ((|x6| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|x| |k1| |l| $ |ext2| |logi|)
          (LETT |x| (QREFELT $$ 5))
          (LETT |k1| (QREFELT $$ 4))
          (LETT |l| (QREFELT $$ 3))
          (LETT $ (QREFELT $$ 2))
          (LETT |ext2| (QREFELT $$ 1))
          (LETT |logi| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |x6| |x3| |x| (SPADCALL |k1| |l| (QREFELT $ 97)) |ext2|
                      |logi| (QREFELT $ 101)))))) 

(SDEFUN |INTPAR2;algextint!5| ((|x2| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |x2| |x3| (QREFELT $ 28)))))) 

(SDEFUN |INTPAR2;algextint!4| ((|x4| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |x4| |x3| (QREFELT $ 87)))))) 

(SDEFUN |INTPAR2;algextint!3| ((|x3| NIL) ($$ NIL))
        (PROG (|x| |k1| |l| $)
          (LETT |x| (QREFELT $$ 3))
          (LETT |k1| (QREFELT $$ 2))
          (LETT |l| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |x| (SPADCALL |k1| |l| (QREFELT $ 97)) |x3|
                      (QREFELT $ 87)))))) 

(SDEFUN |INTPAR2;algextint!2| ((|x1| NIL) ($$ NIL))
        (PROG (|d1| |dk| $)
          (LETT |d1| (QREFELT $$ 2))
          (LETT |dk| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |d1| |dk| (QREFELT $ 41)))))) 

(SDEFUN |INTPAR2;algextint!1| ((|x2| NIL) ($$ NIL))
        (PROG (|d1| $)
          (LETT |d1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|INTPAR2;csolve1| |x2| |d1| $))))) 

(SDEFUN |INTPAR2;algextint!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 35)))))) 

(SDEFUN |INTPAR2;primextint|
        ((|x| |Symbol|) (|k| |Kernel| F) (|l| |List| (|Kernel| F))
         (|lu| |List| F)
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G416 NIL) (|si| NIL) (#2=#:G415 NIL)
          (|res1|
           (|List|
            (|Record|
             (|:| |ratpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |coeffs| (|Vector| F)))))
          (#3=#:G414 NIL) (|u| NIL) (#4=#:G413 NIL)
          (|cs1| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
          (|ext|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| F)))
          (|der|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|d1| (|Mapping| F F)))
         (SEQ (LETT |d1| (CONS #'|INTPAR2;primextint!0| (VECTOR $ |x|)))
              (LETT |der|
                    (CONS #'|INTPAR2;primextint!1| (VECTOR |x| $ |k| |d1|)))
              (LETT |ext| (CONS #'|INTPAR2;primextint!2| (VECTOR $ |l| |x|)))
              (LETT |cs1| (CONS #'|INTPAR2;primextint!3| (VECTOR $ |d1|)))
              (LETT |res1|
                    (SPADCALL |der| |ext| |cs1|
                              (PROGN
                               (LETT #4# NIL)
                               (SEQ (LETT |u| NIL) (LETT #3# |lu|) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN (LETT |u| (CAR #3#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #4#
                                            (CONS
                                             (SPADCALL |u| |k| (QREFELT $ 46))
                                             #4#))))
                                    (LETT #3# (CDR #3#)) (GO G190) G191
                                    (EXIT (NREVERSE #4#))))
                              (QREFELT $ 131)))
              (EXIT
               (PROGN
                (LETT #2# NIL)
                (SEQ (LETT |si| NIL) (LETT #1# |res1|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |si| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (CONS (SPADCALL (QCAR |si|) |k| (QREFELT $ 54))
                                    (QCDR |si|))
                              #2#))))
                     (LETT #1# (CDR #1#)) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |INTPAR2;primextint!3| ((|x4| NIL) ($$ NIL))
        (PROG (|d1| $)
          (LETT |d1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|INTPAR2;csolve1| |x4| |d1| $))))) 

(SDEFUN |INTPAR2;primextint!2| ((|x3| NIL) ($$ NIL))
        (PROG (|x| |l| $)
          (LETT |x| (QREFELT $$ 2))
          (LETT |l| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |l| |x3| (QREFELT $ 87)))))) 

(SDEFUN |INTPAR2;primextint!1| ((|x1| NIL) ($$ NIL))
        (PROG (|d1| |k| $ |x|)
          (LETT |d1| (QREFELT $$ 3))
          (LETT |k| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
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
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
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
         (SEQ (LETT |eta| (|SPADfirst| (SPADCALL |k| (QREFELT $ 61))))
              (LETT |d1| (CONS #'|INTPAR2;expextint!0| (VECTOR $ |x|)))
              (LETT |der|
                    (CONS #'|INTPAR2;expextint!1| (VECTOR $ |x| |eta| |d1|)))
              (LETT |ext| (CONS #'|INTPAR2;expextint!2| (VECTOR $ |x|)))
              (LETT |logi| (CONS #'|INTPAR2;expextint!3| (VECTOR $ |x|)))
              (LETT |rde|
                    (CONS #'|INTPAR2;expextint!4|
                          (VECTOR $ |logi| |ext| |l| |x| |eta|)))
              (LETT |cs1| (CONS #'|INTPAR2;expextint!5| (VECTOR $ |d1|)))
              (LETT |res1|
                    (SPADCALL |der| |rde| |cs1|
                              (PROGN
                               (LETT #4# NIL)
                               (SEQ (LETT |u| NIL) (LETT #3# |lu|) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN (LETT |u| (CAR #3#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #4#
                                            (CONS
                                             (SPADCALL |u| |k| (QREFELT $ 46))
                                             #4#))))
                                    (LETT #3# (CDR #3#)) (GO G190) G191
                                    (EXIT (NREVERSE #4#))))
                              (QREFELT $ 134)))
              (EXIT
               (PROGN
                (LETT #2# NIL)
                (SEQ (LETT |si| NIL) (LETT #1# |res1|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |si| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (CONS (SPADCALL (QCAR |si|) |k| (QREFELT $ 54))
                                    (QCDR |si|))
                              #2#))))
                     (LETT #1# (CDR #1#)) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |INTPAR2;expextint!5| ((|x4| NIL) ($$ NIL))
        (PROG (|d1| $)
          (LETT |d1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|INTPAR2;csolve1| |x4| |d1| $))))) 

(SDEFUN |INTPAR2;expextint!4| ((|x1| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|eta| |x| |l| |ext| |logi| $)
          (LETT |eta| (QREFELT $$ 5))
          (LETT |x| (QREFELT $$ 4))
          (LETT |l| (QREFELT $$ 3))
          (LETT |ext| (QREFELT $$ 2))
          (LETT |logi| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |x1| |eta| |x3| |x| |l| |ext| |logi| (QREFELT $ 132)))))) 

(SDEFUN |INTPAR2;expextint!3| ((|x2| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |x2| |x3| (QREFELT $ 28)))))) 

(SDEFUN |INTPAR2;expextint!2| ((|x2| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |x2| |x3| (QREFELT $ 87)))))) 

(SDEFUN |INTPAR2;expextint!1| ((|x1| NIL) ($$ NIL))
        (PROG (|d1| |eta| |x| $)
          (LETT |d1| (QREFELT $$ 3))
          (LETT |eta| (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |x1| |d1|
                      (SPADCALL (SPADCALL |eta| |x| (QREFELT $ 35))
                                (|spadConstant| $ 62) (QREFELT $ 59))
                      (QREFELT $ 41)))))) 

(SDEFUN |INTPAR2;expextint!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 35)))))) 

(SDEFUN |INTPAR2;diffextint1|
        ((|lup| |List| (|SparseUnivariatePolynomial| F)) (|x| |Symbol|)
         (|k| |Kernel| F) (|lk| |List| (|Kernel| F))
         (|csolve| |Mapping| #1=(|List| (|Vector| F)) (|Matrix| F))
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#2=#:G508 NIL) (|ba| NIL) (#3=#:G509 NIL) (|bv| NIL) (#4=#:G507 NIL)
          (|nlca| (|List| F)) (#5=#:G505 NIL) (#6=#:G506 NIL) (|be| NIL)
          (#7=#:G504 NIL) (|ncb| (|List| (|Vector| F))) (#8=#:G503 NIL)
          (#9=#:G502 NIL) (#10=#:G501 NIL) (#11=#:G500 NIL)
          (|cb1| (|List| #12=(|Vector| F))) (#13=#:G499 NIL) (#14=#:G498 NIL)
          (|res2|
           #15=(|List|
                (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
          (|nlg| (|List| F)) (|ng| (F)) (#16=#:G476 NIL)
          (|nu| (|SparseUnivariatePolynomial| F))
          (|du| (|Fraction| (|SparseUnivariatePolynomial| F))) (#17=#:G495 NIL)
          (|ca| NIL) (#18=#:G496 NIL) (|g1| NIL) (#19=#:G497 NIL) (|g0| NIL)
          (|lca| (|List| F)) (|nlg0| (|List| F)) (#20=#:G494 NIL)
          (#21=#:G493 NIL) (|lg3| (|List| F)) (#22=#:G492 NIL) (#23=#:G491 NIL)
          (|v3| (|Vector| F)) (|v2| (|Vector| F)) (#24=#:G490 NIL)
          (#25=#:G489 NIL) (|cb| #26=(|List| (|Vector| F)))
          (|m2| #27=(|Matrix| F))
          (|#G104| (|Record| (|:| |transform| #27#) (|:| |basis| #26#)))
          (|d1| (|Mapping| F F)) (|cb0| (|List| #12#)) (#28=#:G488 NIL)
          (#29=#:G487 NIL) (|res1| #15#) (|lk1| (|List| (|Kernel| F)))
          (|lek| (|List| F)) (#30=#:G486 NIL) (|ki| NIL) (#31=#:G485 NIL)
          (|lg2| (|List| F)) (#32=#:G484 NIL) (|g| NIL) (#33=#:G483 NIL)
          (|dvf| (F)) (|dv| (|Symbol|)) (|k1| (F)) (|lg1| (|List| F))
          (#34=#:G482 NIL) (|up| NIL) (#35=#:G481 NIL) (|lg0| (|List| F))
          (#36=#:G480 NIL) (#37=#:G479 NIL) (#38=#:G478 NIL) (#39=#:G477 NIL)
          (|b0| #1#) (|rs1| (|Matrix| F))
          (|m1| (|Matrix| (|SparseUnivariatePolynomial| F))) (|da3| (F))
          (|arg3| (F)) (|args| (|List| F)))
         (SEQ
          (EXIT
           (SEQ (LETT |args| (SPADCALL |k| (QREFELT $ 61)))
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |args|) 3 (QREFELT $ 135))
                   (|error| "internal error, k is not a diff"))
                  (#40='T
                   (SEQ (LETT |arg3| (SPADCALL |args| 3 (QREFELT $ 136)))
                        (LETT |da3| (SPADCALL |arg3| |x| (QREFELT $ 35)))
                        (EXIT
                         (COND
                          ((SPADCALL |da3| (|spadConstant| $ 18)
                                     (QREFELT $ 137))
                           (SEQ
                            (LETT |m1| (SPADCALL (LIST |lup|) (QREFELT $ 140)))
                            (LETT |rs1| (SPADCALL |m1| (QREFELT $ 142)))
                            (LETT |b0| (SPADCALL |rs1| |csolve|))
                            (EXIT
                             (PROGN
                              (LETT #39# NIL)
                              (SEQ (LETT |bv| NIL) (LETT #38# |b0|) G190
                                   (COND
                                    ((OR (ATOM #38#)
                                         (PROGN (LETT |bv| (CAR #38#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #39#
                                           (CONS
                                            (CONS (|spadConstant| $ 18) |bv|)
                                            #39#))))
                                   (LETT #38# (CDR #38#)) (GO G190) G191
                                   (EXIT (NREVERSE #39#)))))))
                          (#40#
                           (SEQ
                            (LETT |lg0|
                                  (PROGN
                                   (LETT #37# NIL)
                                   (SEQ (LETT |up| NIL) (LETT #36# |lup|) G190
                                        (COND
                                         ((OR (ATOM #36#)
                                              (PROGN
                                               (LETT |up| (CAR #36#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #37#
                                                (CONS
                                                 (SPADCALL |up| 0
                                                           (QREFELT $ 143))
                                                 #37#))))
                                        (LETT #36# (CDR #36#)) (GO G190) G191
                                        (EXIT (NREVERSE #37#)))))
                            (LETT |lg1|
                                  (PROGN
                                   (LETT #35# NIL)
                                   (SEQ (LETT |up| NIL) (LETT #34# |lup|) G190
                                        (COND
                                         ((OR (ATOM #34#)
                                              (PROGN
                                               (LETT |up| (CAR #34#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #35#
                                                (CONS
                                                 (SPADCALL |up| 1
                                                           (QREFELT $ 143))
                                                 #35#))))
                                        (LETT #34# (CDR #34#)) (GO G190) G191
                                        (EXIT (NREVERSE #35#)))))
                            (LETT |k1|
                                  (SPADCALL (SPADCALL |args| 1 (QREFELT $ 136))
                                            (SPADCALL
                                             (SPADCALL |args| 2
                                                       (QREFELT $ 136))
                                             (QREFELT $ 116))
                                            |arg3| (QREFELT $ 119)))
                            (LETT |dv| (SPADCALL (QREFELT $ 144)))
                            (LETT |dvf| (SPADCALL |dv| (QREFELT $ 75)))
                            (LETT |lg2|
                                  (PROGN
                                   (LETT #33# NIL)
                                   (SEQ (LETT |g| NIL) (LETT #32# |lg1|) G190
                                        (COND
                                         ((OR (ATOM #32#)
                                              (PROGN
                                               (LETT |g| (CAR #32#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #33#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |g| |da3|
                                                            (QREFELT $ 145))
                                                  |k1| |dvf| (QREFELT $ 146))
                                                 #33#))))
                                        (LETT #32# (CDR #32#)) (GO G190) G191
                                        (EXIT (NREVERSE #33#)))))
                            (LETT |lek|
                                  (PROGN
                                   (LETT #31# NIL)
                                   (SEQ (LETT |ki| NIL) (LETT #30# |lk|) G190
                                        (COND
                                         ((OR (ATOM #30#)
                                              (PROGN
                                               (LETT |ki| (CAR #30#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #31#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |ki|
                                                            (QREFELT $ 37))
                                                  |k1| |dvf| (QREFELT $ 146))
                                                 #31#))))
                                        (LETT #30# (CDR #30#)) (GO G190) G191
                                        (EXIT (NREVERSE #31#)))))
                            (LETT |lk1|
                                  (SPADCALL
                                   (SPADCALL
                                    (CONS |dvf|
                                          (SPADCALL |lg2| |lek|
                                                    (QREFELT $ 147)))
                                    (QREFELT $ 77))
                                   |dv| (QREFELT $ 78)))
                            (LETT |res1|
                                  (SPADCALL |dv| |lk1| |lg2| (QREFELT $ 87)))
                            (EXIT
                             (COND ((NULL |res1|) NIL)
                                   (#40#
                                    (SEQ
                                     (LETT |cb0|
                                           (PROGN
                                            (LETT #29# NIL)
                                            (SEQ (LETT |be| NIL)
                                                 (LETT #28# |res1|) G190
                                                 (COND
                                                  ((OR (ATOM #28#)
                                                       (PROGN
                                                        (LETT |be| (CAR #28#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #29#
                                                         (CONS (QCDR |be|)
                                                               #29#))))
                                                 (LETT #28# (CDR #28#))
                                                 (GO G190) G191
                                                 (EXIT (NREVERSE #29#)))))
                                     (LETT |d1|
                                           (CONS #'|INTPAR2;diffextint1!0|
                                                 (VECTOR $ |x|)))
                                     (PROGN
                                      (LETT |#G104|
                                            (SPADCALL |cb0| (LIST |d1|)
                                                      (QREFELT $ 149)))
                                      (LETT |m2| (QCAR |#G104|))
                                      (LETT |cb| (QCDR |#G104|))
                                      |#G104|)
                                     (EXIT
                                      (COND ((NULL |cb|) NIL)
                                            (#40#
                                             (SEQ
                                              (LETT |v2|
                                                    (SPADCALL
                                                     (PROGN
                                                      (LETT #25# NIL)
                                                      (SEQ (LETT |be| NIL)
                                                           (LETT #24# |res1|)
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #24#)
                                                                 (PROGN
                                                                  (LETT |be|
                                                                        (CAR
                                                                         #24#))
                                                                  NIL))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (LETT #25#
                                                                   (CONS
                                                                    (QCAR |be|)
                                                                    #25#))))
                                                           (LETT #24#
                                                                 (CDR #24#))
                                                           (GO G190) G191
                                                           (EXIT
                                                            (NREVERSE #25#))))
                                                     (QREFELT $ 150)))
                                              (LETT |v3|
                                                    (SPADCALL |m2| |v2|
                                                              (QREFELT $ 151)))
                                              (LETT |lca|
                                                    (SPADCALL |v3|
                                                              (QREFELT $ 152)))
                                              (LETT |lg3|
                                                    (PROGN
                                                     (LETT #23# NIL)
                                                     (SEQ (LETT |bv| NIL)
                                                          (LETT #22# |cb|) G190
                                                          (COND
                                                           ((OR (ATOM #22#)
                                                                (PROGN
                                                                 (LETT |bv|
                                                                       (CAR
                                                                        #22#))
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT #23#
                                                                  (CONS
                                                                   (SPADCALL
                                                                    |bv| |lg1|
                                                                    (QREFELT $
                                                                             114))
                                                                   #23#))))
                                                          (LETT #22#
                                                                (CDR #22#))
                                                          (GO G190) G191
                                                          (EXIT
                                                           (NREVERSE #23#)))))
                                              (LETT |nlg0|
                                                    (PROGN
                                                     (LETT #21# NIL)
                                                     (SEQ (LETT |bv| NIL)
                                                          (LETT #20# |cb|) G190
                                                          (COND
                                                           ((OR (ATOM #20#)
                                                                (PROGN
                                                                 (LETT |bv|
                                                                       (CAR
                                                                        #20#))
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT #21#
                                                                  (CONS
                                                                   (SPADCALL
                                                                    |bv| |lg0|
                                                                    (QREFELT $
                                                                             114))
                                                                   #21#))))
                                                          (LETT #20#
                                                                (CDR #20#))
                                                          (GO G190) G191
                                                          (EXIT
                                                           (NREVERSE #21#)))))
                                              (LETT |lca|
                                                    (SPADCALL
                                                     (CONS
                                                      #'|INTPAR2;diffextint1!1|
                                                      (VECTOR |k1| $ |dv|))
                                                     |lca| (QREFELT $ 154)))
                                              (LETT |nlg| NIL)
                                              (SEQ (LETT |g0| NIL)
                                                   (LETT #19# |nlg0|)
                                                   (LETT |g1| NIL)
                                                   (LETT #18# |lg3|)
                                                   (LETT |ca| NIL)
                                                   (LETT #17# |lca|) G190
                                                   (COND
                                                    ((OR (ATOM #17#)
                                                         (PROGN
                                                          (LETT |ca|
                                                                (CAR #17#))
                                                          NIL)
                                                         (ATOM #18#)
                                                         (PROGN
                                                          (LETT |g1|
                                                                (CAR #18#))
                                                          NIL)
                                                         (ATOM #19#)
                                                         (PROGN
                                                          (LETT |g0|
                                                                (CAR #19#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (LETT |du|
                                                          (SPADCALL
                                                           (SPADCALL |ca| |x|
                                                                     (QREFELT $
                                                                              35))
                                                           |k| (QREFELT $ 46)))
                                                    (LETT |nu|
                                                          (SPADCALL |du|
                                                                    (QREFELT $
                                                                             155)))
                                                    (COND
                                                     ((OR
                                                       (SPADCALL
                                                        (SPADCALL |du|
                                                                  (QREFELT $
                                                                           156))
                                                        (|spadConstant| $ 157)
                                                        (QREFELT $ 158))
                                                       (SPADCALL
                                                        (SPADCALL |nu|
                                                                  (QREFELT $
                                                                           159))
                                                        1 (QREFELT $ 160)))
                                                      (EXIT
                                                       (PROGN
                                                        (LETT #16# NIL)
                                                        (GO #41=#:G475)))))
                                                    (EXIT
                                                     (COND
                                                      ((SPADCALL
                                                        (SPADCALL |g1|
                                                                  (SPADCALL
                                                                   |nu| 1
                                                                   (QREFELT $
                                                                            143))
                                                                  (QREFELT $
                                                                           120))
                                                        (|spadConstant| $ 18)
                                                        (QREFELT $ 161))
                                                       (PROGN
                                                        (LETT #16# NIL)
                                                        (GO #41#)))
                                                      ('T
                                                       (SEQ
                                                        (LETT |ng|
                                                              (SPADCALL |g0|
                                                                        (SPADCALL
                                                                         |nu| 0
                                                                         (QREFELT
                                                                          $
                                                                          143))
                                                                        (QREFELT
                                                                         $
                                                                         120)))
                                                        (EXIT
                                                         (LETT |nlg|
                                                               (CONS |ng|
                                                                     |nlg|))))))))
                                                   (LETT #17#
                                                         (PROG1 (CDR #17#)
                                                           (LETT #18#
                                                                 (PROG1
                                                                     (CDR #18#)
                                                                   (LETT #19#
                                                                         (CDR
                                                                          #19#))))))
                                                   (GO G190) G191 (EXIT NIL))
                                              (LETT |nlg| (NREVERSE |nlg|))
                                              (LETT |res2|
                                                    (SPADCALL |x| |lk| |nlg|
                                                              (QREFELT $ 87)))
                                              (EXIT
                                               (COND ((NULL |res2|) NIL)
                                                     (#40#
                                                      (SEQ
                                                       (LETT |cb1|
                                                             (PROGN
                                                              (LETT #14# NIL)
                                                              (SEQ
                                                               (LETT |be| NIL)
                                                               (LETT #13#
                                                                     |res2|)
                                                               G190
                                                               (COND
                                                                ((OR
                                                                  (ATOM #13#)
                                                                  (PROGN
                                                                   (LETT |be|
                                                                         (CAR
                                                                          #13#))
                                                                   NIL))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT #14#
                                                                       (CONS
                                                                        (QCDR
                                                                         |be|)
                                                                        #14#))))
                                                               (LETT #13#
                                                                     (CDR
                                                                      #13#))
                                                               (GO G190) G191
                                                               (EXIT
                                                                (NREVERSE
                                                                 #14#)))))
                                                       (LETT |nlca|
                                                             (PROGN
                                                              (LETT #11# NIL)
                                                              (SEQ
                                                               (LETT |be| NIL)
                                                               (LETT #10#
                                                                     |res2|)
                                                               G190
                                                               (COND
                                                                ((OR
                                                                  (ATOM #10#)
                                                                  (PROGN
                                                                   (LETT |be|
                                                                         (CAR
                                                                          #10#))
                                                                   NIL))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT #11#
                                                                       (CONS
                                                                        (QCAR
                                                                         |be|)
                                                                        #11#))))
                                                               (LETT #10#
                                                                     (CDR
                                                                      #10#))
                                                               (GO G190) G191
                                                               (EXIT
                                                                (NREVERSE
                                                                 #11#)))))
                                                       (LETT |ncb|
                                                             (PROGN
                                                              (LETT #9# NIL)
                                                              (SEQ
                                                               (LETT |bv| NIL)
                                                               (LETT #8# |cb1|)
                                                               G190
                                                               (COND
                                                                ((OR (ATOM #8#)
                                                                     (PROGN
                                                                      (LETT
                                                                       |bv|
                                                                       (CAR
                                                                        #8#))
                                                                      NIL))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT #9#
                                                                       (CONS
                                                                        (SPADCALL
                                                                         |bv|
                                                                         |cb|
                                                                         (QREFELT
                                                                          $
                                                                          121))
                                                                        #9#))))
                                                               (LETT #8#
                                                                     (CDR #8#))
                                                               (GO G190) G191
                                                               (EXIT
                                                                (NREVERSE
                                                                 #9#)))))
                                                       (LETT |nlca|
                                                             (PROGN
                                                              (LETT #7# NIL)
                                                              (SEQ
                                                               (LETT |be| NIL)
                                                               (LETT #6#
                                                                     |res2|)
                                                               (LETT |bv| NIL)
                                                               (LETT #5# |cb1|)
                                                               G190
                                                               (COND
                                                                ((OR (ATOM #5#)
                                                                     (PROGN
                                                                      (LETT
                                                                       |bv|
                                                                       (CAR
                                                                        #5#))
                                                                      NIL)
                                                                     (ATOM #6#)
                                                                     (PROGN
                                                                      (LETT
                                                                       |be|
                                                                       (CAR
                                                                        #6#))
                                                                      NIL))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT #7#
                                                                       (CONS
                                                                        (SPADCALL
                                                                         (QCAR
                                                                          |be|)
                                                                         (SPADCALL
                                                                          |bv|
                                                                          |lca|
                                                                          (QREFELT
                                                                           $
                                                                           114))
                                                                         (QREFELT
                                                                          $
                                                                          120))
                                                                        #7#))))
                                                               (LETT #5#
                                                                     (PROG1
                                                                         (CDR
                                                                          #5#)
                                                                       (LETT
                                                                        #6#
                                                                        (CDR
                                                                         #6#))))
                                                               (GO G190) G191
                                                               (EXIT
                                                                (NREVERSE
                                                                 #7#)))))
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #4# NIL)
                                                         (SEQ (LETT |bv| NIL)
                                                              (LETT #3# |ncb|)
                                                              (LETT |ba| NIL)
                                                              (LETT #2# |nlca|)
                                                              G190
                                                              (COND
                                                               ((OR (ATOM #2#)
                                                                    (PROGN
                                                                     (LETT |ba|
                                                                           (CAR
                                                                            #2#))
                                                                     NIL)
                                                                    (ATOM #3#)
                                                                    (PROGN
                                                                     (LETT |bv|
                                                                           (CAR
                                                                            #3#))
                                                                     NIL))
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (LETT #4#
                                                                      (CONS
                                                                       (CONS
                                                                        |ba|
                                                                        |bv|)
                                                                       #4#))))
                                                              (LETT #2#
                                                                    (PROG1
                                                                        (CDR
                                                                         #2#)
                                                                      (LETT #3#
                                                                            (CDR
                                                                             #3#))))
                                                              (GO G190) G191
                                                              (EXIT
                                                               (NREVERSE
                                                                #4#)))))))))))))))))))))))))))
          #41# (EXIT #16#)))) 

(SDEFUN |INTPAR2;diffextint1!1| ((|x1| NIL) ($$ NIL))
        (PROG (|dv| $ |k1|)
          (LETT |dv| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |k1| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |x1| (SPADCALL |dv| (QREFELT $ 153)) |k1|
                      (QREFELT $ 119)))))) 

(SDEFUN |INTPAR2;diffextint1!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 35)))))) 

(SDEFUN |INTPAR2;diffextint|
        ((|x| |Symbol|) (|k| |Kernel| F) (|l| |List| (|Kernel| F))
         (|lg| |List| F)
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G521 NIL) (|u| NIL) (#2=#:G520 NIL)
          (|diffi1|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| (|SparseUnivariatePolynomial| F))))
          (|cs1| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
          (|d1| (|Mapping| F F)))
         (SEQ (LETT |d1| (CONS #'|INTPAR2;diffextint!0| (VECTOR $ |x|)))
              (LETT |cs1| (CONS #'|INTPAR2;diffextint!1| (VECTOR $ |d1|)))
              (LETT |diffi1|
                    (CONS #'|INTPAR2;diffextint!2|
                          (VECTOR $ |cs1| |l| |k| |x|)))
              (EXIT
               (SPADCALL |diffi1| |cs1|
                         (PROGN
                          (LETT #2# NIL)
                          (SEQ (LETT |u| NIL) (LETT #1# |lg|) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |u| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS (SPADCALL |u| |k| (QREFELT $ 46))
                                             #2#))))
                               (LETT #1# (CDR #1#)) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT $ 163)))))) 

(SDEFUN |INTPAR2;diffextint!2| ((|x1| NIL) ($$ NIL))
        (PROG (|x| |k| |l| |cs1| $)
          (LETT |x| (QREFELT $$ 4))
          (LETT |k| (QREFELT $$ 3))
          (LETT |l| (QREFELT $$ 2))
          (LETT |cs1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|INTPAR2;diffextint1| |x1| |x| |k| |l| |cs1| $))))) 

(SDEFUN |INTPAR2;diffextint!1| ((|x4| NIL) ($$ NIL))
        (PROG (|d1| $)
          (LETT |d1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|INTPAR2;csolve1| |x4| |d1| $))))) 

(SDEFUN |INTPAR2;diffextint!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 35)))))) 

(SDEFUN |INTPAR2;unkextint|
        ((|x| |Symbol|) (|k| |Kernel| F) (|l| |List| (|Kernel| F))
         (|lg| |List| F)
         ($ |List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
        (SPROG
         ((#1=#:G532 NIL) (|u| NIL) (#2=#:G531 NIL)
          (|ext|
           (|Mapping|
            (|List| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
            (|List| F)))
          (|cs1| (|Mapping| (|List| (|Vector| F)) (|Matrix| F)))
          (|d1| (|Mapping| F F)))
         (SEQ (LETT |d1| (CONS #'|INTPAR2;unkextint!0| (VECTOR $ |x|)))
              (LETT |cs1| (CONS #'|INTPAR2;unkextint!1| (VECTOR $ |d1|)))
              (LETT |ext| (CONS #'|INTPAR2;unkextint!2| (VECTOR $ |l| |x|)))
              (EXIT
               (SPADCALL |ext| |cs1|
                         (PROGN
                          (LETT #2# NIL)
                          (SEQ (LETT |u| NIL) (LETT #1# |lg|) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |u| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS (SPADCALL |u| |k| (QREFELT $ 46))
                                             #2#))))
                               (LETT #1# (CDR #1#)) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT $ 164)))))) 

(SDEFUN |INTPAR2;unkextint!2| ((|x3| NIL) ($$ NIL))
        (PROG (|x| |l| $)
          (LETT |x| (QREFELT $$ 2))
          (LETT |l| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |l| |x3| (QREFELT $ 87)))))) 

(SDEFUN |INTPAR2;unkextint!1| ((|x4| NIL) ($$ NIL))
        (PROG (|d1| $)
          (LETT |d1| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|INTPAR2;csolve1| |x4| |d1| $))))) 

(SDEFUN |INTPAR2;unkextint!0| ((|x1| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |x| (QREFELT $ 35)))))) 

(DECLAIM (NOTINLINE |ParametricIntegration;|)) 

(DEFUN |ParametricIntegration| (&REST #1=#:G533)
  (SPROG NIL
         (PROG (#2=#:G534)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ParametricIntegration|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ParametricIntegration;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ParametricIntegration|)))))))))) 

(DEFUN |ParametricIntegration;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|ParametricIntegration| DV$1 DV$2))
          (LETT $ (GETREFV 165))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
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
              (21 . |Zero|) (|Union| (|Vector| (|Fraction| 112)) '"failed")
              (|Record| (|:| |particular| 19)
                        (|:| |basis| (|List| (|Vector| (|Fraction| 112)))))
              (|Matrix| 7) (|Vector| 7) (|IntegerLinearDependence| 7)
              (25 . |solveLinearlyOverQ|)
              (|Record| (|:| |logands| 27)
                        (|:| |basis| (|List| (|Vector| (|Fraction| 112)))))
              (|List| 12) (|List| 7) |INTPAR2;logextint;SLLR;7|
              (|Record| (|:| |logands| 50)
                        (|:| |basis| (|List| (|Vector| (|Fraction| 112)))))
              (|List| 38) (|Mapping| (|List| (|Vector| (|Fraction| 112))) 21)
              (|Mapping| 25 27) (|ParametricTranscendentalIntegration| 7 38)
              (31 . |monologextint|) (38 . |differentiate|) (|Kernel| $)
              (44 . |coerce|) (|SparseUnivariatePolynomial| 7) (49 . |coerce|)
              (|Mapping| 7 7) (54 . |differentiate|) (|Factored| 38)
              (|ExpressionFactorPolynomial| 6 7) (61 . |factorPolynomial|)
              (|Fraction| 125) (66 . |univariate|) (|Mapping| 38 38)
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
              (126 . |member?|) (|Mapping| 10 7) (132 . |every?|) (|List| 27)
              (138 . |matrix|) (|IntegrationTools| 6 7) (143 . |kmax|)
              (148 . ~=) (|Union| 11 '"failed") (154 . |symbolIfCan|)
              (159 . |coerce|) (|List| $) (164 . |tower|) (169 . |varselect|)
              (|Record| (|:| |ratpart| 7) (|:| |coeffs| 22))
              (|Union| 79 '"failed")
              (|Record| (|:| |particular| 80) (|:| |basis| 86))
              |INTPAR2;extendedint;FSLLR;10| |INTPAR2;extendedint;FSLR;8|
              (|List| 22) (175 . |nullSpace|) (|List| 79)
              |INTPAR2;extendedint;SLLL;9| (180 . -)
              (|LinearCombinationUtilities| 7 38) (185 . |dehomogenize|)
              (|List| 40) (|ConstantLinearDependence| 6 7)
              (190 . |nullSpaceOverConstants|) (|Mapping| 84 21)
              (|AlgebraicIntegration| 6 7) (196 . |algextint_base|)
              (205 . |cons|) (|Mapping| 86 26 27) (|Mapping| 25 26 27)
              (|ParametricRischDE| 6 7) (211 . |param_rde2|)
              (|Record| (|:| |ratpart| 52) (|:| |coeffs| 22))
              (|Mapping| 129 50) (|Mapping| 129 52 50) (221 . |algextint|)
              (232 . |is?|) (238 . |tower|)
              (|Record| (|:| |funs| 27) (|:| |nroot| 7) (|:| |npow1| 112)
                        (|:| |npow2| 112))
              (|List| 108) (|RootFSSplit| 6 7) (243 . |alg_split_roots|)
              (|Integer|) (250 . |setelt!|) (257 . |lin_comb|) (263 . >)
              (269 . |retract|) (274 . ^) (280 . *) (286 . |eval|) (293 . +)
              (299 . |lin_comb|)
              (|Record| (|:| |primelt| 7) (|:| |pol1| 38) (|:| |pol2| 38)
                        (|:| |prim| 38))
              (|FunctionSpacePrimitiveElement| 6 7) (305 . |primitiveElement|)
              (|SparseUnivariatePolynomial| $) (311 . |rootOf|) (316 . |elt|)
              (322 . |eval|) (|List| 102) (|Mapping| 86 27)
              (329 . |primextint|) (337 . |param_rde|) (|Mapping| 86 112 27)
              (348 . |expextint|) (356 . ~=) (362 . |elt|) (368 . =)
              (|List| 30) (|Matrix| 38) (374 . |matrix|) (|Matrix| $)
              (379 . |reducedSystem|) (384 . |coefficient|) (390 . |new|)
              (394 . /) (400 . |eval|) (407 . |append|)
              (|Record| (|:| |transform| 21) (|:| |basis| 84))
              (413 . |constant_subspace|) (419 . |vector|) (424 . *)
              (430 . |entries|) (435 . |kernel|) (440 . |map|) (446 . |numer|)
              (451 . |denom|) (456 . |One|) (460 . ~=) (466 . |degree|)
              (471 . >) (477 . ~=) (|Mapping| 86 30) (483 . |diffextint|)
              (490 . |unkextint|))
           '#(|logextint| 497 |extendedint| 504) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 164
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
                                                   2 27 10 66 0 67 1 21 0 68 69
                                                   1 70 12 26 71 2 12 10 0 0 72
                                                   1 12 73 0 74 1 7 0 11 75 1 7
                                                   63 76 77 2 70 26 26 11 78 1
                                                   21 84 0 85 1 7 0 0 88 1 89
                                                   81 86 90 2 92 84 21 91 93 5
                                                   95 86 12 12 47 94 27 96 2 26
                                                   0 12 0 97 6 100 86 7 27 11
                                                   26 98 99 101 7 95 86 12 12
                                                   47 103 104 94 27 105 2 14 10
                                                   0 11 106 1 7 63 0 107 3 110
                                                   109 27 12 12 111 3 22 7 0
                                                   112 7 113 2 89 7 22 27 114 2
                                                   112 10 0 0 115 1 7 36 0 116
                                                   2 7 0 0 112 117 2 7 0 0 0
                                                   118 3 7 0 0 36 0 119 2 7 0 0
                                                   0 120 2 89 22 22 84 121 2
                                                   123 122 7 7 124 1 7 0 125
                                                   126 2 38 7 0 7 127 3 7 0 0
                                                   63 76 128 4 33 129 47 130 94
                                                   50 131 7 100 86 112 7 27 11
                                                   26 98 99 132 4 33 129 47 133
                                                   94 50 134 2 58 10 0 0 135 2
                                                   27 7 0 112 136 2 7 10 0 0
                                                   137 1 139 0 138 140 1 38 21
                                                   141 142 2 38 7 0 58 143 0 11
                                                   0 144 2 7 0 0 0 145 3 7 0 0
                                                   0 0 146 2 27 0 0 0 147 2 92
                                                   148 84 91 149 1 22 0 27 150
                                                   2 21 22 0 22 151 1 22 27 0
                                                   152 1 12 0 11 153 2 27 0 40
                                                   0 154 1 52 38 0 155 1 52 38
                                                   0 156 0 38 0 157 2 38 10 0 0
                                                   158 1 38 58 0 159 2 58 10 0
                                                   0 160 2 7 10 0 0 161 3 33 86
                                                   162 94 50 163 3 33 86 130 94
                                                   50 164 3 0 25 11 26 27 28 4
                                                   0 81 7 11 26 27 82 3 0 86 11
                                                   26 27 87 3 0 81 7 11 27
                                                   83)))))
           '|lookupComplete|)) 
