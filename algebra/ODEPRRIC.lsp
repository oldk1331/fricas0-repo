
(SDEFUN |ODEPRRIC;lambda|
        ((|c| UP) (|l| L)
         ($ |List|
          (|Record| (|:| |ij| (|List| (|Integer|)))
                    (|:| |deg| (|NonNegativeInteger|)))))
        (SPROG NIL
               (|ODEPRRIC;innerlb| |l|
                (CONS #'|ODEPRRIC;lambda!0| (VECTOR $ |c|)) $))) 

(SDEFUN |ODEPRRIC;lambda!0| ((|z| NIL) ($$ NIL))
        (PROG (|c| $)
          (LETT |c| (QREFELT $$ 1) . #1=(|ODEPRRIC;lambda|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |z| |c| (QREFELT $ 15)))))) 

(SDEFUN |ODEPRRIC;infLambda|
        ((|l| L)
         ($ |List|
          (|Record| (|:| |ij| (|List| (|Integer|)))
                    (|:| |deg| (|NonNegativeInteger|)))))
        (|ODEPRRIC;innerlb| |l| (CONS #'|ODEPRRIC;infLambda!0| $) $)) 

(SDEFUN |ODEPRRIC;infLambda!0| ((|z| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z| (QREFELT $ 16)) (QREFELT $ 18))) 

(SDEFUN |ODEPRRIC;infmax|
        ((|rec| |Record| (|:| |ij| (|List| (|Integer|)))
          (|:| |deg| (|NonNegativeInteger|)))
         (|l| L) ($ |List| (|Integer|)))
        (|ODEPRRIC;innermax| |rec| |l| (ELT $ 16) $)) 

(SDEFUN |ODEPRRIC;dmax|
        ((|rec| |Record| (|:| |ij| (|List| (|Integer|)))
          (|:| |deg| (|NonNegativeInteger|)))
         (|c| UP) (|l| L) ($ |List| (|Integer|)))
        (SPROG NIL
               (|ODEPRRIC;innermax| |rec| |l|
                (CONS #'|ODEPRRIC;dmax!0| (VECTOR $ |c|)) $))) 

(SDEFUN |ODEPRRIC;dmax!0| ((|z| NIL) ($$ NIL))
        (PROG (|c| $)
          (LETT |c| (QREFELT $$ 1) . #1=(|ODEPRRIC;dmax|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |z| |c| (QREFELT $ 15)) (QREFELT $ 18)))))) 

(SDEFUN |ODEPRRIC;tau0| ((|p| UP) (|q| UP) ($ UP))
        (SPROG ((#1=#:G130 NIL))
               (SPADCALL
                (PROG2
                    (LETT #1#
                          (SPADCALL |q|
                                    (SPADCALL |p|
                                              (SPADCALL |q| |p| (QREFELT $ 15))
                                              (QREFELT $ 19))
                                    (QREFELT $ 21))
                          |ODEPRRIC;tau0|)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                  (|Union| (QREFELT $ 7) "failed") #1#))
                |p| (QREFELT $ 22)))) 

(SDEFUN |ODEPRRIC;poly1|
        ((|c| UP) (|cp| UP) (|i| |Integer|)
         ($ |SparseUnivariatePolynomial| UP))
        (SPROG
         ((#1=#:G134 NIL) (#2=#:G133 #3=(|SparseUnivariatePolynomial| UP))
          (#4=#:G135 #3#) (#5=#:G137 NIL) (|j| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|ODEPRRIC;poly1|))
           (SEQ (LETT |j| 0 . #6#) (LETT #5# (- |i| 1) . #6#) G190
                (COND ((|greater_SI| |j| #5#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4#
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 24) 1 (QREFELT $ 26))
                          (SPADCALL (SPADCALL |j| |cp| (QREFELT $ 27))
                                    (QREFELT $ 28))
                          (QREFELT $ 29))
                         . #6#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 30)) . #6#))
                    ('T (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 31))))))) 

(SDEFUN |ODEPRRIC;getIndices|
        ((|n| |NonNegativeInteger|)
         (|l| |List|
          (|Record| (|:| |ij| (|List| (|Integer|)))
                    (|:| |deg| (|NonNegativeInteger|))))
         ($ |List| (|Integer|)))
        (SPROG ((#1=#:G142 NIL) (|r| NIL) (#2=#:G141 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL . #3=(|ODEPRRIC;getIndices|))
                   (SEQ (LETT |r| NIL . #3#) (LETT #1# |l| . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |r| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((EQL (QCDR |r|) |n|)
                            (LETT #2# (CONS (QCAR |r|) #2#) . #3#)))))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 34))
                 (QREFELT $ 35))))) 

(SDEFUN |ODEPRRIC;denomRicDE;LUP;8| ((|l| L) ($ UP))
        (SPROG
         ((#1=#:G144 NIL) (#2=#:G143 (UP)) (#3=#:G145 (UP)) (#4=#:G147 NIL)
          (|c| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #5=(|ODEPRRIC;denomRicDE;LUP;8|))
           (SEQ (LETT |c| NIL . #5#)
                (LETT #4# (|ODEPRRIC;factoredDenomRicDE| |l| $) . #5#) G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |c| (CAR #4#) . #5#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL |c| (|ODEPRRIC;bound| |c| |l| $)
                                   (QREFELT $ 19))
                         . #5#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 36)) . #5#))
                    ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 24))))))) 

(SDEFUN |ODEPRRIC;polyRicDE;LML;9|
        ((|l| L) (|zeros| |Mapping| (|List| F) UP)
         ($ |List| (|Record| (|:| |poly| UP) (|:| |eq| L))))
        (CONS (CONS (|spadConstant| $ 39) |l|)
              (|ODEPRRIC;polysol| |l| 0 'NIL |zeros| $))) 

(SDEFUN |ODEPRRIC;refine|
        ((|l| |List| UP) (|ezfactor| |Mapping| (|Factored| UP) UP)
         ($ |List| UP))
        (SPROG
         ((#1=#:G161 NIL) (|r| NIL) (#2=#:G160 NIL) (#3=#:G159 NIL) (|p| NIL)
          (#4=#:G158 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #4# NIL . #5=(|ODEPRRIC;refine|))
            (SEQ (LETT |p| NIL . #5#) (LETT #3# |l| . #5#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (PROGN
                           (LETT #2# NIL . #5#)
                           (SEQ (LETT |r| NIL . #5#)
                                (LETT #1#
                                      (SPADCALL (SPADCALL |p| |ezfactor|)
                                                (QREFELT $ 49))
                                      . #5#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |r| (CAR #1#) . #5#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT (LETT #2# (CONS (QCAR |r|) #2#) . #5#)))
                                (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          #4#)
                         . #5#)))
                 (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                 (EXIT (NREVERSE #4#))))
           (QREFELT $ 51))))) 

(SDEFUN |ODEPRRIC;padicsol|
        ((|c| UP) (|op| L) (|b| |NonNegativeInteger|) (|finite?| |Boolean|)
         (|zeros| |Mapping| (|List| UP) UP (|SparseUnivariatePolynomial| UP))
         ($ |List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
        (SPROG
         ((|ans| (|List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
          (#1=#:G182 NIL) (|sol| NIL) (#2=#:G181 NIL)
          (|sols|
           (|List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
          (#3=#:G167 NIL) (|neweq| (L)) (|rcn| (|Fraction| UP)) (#4=#:G180 NIL)
          (|r| NIL) (#5=#:G179 NIL) (|rec| NIL)
          (|lc|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|))
                      (|:| |eq| (|SparseUnivariatePolynomial| UP))))))
         (SEQ (LETT |ans| NIL . #6=(|ODEPRRIC;padicsol|))
              (COND (|finite?| (COND ((ZEROP |b|) (EXIT |ans|)))))
              (LETT |lc| (|ODEPRRIC;leadingDenomRicDE| |c| |op| $) . #6#)
              (COND
               (|finite?|
                (LETT |lc|
                      (SPADCALL (CONS #'|ODEPRRIC;padicsol!0| (VECTOR $ |b|))
                                |lc| (QREFELT $ 57))
                      . #6#)))
              (SEQ (LETT |rec| NIL . #6#) (LETT #5# |lc| . #6#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |rec| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |r| NIL . #6#)
                          (LETT #4# (SPADCALL |c| (QCDR |rec|) |zeros|) . #6#)
                          G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |r| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |r| (|spadConstant| $ 39)
                                        (QREFELT $ 58))
                              (SEQ
                               (LETT |rcn|
                                     (SPADCALL |r|
                                               (SPADCALL |c| (QCAR |rec|)
                                                         (QREFELT $ 19))
                                               (QREFELT $ 60))
                                     . #6#)
                               (LETT |neweq|
                                     (SPADCALL |op| |rcn| (QREFELT $ 61))
                                     . #6#)
                               (LETT |sols|
                                     (|ODEPRRIC;padicsol| |c| |neweq|
                                      (PROG1
                                          (LETT #3# (- (QCAR |rec|) 1) . #6#)
                                        (|check_subtype2| (>= #3# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #3#))
                                      'T |zeros| $)
                                     . #6#)
                               (EXIT
                                (LETT |ans|
                                      (COND
                                       ((NULL |sols|)
                                        (CONS (CONS |rcn| |neweq|) |ans|))
                                       ('T
                                        (SPADCALL
                                         (PROGN
                                          (LETT #2# NIL . #6#)
                                          (SEQ (LETT |sol| NIL . #6#)
                                               (LETT #1# |sols| . #6#) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |sol| (CAR #1#)
                                                            . #6#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #2#
                                                       (CONS
                                                        (CONS
                                                         (SPADCALL |rcn|
                                                                   (QCAR |sol|)
                                                                   (QREFELT $
                                                                            62))
                                                         (QCDR |sol|))
                                                        #2#)
                                                       . #6#)))
                                               (LETT #1# (CDR #1#) . #6#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #2#))))
                                         |ans| (QREFELT $ 65))))
                                      . #6#)))))))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |ODEPRRIC;padicsol!0| ((|z| NIL) ($$ NIL))
        (PROG (|b| $)
          (LETT |b| (QREFELT $$ 1) . #1=(|ODEPRRIC;padicsol|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (QCAR |z|) |b| (QREFELT $ 53)))))) 

(SDEFUN |ODEPRRIC;leadingDenomRicDE|
        ((|c| UP) (|l| L)
         ($ |List|
          (|Record| (|:| |deg| (|NonNegativeInteger|))
                    (|:| |eq| (|SparseUnivariatePolynomial| UP)))))
        (SPROG
         ((|done| (|List| (|NonNegativeInteger|)))
          (|ans|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|))
                      (|:| |eq| (|SparseUnivariatePolynomial| UP)))))
          (|ind| (|List| (|Integer|))) (#1=#:G193 NIL) (|rec| NIL)
          (|lb|
           (|List|
            (|Record| (|:| |ij| (|List| (|Integer|)))
                      (|:| |deg| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |lb| (|ODEPRRIC;lambda| |c| |l| $)
                . #2=(|ODEPRRIC;leadingDenomRicDE|))
          (LETT |done| NIL . #2#) (LETT |ans| NIL . #2#)
          (SEQ (LETT |rec| NIL . #2#) (LETT #1# |lb| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((COND
                    ((OR (SPADCALL (QCDR |rec|) |done| (QREFELT $ 67))
                         (NULL
                          (LETT |ind| (|ODEPRRIC;dmax| |rec| |c| |l| $)
                                . #2#)))
                     'NIL)
                    ('T 'T))
                   (SEQ
                    (LETT |ans|
                          (CONS
                           (CONS (QCDR |rec|)
                                 (|ODEPRRIC;getPol| |rec| |c| |l| |ind| $))
                           |ans|)
                          . #2#)
                    (EXIT (LETT |done| (CONS (QCDR |rec|) |done|) . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (CONS #'|ODEPRRIC;leadingDenomRicDE!0| $) |ans|
                     (QREFELT $ 70)))))) 

(SDEFUN |ODEPRRIC;leadingDenomRicDE!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (QCAR |z1|) (QCAR |z2|) (QREFELT $ 68))) 

(SDEFUN |ODEPRRIC;getPol|
        ((|rec| |Record| (|:| |ij| (|List| (|Integer|)))
          (|:| |deg| (|NonNegativeInteger|)))
         (|c| UP) (|l| L) (|ind| |List| (|Integer|))
         ($ |SparseUnivariatePolynomial| UP))
        (SPROG
         ((#1=#:G196 NIL) (#2=#:G195 #3=(|SparseUnivariatePolynomial| UP))
          (#4=#:G197 #3#) (#5=#:G200 NIL) (#6=#:G199 NIL) (#7=#:G203 NIL)
          (|i| NIL))
         (SEQ
          (COND ((EQL (QCDR |rec|) 1) (|ODEPRRIC;getPol1| |ind| |c| |l| $))
                (#8='T
                 (PROGN
                  (LETT #1# NIL . #9=(|ODEPRRIC;getPol|))
                  (SEQ (LETT |i| NIL . #9#) (LETT #7# |ind| . #9#) G190
                       (COND
                        ((OR (ATOM #7#) (PROGN (LETT |i| (CAR #7#) . #9#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (SPADCALL
                                 (|ODEPRRIC;tau0| |c|
                                  (SPADCALL |l|
                                            (PROG1 (LETT #6# |i| . #9#)
                                              (|check_subtype2| (>= #6# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #6#))
                                            (QREFELT $ 71))
                                  $)
                                 (PROG1 (LETT #5# |i| . #9#)
                                   (|check_subtype2| (>= #5# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #5#))
                                 (QREFELT $ 26))
                                . #9#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #4# (QREFELT $ 72)) . #9#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #9#)
                             (LETT #1# 'T . #9#)))))))
                       (LETT #7# (CDR #7#) . #9#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#8# (|spadConstant| $ 73))))))))) 

(SDEFUN |ODEPRRIC;getPol1|
        ((|ind| |List| (|Integer|)) (|c| UP) (|l| L)
         ($ |SparseUnivariatePolynomial| UP))
        (SPROG
         ((#1=#:G205 NIL) (#2=#:G204 #3=(|SparseUnivariatePolynomial| UP))
          (#4=#:G206 #3#) (#5=#:G240 NIL) (#6=#:G243 NIL) (|i| NIL)
          (|cp| (UP)))
         (SEQ
          (LETT |cp| (SPADCALL (QREFELT $ 11) |c| (QREFELT $ 74))
                . #7=(|ODEPRRIC;getPol1|))
          (EXIT
           (PROGN
            (LETT #1# NIL . #7#)
            (SEQ (LETT |i| NIL . #7#) (LETT #6# |ind| . #7#) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#) . #7#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #4#
                          (SPADCALL
                           (|ODEPRRIC;tau0| |c|
                            (SPADCALL |l|
                                      (PROG1 (LETT #5# |i| . #7#)
                                        (|check_subtype2| (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #5#))
                                      (QREFELT $ 71))
                            $)
                           (|ODEPRRIC;poly1| |c| |cp| |i| $) (QREFELT $ 75))
                          . #7#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT $ 72)) . #7#))
                     ('T (PROGN (LETT #2# #4# . #7#) (LETT #1# 'T . #7#)))))))
                 (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 73)))))))) 

(SDEFUN |ODEPRRIC;constantCoefficientRicDE;LML;15|
        ((|op| L) (|ric| |Mapping| (|List| F) UP)
         ($ |List| (|Record| (|:| |constant| F) (|:| |eq| L))))
        (SPROG
         ((#1=#:G255 NIL) (|a| NIL) (#2=#:G254 NIL)
          (|m| #3=(|NonNegativeInteger|)) (#4=#:G246 NIL) (#5=#:G245 #3#)
          (#6=#:G247 #3#) (#7=#:G253 NIL) (|p| NIL))
         (SEQ
          (LETT |m|
                (PROGN
                 (LETT #4# NIL
                       . #8=(|ODEPRRIC;constantCoefficientRicDE;LML;15|))
                 (SEQ (LETT |p| NIL . #8#)
                      (LETT #7# (SPADCALL |op| (QREFELT $ 76)) . #8#) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |p| (CAR #7#) . #8#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #6# (SPADCALL |p| (QREFELT $ 16)) . #8#)
                         (COND (#4# (LETT #5# (MAX #5# #6#) . #8#))
                               ('T
                                (PROGN
                                 (LETT #5# #6# . #8#)
                                 (LETT #4# 'T . #8#)))))))
                      (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
                 (COND (#4# #5#) ('T (|IdentityError| '|max|))))
                . #8#)
          (EXIT
           (PROGN
            (LETT #2# NIL . #8#)
            (SEQ (LETT |a| NIL . #8#)
                 (LETT #1#
                       (SPADCALL
                        (|ODEPRRIC;constantCoefficientOperator| |op| |m| $)
                        |ric|)
                       . #8#)
                 G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #8#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (CONS |a|
                                (SPADCALL |op| (SPADCALL |a| (QREFELT $ 77))
                                          (QREFELT $ 78)))
                          #2#)
                         . #8#)))
                 (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |ODEPRRIC;constantCoefficientOperator|
        ((|op| L) (|m| |NonNegativeInteger|) ($ UP))
        (SPROG ((|ans| (UP)) (|p| (UP)))
               (SEQ
                (LETT |ans| (|spadConstant| $ 39)
                      . #1=(|ODEPRRIC;constantCoefficientOperator|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |op| (|spadConstant| $ 40) (QREFELT $ 82)))
                       (GO G191)))
                     (SEQ
                      (COND
                       ((EQL
                         (SPADCALL
                          (LETT |p| (SPADCALL |op| (QREFELT $ 83)) . #1#)
                          (QREFELT $ 16))
                         |m|)
                        (LETT |ans|
                              (SPADCALL |ans|
                                        (SPADCALL (SPADCALL |p| (QREFELT $ 84))
                                                  (SPADCALL |op|
                                                            (QREFELT $ 85))
                                                  (QREFELT $ 86))
                                        (QREFELT $ 87))
                              . #1#)))
                      (EXIT (LETT |op| (SPADCALL |op| (QREFELT $ 88)) . #1#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))) 

(SDEFUN |ODEPRRIC;getPoly|
        ((|rec| |Record| (|:| |ij| (|List| (|Integer|)))
          (|:| |deg| (|NonNegativeInteger|)))
         (|l| L) (|ind| |List| (|Integer|)) ($ UP))
        (SPROG
         ((#1=#:G263 NIL) (#2=#:G262 (UP)) (#3=#:G264 (UP)) (#4=#:G267 NIL)
          (#5=#:G266 NIL) (#6=#:G269 NIL) (|i| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #7=(|ODEPRRIC;getPoly|))
           (SEQ (LETT |i| NIL . #7#) (LETT #6# |ind| . #7#) G190
                (COND
                 ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#) . #7#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL |l|
                                     (PROG1 (LETT #5# |i| . #7#)
                                       (|check_subtype2| (>= #5# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #5#))
                                     (QREFELT $ 71))
                           (QREFELT $ 84))
                          (PROG1 (LETT #4# |i| . #7#)
                            (|check_subtype2| (>= #4# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #4#))
                          (QREFELT $ 86))
                         . #7#)
                   (COND
                    (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 87)) . #7#))
                    ('T (PROGN (LETT #2# #3# . #7#) (LETT #1# 'T . #7#)))))))
                (LETT #6# (CDR #6#) . #7#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| $ 39))))))) 

(SDEFUN |ODEPRRIC;innermax|
        ((|rec| |Record| (|:| |ij| (|List| (|Integer|)))
          (|:| |deg| (|NonNegativeInteger|)))
         (|l| L) (|nu| |Mapping| (|Integer|) UP) ($ |List| (|Integer|)))
        (SPROG
         ((|ans| (|List| (|Integer|))) (#1=#:G277 NIL) (|k| #2=(|Integer|))
          (|f| (UP)) (#3=#:G278 NIL) (|j| NIL) (|m| #2#) (#4=#:G272 NIL)
          (|d| (|Integer|)) (|i| (|Integer|)) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n| (SPADCALL |l| (QREFELT $ 85)) . #5=(|ODEPRRIC;innermax|))
            (LETT |i| (|SPADfirst| (QCAR |rec|)) . #5#)
            (LETT |m|
                  (+ (* |i| (LETT |d| (QCDR |rec|) . #5#))
                     (SPADCALL
                      (SPADCALL |l|
                                (PROG1 (LETT #4# |i| . #5#)
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#))
                                (QREFELT $ 71))
                      |nu|))
                  . #5#)
            (LETT |ans| NIL . #5#)
            (SEQ (LETT |j| 0 . #5#) (LETT #3# |n| . #5#) G190
                 (COND ((|greater_SI| |j| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL
                      (LETT |f| (SPADCALL |l| |j| (QREFELT $ 71)) . #5#)
                      (|spadConstant| $ 39) (QREFELT $ 58))
                     (SEQ
                      (LETT |k|
                            (+ (SPADCALL |j| |d| (QREFELT $ 89))
                               (SPADCALL |f| |nu|))
                            . #5#)
                      (EXIT
                       (COND
                        ((SPADCALL |k| |m| (QREFELT $ 90))
                         (PROGN (LETT #1# NIL . #5#) (GO #6=#:G276)))
                        ((EQL |k| |m|)
                         (LETT |ans| (CONS |j| |ans|) . #5#)))))))))
                 (LETT |j| (|inc_SI| |j|) . #5#) (GO G190) G191 (EXIT NIL))
            (EXIT |ans|)))
          #6# (EXIT #1#)))) 

(SDEFUN |ODEPRRIC;leadingCoefficientRicDE;LL;19|
        ((|l| L)
         ($ |List|
          (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |eq| UP))))
        (SPROG
         ((|done| (|List| (|NonNegativeInteger|)))
          (|ans|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |eq| UP))))
          (|ind| (|List| (|Integer|))) (#1=#:G290 NIL) (|rec| NIL)
          (|lb|
           (|List|
            (|Record| (|:| |ij| (|List| (|Integer|)))
                      (|:| |deg| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |lb| (|ODEPRRIC;infLambda| |l| $)
                . #2=(|ODEPRRIC;leadingCoefficientRicDE;LL;19|))
          (LETT |done| NIL . #2#) (LETT |ans| NIL . #2#)
          (SEQ (LETT |rec| NIL . #2#) (LETT #1# |lb| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((COND
                    ((OR (SPADCALL (QCDR |rec|) |done| (QREFELT $ 67))
                         (NULL
                          (LETT |ind| (|ODEPRRIC;infmax| |rec| |l| $) . #2#)))
                     'NIL)
                    ('T 'T))
                   (SEQ
                    (LETT |ans|
                          (CONS
                           (CONS (QCDR |rec|)
                                 (|ODEPRRIC;getPoly| |rec| |l| |ind| $))
                           |ans|)
                          . #2#)
                    (EXIT (LETT |done| (CONS (QCDR |rec|) |done|) . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (CONS #'|ODEPRRIC;leadingCoefficientRicDE;LL;19!0| $)
                     |ans| (QREFELT $ 94)))))) 

(SDEFUN |ODEPRRIC;leadingCoefficientRicDE;LL;19!0|
        ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPADCALL (QCAR |z1|) (QCAR |z2|) (QREFELT $ 68))) 

(SDEFUN |ODEPRRIC;factoredDenomRicDE| ((|l| L) ($ |List| UP))
        (SPROG
         ((#1=#:G296 NIL) (|dd| NIL) (#2=#:G295 NIL)
          (|bd|
           (|List| (|Record| (|:| |factor| UP) (|:| |exponent| (|Integer|))))))
         (SEQ
          (LETT |bd|
                (SPADCALL
                 (SPADCALL (SPADCALL |l| (QREFELT $ 83))
                           (SPADCALL |l| (QREFELT $ 76)) (QREFELT $ 97))
                 (QREFELT $ 49))
                . #3=(|ODEPRRIC;factoredDenomRicDE|))
          (EXIT
           (PROGN
            (LETT #2# NIL . #3#)
            (SEQ (LETT |dd| NIL . #3#) (LETT #1# |bd| . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |dd| (CAR #1#) . #3#) NIL))
                   (GO G191)))
                 (SEQ (EXIT (LETT #2# (CONS (QCAR |dd|) #2#) . #3#)))
                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |ODEPRRIC;changeVar;LUPL;21| ((|l| L) (|a| UP) ($ L))
        (SPROG ((|dpan| (L)) (|op| (L)) (#1=#:G301 NIL) (|i| NIL) (|dpa| (L)))
               (SEQ
                (LETT |dpa|
                      (SPADCALL (QREFELT $ 11) (SPADCALL |a| (QREFELT $ 98))
                                (QREFELT $ 99))
                      . #2=(|ODEPRRIC;changeVar;LUPL;21|))
                (LETT |dpan| (|spadConstant| $ 100) . #2#)
                (LETT |op| (|spadConstant| $ 40) . #2#)
                (SEQ (LETT |i| 0 . #2#)
                     (LETT #1# (SPADCALL |l| (QREFELT $ 85)) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (LETT |op|
                            (SPADCALL |op|
                                      (SPADCALL
                                       (SPADCALL |l| |i| (QREFELT $ 71)) |dpan|
                                       (QREFELT $ 101))
                                      (QREFELT $ 99))
                            . #2#)
                      (EXIT
                       (LETT |dpan| (SPADCALL |dpa| |dpan| (QREFELT $ 102))
                             . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |op| (QREFELT $ 103)))))) 

(SDEFUN |ODEPRRIC;changeVar;LFL;22| ((|l| L) (|a| |Fraction| UP) ($ L))
        (SPROG
         ((|dpan| (LQ)) (|op| (LQ)) (#1=#:G307 NIL) (|i| NIL) (|dpa| (LQ)))
         (SEQ
          (LETT |dpa|
                (SPADCALL (QREFELT $ 13) (SPADCALL |a| (QREFELT $ 104))
                          (QREFELT $ 105))
                . #2=(|ODEPRRIC;changeVar;LFL;22|))
          (LETT |dpan| (|spadConstant| $ 106) . #2#)
          (LETT |op| (|spadConstant| $ 41) . #2#)
          (SEQ (LETT |i| 0 . #2#)
               (LETT #1# (SPADCALL |l| (QREFELT $ 85)) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (LETT |op|
                      (SPADCALL |op|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |l| |i| (QREFELT $ 71))
                                           (QREFELT $ 107))
                                 |dpan| (QREFELT $ 108))
                                (QREFELT $ 105))
                      . #2#)
                (EXIT
                 (LETT |dpan| (SPADCALL |dpa| |dpan| (QREFELT $ 109)) . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (QCAR (SPADCALL |op| NIL (QREFELT $ 113))))))) 

(SDEFUN |ODEPRRIC;bound| ((|c| UP) (|l| L) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G310 NIL) (#2=#:G309 #3=(|NonNegativeInteger|)) (#4=#:G311 #3#)
          (#5=#:G314 NIL) (|rec| NIL)
          (|lb|
           (|List|
            (|Record| (|:| |ij| (|List| (|Integer|))) (|:| |deg| #3#)))))
         (SEQ
          (COND
           ((NULL
             (LETT |lb| (|ODEPRRIC;lambda| |c| |l| $) . #6=(|ODEPRRIC;bound|)))
            1)
           (#7='T
            (PROGN
             (LETT #1# NIL . #6#)
             (SEQ (LETT |rec| NIL . #6#) (LETT #5# |lb| . #6#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |rec| (CAR #5#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4# (QCDR |rec|) . #6#)
                     (COND (#1# (LETT #2# (MAX #2# #4#) . #6#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #6#)
                             (LETT #1# 'T . #6#)))))))
                  (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#7# (|IdentityError| '|max|))))))))) 

(SDEFUN |ODEPRRIC;innerlb|
        ((|l| L) (|nu| |Mapping| (|Integer|) UP)
         ($ |List|
          (|Record| (|:| |ij| (|List| (|Integer|)))
                    (|:| |deg| (|NonNegativeInteger|)))))
        (SPROG
         ((|lb|
           (|List|
            (|Record| (|:| |ij| (|List| (|Integer|)))
                      (|:| |deg| (|NonNegativeInteger|)))))
          (#1=#:G320 NIL) (|b| (|Integer|))
          (|u| (|Union| (|Integer|) "failed")) (|lj| (UP)) (#2=#:G328 NIL)
          (|j| NIL) (|li| (UP)) (#3=#:G327 NIL) (|i| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |lb| NIL . #4=(|ODEPRRIC;innerlb|))
              (LETT |n| (SPADCALL |l| (QREFELT $ 85)) . #4#)
              (SEQ (LETT |i| 0 . #4#) (LETT #3# |n| . #4#) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL
                        (LETT |li| (SPADCALL |l| |i| (QREFELT $ 71)) . #4#)
                        (|spadConstant| $ 39) (QREFELT $ 58))
                       (SEQ (LETT |j| (+ |i| 1) . #4#) (LETT #2# |n| . #4#)
                            G190 (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL
                                 (LETT |lj| (SPADCALL |l| |j| (QREFELT $ 71))
                                       . #4#)
                                 (|spadConstant| $ 39) (QREFELT $ 58))
                                (SEQ
                                 (LETT |u|
                                       (SPADCALL
                                        (- (SPADCALL |li| |nu|)
                                           (SPADCALL |lj| |nu|))
                                        (- |i| |j|) (QREFELT $ 114))
                                       . #4#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |u| 0)
                                    (SEQ (LETT |b| (QCDR |u|) . #4#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |b| 0 (QREFELT $ 90))
                                            (LETT |lb|
                                                  (CONS
                                                   (CONS (LIST |i| |j|)
                                                         (PROG1
                                                             (LETT #1# |b|
                                                                   . #4#)
                                                           (|check_subtype2|
                                                            (>= #1# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #1#)))
                                                   |lb|)
                                                  . #4#)))))))))))))
                            (LETT |j| (+ |j| 1) . #4#) (GO G190) G191
                            (EXIT NIL))))))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |lb|)))) 

(SDEFUN |ODEPRRIC;singRicDE;LMML;25|
        ((|l| L)
         (|zeros| |Mapping| (|List| UP) UP (|SparseUnivariatePolynomial| UP))
         (|ezfactor| |Mapping| (|Factored| UP) UP)
         ($ |List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
        (CONS (CONS (|spadConstant| $ 115) |l|)
              (|ODEPRRIC;fracsol| |l| |zeros|
               (|ODEPRRIC;refine| (|ODEPRRIC;factoredDenomRicDE| |l| $)
                |ezfactor| $)
               $))) 

(SDEFUN |ODEPRRIC;fracsol|
        ((|l| L)
         (|zeros| |Mapping| (|List| UP) UP (|SparseUnivariatePolynomial| UP))
         (|lc| |List| UP)
         ($ |List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
        (SPROG
         ((|ans| (|List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
          (#1=#:G354 NIL) (|sol| NIL) (#2=#:G353 NIL)
          (|sols|
           (|List| (|Record| (|:| |frac| (|Fraction| UP)) (|:| |eq| L))))
          (|neweq| (L)) (#3=#:G352 NIL) (|rec| NIL))
         (SEQ (LETT |ans| NIL . #4=(|ODEPRRIC;fracsol|))
              (EXIT
               (COND ((NULL |lc|) |ans|)
                     ((NULL
                       (LETT |sols|
                             (|ODEPRRIC;padicsol| (|SPADfirst| |lc|) |l| 0 'NIL
                              |zeros| $)
                             . #4#))
                      (|ODEPRRIC;fracsol| |l| |zeros| (CDR |lc|) $))
                     ('T
                      (SEQ
                       (SEQ (LETT |rec| NIL . #4#) (LETT #3# |sols| . #4#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |rec| (CAR #3#) . #4#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |neweq|
                                   (SPADCALL |l| (QCAR |rec|) (QREFELT $ 61))
                                   . #4#)
                             (LETT |sols|
                                   (|ODEPRRIC;fracsol| |neweq| |zeros|
                                    (CDR |lc|) $)
                                   . #4#)
                             (EXIT
                              (LETT |ans|
                                    (COND ((NULL |sols|) (CONS |rec| |ans|))
                                          ('T
                                           (SPADCALL
                                            (PROGN
                                             (LETT #2# NIL . #4#)
                                             (SEQ (LETT |sol| NIL . #4#)
                                                  (LETT #1# |sols| . #4#) G190
                                                  (COND
                                                   ((OR (ATOM #1#)
                                                        (PROGN
                                                         (LETT |sol| (CAR #1#)
                                                               . #4#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT #2#
                                                          (CONS
                                                           (CONS
                                                            (SPADCALL
                                                             (QCAR |rec|)
                                                             (QCAR |sol|)
                                                             (QREFELT $ 62))
                                                            (QCDR |sol|))
                                                           #2#)
                                                          . #4#)))
                                                  (LETT #1# (CDR #1#) . #4#)
                                                  (GO G190) G191
                                                  (EXIT (NREVERSE #2#))))
                                            |ans| (QREFELT $ 65))))
                                    . #4#)))
                            (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |ans|)))))))) 

(SDEFUN |ODEPRRIC;polysol|
        ((|l| L) (|b| |NonNegativeInteger|) (|finite?| |Boolean|)
         (|zeros| |Mapping| (|List| F) UP)
         ($ |List| (|Record| (|:| |poly| UP) (|:| |eq| L))))
        (SPROG
         ((|ans| (|List| (|Record| (|:| |poly| UP) (|:| |eq| L))))
          (#1=#:G372 NIL) (|sol| NIL) (#2=#:G371 NIL)
          (|sols| (|List| (|Record| (|:| |poly| UP) (|:| |eq| L))))
          (#3=#:G359 NIL) (|neweq| (L)) (|atn| (UP)) (#4=#:G370 NIL) (|a| NIL)
          (#5=#:G369 NIL) (|rec| NIL)
          (|lc|
           (|List|
            (|Record| (|:| |deg| (|NonNegativeInteger|)) (|:| |eq| UP)))))
         (SEQ (LETT |ans| NIL . #6=(|ODEPRRIC;polysol|))
              (COND (|finite?| (COND ((ZEROP |b|) (EXIT |ans|)))))
              (LETT |lc| (SPADCALL |l| (QREFELT $ 95)) . #6#)
              (COND
               (|finite?|
                (LETT |lc|
                      (SPADCALL (CONS #'|ODEPRRIC;polysol!0| (VECTOR $ |b|))
                                |lc| (QREFELT $ 120))
                      . #6#)))
              (SEQ (LETT |rec| NIL . #6#) (LETT #5# |lc| . #6#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |rec| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |a| NIL . #6#)
                          (LETT #4# (SPADCALL (QCDR |rec|) |zeros|) . #6#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |a| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |a| (|spadConstant| $ 38)
                                        (QREFELT $ 121))
                              (SEQ
                               (LETT |atn|
                                     (SPADCALL |a| (QCAR |rec|) (QREFELT $ 86))
                                     . #6#)
                               (LETT |neweq|
                                     (SPADCALL |l| |atn| (QREFELT $ 78)) . #6#)
                               (LETT |sols|
                                     (|ODEPRRIC;polysol| |neweq|
                                      (PROG1
                                          (LETT #3# (- (QCAR |rec|) 1) . #6#)
                                        (|check_subtype2| (>= #3# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #3#))
                                      'T |zeros| $)
                                     . #6#)
                               (EXIT
                                (LETT |ans|
                                      (COND
                                       ((NULL |sols|)
                                        (CONS (CONS |atn| |neweq|) |ans|))
                                       ('T
                                        (SPADCALL
                                         (PROGN
                                          (LETT #2# NIL . #6#)
                                          (SEQ (LETT |sol| NIL . #6#)
                                               (LETT #1# |sols| . #6#) G190
                                               (COND
                                                ((OR (ATOM #1#)
                                                     (PROGN
                                                      (LETT |sol| (CAR #1#)
                                                            . #6#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #2#
                                                       (CONS
                                                        (CONS
                                                         (SPADCALL |atn|
                                                                   (QCAR |sol|)
                                                                   (QREFELT $
                                                                            87))
                                                         (QCDR |sol|))
                                                        #2#)
                                                       . #6#)))
                                               (LETT #1# (CDR #1#) . #6#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #2#))))
                                         |ans| (QREFELT $ 122))))
                                      . #6#)))))))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |ODEPRRIC;polysol!0| ((|z| NIL) ($$ NIL))
        (PROG (|b| $)
          (LETT |b| (QREFELT $$ 1) . #1=(|ODEPRRIC;polysol|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (QCAR |z|) |b| (QREFELT $ 53)))))) 

(DECLAIM (NOTINLINE |PrimitiveRatRicDE;|)) 

(DEFUN |PrimitiveRatRicDE| (&REST #1=#:G373)
  (SPROG NIL
         (PROG (#2=#:G374)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PrimitiveRatRicDE|)
                                               '|domainEqualList|)
                    . #3=(|PrimitiveRatRicDE|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PrimitiveRatRicDE;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PrimitiveRatRicDE|)))))))))) 

(DEFUN |PrimitiveRatRicDE;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|PrimitiveRatRicDE|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|PrimitiveRatRicDE| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 123) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|PrimitiveRatRicDE|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
    (QSETREFV $ 13 (SPADCALL (QREFELT $ 12)))
    $))) 

(MAKEPROP '|PrimitiveRatRicDE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . D) '|diff| (4 . D) '|diffq|
              (|NonNegativeInteger|) (8 . |order|) (14 . |degree|) (|Integer|)
              (19 . -) (24 . ^) (|Union| $ '"failed") (30 . |exquo|)
              (36 . |rem|) (42 . |One|) (46 . |One|)
              (|SparseUnivariatePolynomial| 7) (50 . |monomial|) (56 . *)
              (62 . |coerce|) (67 . -) (73 . *) (79 . |One|) (|List| $)
              (|List| 17) (83 . |concat|) (88 . |removeDuplicates!|) (93 . *)
              |ODEPRRIC;denomRicDE;LUP;8| (99 . |Zero|) (103 . |Zero|)
              (107 . |Zero|) (111 . |Zero|)
              (|Record| (|:| |poly| 7) (|:| |eq| 8)) (|List| 42)
              (|Mapping| (|List| 6) 7) |ODEPRRIC;polyRicDE;LML;9|
              (|Record| (|:| |factor| 7) (|:| |exponent| 17)) (|List| 46)
              (|Factored| 7) (115 . |factors|) (|List| 7) (120 . |concat|)
              (|Boolean|) (125 . <=) (|Record| (|:| |deg| 14) (|:| |eq| 25))
              (|Mapping| 52 54) (|List| 54) (131 . |select!|) (137 . ~=)
              (|Fraction| 7) (143 . /) |ODEPRRIC;changeVar;LFL;22| (149 . +)
              (|Record| (|:| |frac| 59) (|:| |eq| 8)) (|List| 63)
              (155 . |concat!|) (|List| 14) (161 . |member?|) (167 . >)
              (|Mapping| 52 54 54) (173 . |sort!|) (179 . |coefficient|)
              (185 . +) (191 . |Zero|) (195 . |elt|) (201 . *)
              (207 . |coefficients|) (212 . |coerce|)
              |ODEPRRIC;changeVar;LUPL;21|
              (|Record| (|:| |constant| 6) (|:| |eq| 8)) (|List| 79)
              |ODEPRRIC;constantCoefficientRicDE;LML;15| (217 . ~=)
              (223 . |leadingCoefficient|) (228 . |leadingCoefficient|)
              (233 . |degree|) (238 . |monomial|) (244 . +) (250 . |reductum|)
              (255 . *) (261 . >) (|Record| (|:| |deg| 14) (|:| |eq| 7))
              (|Mapping| 52 91 91) (|List| 91) (267 . |sort!|)
              |ODEPRRIC;leadingCoefficientRicDE;LL;19|
              (|BalancedFactorisation| 6 7) (273 . |balancedFactorisation|)
              (279 . |coerce|) (284 . +) (290 . |One|) (294 . *) (300 . *)
              (306 . |primitivePart|) (311 . |coerce|) (316 . +) (322 . |One|)
              (326 . |coerce|) (331 . *) (337 . *)
              (|Record| (|:| |eq| 8) (|:| |rh| 111)) (|List| 59)
              (|PrimitiveRatDE| 6 7 8 9) (343 . |splitDenominator|)
              (349 . |exquo|) (355 . |Zero|) (|Mapping| 50 7 25)
              (|Mapping| 48 7) |ODEPRRIC;singRicDE;LMML;25| (|Mapping| 52 91)
              (359 . |select!|) (365 . ~=) (371 . |concat!|))
           '#(|singRicDE| 377 |polyRicDE| 384 |leadingCoefficientRicDE| 390
              |denomRicDE| 395 |constantCoefficientRicDE| 400 |changeVar| 406)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 122
                                                 '(0 8 0 10 0 9 0 12 2 7 14 0 0
                                                   15 1 7 14 0 16 1 17 0 0 18 2
                                                   7 0 0 14 19 2 7 20 0 0 21 2
                                                   7 0 0 0 22 0 6 0 23 0 7 0 24
                                                   2 25 0 7 14 26 2 7 0 14 0 27
                                                   1 25 0 7 28 2 25 0 0 0 29 2
                                                   25 0 0 0 30 0 25 0 31 1 33 0
                                                   32 34 1 33 0 0 35 2 7 0 0 0
                                                   36 0 6 0 38 0 7 0 39 0 8 0
                                                   40 0 9 0 41 1 48 47 0 49 1
                                                   50 0 32 51 2 14 52 0 0 53 2
                                                   56 0 55 0 57 2 7 52 0 0 58 2
                                                   59 0 7 7 60 2 59 0 0 0 62 2
                                                   64 0 0 0 65 2 66 52 14 0 67
                                                   2 14 52 0 0 68 2 56 0 69 0
                                                   70 2 8 7 0 14 71 2 25 0 0 0
                                                   72 0 25 0 73 2 8 7 0 7 74 2
                                                   25 0 7 0 75 1 8 50 0 76 1 7
                                                   0 6 77 2 8 52 0 0 82 1 8 7 0
                                                   83 1 7 6 0 84 1 8 14 0 85 2
                                                   7 0 6 14 86 2 7 0 0 0 87 1 8
                                                   0 0 88 2 17 0 14 0 89 2 17
                                                   52 0 0 90 2 93 0 92 0 94 2
                                                   96 48 7 50 97 1 8 0 7 98 2 8
                                                   0 0 0 99 0 8 0 100 2 8 0 7 0
                                                   101 2 8 0 0 0 102 1 8 0 0
                                                   103 1 9 0 59 104 2 9 0 0 0
                                                   105 0 9 0 106 1 59 0 7 107 2
                                                   9 0 59 0 108 2 9 0 0 0 109 2
                                                   112 110 9 111 113 2 17 20 0
                                                   0 114 0 59 0 115 2 93 0 119
                                                   0 120 2 6 52 0 0 121 2 43 0
                                                   0 0 122 3 0 64 8 116 117 118
                                                   2 0 43 8 44 45 1 0 93 8 95 1
                                                   0 7 8 37 2 0 80 8 44 81 2 0
                                                   8 8 59 61 2 0 8 8 7 78)))))
           '|lookupComplete|)) 
