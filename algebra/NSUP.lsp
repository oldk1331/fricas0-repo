
(PUT '|NSUP;rep| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |NSUP;rep|
        ((|s| $)
         ($ |List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
        |s|) 

(PUT '|NSUP;per| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |NSUP;per|
        ((|l| |List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R)))
         ($ $))
        |l|) 

(PUT '|NSUP;coerce;$Sup;3| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |NSUP;coerce;$Sup;3| ((|p| $) ($ |SparseUnivariatePolynomial| R)) |p|) 

(PUT '|NSUP;coerce;Sup$;4| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |NSUP;coerce;Sup$;4| ((|p| |SparseUnivariatePolynomial| R) ($ $)) |p|) 

(PUT '|NSUP;retractIfCan;$U;5| '|SPADreplace| '(XLAM (|p|) (CONS 0 |p|))) 

(SDEFUN |NSUP;retractIfCan;$U;5|
        ((|p| $) ($ |Union| (|SparseUnivariatePolynomial| R) "failed"))
        (CONS 0 |p|)) 

(SDEFUN |NSUP;monicModulo;3$;6| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((#1=#:G164 NIL)
          (|xx|
           #2=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|e| (|NonNegativeInteger|)) (|yy| #2#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT $ 12))
            (|error| "in monicModulo$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT $ 13))
            (|error| "in monicModulo$NSUP: ground? #2"))
           (#3='T
            (SEQ (LETT |yy| (|NSUP;rep| |y| $) . #4=(|NSUP;monicModulo;3$;6|))
                 (COND
                  ((NULL
                    (SPADCALL (QCDR (|SPADfirst| |yy|)) (|spadConstant| $ 14)
                              (QREFELT $ 15)))
                   (EXIT (|error| "in monicModulo$NSUP: not monic #2"))))
                 (LETT |xx| (|NSUP;rep| |x| $) . #4#)
                 (EXIT
                  (COND ((NULL |xx|) |x|)
                        (#3#
                         (SEQ (LETT |e| (QCAR (|SPADfirst| |yy|)) . #4#)
                              (LETT |y| (|NSUP;per| (CDR |yy|) $) . #4#)
                              (SEQ
                               (EXIT
                                (SEQ G190 NIL
                                     (SEQ
                                      (SEQ
                                       (LETT |u|
                                             (SPADCALL
                                              (QCAR (|SPADfirst| |xx|)) |e|
                                              (QREFELT $ 18))
                                             . #4#)
                                       (EXIT
                                        (COND
                                         ((QEQCAR |u| 1)
                                          (PROGN
                                           (LETT #1# |$NoValue| . #4#)
                                           (GO #5=#:G158))))))
                                      (LETT |xx|
                                            (|NSUP;rep|
                                             (SPADCALL
                                              (|NSUP;per| (CDR |xx|) $)
                                              (QCDR |u|)
                                              (QCDR (|SPADfirst| |xx|)) |y|
                                              (QREFELT $ 19))
                                             $)
                                            . #4#)
                                      (EXIT
                                       (COND
                                        ((NULL |xx|)
                                         (PROGN
                                          (LETT #1# |$NoValue| . #4#)
                                          (GO #5#))))))
                                     NIL (GO G190) G191 (EXIT NIL)))
                               #5# (EXIT #1#))
                              (EXIT (|NSUP;per| |xx| $)))))))))))) 

(SDEFUN |NSUP;lazyResidueClass;2$R;7|
        ((|x| $) (|y| $)
         ($ |Record| (|:| |polnum| $) (|:| |polden| R)
          (|:| |power| (|NonNegativeInteger|))))
        (SPROG
         ((#1=#:G178 NIL) (|pow| (|NonNegativeInteger|))
          (|xx|
           #2=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|e| (|NonNegativeInteger|)) (|co| (R)) (|yy| #2#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT $ 12))
            (|error| "in lazyResidueClass$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT $ 13))
            (|error| "in lazyResidueClass$NSUP: ground? #2"))
           (#3='T
            (SEQ
             (LETT |yy| (|NSUP;rep| |y| $)
                   . #4=(|NSUP;lazyResidueClass;2$R;7|))
             (LETT |co| (QCDR (|SPADfirst| |yy|)) . #4#)
             (LETT |xx| (|NSUP;rep| |x| $) . #4#)
             (EXIT
              (COND ((NULL |xx|) (VECTOR |x| |co| 0))
                    (#3#
                     (SEQ (LETT |pow| 0 . #4#)
                          (LETT |e| (QCAR (|SPADfirst| |yy|)) . #4#)
                          (LETT |y| (|NSUP;per| (CDR |yy|) $) . #4#)
                          (SEQ
                           (EXIT
                            (SEQ G190 NIL
                                 (SEQ
                                  (SEQ
                                   (LETT |u|
                                         (SPADCALL (QCAR (|SPADfirst| |xx|))
                                                   |e| (QREFELT $ 18))
                                         . #4#)
                                   (EXIT
                                    (COND
                                     ((QEQCAR |u| 1)
                                      (PROGN
                                       (LETT #1# |$NoValue| . #4#)
                                       (GO #5=#:G171))))))
                                  (LETT |xx|
                                        (|NSUP;rep|
                                         (SPADCALL
                                          (SPADCALL |co|
                                                    (|NSUP;per| (CDR |xx|) $)
                                                    (QREFELT $ 23))
                                          (QCDR |u|) (QCDR (|SPADfirst| |xx|))
                                          |y| (QREFELT $ 19))
                                         $)
                                        . #4#)
                                  (LETT |pow| (+ |pow| 1) . #4#)
                                  (EXIT
                                   (COND
                                    ((NULL |xx|)
                                     (PROGN
                                      (LETT #1# |$NoValue| . #4#)
                                      (GO #5#))))))
                                 NIL (GO G190) G191 (EXIT NIL)))
                           #5# (EXIT #1#))
                          (EXIT
                           (VECTOR (|NSUP;per| |xx| $) |co| |pow|)))))))))))) 

(SDEFUN |NSUP;lazyPseudoRemainder;3$;8| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((#1=#:G192 NIL)
          (|xx|
           #2=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|e| (|NonNegativeInteger|)) (|co| (R)) (|yy| #2#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT $ 12))
            (|error| "in lazyPseudoRemainder$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT $ 13))
            (|error| "in lazyPseudoRemainder$NSUP: ground? #2"))
           ((SPADCALL |x| (QREFELT $ 13)) |x|)
           (#3='T
            (SEQ
             (LETT |yy| (|NSUP;rep| |y| $)
                   . #4=(|NSUP;lazyPseudoRemainder;3$;8|))
             (LETT |co| (QCDR (|SPADfirst| |yy|)) . #4#)
             (EXIT
              (COND
               ((SPADCALL |co| (|spadConstant| $ 14) (QREFELT $ 15))
                (SPADCALL |x| |y| (QREFELT $ 20)))
               ((SPADCALL |co| (SPADCALL (|spadConstant| $ 14) (QREFELT $ 27))
                          (QREFELT $ 15))
                (SPADCALL
                 (SPADCALL (SPADCALL |x| (QREFELT $ 28))
                           (SPADCALL |y| (QREFELT $ 28)) (QREFELT $ 20))
                 (QREFELT $ 28)))
               (#3#
                (SEQ (LETT |xx| (|NSUP;rep| |x| $) . #4#)
                     (LETT |e| (QCAR (|SPADfirst| |yy|)) . #4#)
                     (LETT |y| (|NSUP;per| (CDR |yy|) $) . #4#)
                     (SEQ
                      (EXIT
                       (SEQ G190 NIL
                            (SEQ
                             (SEQ
                              (LETT |u|
                                    (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                              (QREFELT $ 18))
                                    . #4#)
                              (EXIT
                               (COND
                                ((QEQCAR |u| 1)
                                 (PROGN
                                  (LETT #1# |$NoValue| . #4#)
                                  (GO #5=#:G184))))))
                             (LETT |xx|
                                   (|NSUP;rep|
                                    (SPADCALL
                                     (SPADCALL |co| (|NSUP;per| (CDR |xx|) $)
                                               (QREFELT $ 23))
                                     (QCDR |u|) (QCDR (|SPADfirst| |xx|)) |y|
                                     (QREFELT $ 19))
                                    $)
                                   . #4#)
                             (EXIT
                              (COND
                               ((NULL |xx|)
                                (PROGN
                                 (LETT #1# |$NoValue| . #4#)
                                 (GO #5#))))))
                            NIL (GO G190) G191 (EXIT NIL)))
                      #5# (EXIT #1#))
                     (EXIT (|NSUP;per| |xx| $)))))))))))) 

(SDEFUN |NSUP;lazyPseudoDivide;2$R;9|
        ((|x| $) (|y| $)
         ($ |Record| (|:| |coef| R) (|:| |gap| (|NonNegativeInteger|))
          (|:| |quotient| $) (|:| |remainder| $)))
        (SPROG
         ((#1=#:G208 NIL) (|pow| (|NonNegativeInteger|)) (#2=#:G197 NIL)
          (|xx|
           #3=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|qq|
           (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) #4="failed")) (|co| (R))
          (|e| (|NonNegativeInteger|)) (|yy| #3#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT $ 12))
            (|error| "in lazyPseudoDivide$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT $ 13))
            (|error| "in lazyPseudoDivide$NSUP: ground? #2"))
           ('T
            (SEQ
             (LETT |yy| (|NSUP;rep| |y| $)
                   . #5=(|NSUP;lazyPseudoDivide;2$R;9|))
             (LETT |e| (QCAR (|SPADfirst| |yy|)) . #5#)
             (LETT |xx| (|NSUP;rep| |x| $) . #5#)
             (LETT |co| (QCDR (|SPADfirst| |yy|)) . #5#)
             (COND
              ((OR (NULL |xx|) (< (QCAR (|SPADfirst| |xx|)) |e|))
               (EXIT (VECTOR |co| 0 (|spadConstant| $ 21) |x|))))
             (LETT |pow|
                   (+
                    (PROG2
                        (LETT #2#
                              (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                        (QREFELT $ 18))
                              . #5#)
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                      (|Union| (|NonNegativeInteger|) #4#)
                                      #2#))
                    1)
                   . #5#)
             (LETT |qq| NIL . #5#) (LETT |y| (|NSUP;per| (CDR |yy|) $) . #5#)
             (SEQ
              (EXIT
               (SEQ G190 NIL
                    (SEQ
                     (SEQ
                      (LETT |u|
                            (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                      (QREFELT $ 18))
                            . #5#)
                      (EXIT
                       (COND
                        ((QEQCAR |u| 1)
                         (PROGN (LETT #1# |$NoValue| . #5#) (GO #6=#:G201))))))
                     (LETT |qq|
                           (CONS (CONS (QCDR |u|) (QCDR (|SPADfirst| |xx|)))
                                 (|NSUP;rep|
                                  (SPADCALL |co| (|NSUP;per| |qq| $)
                                            (QREFELT $ 23))
                                  $))
                           . #5#)
                     (LETT |xx|
                           (|NSUP;rep|
                            (SPADCALL
                             (SPADCALL |co| (|NSUP;per| (CDR |xx|) $)
                                       (QREFELT $ 23))
                             (QCDR |u|) (QCDR (|SPADfirst| |xx|)) |y|
                             (QREFELT $ 19))
                            $)
                           . #5#)
                     (LETT |pow|
                           (PROG2
                               (LETT #2# (SPADCALL |pow| 1 (QREFELT $ 18))
                                     . #5#)
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0)
                                             (|NonNegativeInteger|)
                                             (|Union| (|NonNegativeInteger|)
                                                      #4#)
                                             #2#))
                           . #5#)
                     (EXIT
                      (COND
                       ((NULL |xx|)
                        (PROGN (LETT #1# |$NoValue| . #5#) (GO #6#))))))
                    NIL (GO G190) G191 (EXIT NIL)))
              #6# (EXIT #1#))
             (EXIT
              (VECTOR |co| |pow| (|NSUP;per| (REVERSE |qq|) $)
                      (|NSUP;per| |xx| $))))))))) 

(SDEFUN |NSUP;lazyPseudoQuotient;3$;10| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((#1=#:G222 NIL)
          (|xx|
           #2=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|qq|
           (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed")) (|co| (R))
          (|e| (|NonNegativeInteger|)) (|yy| #2#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT $ 12))
            (|error| "in lazyPseudoQuotient$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT $ 13))
            (|error| "in lazyPseudoQuotient$NSUP: ground? #2"))
           ('T
            (SEQ
             (LETT |yy| (|NSUP;rep| |y| $)
                   . #3=(|NSUP;lazyPseudoQuotient;3$;10|))
             (LETT |e| (QCAR (|SPADfirst| |yy|)) . #3#)
             (LETT |xx| (|NSUP;rep| |x| $) . #3#)
             (COND
              ((OR (NULL |xx|) (< (QCAR (|SPADfirst| |xx|)) |e|))
               (EXIT (|spadConstant| $ 21))))
             (LETT |qq| NIL . #3#) (LETT |co| (QCDR (|SPADfirst| |yy|)) . #3#)
             (LETT |y| (|NSUP;per| (CDR |yy|) $) . #3#)
             (SEQ
              (EXIT
               (SEQ G190 NIL
                    (SEQ
                     (SEQ
                      (LETT |u|
                            (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                      (QREFELT $ 18))
                            . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |u| 1)
                         (PROGN (LETT #1# |$NoValue| . #3#) (GO #4=#:G216))))))
                     (LETT |qq|
                           (CONS (CONS (QCDR |u|) (QCDR (|SPADfirst| |xx|)))
                                 (|NSUP;rep|
                                  (SPADCALL |co| (|NSUP;per| |qq| $)
                                            (QREFELT $ 23))
                                  $))
                           . #3#)
                     (LETT |xx|
                           (|NSUP;rep|
                            (SPADCALL
                             (SPADCALL |co| (|NSUP;per| (CDR |xx|) $)
                                       (QREFELT $ 23))
                             (QCDR |u|) (QCDR (|SPADfirst| |xx|)) |y|
                             (QREFELT $ 19))
                            $)
                           . #3#)
                     (EXIT
                      (COND
                       ((NULL |xx|)
                        (PROGN (LETT #1# |$NoValue| . #3#) (GO #4#))))))
                    NIL (GO G190) G191 (EXIT NIL)))
              #4# (EXIT #1#))
             (EXIT (|NSUP;per| (REVERSE |qq|) $)))))))) 

(SDEFUN |NSUP;subResultantGcd;3$;11| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 34))) 

(SDEFUN |NSUP;subResultantsChain;2$L;12| ((|p1| $) (|p2| $) ($ |List| $))
        (SPADCALL |p1| |p2| (QREFELT $ 37))) 

(SDEFUN |NSUP;lastSubResultant;3$;13| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 40))) 

(SDEFUN |NSUP;resultant;2$R;14| ((|p1| $) (|p2| $) ($ R))
        (SPADCALL |p1| |p2| (QREFELT $ 42))) 

(SDEFUN |NSUP;extendedResultant;2$R;15|
        ((|p1| $) (|p2| $)
         ($ |Record| (|:| |resultant| R) (|:| |coef1| $) (|:| |coef2| $)))
        (SPROG
         ((|re|
           (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |resultant| R))))
         (SEQ
          (LETT |re| (SPADCALL |p1| |p2| (QREFELT $ 45))
                |NSUP;extendedResultant;2$R;15|)
          (EXIT (VECTOR (QVELT |re| 2) (QVELT |re| 0) (QVELT |re| 1)))))) 

(SDEFUN |NSUP;halfExtendedResultant1;2$R;16|
        ((|p1| $) (|p2| $) ($ |Record| (|:| |resultant| R) (|:| |coef1| $)))
        (SPROG ((|re| (|Record| (|:| |coef1| $) (|:| |resultant| R))))
               (SEQ
                (LETT |re| (SPADCALL |p1| |p2| (QREFELT $ 49))
                      |NSUP;halfExtendedResultant1;2$R;16|)
                (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(SDEFUN |NSUP;halfExtendedResultant2;2$R;17|
        ((|p1| $) (|p2| $) ($ |Record| (|:| |resultant| R) (|:| |coef2| $)))
        (SPROG ((|re| (|Record| (|:| |coef2| $) (|:| |resultant| R))))
               (SEQ
                (LETT |re| (SPADCALL |p1| |p2| (QREFELT $ 53))
                      |NSUP;halfExtendedResultant2;2$R;17|)
                (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(SDEFUN |NSUP;extendedSubResultantGcd;2$R;18|
        ((|p1| $) (|p2| $)
         ($ |Record| (|:| |gcd| $) (|:| |coef1| $) (|:| |coef2| $)))
        (SPROG
         ((|re| (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |gcd| $))))
         (SEQ
          (LETT |re| (SPADCALL |p1| |p2| (QREFELT $ 57))
                |NSUP;extendedSubResultantGcd;2$R;18|)
          (EXIT (VECTOR (QVELT |re| 2) (QVELT |re| 0) (QVELT |re| 1)))))) 

(SDEFUN |NSUP;halfExtendedSubResultantGcd1;2$R;19|
        ((|p1| $) (|p2| $) ($ |Record| (|:| |gcd| $) (|:| |coef1| $)))
        (SPROG ((|re| (|Record| (|:| |coef1| $) (|:| |gcd| $))))
               (SEQ
                (LETT |re| (SPADCALL |p1| |p2| (QREFELT $ 61))
                      |NSUP;halfExtendedSubResultantGcd1;2$R;19|)
                (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(SDEFUN |NSUP;halfExtendedSubResultantGcd2;2$R;20|
        ((|p1| $) (|p2| $) ($ |Record| (|:| |gcd| $) (|:| |coef2| $)))
        (SPROG ((|re| (|Record| (|:| |coef2| $) (|:| |gcd| $))))
               (SEQ
                (LETT |re| (SPADCALL |p1| |p2| (QREFELT $ 65))
                      |NSUP;halfExtendedSubResultantGcd2;2$R;20|)
                (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(SDEFUN |NSUP;pseudoDivide;2$R;21|
        ((|x| $) (|y| $)
         ($ |Record| (|:| |coef| R) (|:| |quotient| . #1=($))
          (|:| |remainder| . #1#)))
        (SPROG
         ((|q| ($)) (|default| (R)) (#2=#:G274 NIL)
          (|pow| (|NonNegativeInteger|)) (#3=#:G261 NIL)
          (|xx|
           #4=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|qq|
           (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) #5="failed")) (|co| (R))
          (|e| (|NonNegativeInteger|)) (|yy| #4#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT $ 12))
            (|error| "in pseudoDivide$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT $ 13))
            (|error| "in pseudoDivide$NSUP: ground? #2"))
           (#6='T
            (SEQ
             (LETT |yy| (|NSUP;rep| |y| $) . #7=(|NSUP;pseudoDivide;2$R;21|))
             (LETT |e| (QCAR (|SPADfirst| |yy|)) . #7#)
             (LETT |xx| (|NSUP;rep| |x| $) . #7#)
             (LETT |co| (QCDR (|SPADfirst| |yy|)) . #7#)
             (COND
              ((OR (NULL |xx|) (< (QCAR (|SPADfirst| |xx|)) |e|))
               (EXIT (VECTOR |co| (|spadConstant| $ 21) |x|))))
             (LETT |pow|
                   (+
                    (PROG2
                        (LETT #3#
                              (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                        (QREFELT $ 18))
                              . #7#)
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0) (|NonNegativeInteger|)
                                      (|Union| (|NonNegativeInteger|) #5#)
                                      #3#))
                    1)
                   . #7#)
             (LETT |qq| NIL . #7#) (LETT |y| (|NSUP;per| (CDR |yy|) $) . #7#)
             (SEQ
              (EXIT
               (SEQ G190 NIL
                    (SEQ
                     (SEQ
                      (LETT |u|
                            (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                      (QREFELT $ 18))
                            . #7#)
                      (EXIT
                       (COND
                        ((QEQCAR |u| 1)
                         (PROGN (LETT #2# |$NoValue| . #7#) (GO #8=#:G265))))))
                     (LETT |qq|
                           (CONS (CONS (QCDR |u|) (QCDR (|SPADfirst| |xx|)))
                                 (|NSUP;rep|
                                  (SPADCALL |co| (|NSUP;per| |qq| $)
                                            (QREFELT $ 23))
                                  $))
                           . #7#)
                     (LETT |xx|
                           (|NSUP;rep|
                            (SPADCALL
                             (SPADCALL |co| (|NSUP;per| (CDR |xx|) $)
                                       (QREFELT $ 23))
                             (QCDR |u|) (QCDR (|SPADfirst| |xx|)) |y|
                             (QREFELT $ 19))
                            $)
                           . #7#)
                     (LETT |pow|
                           (PROG2
                               (LETT #3# (SPADCALL |pow| 1 (QREFELT $ 18))
                                     . #7#)
                               (QCDR #3#)
                             (|check_union2| (QEQCAR #3# 0)
                                             (|NonNegativeInteger|)
                                             (|Union| (|NonNegativeInteger|)
                                                      #5#)
                                             #3#))
                           . #7#)
                     (EXIT
                      (COND
                       ((NULL |xx|)
                        (PROGN (LETT #2# |$NoValue| . #7#) (GO #8#))))))
                    NIL (GO G190) G191 (EXIT NIL)))
              #8# (EXIT #2#))
             (EXIT
              (COND
               ((ZEROP |pow|)
                (VECTOR |co| (|NSUP;per| (REVERSE |qq|) $)
                        (|NSUP;per| |xx| $)))
               (#6#
                (SEQ
                 (LETT |default| (SPADCALL |co| |pow| (QREFELT $ 68)) . #7#)
                 (LETT |q|
                       (SPADCALL |default| (|NSUP;per| (REVERSE |qq|) $)
                                 (QREFELT $ 23))
                       . #7#)
                 (LETT |x|
                       (SPADCALL |default| (|NSUP;per| |xx| $) (QREFELT $ 23))
                       . #7#)
                 (EXIT (VECTOR |co| |q| |x|)))))))))))) 

(SDEFUN |NSUP;pseudoQuotient;3$;22| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((#1=#:G289 NIL) (|pow| (|NonNegativeInteger|)) (#2=#:G278 NIL)
          (|xx|
           #3=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|qq|
           (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) #4="failed")) (|co| (R))
          (|e| (|NonNegativeInteger|)) (|yy| #3#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT $ 12))
            (|error| "in pseudoDivide$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT $ 13))
            (|error| "in pseudoDivide$NSUP: ground? #2"))
           (#5='T
            (SEQ
             (LETT |yy| (|NSUP;rep| |y| $) . #6=(|NSUP;pseudoQuotient;3$;22|))
             (LETT |e| (QCAR (|SPADfirst| |yy|)) . #6#)
             (LETT |xx| (|NSUP;rep| |x| $) . #6#)
             (COND
              ((OR (NULL |xx|) (< (QCAR (|SPADfirst| |xx|)) |e|))
               (EXIT (|spadConstant| $ 21))))
             (LETT |pow|
                   (+
                    (PROG2
                        (LETT #2#
                              (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                        (QREFELT $ 18))
                              . #6#)
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                      (|Union| (|NonNegativeInteger|) #4#)
                                      #2#))
                    1)
                   . #6#)
             (LETT |qq| NIL . #6#) (LETT |co| (QCDR (|SPADfirst| |yy|)) . #6#)
             (LETT |y| (|NSUP;per| (CDR |yy|) $) . #6#)
             (SEQ
              (EXIT
               (SEQ G190 NIL
                    (SEQ
                     (SEQ
                      (LETT |u|
                            (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                      (QREFELT $ 18))
                            . #6#)
                      (EXIT
                       (COND
                        ((QEQCAR |u| 1)
                         (PROGN (LETT #1# |$NoValue| . #6#) (GO #7=#:G282))))))
                     (LETT |qq|
                           (CONS (CONS (QCDR |u|) (QCDR (|SPADfirst| |xx|)))
                                 (|NSUP;rep|
                                  (SPADCALL |co| (|NSUP;per| |qq| $)
                                            (QREFELT $ 23))
                                  $))
                           . #6#)
                     (LETT |xx|
                           (|NSUP;rep|
                            (SPADCALL
                             (SPADCALL |co| (|NSUP;per| (CDR |xx|) $)
                                       (QREFELT $ 23))
                             (QCDR |u|) (QCDR (|SPADfirst| |xx|)) |y|
                             (QREFELT $ 19))
                            $)
                           . #6#)
                     (LETT |pow|
                           (PROG2
                               (LETT #2# (SPADCALL |pow| 1 (QREFELT $ 18))
                                     . #6#)
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0)
                                             (|NonNegativeInteger|)
                                             (|Union| (|NonNegativeInteger|)
                                                      #4#)
                                             #2#))
                           . #6#)
                     (EXIT
                      (COND
                       ((NULL |xx|)
                        (PROGN (LETT #1# |$NoValue| . #6#) (GO #7#))))))
                    NIL (GO G190) G191 (EXIT NIL)))
              #7# (EXIT #1#))
             (EXIT
              (COND ((ZEROP |pow|) (|NSUP;per| (REVERSE |qq|) $))
                    (#5#
                     (SPADCALL (SPADCALL |co| |pow| (QREFELT $ 68))
                               (|NSUP;per| (REVERSE |qq|) $)
                               (QREFELT $ 23))))))))))) 

(DECLAIM (NOTINLINE |NewSparseUnivariatePolynomial;|)) 

(DEFUN |NewSparseUnivariatePolynomial| (#1=#:G343)
  (SPROG NIL
         (PROG (#2=#:G344)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|NewSparseUnivariatePolynomial|)
                                               '|domainEqualList|)
                    . #3=(|NewSparseUnivariatePolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|NewSparseUnivariatePolynomial;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|NewSparseUnivariatePolynomial|)))))))))) 

(DEFUN |NewSparseUnivariatePolynomial;| (|#1|)
  (SPROG
   ((#1=#:G342 NIL) (|pv$| NIL) (#2=#:G332 NIL) (#3=#:G333 NIL) (#4=#:G334 NIL)
    (#5=#:G335 NIL) (#6=#:G336 NIL) (#7=#:G337 NIL) (#8=#:G338 NIL)
    (#9=#:G339 NIL) (#10=#:G340 NIL) (#11=#:G341 NIL) ($ NIL) (|dv$| NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #12=(|NewSparseUnivariatePolynomial|))
    (LETT |dv$| (LIST '|NewSparseUnivariatePolynomial| DV$1) . #12#)
    (LETT $ (GETREFV 124) . #12#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
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
                                                       '(|LinearlyExplicitRingOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #11#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))
                                              . #12#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #11#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #11#)
                                        (LETT #10#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #12#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #11# #10#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #11# #10#)
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
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #9#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Float|))))
                                              . #12#)
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
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
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
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #11#
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
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         #9#)
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Integer|))))
                                              . #12#)
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
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
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
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #11#
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
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         #8#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|)))))
                                              . #12#)
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
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
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
                                          #11#
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
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|)))))
                                              . #12#)
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
                                                         '(|LinearlyExplicitRingOver|
                                                           (|Integer|)))
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
                                          #11#
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
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         #6#)
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #12#)
                                        (OR #5# (|HasCategory| |#1| '(|Field|))
                                            #11# #10#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|)))
                                        (OR #5# #11# #10#)
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            #11# #10#
                                            (|HasCategory| |#1| '(|Ring|)))
                                        (OR #5#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            #11# #10#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #11#
                                         #10#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #12#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #11#
                                         #10#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #12#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #4# #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #11#
                                         #10#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|))
                                              . #12#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitRingOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #4# #2# #3#
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #5#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #11#
                                         #10#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))))
                    . #12#))
    (|haddProp| |$ConstructorCache| '|NewSparseUnivariatePolynomial|
                (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 70368744177664))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #12#)
     (|augmentPredVector| $ 140737488355328))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 281474976710656))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 562949953421312))
    (AND
     (OR #11#
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 1125899906842624))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 2251799813685248))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 4503599627370496))
    (AND
     (OR (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 9007199254740992))
    (AND
     (OR #4# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 18014398509481984))
    (AND
     (OR #3# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 36028797018963968))
    (AND
     (OR #2# (AND #5# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #10# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 72057594037927936))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 18)
      (PROGN
       (QSETREFV $ 35
                 (CONS (|dispatchFunction| |NSUP;subResultantGcd;3$;11|) $))
       (QSETREFV $ 39
                 (CONS (|dispatchFunction| |NSUP;subResultantsChain;2$L;12|)
                       $))
       (QSETREFV $ 41
                 (CONS (|dispatchFunction| |NSUP;lastSubResultant;3$;13|) $))
       (QSETREFV $ 43 (CONS (|dispatchFunction| |NSUP;resultant;2$R;14|) $))
       (QSETREFV $ 47
                 (CONS (|dispatchFunction| |NSUP;extendedResultant;2$R;15|) $))
       (QSETREFV $ 51
                 (CONS
                  (|dispatchFunction| |NSUP;halfExtendedResultant1;2$R;16|) $))
       (QSETREFV $ 55
                 (CONS
                  (|dispatchFunction| |NSUP;halfExtendedResultant2;2$R;17|) $))
       (QSETREFV $ 59
                 (CONS
                  (|dispatchFunction| |NSUP;extendedSubResultantGcd;2$R;18|)
                  $))
       (QSETREFV $ 63
                 (CONS
                  (|dispatchFunction|
                   |NSUP;halfExtendedSubResultantGcd1;2$R;19|)
                  $))
       (QSETREFV $ 67
                 (CONS
                  (|dispatchFunction|
                   |NSUP;halfExtendedSubResultantGcd2;2$R;20|)
                  $))
       (QSETREFV $ 70 (CONS (|dispatchFunction| |NSUP;pseudoDivide;2$R;21|) $))
       (QSETREFV $ 71
                 (CONS (|dispatchFunction| |NSUP;pseudoQuotient;3$;22|) $)))))
    $))) 

(MAKEPROP '|NewSparseUnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 6)
              (|local| |#1|) |NSUP;coerce;$Sup;3| |NSUP;coerce;Sup$;4|
              (|Union| 5 '"failed") |NSUP;retractIfCan;$U;5| (|Boolean|)
              (0 . |zero?|) (5 . |ground?|) (10 . |One|) (14 . =)
              (|Union| $ '"failed") (|NonNegativeInteger|)
              (20 . |subtractIfCan|) (26 . |fmecg|) |NSUP;monicModulo;3$;6|
              (34 . |Zero|) (38 . |Zero|) (42 . *) (48 . |One|)
              (|Record| (|:| |polnum| $) (|:| |polden| 6) (|:| |power| 17))
              |NSUP;lazyResidueClass;2$R;7| (52 . -) (57 . -)
              |NSUP;lazyPseudoRemainder;3$;8|
              (|Record| (|:| |coef| 6) (|:| |gap| 17) (|:| |quotient| $)
                        (|:| |remainder| $))
              |NSUP;lazyPseudoDivide;2$R;9| |NSUP;lazyPseudoQuotient;3$;10|
              (|PseudoRemainderSequence| 6 $$) (62 . |subResultantGcd|)
              (68 . |subResultantGcd|) (|List| $$) (74 . |chainSubResultants|)
              (|List| $) (80 . |subResultantsChain|) (86 . |lastSubResultant|)
              (92 . |lastSubResultant|) (98 . |resultant|) (104 . |resultant|)
              (|Record| (|:| |coef1| $$) (|:| |coef2| $$) (|:| |resultant| 6))
              (110 . |resultantEuclidean|)
              (|Record| (|:| |resultant| 6) (|:| |coef1| $) (|:| |coef2| $))
              (116 . |extendedResultant|)
              (|Record| (|:| |coef1| $$) (|:| |resultant| 6))
              (122 . |semiResultantEuclidean1|)
              (|Record| (|:| |resultant| 6) (|:| |coef1| $))
              (128 . |halfExtendedResultant1|)
              (|Record| (|:| |coef2| $$) (|:| |resultant| 6))
              (134 . |semiResultantEuclidean2|)
              (|Record| (|:| |resultant| 6) (|:| |coef2| $))
              (140 . |halfExtendedResultant2|)
              (|Record| (|:| |coef1| $$) (|:| |coef2| $$) (|:| |gcd| $$))
              (146 . |subResultantGcdEuclidean|)
              (|Record| (|:| |gcd| $) (|:| |coef1| $) (|:| |coef2| $))
              (152 . |extendedSubResultantGcd|)
              (|Record| (|:| |coef1| $$) (|:| |gcd| $$))
              (158 . |semiSubResultantGcdEuclidean1|)
              (|Record| (|:| |gcd| $) (|:| |coef1| $))
              (164 . |halfExtendedSubResultantGcd1|)
              (|Record| (|:| |coef2| $$) (|:| |gcd| $$))
              (170 . |semiSubResultantGcdEuclidean2|)
              (|Record| (|:| |gcd| $) (|:| |coef2| $))
              (176 . |halfExtendedSubResultantGcd2|) (182 . ^)
              (|Record| (|:| |coef| 6) (|:| |quotient| $) (|:| |remainder| $))
              (188 . |pseudoDivide|) (194 . |pseudoQuotient|)
              (|Union| 79 '#1="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 85) (|Matrix| 85)
              (|Record| (|:| |mat| 77) (|:| |vec| (|Vector| 85))) (|Vector| $)
              (|List| 82) (|List| 17) (|Symbol|)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 85 $)
              (|Integer|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 85) (|SingletonAsOrderedSet|)
              (|Record| (|:| |coef| 38) (|:| |generator| $))
              (|Union| 38 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 93 '"failed")
              (|Fraction| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (|Factored| $) (|Union| 95 '"failed") (|Factored| 97)
              (|Union| 103 '#1#) (|List| 97) (|Union| 87 '#2="failed")
              (|Union| 85 '#2#) (|Mapping| 6 6) (|List| 88) (|Matrix| 6)
              (|Record| (|:| |mat| 108) (|:| |vec| 115)) (|Union| 88 '#2#)
              (|List| 112) (|Equation| $)
              (|Record| (|:| |var| 88) (|:| |exponent| 17))
              (|Union| 113 '"failed") (|Vector| 6) (|List| 6) (|Mapping| 17 17)
              (|Union| 6 '#2#) (|PositiveInteger|) (|HashState|) (|String|)
              (|OutputForm|) (|SingleInteger|))
           '#(~= 200 |zero?| 206 |vectorise| 211 |variables| 217 |unvectorise|
              222 |unmakeSUP| 227 |univariate| 232 |unitNormal| 243
              |unitCanonical| 248 |unit?| 253 |totalDegreeSorted| 258
              |totalDegree| 264 |subtractIfCan| 275 |subResultantsChain| 281
              |subResultantGcd| 287 |squareFreePolynomial| 293 |squareFreePart|
              298 |squareFree| 303 |solveLinearPolynomialEquation| 308
              |smaller?| 314 |sizeLess?| 320 |shiftRight| 326 |shiftLeft| 332
              |separate| 338 |sample| 344 |retractIfCan| 348 |retract| 373
              |resultant| 398 |rem| 411 |reductum| 417 |reducedSystem| 422
              |recip| 444 |quo| 449 |pseudoRemainder| 455 |pseudoQuotient| 461
              |pseudoDivide| 467 |principalIdeal| 473 |primitivePart| 478
              |primitiveMonomials| 489 |prime?| 494 |pomopo!| 499
              |patternMatch| 507 |order| 521 |opposite?| 527 |one?| 533
              |numberOfMonomials| 538 |nextItem| 543 |multivariate| 548
              |multiplyExponents| 560 |multiEuclidean| 566 |monomials| 572
              |monomial?| 577 |monomial| 582 |monicModulo| 602 |monicDivide|
              608 |minimumDegree| 621 |mapExponents| 638 |map| 644 |makeSUP|
              650 |mainVariable| 655 |leadingMonomial| 660 |leadingCoefficient|
              665 |lcmCoef| 670 |lcm| 676 |lazyResidueClass| 687
              |lazyPseudoRemainder| 693 |lazyPseudoQuotient| 699
              |lazyPseudoDivide| 705 |latex| 711 |lastSubResultant| 716
              |karatsubaDivide| 722 |isTimes| 728 |isPlus| 733 |isExpt| 738
              |integrate| 743 |init| 748 |hashUpdate!| 752 |hash| 758
              |halfExtendedSubResultantGcd2| 763 |halfExtendedSubResultantGcd1|
              769 |halfExtendedResultant2| 775 |halfExtendedResultant1| 781
              |ground?| 787 |ground| 792 |gcdPolynomial| 797 |gcd| 803 |fmecg|
              814 |factorSquareFreePolynomial| 822 |factorPolynomial| 827
              |factor| 832 |extendedSubResultantGcd| 837 |extendedResultant|
              843 |extendedEuclidean| 849 |exquo| 862 |expressIdealMember| 874
              |eval| 880 |euclideanSize| 934 |elt| 939 |divideExponents| 969
              |divide| 975 |discriminant| 981 |differentiate| 992 |degree| 1075
              |convert| 1092 |content| 1107 |conditionP| 1118 |composite| 1123
              |coerce| 1135 |coefficients| 1175 |coefficient| 1180 |charthRoot|
              1200 |characteristic| 1205 |binomThmExpt| 1209 |associates?| 1216
              |annihilate?| 1222 ^ 1228 |Zero| 1240 |One| 1244 D 1248 = 1324 /
              1330 - 1336 + 1347 * 1353)
           'NIL
           (CONS
            (|makeByteWordVec2| 46
                                '(0 0 0 10 13 0 10 13 0 16 19 1 34 4 20 15 4 1
                                  2 3 34 4 9 4 34 20 17 22 4 0 1 38 39 0 0 1 1
                                  35 37 39 42 12 44 0 12 46 0 0 8 26 28 21 0 0
                                  12 0 0 0 0 0 0 0 0 0 0 4 5 6 7 30 32 11 12 12
                                  13 36 14 18))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| NIL |Algebra&| |Algebra&|
                |FullyLinearlyExplicitRingOver&| |Algebra&| NIL
                |DifferentialExtension&| |Module&| NIL NIL |Module&| NIL NIL
                |PartialDifferentialRing&| NIL |Module&| |EntireRing&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL NIL
                |Ring&| NIL NIL NIL NIL NIL NIL |Rng&| |AbelianGroup&| NIL NIL
                NIL |Monoid&| |AbelianMonoid&| |AbelianSemiGroup&| |SemiGroup&|
                NIL NIL NIL NIL |FullyRetractableTo&| |SetCategory&|
                |Evalable&| |RetractableTo&| NIL NIL NIL NIL |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| |BasicType&| NIL NIL
                |RetractableTo&| |RetractableTo&| NIL NIL NIL NIL
                |InnerEvalable&| |RetractableTo&| NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 6)
                 (|PolynomialCategory| 6 17 88)
                 (|MaybeSkewPolynomialCategory| 6 17 88)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 6 17) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 6 17)
                 (|GcdDomain|) (|IntegralDomain|) (|Algebra| 87) (|Algebra| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| $$)
                 (|LeftOreRing|) (|DifferentialExtension| 6) (|Module| 87)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|LinearlyExplicitRingOver| 6) (|LinearlyExplicitRingOver| 85)
                 (|PartialDifferentialRing| 88) (|CommutativeRing|)
                 (|Module| $$) (|EntireRing|) (|PartialDifferentialRing| 82)
                 (|DifferentialRing|) (|BiModule| 6 6) (|BiModule| 87 87)
                 (|BiModule| $$ $$) (|Ring|) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| 87) (|RightModule| 87) (|RightModule| $$)
                 (|LeftModule| $$) (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiRng|) (|Monoid|)
                 (|AbelianMonoid|) (|AbelianSemiGroup|) (|SemiGroup|)
                 (|Comparable|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 85) (|StepThrough|)
                 (|FullyRetractableTo| 6) (|SetCategory|) (|Evalable| $$)
                 (|RetractableTo| (|SparseUnivariatePolynomial| 6))
                 (|CoercibleTo| (|SparseUnivariatePolynomial| 6))
                 (|Eltable| $$ $$) (|Eltable| 6 6)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 88 $$)
                 (|InnerEvalable| 88 6) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 122) (|unitsKnown|) (|RetractableTo| 87)
                 (|RetractableTo| 85) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 75) (|ConvertibleTo| 76) (|ConvertibleTo| 74)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 88)
                 (|additiveValuation|) (|CommutativeStar|) (|noZeroDivisors|)
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
                                    62 0 0 63 2 33 64 2 2 65 2 0 66 0 0 67 2 6
                                    0 0 17 68 2 0 69 0 0 70 2 0 0 0 0 71 2 0 11
                                    0 0 1 1 57 11 0 12 2 0 115 0 17 1 1 0 107 0
                                    1 1 0 0 115 1 1 0 0 5 1 1 0 5 0 1 2 0 97 0
                                    88 1 1 50 86 0 1 1 50 0 0 1 1 50 11 0 1 2 0
                                    17 0 107 1 2 0 17 0 107 1 1 0 17 0 1 2 56
                                    16 0 0 1 2 18 38 0 0 39 2 18 0 0 0 35 1 10
                                    101 97 1 1 15 0 0 1 1 15 99 0 1 2 10 102
                                    103 97 1 2 8 11 0 0 1 2 13 11 0 0 1 2 4 0 0
                                    17 1 2 0 0 0 17 1 2 15 98 0 0 1 0 57 0 1 1
                                    5 104 0 1 1 6 105 0 1 1 12 110 0 1 1 0 9 0
                                    10 1 0 118 0 1 1 5 87 0 1 1 6 85 0 1 1 12
                                    88 0 1 1 0 5 0 1 1 0 6 0 1 2 33 6 0 0 43 3
                                    33 0 0 0 88 1 2 13 0 0 0 1 1 0 0 0 1 1 24
                                    77 73 1 2 24 78 73 79 1 1 4 108 73 1 2 4
                                    109 73 79 1 1 53 16 0 1 2 13 0 0 0 1 2 4 0
                                    0 0 1 2 18 0 0 0 71 2 18 69 0 0 70 1 13 89
                                    38 1 2 15 0 0 88 1 1 15 0 0 1 1 12 38 0 1 1
                                    10 11 0 1 4 0 0 0 6 17 0 1 3 25 83 0 75 83
                                    1 3 27 84 0 76 84 1 2 18 17 0 0 1 2 57 11 0
                                    0 1 1 53 11 0 1 1 0 17 0 1 1 21 16 0 1 2 0
                                    0 5 88 1 2 0 0 97 88 1 2 0 0 0 17 1 2 13 90
                                    38 0 1 1 0 38 0 1 1 0 11 0 1 3 0 0 0 107 81
                                    1 3 0 0 0 88 17 1 2 0 0 6 17 1 2 0 0 0 0 20
                                    2 4 91 0 0 1 3 4 91 0 0 88 1 2 0 81 0 107 1
                                    2 0 17 0 88 1 1 0 17 0 1 2 0 0 117 0 1 2 0
                                    0 106 0 1 1 0 5 0 1 1 0 110 0 1 1 0 0 0 1 1
                                    0 6 0 1 2 15 96 0 0 1 1 15 0 38 1 2 15 0 0
                                    0 1 2 0 25 0 0 26 2 0 0 0 0 29 2 0 0 0 0 32
                                    2 0 30 0 0 31 1 0 121 0 1 2 18 0 0 0 41 2 4
                                    91 0 17 1 1 12 90 0 1 1 0 90 0 1 1 12 114 0
                                    1 1 1 0 0 1 0 21 0 1 2 0 120 120 0 1 1 0
                                    123 0 1 2 18 66 0 0 67 2 18 62 0 0 63 2 18
                                    54 0 0 55 2 18 50 0 0 51 1 0 11 0 13 1 0 6
                                    0 1 2 15 97 97 97 1 1 15 0 38 1 2 15 0 0 0
                                    1 4 4 0 0 17 6 0 19 1 10 101 97 1 1 10 101
                                    97 1 1 10 99 0 1 2 18 58 0 0 59 2 18 46 0 0
                                    47 2 13 92 0 0 1 3 13 94 0 0 0 1 2 50 16 0
                                    0 1 2 14 16 0 6 1 2 13 90 38 0 1 3 12 0 0
                                    38 38 1 3 12 0 0 0 0 1 2 12 0 0 111 1 2 12
                                    0 0 112 1 3 0 0 0 88 0 1 3 0 0 0 107 38 1 3
                                    0 0 0 107 116 1 3 0 0 0 88 6 1 1 13 17 0 1
                                    2 13 6 95 6 1 2 18 95 0 95 1 2 18 95 95 95
                                    1 2 0 6 0 6 1 2 0 0 0 0 1 2 0 16 0 17 1 2
                                    13 91 0 0 1 1 33 6 0 1 2 33 0 0 88 1 3 40 0
                                    0 80 81 1 2 40 0 0 80 1 3 40 0 0 82 17 1 2
                                    40 0 0 82 1 1 4 0 0 1 2 4 0 0 17 1 3 4 0 0
                                    106 17 1 2 4 0 0 106 1 3 4 0 0 106 0 1 2 4
                                    0 0 88 1 3 4 0 0 88 17 1 2 4 0 0 107 1 3 4
                                    0 0 107 81 1 2 0 81 0 107 1 2 0 17 0 88 1 1
                                    0 17 0 1 1 11 74 0 1 1 29 75 0 1 1 31 76 0
                                    1 2 15 0 0 88 1 1 15 6 0 1 1 48 72 73 1 2
                                    18 16 0 0 1 2 18 100 95 0 1 1 52 0 85 1 1
                                    51 0 0 1 1 23 0 87 1 1 12 0 88 1 1 0 0 5 8
                                    1 0 5 0 7 1 0 0 6 1 1 0 122 0 1 1 0 116 0 1
                                    3 0 0 0 107 81 1 3 0 0 0 88 17 1 2 0 6 0 17
                                    1 1 49 16 0 1 0 54 17 1 3 47 0 0 0 17 1 2
                                    50 11 0 0 1 2 54 11 0 0 1 2 53 0 0 17 1 2 0
                                    0 0 119 1 0 57 0 21 0 53 0 24 3 40 0 0 80
                                    81 1 3 40 0 0 82 17 1 2 40 0 0 82 1 2 40 0
                                    0 80 1 1 4 0 0 1 2 4 0 0 17 1 2 4 0 0 106 1
                                    3 4 0 0 106 17 1 2 4 0 0 107 1 2 4 0 0 88 1
                                    3 4 0 0 107 81 1 3 4 0 0 88 17 1 2 0 11 0 0
                                    1 2 13 0 0 6 1 1 55 0 0 28 2 55 0 0 0 1 2 0
                                    0 0 0 1 2 55 0 85 0 1 2 57 0 17 0 1 2 1 0
                                    87 0 1 2 1 0 0 87 1 2 0 0 6 0 23 2 0 0 0 0
                                    1 2 0 0 0 6 1 2 0 0 119 0 1)))))
           '|lookupComplete|)) 
