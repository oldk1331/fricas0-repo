
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
         ((#1=#:G207 NIL) (|pow| (|NonNegativeInteger|)) (#2=#:G197 NIL)
          (|xx|
           #3=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|qq|
           (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed")) (|co| (R))
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
                   . #4=(|NSUP;lazyPseudoDivide;2$R;9|))
             (LETT |e| (QCAR (|SPADfirst| |yy|)) . #4#)
             (LETT |xx| (|NSUP;rep| |x| $) . #4#)
             (LETT |co| (QCDR (|SPADfirst| |yy|)) . #4#)
             (COND
              ((OR (NULL |xx|) (< (QCAR (|SPADfirst| |xx|)) |e|))
               (EXIT (VECTOR |co| 0 (|spadConstant| $ 21) |x|))))
             (LETT |pow|
                   (+
                    (PROG2
                        (LETT #2#
                              (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                        (QREFELT $ 18))
                              . #4#)
                        (QCDR #2#)
                      (|check_union| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                     #2#))
                    1)
                   . #4#)
             (LETT |qq| NIL . #4#) (LETT |y| (|NSUP;per| (CDR |yy|) $) . #4#)
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
                         (PROGN (LETT #1# |$NoValue| . #4#) (GO #5=#:G201))))))
                     (LETT |qq|
                           (CONS (CONS (QCDR |u|) (QCDR (|SPADfirst| |xx|)))
                                 (|NSUP;rep|
                                  (SPADCALL |co| (|NSUP;per| |qq| $)
                                            (QREFELT $ 23))
                                  $))
                           . #4#)
                     (LETT |xx|
                           (|NSUP;rep|
                            (SPADCALL
                             (SPADCALL |co| (|NSUP;per| (CDR |xx|) $)
                                       (QREFELT $ 23))
                             (QCDR |u|) (QCDR (|SPADfirst| |xx|)) |y|
                             (QREFELT $ 19))
                            $)
                           . #4#)
                     (LETT |pow|
                           (PROG2
                               (LETT #2# (SPADCALL |pow| 1 (QREFELT $ 18))
                                     . #4#)
                               (QCDR #2#)
                             (|check_union| (QEQCAR #2# 0)
                                            (|NonNegativeInteger|) #2#))
                           . #4#)
                     (EXIT
                      (COND
                       ((NULL |xx|)
                        (PROGN (LETT #1# |$NoValue| . #4#) (GO #5#))))))
                    NIL (GO G190) G191 (EXIT NIL)))
              #5# (EXIT #1#))
             (EXIT
              (VECTOR |co| |pow| (|NSUP;per| (REVERSE |qq|) $)
                      (|NSUP;per| |xx| $))))))))) 

(SDEFUN |NSUP;lazyPseudoQuotient;3$;10| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((#1=#:G220 NIL)
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
                         (PROGN (LETT #1# |$NoValue| . #3#) (GO #4=#:G215))))))
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
         ((|q| ($)) (|default| (R)) (#2=#:G270 NIL)
          (|pow| (|NonNegativeInteger|)) (#3=#:G259 NIL)
          (|xx|
           #4=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|qq|
           (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed")) (|co| (R))
          (|e| (|NonNegativeInteger|)) (|yy| #4#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT $ 12))
            (|error| "in pseudoDivide$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT $ 13))
            (|error| "in pseudoDivide$NSUP: ground? #2"))
           (#5='T
            (SEQ
             (LETT |yy| (|NSUP;rep| |y| $) . #6=(|NSUP;pseudoDivide;2$R;21|))
             (LETT |e| (QCAR (|SPADfirst| |yy|)) . #6#)
             (LETT |xx| (|NSUP;rep| |x| $) . #6#)
             (LETT |co| (QCDR (|SPADfirst| |yy|)) . #6#)
             (COND
              ((OR (NULL |xx|) (< (QCAR (|SPADfirst| |xx|)) |e|))
               (EXIT (VECTOR |co| (|spadConstant| $ 21) |x|))))
             (LETT |pow|
                   (+
                    (PROG2
                        (LETT #3#
                              (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                        (QREFELT $ 18))
                              . #6#)
                        (QCDR #3#)
                      (|check_union| (QEQCAR #3# 0) (|NonNegativeInteger|)
                                     #3#))
                    1)
                   . #6#)
             (LETT |qq| NIL . #6#) (LETT |y| (|NSUP;per| (CDR |yy|) $) . #6#)
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
                         (PROGN (LETT #2# |$NoValue| . #6#) (GO #7=#:G263))))))
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
                               (LETT #3# (SPADCALL |pow| 1 (QREFELT $ 18))
                                     . #6#)
                               (QCDR #3#)
                             (|check_union| (QEQCAR #3# 0)
                                            (|NonNegativeInteger|) #3#))
                           . #6#)
                     (EXIT
                      (COND
                       ((NULL |xx|)
                        (PROGN (LETT #2# |$NoValue| . #6#) (GO #7#))))))
                    NIL (GO G190) G191 (EXIT NIL)))
              #7# (EXIT #2#))
             (EXIT
              (COND
               ((ZEROP |pow|)
                (VECTOR |co| (|NSUP;per| (REVERSE |qq|) $)
                        (|NSUP;per| |xx| $)))
               (#5#
                (SEQ
                 (LETT |default| (SPADCALL |co| |pow| (QREFELT $ 68)) . #6#)
                 (LETT |q|
                       (SPADCALL |default| (|NSUP;per| (REVERSE |qq|) $)
                                 (QREFELT $ 23))
                       . #6#)
                 (LETT |x|
                       (SPADCALL |default| (|NSUP;per| |xx| $) (QREFELT $ 23))
                       . #6#)
                 (EXIT (VECTOR |co| |q| |x|)))))))))))) 

(SDEFUN |NSUP;pseudoQuotient;3$;22| ((|x| $) (|y| $) ($ $))
        (SPROG
         ((#1=#:G283 NIL) (|pow| (|NonNegativeInteger|)) (#2=#:G274 NIL)
          (|xx|
           #3=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|qq|
           (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|u| (|Union| (|NonNegativeInteger|) "failed")) (|co| (R))
          (|e| (|NonNegativeInteger|)) (|yy| #3#))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT $ 12))
            (|error| "in pseudoDivide$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT $ 13))
            (|error| "in pseudoDivide$NSUP: ground? #2"))
           (#4='T
            (SEQ
             (LETT |yy| (|NSUP;rep| |y| $) . #5=(|NSUP;pseudoQuotient;3$;22|))
             (LETT |e| (QCAR (|SPADfirst| |yy|)) . #5#)
             (LETT |xx| (|NSUP;rep| |x| $) . #5#)
             (COND
              ((OR (NULL |xx|) (< (QCAR (|SPADfirst| |xx|)) |e|))
               (EXIT (|spadConstant| $ 21))))
             (LETT |pow|
                   (+
                    (PROG2
                        (LETT #2#
                              (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                        (QREFELT $ 18))
                              . #5#)
                        (QCDR #2#)
                      (|check_union| (QEQCAR #2# 0) (|NonNegativeInteger|)
                                     #2#))
                    1)
                   . #5#)
             (LETT |qq| NIL . #5#) (LETT |co| (QCDR (|SPADfirst| |yy|)) . #5#)
             (LETT |y| (|NSUP;per| (CDR |yy|) $) . #5#)
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
                         (PROGN (LETT #1# |$NoValue| . #5#) (GO #6=#:G278))))))
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
                             (|check_union| (QEQCAR #2# 0)
                                            (|NonNegativeInteger|) #2#))
                           . #5#)
                     (EXIT
                      (COND
                       ((NULL |xx|)
                        (PROGN (LETT #1# |$NoValue| . #5#) (GO #6#))))))
                    NIL (GO G190) G191 (EXIT NIL)))
              #6# (EXIT #1#))
             (EXIT
              (COND ((ZEROP |pow|) (|NSUP;per| (REVERSE |qq|) $))
                    (#4#
                     (SPADCALL (SPADCALL |co| |pow| (QREFELT $ 68))
                               (|NSUP;per| (REVERSE |qq|) $)
                               (QREFELT $ 23))))))))))) 

(DECLAIM (NOTINLINE |NewSparseUnivariatePolynomial;|)) 

(DEFUN |NewSparseUnivariatePolynomial| (#1=#:G330)
  (SPROG NIL
         (PROG (#2=#:G331)
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
   ((#1=#:G329 NIL) (|pv$| NIL) (#2=#:G326 NIL) (#3=#:G327 NIL) (#4=#:G328 NIL)
    ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|NewSparseUnivariatePolynomial|))
    (LETT |dv$| (LIST '|NewSparseUnivariatePolynomial| DV$1) . #5#)
    (LETT $ (GETREFV 124) . #5#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PatternMatchable|
                                                          (|Float|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|PatternMatchable| (|Float|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PatternMatchable|
                                                          (|Integer|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|PatternMatchable| (|Integer|))))
                                        (AND
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
                                                           (|Integer|))))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo|
                                            (|Pattern| (|Integer|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
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
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))
                                              . #5#)
                                        (OR (|HasCategory| |#1| '(|Field|)) #4#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #5#)
                                        (OR (|HasCategory| |#1| '(|Field|)) #4#
                                            #3#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #4# #3#)
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
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #5#)
                                        (OR #2# (|HasCategory| |#1| '(|Field|))
                                            #4# #3#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|)))
                                        (OR #2# #4# #3#)
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|EntireRing|))
                                            #4# #3#)))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|NewSparseUnivariatePolynomial|
                (LIST DV$1) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 1073741824))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #5#)
     (|augmentPredVector| $ 2147483648))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 4294967296))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 8589934592))
    (AND
     (OR #4# (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 17179869184))
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|testBitVector| |pv$| 20)
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
              (|Union| 95 '#1="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 104)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 104 $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 104) (|SingletonAsOrderedSet|) (|Union| 38 '"failed")
              (|Record| (|:| |coef| 38) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 85 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Fraction| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SparseUnivariatePolynomial| $)
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (|Factored| $) (|Union| 88 '"failed")
              (|Record| (|:| |mat| 96) (|:| |vec| (|Vector| 104))) (|Vector| $)
              (|Matrix| 104) (|List| 99) (|List| 17) (|Symbol|) (|Factored| 90)
              (|Union| 102 '#1#) (|List| 90) (|Union| 80 '#2="failed")
              (|Integer|) (|Union| 104 '#2#) (|Mapping| 6 6) (|Vector| 6)
              (|Record| (|:| |var| 81) (|:| |exponent| 17))
              (|Union| 108 '"failed") (|List| 81) (|Union| 81 '#2#) (|List| 6)
              (|Equation| $) (|List| 113) (|Union| 6 '#2#) (|Mapping| 17 17)
              (|Record| (|:| |mat| 118) (|:| |vec| 107)) (|Matrix| 6)
              (|PositiveInteger|) (|HashState|) (|String|) (|OutputForm|)
              (|SingleInteger|))
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
            (|makeByteWordVec2| 30
                                '(0 0 0 1 15 0 1 15 0 18 21 0 0 7 27 22 17 0 0
                                  0 7 8 9 27 14 27 22 19 24 0 0 7 30 0 0 0 0 7
                                  7 28 0 0 0 0 0 0 0 0 2 3 13 23 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 4 5 6 10 11 12 15 29 16
                                  20))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| NIL |DifferentialExtension&|
                |FullyLinearlyExplicitRingOver&| |Algebra&| |Algebra&|
                |Algebra&| NIL |PartialDifferentialRing&| |DifferentialRing&|
                NIL |Module&| NIL NIL |Module&| NIL NIL |Module&| |EntireRing&|
                |PartialDifferentialRing&| |Ring&| NIL NIL NIL |Rng&| NIL NIL
                NIL NIL NIL NIL |AbelianGroup&| NIL NIL |AbelianMonoid&|
                |Monoid&| NIL |SemiGroup&| |AbelianSemiGroup&| NIL NIL NIL NIL
                |Evalable&| |FullyRetractableTo&| |SetCategory&|
                |RetractableTo&| NIL NIL NIL NIL |RetractableTo&|
                |InnerEvalable&| |InnerEvalable&| |InnerEvalable&|
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL NIL
                |RetractableTo&| |RetractableTo&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 6)
                 (|PolynomialCategory| 6 17 81)
                 (|MaybeSkewPolynomialCategory| 6 17 81)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 6 17) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 6 17)
                 (|GcdDomain|) (|IntegralDomain|) (|DifferentialExtension| 6)
                 (|FullyLinearlyExplicitRingOver| 6) (|Algebra| 80)
                 (|Algebra| 6) (|Algebra| $$) (|LeftOreRing|)
                 (|PartialDifferentialRing| 81) (|DifferentialRing|)
                 (|LinearlyExplicitRingOver| 6) (|Module| 80)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Module| 6)
                 (|LinearlyExplicitRingOver| 104) (|CommutativeRing|)
                 (|Module| $$) (|EntireRing|) (|PartialDifferentialRing| 99)
                 (|Ring|) (|BiModule| 6 6) (|BiModule| 80 80)
                 (|BiModule| $$ $$) (|Rng|) (|LeftModule| 6) (|RightModule| 6)
                 (|LeftModule| $$) (|LeftModule| 80) (|RightModule| 80)
                 (|RightModule| $$) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|AbelianMonoid|)
                 (|Monoid|) (|SemiRng|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 104)
                 (|Comparable|) (|StepThrough|) (|Evalable| $$)
                 (|FullyRetractableTo| 6) (|SetCategory|)
                 (|RetractableTo| (|SparseUnivariatePolynomial| 6))
                 (|CoercibleTo| (|SparseUnivariatePolynomial| 6))
                 (|Eltable| $$ $$) (|Eltable| 6 6)
                 (|VariablesCommuteWithCoefficients|) (|RetractableTo| 81)
                 (|InnerEvalable| 81 $$) (|InnerEvalable| 81 6)
                 (|InnerEvalable| $$ $$) (|RetractableTo| 6) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 122) (|ConvertibleTo| 75)
                 (|ConvertibleTo| 76) (|ConvertibleTo| 74) (|RetractableTo| 80)
                 (|RetractableTo| 104) (|canonicalUnitNormal|)
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
                                    0 0 1 1 0 11 0 12 2 0 107 0 17 1 1 0 110 0
                                    1 1 0 0 107 1 1 0 0 5 1 1 0 5 0 1 2 0 90 0
                                    81 1 1 34 79 0 1 1 34 0 0 1 1 34 11 0 1 2 0
                                    17 0 110 1 1 0 17 0 1 2 0 17 0 110 1 2 0 16
                                    0 0 1 2 20 38 0 0 39 2 20 0 0 0 35 1 1 100
                                    90 1 1 17 0 0 1 1 17 92 0 1 2 1 101 102 90
                                    1 2 13 11 0 0 1 2 15 11 0 0 1 2 0 0 0 17 1
                                    2 0 0 0 17 1 2 17 91 0 0 1 0 0 0 1 1 10 103
                                    0 1 1 11 105 0 1 1 0 9 0 10 1 0 111 0 1 1 0
                                    115 0 1 1 10 80 0 1 1 11 104 0 1 1 0 5 0 1
                                    1 0 81 0 1 1 0 6 0 1 2 26 6 0 0 43 3 26 0 0
                                    0 81 1 2 15 0 0 0 1 1 0 0 0 1 2 14 94 73 95
                                    1 1 14 96 73 1 2 0 117 73 95 1 1 0 118 73 1
                                    1 0 16 0 1 2 15 0 0 0 1 2 0 0 0 0 1 2 20 0
                                    0 0 71 2 20 69 0 0 70 1 15 83 38 1 2 17 0 0
                                    81 1 1 17 0 0 1 1 0 38 0 1 1 1 11 0 1 4 0 0
                                    0 6 17 0 1 3 2 77 0 75 77 1 3 3 78 0 76 78
                                    1 2 20 17 0 0 1 2 0 11 0 0 1 1 0 11 0 1 1 0
                                    17 0 1 1 23 16 0 1 2 0 0 90 81 1 2 0 0 5 81
                                    1 2 0 0 0 17 1 2 15 82 38 0 1 1 0 38 0 1 1
                                    0 11 0 1 2 0 0 6 17 1 3 0 0 0 110 98 1 3 0
                                    0 0 81 17 1 2 0 0 0 0 20 2 0 84 0 0 1 3 0
                                    84 0 0 81 1 2 0 98 0 110 1 2 0 17 0 81 1 1
                                    0 17 0 1 2 0 0 116 0 1 2 0 0 106 0 1 1 0 5
                                    0 1 1 0 111 0 1 1 0 0 0 1 1 0 6 0 1 2 17 89
                                    0 0 1 1 17 0 38 1 2 17 0 0 0 1 2 0 25 0 0
                                    26 2 0 0 0 0 29 2 0 0 0 0 32 2 0 30 0 0 31
                                    1 0 121 0 1 2 20 0 0 0 41 2 0 84 0 17 1 1 0
                                    82 0 1 1 0 82 0 1 1 0 109 0 1 1 7 0 0 1 0
                                    23 0 1 2 0 120 120 0 1 1 0 123 0 1 2 20 66
                                    0 0 67 2 20 62 0 0 63 2 20 54 0 0 55 2 20
                                    50 0 0 51 1 0 11 0 13 1 0 6 0 1 2 17 90 90
                                    90 1 2 17 0 0 0 1 1 17 0 38 1 4 0 0 0 17 6
                                    0 19 1 1 100 90 1 1 1 100 90 1 1 1 92 0 1 2
                                    20 58 0 0 59 2 20 46 0 0 47 3 15 86 0 0 0 1
                                    2 15 87 0 0 1 2 34 16 0 0 1 2 16 16 0 6 1 2
                                    15 82 38 0 1 3 0 0 0 110 38 1 3 0 0 0 110
                                    112 1 3 0 0 0 81 0 1 3 0 0 0 81 6 1 3 0 0 0
                                    0 0 1 3 0 0 0 38 38 1 2 0 0 0 113 1 2 0 0 0
                                    114 1 1 15 17 0 1 2 15 6 88 6 1 2 20 88 0
                                    88 1 2 20 88 88 88 1 2 0 0 0 0 1 2 0 6 0 6
                                    1 2 0 16 0 17 1 2 15 84 0 0 1 1 26 6 0 1 2
                                    26 0 0 81 1 3 24 0 0 97 98 1 2 24 0 0 97 1
                                    3 24 0 0 99 17 1 2 24 0 0 99 1 3 0 0 0 106
                                    0 1 2 0 0 0 106 1 3 0 0 0 106 17 1 1 0 0 0
                                    1 2 0 0 0 17 1 3 0 0 0 110 98 1 2 0 0 0 110
                                    1 3 0 0 0 81 17 1 2 0 0 0 81 1 1 0 17 0 1 2
                                    0 17 0 81 1 2 0 98 0 110 1 1 6 74 0 1 1 4
                                    75 0 1 1 5 76 0 1 2 17 0 0 81 1 1 17 6 0 1
                                    1 32 72 73 1 2 20 16 0 0 1 2 20 93 88 0 1 1
                                    35 0 0 1 1 25 0 80 1 1 0 0 5 8 1 0 5 0 7 1
                                    0 0 81 1 1 0 0 6 1 1 0 0 104 1 1 0 122 0 1
                                    1 0 112 0 1 2 0 6 0 17 1 3 0 0 0 110 98 1 3
                                    0 0 0 81 17 1 1 33 16 0 1 0 0 17 1 3 31 0 0
                                    0 17 1 2 34 11 0 0 1 2 0 11 0 0 1 2 0 0 0
                                    17 1 2 0 0 0 119 1 0 0 0 21 0 0 0 24 3 24 0
                                    0 97 98 1 2 24 0 0 97 1 3 24 0 0 99 17 1 2
                                    24 0 0 99 1 3 0 0 0 106 17 1 2 0 0 0 106 1
                                    1 0 0 0 1 2 0 0 0 17 1 3 0 0 0 110 98 1 2 0
                                    0 0 110 1 3 0 0 0 81 17 1 2 0 0 0 81 1 2 0
                                    11 0 0 1 2 15 0 0 6 1 1 0 0 0 28 2 0 0 0 0
                                    1 2 0 0 0 0 1 2 7 0 80 0 1 2 7 0 0 80 1 2 0
                                    0 0 6 1 2 0 0 6 0 23 2 0 0 104 0 1 2 0 0 0
                                    0 1 2 0 0 17 0 1 2 0 0 119 0 1)))))
           '|lookupComplete|)) 
