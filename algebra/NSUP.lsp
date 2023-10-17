
(PUT '|NSUP;rep| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |NSUP;rep|
        ((|s| (%))
         (% (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R)))))
        |s|) 

(PUT '|NSUP;per| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |NSUP;per|
        ((|l| (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
         (% (%)))
        |l|) 

(PUT '|NSUP;coerce;%Sup;3| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |NSUP;coerce;%Sup;3| ((|p| (%)) (% (|SparseUnivariatePolynomial| R)))
        |p|) 

(PUT '|NSUP;coerce;Sup%;4| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |NSUP;coerce;Sup%;4| ((|p| (|SparseUnivariatePolynomial| R)) (% (%)))
        |p|) 

(PUT '|NSUP;retractIfCan;%U;5| '|SPADreplace| '(XLAM (|p|) (CONS 0 |p|))) 

(SDEFUN |NSUP;retractIfCan;%U;5|
        ((|p| (%)) (% (|Union| (|SparseUnivariatePolynomial| R) "failed")))
        (CONS 0 |p|)) 

(SDEFUN |NSUP;monicModulo;3%;6| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((#1=#:G153 NIL)
          (|xx|
           #2=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|e| (|NonNegativeInteger|)) (|yy| #2#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT % 12))
            (|error| "in monicModulo$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT % 13))
            (|error| "in monicModulo$NSUP: ground? #2"))
           (#3='T
            (SEQ (LETT |yy| (|NSUP;rep| |y| %))
                 (COND
                  ((NULL
                    (SPADCALL (QCDR (|SPADfirst| |yy|)) (|spadConstant| % 14)
                              (QREFELT % 15)))
                   (EXIT (|error| "in monicModulo$NSUP: not monic #2"))))
                 (LETT |xx| (|NSUP;rep| |x| %))
                 (EXIT
                  (COND ((NULL |xx|) |x|)
                        (#3#
                         (SEQ (LETT |e| (QCAR (|SPADfirst| |yy|)))
                              (LETT |y| (|NSUP;per| (CDR |yy|) %))
                              (SEQ
                               (EXIT
                                (SEQ G190 NIL
                                     (SEQ
                                      (SEQ
                                       (LETT |u|
                                             (SPADCALL
                                              (QCAR (|SPADfirst| |xx|)) |e|
                                              (QREFELT % 18)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |u| 1)
                                          (PROGN
                                           (LETT #1# 1)
                                           (GO #4=#:G147))))))
                                      (LETT |xx|
                                            (|NSUP;rep|
                                             (SPADCALL
                                              (|NSUP;per| (CDR |xx|) %)
                                              (QCDR |u|)
                                              (QCDR (|SPADfirst| |xx|)) |y|
                                              (QREFELT % 19))
                                             %))
                                      (EXIT
                                       (COND
                                        ((NULL |xx|)
                                         (PROGN (LETT #1# 1) (GO #4#))))))
                                     NIL (GO G190) G191 (EXIT NIL)))
                               #4# (EXIT #1#))
                              (EXIT (|NSUP;per| |xx| %)))))))))))) 

(SDEFUN |NSUP;lazyResidueClass;2%R;7|
        ((|x| (%)) (|y| (%))
         (%
          (|Record| (|:| |polnum| %) (|:| |polden| R)
                    (|:| |power| (|NonNegativeInteger|)))))
        (SPROG
         ((#1=#:G168 NIL) (|pow| (|NonNegativeInteger|))
          (|xx|
           #2=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|e| (|NonNegativeInteger|)) (|co| (R)) (|yy| #2#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT % 12))
            (|error| "in lazyResidueClass$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT % 13))
            (|error| "in lazyResidueClass$NSUP: ground? #2"))
           (#3='T
            (SEQ (LETT |yy| (|NSUP;rep| |y| %))
                 (LETT |co| (QCDR (|SPADfirst| |yy|)))
                 (LETT |xx| (|NSUP;rep| |x| %))
                 (EXIT
                  (COND ((NULL |xx|) (VECTOR |x| |co| 0))
                        (#3#
                         (SEQ (LETT |pow| 0)
                              (LETT |e| (QCAR (|SPADfirst| |yy|)))
                              (LETT |y| (|NSUP;per| (CDR |yy|) %))
                              (SEQ
                               (EXIT
                                (SEQ G190 NIL
                                     (SEQ
                                      (SEQ
                                       (LETT |u|
                                             (SPADCALL
                                              (QCAR (|SPADfirst| |xx|)) |e|
                                              (QREFELT % 18)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |u| 1)
                                          (PROGN
                                           (LETT #1# 1)
                                           (GO #4=#:G161))))))
                                      (LETT |xx|
                                            (|NSUP;rep|
                                             (SPADCALL
                                              (SPADCALL |co|
                                                        (|NSUP;per| (CDR |xx|)
                                                         %)
                                                        (QREFELT % 23))
                                              (QCDR |u|)
                                              (QCDR (|SPADfirst| |xx|)) |y|
                                              (QREFELT % 19))
                                             %))
                                      (LETT |pow| (+ |pow| 1))
                                      (EXIT
                                       (COND
                                        ((NULL |xx|)
                                         (PROGN (LETT #1# 1) (GO #4#))))))
                                     NIL (GO G190) G191 (EXIT NIL)))
                               #4# (EXIT #1#))
                              (EXIT
                               (VECTOR (|NSUP;per| |xx| %) |co|
                                       |pow|)))))))))))) 

(SDEFUN |NSUP;lazyPseudoRemainder;3%;8| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((#1=#:G183 NIL)
          (|xx|
           #2=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|e| (|NonNegativeInteger|)) (|co| (R)) (|yy| #2#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT % 12))
            (|error| "in lazyPseudoRemainder$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT % 13))
            (|error| "in lazyPseudoRemainder$NSUP: ground? #2"))
           ((SPADCALL |x| (QREFELT % 13)) |x|)
           (#3='T
            (SEQ (LETT |yy| (|NSUP;rep| |y| %))
                 (LETT |co| (QCDR (|SPADfirst| |yy|)))
                 (EXIT
                  (COND
                   ((SPADCALL |co| (|spadConstant| % 14) (QREFELT % 15))
                    (SPADCALL |x| |y| (QREFELT % 20)))
                   ((SPADCALL |co|
                              (SPADCALL (|spadConstant| % 14) (QREFELT % 27))
                              (QREFELT % 15))
                    (SPADCALL
                     (SPADCALL (SPADCALL |x| (QREFELT % 28))
                               (SPADCALL |y| (QREFELT % 28)) (QREFELT % 20))
                     (QREFELT % 28)))
                   (#3#
                    (SEQ (LETT |xx| (|NSUP;rep| |x| %))
                         (LETT |e| (QCAR (|SPADfirst| |yy|)))
                         (LETT |y| (|NSUP;per| (CDR |yy|) %))
                         (SEQ
                          (EXIT
                           (SEQ G190 NIL
                                (SEQ
                                 (SEQ
                                  (LETT |u|
                                        (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                                  (QREFELT % 18)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |u| 1)
                                     (PROGN (LETT #1# 1) (GO #4=#:G175))))))
                                 (LETT |xx|
                                       (|NSUP;rep|
                                        (SPADCALL
                                         (SPADCALL |co|
                                                   (|NSUP;per| (CDR |xx|) %)
                                                   (QREFELT % 23))
                                         (QCDR |u|) (QCDR (|SPADfirst| |xx|))
                                         |y| (QREFELT % 19))
                                        %))
                                 (EXIT
                                  (COND
                                   ((NULL |xx|)
                                    (PROGN (LETT #1# 1) (GO #4#))))))
                                NIL (GO G190) G191 (EXIT NIL)))
                          #4# (EXIT #1#))
                         (EXIT (|NSUP;per| |xx| %)))))))))))) 

(SDEFUN |NSUP;lazyPseudoDivide;2%R;9|
        ((|x| (%)) (|y| (%))
         (%
          (|Record| (|:| |coef| R) (|:| |gap| (|NonNegativeInteger|))
                    (|:| |quotient| %) (|:| |remainder| %))))
        (SPROG
         ((#1=#:G200 NIL) (|pow| (|NonNegativeInteger|)) (#2=#:G188 NIL)
          (|xx|
           #3=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|qq|
           (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) #4="failed")) (|co| (R))
          (|e| (|NonNegativeInteger|)) (|yy| #3#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT % 12))
            (|error| "in lazyPseudoDivide$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT % 13))
            (|error| "in lazyPseudoDivide$NSUP: ground? #2"))
           ('T
            (SEQ (LETT |yy| (|NSUP;rep| |y| %))
                 (LETT |e| (QCAR (|SPADfirst| |yy|)))
                 (LETT |xx| (|NSUP;rep| |x| %))
                 (LETT |co| (QCDR (|SPADfirst| |yy|)))
                 (COND
                  ((OR (NULL |xx|) (< (QCAR (|SPADfirst| |xx|)) |e|))
                   (EXIT (VECTOR |co| 0 (|spadConstant| % 21) |x|))))
                 (LETT |pow|
                       (+
                        (PROG2
                            (LETT #2#
                                  (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                            (QREFELT % 18)))
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                          (|Union| (|NonNegativeInteger|) #4#)
                                          #2#))
                        1))
                 (LETT |qq| NIL) (LETT |y| (|NSUP;per| (CDR |yy|) %))
                 (SEQ
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (SEQ
                          (LETT |u|
                                (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                          (QREFELT % 18)))
                          (EXIT
                           (COND
                            ((QEQCAR |u| 1)
                             (PROGN (LETT #1# 1) (GO #5=#:G193))))))
                         (LETT |qq|
                               (CONS
                                (CONS (QCDR |u|) (QCDR (|SPADfirst| |xx|)))
                                (|NSUP;rep|
                                 (SPADCALL |co| (|NSUP;per| |qq| %)
                                           (QREFELT % 23))
                                 %)))
                         (LETT |xx|
                               (|NSUP;rep|
                                (SPADCALL
                                 (SPADCALL |co| (|NSUP;per| (CDR |xx|) %)
                                           (QREFELT % 23))
                                 (QCDR |u|) (QCDR (|SPADfirst| |xx|)) |y|
                                 (QREFELT % 19))
                                %))
                         (LETT |pow|
                               (PROG2
                                   (LETT #2# (SPADCALL |pow| 1 (QREFELT % 18)))
                                   (QCDR #2#)
                                 (|check_union2| (QEQCAR #2# 0)
                                                 (|NonNegativeInteger|)
                                                 (|Union|
                                                  (|NonNegativeInteger|) #4#)
                                                 #2#)))
                         (EXIT
                          (COND ((NULL |xx|) (PROGN (LETT #1# 1) (GO #5#))))))
                        NIL (GO G190) G191 (EXIT NIL)))
                  #5# (EXIT #1#))
                 (EXIT
                  (VECTOR |co| |pow| (|NSUP;per| (REVERSE |qq|) %)
                          (|NSUP;per| |xx| %))))))))) 

(SDEFUN |NSUP;lazyPseudoQuotient;3%;10| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((#1=#:G215 NIL)
          (|xx|
           #2=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|qq|
           (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed")) (|co| (R))
          (|e| (|NonNegativeInteger|)) (|yy| #2#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT % 12))
            (|error| "in lazyPseudoQuotient$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT % 13))
            (|error| "in lazyPseudoQuotient$NSUP: ground? #2"))
           ('T
            (SEQ (LETT |yy| (|NSUP;rep| |y| %))
                 (LETT |e| (QCAR (|SPADfirst| |yy|)))
                 (LETT |xx| (|NSUP;rep| |x| %))
                 (COND
                  ((OR (NULL |xx|) (< (QCAR (|SPADfirst| |xx|)) |e|))
                   (EXIT (|spadConstant| % 21))))
                 (LETT |qq| NIL) (LETT |co| (QCDR (|SPADfirst| |yy|)))
                 (LETT |y| (|NSUP;per| (CDR |yy|) %))
                 (SEQ
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (SEQ
                          (LETT |u|
                                (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                          (QREFELT % 18)))
                          (EXIT
                           (COND
                            ((QEQCAR |u| 1)
                             (PROGN (LETT #1# 1) (GO #3=#:G209))))))
                         (LETT |qq|
                               (CONS
                                (CONS (QCDR |u|) (QCDR (|SPADfirst| |xx|)))
                                (|NSUP;rep|
                                 (SPADCALL |co| (|NSUP;per| |qq| %)
                                           (QREFELT % 23))
                                 %)))
                         (LETT |xx|
                               (|NSUP;rep|
                                (SPADCALL
                                 (SPADCALL |co| (|NSUP;per| (CDR |xx|) %)
                                           (QREFELT % 23))
                                 (QCDR |u|) (QCDR (|SPADfirst| |xx|)) |y|
                                 (QREFELT % 19))
                                %))
                         (EXIT
                          (COND ((NULL |xx|) (PROGN (LETT #1# 1) (GO #3#))))))
                        NIL (GO G190) G191 (EXIT NIL)))
                  #3# (EXIT #1#))
                 (EXIT (|NSUP;per| (REVERSE |qq|) %)))))))) 

(SDEFUN |NSUP;subResultantGcd;3%;11| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPADCALL |p1| |p2| (QREFELT % 34))) 

(SDEFUN |NSUP;subResultantsChain;2%L;12| ((|p1| (%)) (|p2| (%)) (% (|List| %)))
        (SPADCALL |p1| |p2| (QREFELT % 37))) 

(SDEFUN |NSUP;lastSubResultant;3%;13| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPADCALL |p1| |p2| (QREFELT % 40))) 

(SDEFUN |NSUP;resultant;2%R;14| ((|p1| (%)) (|p2| (%)) (% (R)))
        (SPADCALL |p1| |p2| (QREFELT % 42))) 

(SDEFUN |NSUP;extendedResultant;2%R;15|
        ((|p1| (%)) (|p2| (%))
         (% (|Record| (|:| |resultant| R) (|:| |coef1| %) (|:| |coef2| %))))
        (SPROG
         ((|re|
           (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |resultant| R))))
         (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 45)))
              (EXIT (VECTOR (QVELT |re| 2) (QVELT |re| 0) (QVELT |re| 1)))))) 

(SDEFUN |NSUP;halfExtendedResultant1;2%R;16|
        ((|p1| (%)) (|p2| (%))
         (% (|Record| (|:| |resultant| R) (|:| |coef1| %))))
        (SPROG ((|re| (|Record| (|:| |coef1| %) (|:| |resultant| R))))
               (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 49)))
                    (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(SDEFUN |NSUP;halfExtendedResultant2;2%R;17|
        ((|p1| (%)) (|p2| (%))
         (% (|Record| (|:| |resultant| R) (|:| |coef2| %))))
        (SPROG ((|re| (|Record| (|:| |coef2| %) (|:| |resultant| R))))
               (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 53)))
                    (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(SDEFUN |NSUP;extendedSubResultantGcd;2%R;18|
        ((|p1| (%)) (|p2| (%))
         (% (|Record| (|:| |gcd| %) (|:| |coef1| %) (|:| |coef2| %))))
        (SPROG
         ((|re| (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |gcd| %))))
         (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 57)))
              (EXIT (VECTOR (QVELT |re| 2) (QVELT |re| 0) (QVELT |re| 1)))))) 

(SDEFUN |NSUP;halfExtendedSubResultantGcd1;2%R;19|
        ((|p1| (%)) (|p2| (%)) (% (|Record| (|:| |gcd| %) (|:| |coef1| %))))
        (SPROG ((|re| (|Record| (|:| |coef1| %) (|:| |gcd| %))))
               (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 61)))
                    (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(SDEFUN |NSUP;halfExtendedSubResultantGcd2;2%R;20|
        ((|p1| (%)) (|p2| (%)) (% (|Record| (|:| |gcd| %) (|:| |coef2| %))))
        (SPROG ((|re| (|Record| (|:| |coef2| %) (|:| |gcd| %))))
               (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 65)))
                    (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(DECLAIM (NOTINLINE |NewSparseUnivariatePolynomial;|)) 

(DEFUN |NewSparseUnivariatePolynomial| (#1=#:G306)
  (SPROG NIL
         (PROG (#2=#:G307)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|NewSparseUnivariatePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|NewSparseUnivariatePolynomial;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|NewSparseUnivariatePolynomial|)))))))))) 

(DEFUN |NewSparseUnivariatePolynomial;| (|#1|)
  (SPROG
   ((#1=#:G305 NIL) (|pv$| NIL) (#2=#:G296 NIL) (#3=#:G298 NIL) (#4=#:G297 NIL)
    (#5=#:G299 NIL) (#6=#:G300 NIL) (#7=#:G301 NIL) (#8=#:G302 NIL)
    (#9=#:G303 NIL) (#10=#:G304 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|NewSparseUnivariatePolynomial| DV$1))
    (LETT % (GETREFV 124))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory|
                                              (|SingletonAsOrderedSet|)
                                              '(|Hashable|)))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #10#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|)))
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #10#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #10#)
                                        (LETT #9#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|Field|)) #10#
                                         #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #10# #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #10# #9#)
                                        (|HasCategory| |#1| '(|StepThrough|))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #10#
                                         #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|Comparable|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Float|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         #8#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Integer|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         #5#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #4#)
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         (AND #4#
                                              (|HasCategory| |#1| '(|Field|)))
                                         (AND #4# #10#) (AND #4# #9#)
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                         #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         #2#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#)))))
    (|haddProp| |$ConstructorCache| '|NewSparseUnivariatePolynomial|
                (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 70368744177664))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 140737488355328))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| % 281474976710656))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 562949953421312))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #10# (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1125899906842624))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 2251799813685248))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#1| '(|AbelianMonoid|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #2#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 72057594037927936))
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 20)
      (PROGN
       (QSETREFV % 35
                 (CONS (|dispatchFunction| |NSUP;subResultantGcd;3%;11|) %))
       (QSETREFV % 39
                 (CONS (|dispatchFunction| |NSUP;subResultantsChain;2%L;12|)
                       %))
       (QSETREFV % 41
                 (CONS (|dispatchFunction| |NSUP;lastSubResultant;3%;13|) %))
       (QSETREFV % 43 (CONS (|dispatchFunction| |NSUP;resultant;2%R;14|) %))
       (QSETREFV % 47
                 (CONS (|dispatchFunction| |NSUP;extendedResultant;2%R;15|) %))
       (QSETREFV % 51
                 (CONS
                  (|dispatchFunction| |NSUP;halfExtendedResultant1;2%R;16|) %))
       (QSETREFV % 55
                 (CONS
                  (|dispatchFunction| |NSUP;halfExtendedResultant2;2%R;17|) %))
       (QSETREFV % 59
                 (CONS
                  (|dispatchFunction| |NSUP;extendedSubResultantGcd;2%R;18|)
                  %))
       (QSETREFV % 63
                 (CONS
                  (|dispatchFunction|
                   |NSUP;halfExtendedSubResultantGcd1;2%R;19|)
                  %))
       (QSETREFV % 67
                 (CONS
                  (|dispatchFunction|
                   |NSUP;halfExtendedSubResultantGcd2;2%R;20|)
                  %)))))
    %))) 

(MAKEPROP '|NewSparseUnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 6)
              (|local| |#1|) |NSUP;coerce;%Sup;3| |NSUP;coerce;Sup%;4|
              (|Union| 5 '"failed") |NSUP;retractIfCan;%U;5| (|Boolean|)
              (0 . |zero?|) (5 . |ground?|) (10 . |One|) (14 . =)
              (|Union| % '"failed") (|NonNegativeInteger|)
              (20 . |subtractIfCan|) (26 . |fmecg|) |NSUP;monicModulo;3%;6|
              (34 . |Zero|) (38 . |Zero|) (42 . *) (48 . |One|)
              (|Record| (|:| |polnum| %) (|:| |polden| 6) (|:| |power| 17))
              |NSUP;lazyResidueClass;2%R;7| (52 . -) (57 . -)
              |NSUP;lazyPseudoRemainder;3%;8|
              (|Record| (|:| |coef| 6) (|:| |gap| 17) (|:| |quotient| %)
                        (|:| |remainder| %))
              |NSUP;lazyPseudoDivide;2%R;9| |NSUP;lazyPseudoQuotient;3%;10|
              (|PseudoRemainderSequence| 6 $$) (62 . |subResultantGcd|)
              (68 . |subResultantGcd|) (|List| $$) (74 . |chainSubResultants|)
              (|List| %) (80 . |subResultantsChain|) (86 . |lastSubResultant|)
              (92 . |lastSubResultant|) (98 . |resultant|) (104 . |resultant|)
              (|Record| (|:| |coef1| $$) (|:| |coef2| $$) (|:| |resultant| 6))
              (110 . |resultantEuclidean|)
              (|Record| (|:| |resultant| 6) (|:| |coef1| %) (|:| |coef2| %))
              (116 . |extendedResultant|)
              (|Record| (|:| |coef1| $$) (|:| |resultant| 6))
              (122 . |semiResultantEuclidean1|)
              (|Record| (|:| |resultant| 6) (|:| |coef1| %))
              (128 . |halfExtendedResultant1|)
              (|Record| (|:| |coef2| $$) (|:| |resultant| 6))
              (134 . |semiResultantEuclidean2|)
              (|Record| (|:| |resultant| 6) (|:| |coef2| %))
              (140 . |halfExtendedResultant2|)
              (|Record| (|:| |coef1| $$) (|:| |coef2| $$) (|:| |gcd| $$))
              (146 . |subResultantGcdEuclidean|)
              (|Record| (|:| |gcd| %) (|:| |coef1| %) (|:| |coef2| %))
              (152 . |extendedSubResultantGcd|)
              (|Record| (|:| |coef1| $$) (|:| |gcd| $$))
              (158 . |semiSubResultantGcdEuclidean1|)
              (|Record| (|:| |gcd| %) (|:| |coef1| %))
              (164 . |halfExtendedSubResultantGcd1|)
              (|Record| (|:| |coef2| $$) (|:| |gcd| $$))
              (170 . |semiSubResultantGcdEuclidean2|)
              (|Record| (|:| |gcd| %) (|:| |coef2| %))
              (176 . |halfExtendedSubResultantGcd2|) (|Union| 77 '#1="failed")
              (|Matrix| %) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 78)
              (|HashState|) (|SingleInteger|) (|Matrix| 78)
              (|Record| (|:| |mat| 75) (|:| |vec| (|Vector| 78))) (|Vector| %)
              (|Integer|) (|Symbol|) (|List| 79) (|List| 17)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 78 %)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 78) (|Record| (|:| |k| 17) (|:| |c| 6)) (|List| 86)
              (|SingletonAsOrderedSet|) (|Mapping| 6 17)
              (|Record| (|:| |coef| 38) (|:| |generator| %))
              (|Union| 38 '"failed")
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 94 '"failed")
              (|Fraction| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |primePart| %) (|:| |commonPart| %))
              (|Factored| %)
              (|Record| (|:| |coef| 6) (|:| |quotient| %) (|:| |remainder| %))
              (|Union| 96 '"failed") (|Factored| 98) (|Union| 105 '#1#)
              (|List| 98) (|Union| 85 '#2="failed") (|Union| 78 '#2#)
              (|Mapping| 6 6) (|List| 88)
              (|Record| (|:| |mat| 111) (|:| |vec| 117)) (|Matrix| 6)
              (|Union| 88 '#2#) (|List| 114) (|Equation| %)
              (|Record| (|:| |var| 88) (|:| |exponent| 17))
              (|Union| 115 '"failed") (|Vector| 6) (|List| 6) (|Mapping| 17 17)
              (|Union| 6 '#2#) (|PositiveInteger|) (|OutputForm|) (|String|))
           '#(~= 182 |zero?| 188 |vectorise| 193 |variables| 199 |unvectorise|
              204 |unmakeSUP| 209 |univariate| 214 |unitNormal| 225
              |unitCanonical| 230 |unit?| 235 |totalDegreeSorted| 240
              |totalDegree| 246 |support| 257 |subtractIfCan| 262
              |subResultantsChain| 268 |subResultantGcd| 274
              |squareFreePolynomial| 280 |squareFreePart| 285 |squareFree| 290
              |solveLinearPolynomialEquation| 295 |smaller?| 301 |sizeLess?|
              307 |shiftRight| 313 |shiftLeft| 319 |separate| 325 |sample| 331
              |rightRecip| 335 |rightPower| 340 |retractIfCan| 352 |retract|
              377 |resultant| 402 |rem| 415 |reductum| 421 |reducedSystem| 426
              |recip| 448 |quo| 453 |pseudoRemainder| 459 |pseudoQuotient| 465
              |pseudoDivide| 471 |principalIdeal| 477 |primitivePart| 482
              |primitiveMonomials| 493 |prime?| 498 |pomopo!| 503
              |patternMatch| 511 |order| 525 |opposite?| 531 |one?| 537
              |numberOfMonomials| 542 |nextItem| 547 |multivariate| 552
              |multiplyExponents| 564 |multiEuclidean| 570 |monomials| 576
              |monomial?| 581 |monomial| 586 |monicModulo| 606 |monicDivide|
              612 |minimumDegree| 625 |mapExponents| 642 |map| 648 |makeSUP|
              654 |mainVariable| 659 |listOfTerms| 664 |linearExtend| 669
              |leftRecip| 675 |leftPower| 680 |leadingTerm| 692
              |leadingSupport| 697 |leadingMonomial| 702 |leadingCoefficient|
              707 |lcmCoef| 712 |lcm| 718 |lazyResidueClass| 729
              |lazyPseudoRemainder| 735 |lazyPseudoQuotient| 741
              |lazyPseudoDivide| 747 |latex| 753 |lastSubResultant| 758
              |karatsubaDivide| 764 |isTimes| 770 |isPlus| 775 |isExpt| 780
              |integrate| 785 |init| 790 |hashUpdate!| 794 |hash| 800
              |halfExtendedSubResultantGcd2| 805 |halfExtendedSubResultantGcd1|
              811 |halfExtendedResultant2| 817 |halfExtendedResultant1| 823
              |ground?| 829 |ground| 834 |gcdPolynomial| 839 |gcd| 845 |fmecg|
              856 |factorSquareFreePolynomial| 864 |factorPolynomial| 869
              |factor| 874 |extendedSubResultantGcd| 879 |extendedResultant|
              885 |extendedEuclidean| 891 |exquo| 904 |expressIdealMember| 916
              |eval| 922 |euclideanSize| 976 |elt| 981 |divideExponents| 1011
              |divide| 1017 |discriminant| 1023 |differentiate| 1034 |degree|
              1117 |convert| 1134 |content| 1149 |constructOrdered| 1160
              |construct| 1165 |conditionP| 1170 |composite| 1175 |commutator|
              1187 |coerce| 1193 |coefficients| 1233 |coefficient| 1238
              |charthRoot| 1258 |characteristic| 1263 |binomThmExpt| 1267
              |associator| 1274 |associates?| 1281 |antiCommutator| 1287
              |annihilate?| 1293 ^ 1299 |Zero| 1311 |One| 1315 D 1319 = 1395 /
              1401 - 1407 + 1418 * 1424)
           'NIL
           (CONS
            (|makeByteWordVec2| 46
                                '(0 0 0 10 14 0 10 14 0 18 22 21 17 4 1 2 3 21
                                  4 23 19 25 4 26 0 13 26 0 0 1 5 4 23 0 0 0 1
                                  4 4 40 0 0 0 0 0 1 1 40 26 15 46 13 13 0 0 45
                                  13 0 0 0 9 30 32 24 0 0 0 6 7 12 13 13 23 0 0
                                  0 0 0 0 0 0 0 0 4 6 7 8 34 36 11 13 13 14 23
                                  16 20))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| NIL NIL NIL
                |DifferentialExtension&| |Algebra&| NIL NIL |Algebra&|
                |PartialDifferentialRing&| |Algebra&| |EntireRing&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL
                |FreeModuleCategory&| NIL |Rng&| NIL NIL |Module&| |Module&|
                |FullyLinearlyExplicitOver&| |Module&| NIL NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                |FullyRetractableTo&| |Magma&| |AbelianSemiGroup&| NIL NIL NIL
                NIL |RetractableTo&| |RetractableTo&| |SetCategory&|
                |RetractableTo&| |RetractableTo&| |Hashable&| |Evalable&|
                |RetractableTo&| NIL NIL NIL NIL NIL NIL |InnerEvalable&|
                |InnerEvalable&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL NIL
                NIL |InnerEvalable&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 6)
                 (|PolynomialCategory| 6 17 88)
                 (|MaybeSkewPolynomialCategory| 6 17 88)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 6 17) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 6 17)
                 (|GcdDomain|) (|IntegralDomain|) (|CommutativeRing|)
                 (|LeftOreRing|) (|DifferentialExtension| 6) (|Algebra| 85)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Algebra| 6)
                 (|PartialDifferentialRing| 88) (|Algebra| $$) (|EntireRing|)
                 (|PartialDifferentialRing| 79) (|DifferentialRing|) (|Ring|)
                 (|FreeModuleCategory| 6 17) (|SemiRing|) (|Rng|) (|SemiRng|)
                 (|IndexedDirectProductCategory| 6 17) (|Module| 85)
                 (|Module| 6) (|FullyLinearlyExplicitOver| 6) (|Module| $$)
                 (|IndexedProductCategory| 6 17) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|BiModule| 85 85) (|NonAssociativeRing|)
                 (|LinearlyExplicitOver| 6) (|LinearlyExplicitOver| 78)
                 (|AbelianProductCategory| 6) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 85) (|RightModule| 85) (|RightModule| 78)
                 (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|SemiGroup|)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|FullyRetractableTo| 6)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 78)
                 (|StepThrough|)
                 (|RetractableTo| (|SparseUnivariatePolynomial| 6))
                 (|RetractableTo| 6) (|SetCategory|) (|RetractableTo| 85)
                 (|RetractableTo| 78) (|Hashable|) (|Evalable| $$)
                 (|RetractableTo| 88) (|CommutativeStar|)
                 (|CoercibleFrom| (|SparseUnivariatePolynomial| 6))
                 (|CoercibleTo| (|SparseUnivariatePolynomial| 6))
                 (|Eltable| $$ $$) (|Eltable| 6 6)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 88 $$)
                 (|InnerEvalable| 88 6) (|CoercibleFrom| 6) (|BasicType|)
                 (|CoercibleTo| 122) (|unitsKnown|) (|CoercibleFrom| 85)
                 (|CoercibleFrom| 78) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 71) (|ConvertibleTo| 72) (|ConvertibleTo| 70)
                 (|InnerEvalable| $$ $$) (|CoercibleFrom| 88)
                 (|additiveValuation|) (|TwoSidedRecip|) (|noZeroDivisors|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)))
              (|makeByteWordVec2| 123
                                  '(1 0 11 0 12 1 0 11 0 13 0 6 0 14 2 6 11 0 0
                                    15 2 17 16 0 0 18 4 0 0 0 17 6 0 19 0 0 0
                                    21 0 6 0 22 2 0 0 6 0 23 0 0 0 24 1 6 0 0
                                    27 1 0 0 0 28 2 33 2 2 2 34 2 0 0 0 0 35 2
                                    33 36 2 2 37 2 0 38 0 0 39 2 33 2 2 2 40 2
                                    0 0 0 0 41 2 33 6 2 2 42 2 0 6 0 0 43 2 33
                                    44 2 2 45 2 0 46 0 0 47 2 33 48 2 2 49 2 0
                                    50 0 0 51 2 33 52 2 2 53 2 0 54 0 0 55 2 33
                                    56 2 2 57 2 0 58 0 0 59 2 33 60 2 2 61 2 0
                                    62 0 0 63 2 33 64 2 2 65 2 0 66 0 0 67 2 0
                                    11 0 0 1 1 55 11 0 12 2 0 117 0 17 1 1 0
                                    109 0 1 1 0 0 117 1 1 0 0 5 1 1 0 5 0 1 2 0
                                    98 0 88 1 1 50 84 0 1 1 50 0 0 1 1 50 11 0
                                    1 2 0 17 0 109 1 1 0 17 0 1 2 0 17 0 109 1
                                    1 0 81 0 1 2 56 16 0 0 1 2 20 38 0 0 39 2
                                    20 0 0 0 35 1 10 103 98 1 1 17 0 0 1 1 17
                                    100 0 1 2 10 104 105 98 1 2 9 11 0 0 1 2 14
                                    11 0 0 1 2 4 0 0 17 1 2 0 0 0 17 1 2 17 99
                                    0 0 1 0 55 0 1 1 53 16 0 1 2 53 0 0 17 1 2
                                    0 0 0 121 1 1 6 106 0 1 1 7 107 0 1 1 13
                                    112 0 1 1 0 9 0 10 1 0 120 0 1 1 6 85 0 1 1
                                    7 78 0 1 1 13 88 0 1 1 0 5 0 1 1 0 6 0 1 2
                                    5 6 0 0 43 3 5 0 0 0 88 1 2 14 0 0 0 1 1 27
                                    0 0 1 1 39 75 69 1 2 39 76 69 77 1 2 4 110
                                    69 77 1 1 4 111 69 1 1 53 16 0 1 2 14 0 0 0
                                    1 2 4 0 0 0 1 2 20 0 0 0 1 2 20 101 0 0 1 1
                                    14 90 38 1 2 17 0 0 88 1 1 17 0 0 1 1 13 38
                                    0 1 1 10 11 0 1 4 0 0 0 6 17 0 1 3 29 82 0
                                    71 82 1 3 31 83 0 72 83 1 2 20 17 0 0 1 2
                                    55 11 0 0 1 1 53 11 0 1 1 0 17 0 1 1 24 16
                                    0 1 2 0 0 98 88 1 2 0 0 5 88 1 2 0 0 0 17 1
                                    2 14 91 38 0 1 1 0 38 0 1 1 0 11 0 1 3 0 0
                                    0 88 17 1 3 0 0 0 109 81 1 2 0 0 6 17 1 2 0
                                    0 0 0 20 2 4 92 0 0 1 3 4 92 0 0 88 1 2 0
                                    81 0 109 1 2 0 17 0 88 1 1 0 17 0 1 2 0 0
                                    119 0 1 2 0 0 108 0 1 1 0 5 0 1 1 0 112 0 1
                                    1 0 87 0 1 2 5 6 89 0 1 1 53 16 0 1 2 53 0
                                    0 17 1 2 0 0 0 121 1 1 27 86 0 1 1 27 17 0
                                    1 1 27 0 0 1 1 27 6 0 1 2 17 97 0 0 1 2 17
                                    0 0 0 1 1 17 0 38 1 2 0 25 0 0 26 2 0 0 0 0
                                    29 2 0 0 0 0 32 2 0 30 0 0 31 1 0 123 0 1 2
                                    20 0 0 0 41 2 4 92 0 17 1 1 13 91 0 1 1 0
                                    91 0 1 1 13 116 0 1 1 1 0 0 1 0 24 0 1 2 12
                                    73 73 0 1 1 12 74 0 1 2 20 66 0 0 67 2 20
                                    62 0 0 63 2 20 54 0 0 55 2 20 50 0 0 51 1 0
                                    11 0 13 1 0 6 0 1 2 17 98 98 98 1 2 17 0 0
                                    0 1 1 17 0 38 1 4 4 0 0 17 6 0 19 1 10 103
                                    98 1 1 10 103 98 1 1 10 100 0 1 2 20 58 0 0
                                    59 2 20 46 0 0 47 2 14 93 0 0 1 3 14 95 0 0
                                    0 1 2 50 16 0 0 1 2 16 16 0 6 1 2 14 91 38
                                    0 1 3 13 0 0 0 0 1 3 13 0 0 38 38 1 2 13 0
                                    0 113 1 2 13 0 0 114 1 3 0 0 0 109 38 1 3 0
                                    0 0 109 118 1 3 0 0 0 88 0 1 3 0 0 0 88 6 1
                                    1 14 17 0 1 2 14 6 96 6 1 2 20 96 0 96 1 2
                                    20 96 96 96 1 2 0 0 0 0 1 2 0 6 0 6 1 2 0
                                    16 0 17 1 2 14 92 0 0 1 1 5 6 0 1 2 5 0 0
                                    88 1 3 37 0 0 80 81 1 2 37 0 0 80 1 3 37 0
                                    0 79 17 1 2 37 0 0 79 1 1 4 0 0 1 2 4 0 0
                                    17 1 3 4 0 0 108 17 1 2 4 0 0 108 1 3 4 0 0
                                    108 0 1 2 4 0 0 88 1 3 4 0 0 88 17 1 2 4 0
                                    0 109 1 3 4 0 0 109 81 1 2 0 17 0 88 1 2 0
                                    81 0 109 1 1 0 17 0 1 1 11 70 0 1 1 33 71 0
                                    1 1 35 72 0 1 2 17 0 0 88 1 1 17 6 0 1 1 27
                                    0 87 1 1 0 0 87 1 1 48 68 69 1 2 20 16 0 0
                                    1 2 20 102 96 0 1 2 54 0 0 0 1 1 51 0 0 1 1
                                    52 0 78 1 1 28 0 85 1 1 13 0 88 1 1 0 0 5 8
                                    1 0 5 0 7 1 0 0 6 1 1 0 122 0 1 1 0 118 0 1
                                    3 0 0 0 88 17 1 3 0 0 0 109 81 1 2 0 6 0 17
                                    1 1 49 16 0 1 0 54 17 1 3 47 0 0 0 17 1 3
                                    54 0 0 0 0 1 2 50 11 0 0 1 2 0 0 0 0 1 2 54
                                    11 0 0 1 2 53 0 0 17 1 2 0 0 0 121 1 0 55 0
                                    21 0 53 0 24 3 37 0 0 79 17 1 3 37 0 0 80
                                    81 1 2 37 0 0 80 1 2 37 0 0 79 1 1 4 0 0 1
                                    2 4 0 0 17 1 3 4 0 0 108 17 1 2 4 0 0 108 1
                                    2 4 0 0 88 1 3 4 0 0 88 17 1 2 4 0 0 109 1
                                    3 4 0 0 109 81 1 2 0 11 0 0 1 2 14 0 0 6 1
                                    2 57 0 0 0 1 1 57 0 0 28 2 0 0 0 0 1 2 39 0
                                    0 78 1 2 57 0 78 0 1 2 55 0 17 0 1 2 1 0 85
                                    0 1 2 1 0 0 85 1 2 0 0 6 0 23 2 0 0 0 6 1 2
                                    0 0 0 0 1 2 0 0 121 0 1)))))
           '|lookupComplete|)) 
