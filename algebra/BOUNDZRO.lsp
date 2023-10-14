
(SDEFUN |BOUNDZRO;qzroot1|
        ((|p| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Integer|))
        (|BOUNDZRO;negint|
         (SPADCALL
          (SPADCALL (SPADCALL (SPADCALL |p| (QREFELT $ 9)) (QREFELT $ 11))
                    (SPADCALL |p| (QREFELT $ 11)) (QREFELT $ 12))
          (QREFELT $ 13))
         $)) 

(SDEFUN |BOUNDZRO;zroot1| ((|p| UP) ($ |Integer|))
        (SPROG ((|r| (|Union| (|Fraction| (|Integer|)) "failed")) (|z| (F)))
               (SEQ
                (LETT |z|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |p| (QREFELT $ 14)) (QREFELT $ 15))
                        (SPADCALL |p| (QREFELT $ 15)) (QREFELT $ 16))
                       (QREFELT $ 17))
                      . #1=(|BOUNDZRO;zroot1|))
                (LETT |r| (SPADCALL |z| (QREFELT $ 19)) . #1#)
                (EXIT
                 (COND ((QEQCAR |r| 0) (|BOUNDZRO;negint| (QCDR |r|) $))
                       ('T 0)))))) 

(SDEFUN |BOUNDZRO;negint| ((|r| |Fraction| (|Integer|)) ($ |Integer|))
        (SPROG ((#1=#:G117 NIL) (|u| (|Union| (|Integer|) "failed")))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (LETT |u| (SPADCALL |r| (QREFELT $ 21))
                         . #2=(|BOUNDZRO;negint|))
                   (EXIT
                    (COND
                     ((QEQCAR |u| 0)
                      (COND
                       ((< (QCDR |u|) 0)
                        (PROGN (LETT #1# (QCDR |u|) . #2#) (GO #1#))))))))
                  (EXIT 0)))
                #1# (EXIT #1#)))) 

(SDEFUN |BOUNDZRO;bringDown| ((|f| F) ($ |Fraction| (|Integer|)))
        (SPROG
         ((#1=#:G123 NIL) (|k| NIL) (#2=#:G122 NIL)
          (|t| (|List| (|Kernel| F))))
         (SEQ
          (LETT |t| (SPADCALL |f| (QREFELT $ 25)) . #3=(|BOUNDZRO;bringDown|))
          (EXIT
           (SPADCALL
            (SPADCALL |f| |t|
                      (PROGN
                       (LETT #2# NIL . #3#)
                       (SEQ (LETT |k| NIL . #3#) (LETT #1# |t| . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS
                                     (SPADCALL (SPADCALL (QREFELT $ 26))
                                               (QREFELT $ 27))
                                     #2#)
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      (QREFELT $ 29))
            (QREFELT $ 30)))))) 

(SDEFUN |BOUNDZRO;integerBound;UPI;5| ((|p| UP) ($ |Integer|))
        (SPROG
         ((|q2| #1=(|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
          (|q1| #1#))
         (SEQ
          (COND
           ((EQL (SPADCALL |p| (QREFELT $ 32)) 1) (|BOUNDZRO;zroot1| |p| $))
           ('T
            (SEQ
             (LETT |q1|
                   (SPADCALL (CONS (|function| |BOUNDZRO;bringDown|) $) |p|
                             (QREFELT $ 35))
                   . #2=(|BOUNDZRO;integerBound;UPI;5|))
             (LETT |q2|
                   (SPADCALL (CONS (|function| |BOUNDZRO;bringDown|) $) |p|
                             (QREFELT $ 35))
                   . #2#)
             (EXIT
              (|BOUNDZRO;qbound| |p| (SPADCALL |q1| |q2| (QREFELT $ 36))
               $)))))))) 

(SDEFUN |BOUNDZRO;integerBound;UPI;6| ((|p| UP) ($ |Integer|))
        (COND ((EQL (SPADCALL |p| (QREFELT $ 32)) 1) (|BOUNDZRO;zroot1| |p| $))
              ('T
               (|BOUNDZRO;qbound| |p| (SPADCALL (ELT $ 30) |p| (QREFELT $ 35))
                $)))) 

(SDEFUN |BOUNDZRO;qbound|
        ((|p| UP) (|q| |SparseUnivariatePolynomial| (|Fraction| (|Integer|)))
         ($ |Integer|))
        (SPROG
         ((|bound| (|Integer|)) (|r| (|Integer|)) (#1=#:G138 NIL) (|rec| NIL))
         (SEQ (LETT |bound| 0 . #2=(|BOUNDZRO;qbound|))
              (SEQ (LETT |rec| NIL . #2#)
                   (LETT #1#
                         (SPADCALL (SPADCALL |q| (QREFELT $ 41))
                                   (QREFELT $ 44))
                         . #2#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (SPADCALL (QCAR |rec|) (QREFELT $ 45)) 1)
                       (SEQ
                        (LETT |r| (|BOUNDZRO;qzroot1| (QCAR |rec|) $) . #2#)
                        (EXIT
                         (COND
                          ((< |r| |bound|)
                           (COND
                            ((SPADCALL
                              (SPADCALL |p|
                                        (SPADCALL (SPADCALL |r| (QREFELT $ 46))
                                                  (QREFELT $ 27))
                                        (QREFELT $ 47))
                              (QREFELT $ 49))
                             (LETT |bound| |r| . #2#)))))))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |bound|)))) 

(DECLAIM (NOTINLINE |BoundIntegerRoots;|)) 

(DEFUN |BoundIntegerRoots| (&REST #1=#:G139)
  (SPROG NIL
         (PROG (#2=#:G140)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|BoundIntegerRoots|)
                                               '|domainEqualList|)
                    . #3=(|BoundIntegerRoots|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |BoundIntegerRoots;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|BoundIntegerRoots|)))))))))) 

(DEFUN |BoundIntegerRoots;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|BoundIntegerRoots|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|BoundIntegerRoots| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 50) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|BoundIntegerRoots| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|HasCategory| |#1| '(|ExpressionSpace|))
            (PROGN
             (QSETREFV $ 38
                       (CONS (|dispatchFunction| |BOUNDZRO;integerBound;UPI;5|)
                             $))))
           ('T
            (QSETREFV $ 38
                      (CONS (|dispatchFunction| |BOUNDZRO;integerBound;UPI;6|)
                            $))))
          $))) 

(MAKEPROP '|BoundIntegerRoots| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|SparseUnivariatePolynomial| 10) (0 . |reductum|)
              (|Fraction| 37) (5 . |leadingCoefficient|) (10 . /) (16 . -)
              (21 . |reductum|) (26 . |leadingCoefficient|) (31 . /) (37 . -)
              (|Union| 10 '"failed") (42 . |retractIfCan|)
              (|Union| 37 '"failed") (47 . |retractIfCan|) (52 . |Zero|)
              (56 . |Zero|) (|List| (|Kernel| $)) (60 . |tower|)
              (65 . |random|) (69 . |coerce|) (|List| $) (74 . |eval|)
              (81 . |retract|) (|NonNegativeInteger|) (86 . |degree|)
              (|Mapping| 10 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 10 8) (91 . |map|)
              (97 . |gcd|) (|Integer|) (103 . |integerBound|) (|Factored| 8)
              (|RationalFactorize| 8) (108 . |factor|)
              (|Record| (|:| |factor| 8) (|:| |exponent| 37)) (|List| 42)
              (113 . |factors|) (118 . |degree|) (123 . |coerce|) (128 . |elt|)
              (|Boolean|) (134 . |zero?|))
           '#(|integerBound| 139) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 49
                                                 '(1 8 0 0 9 1 8 10 0 11 2 10 0
                                                   0 0 12 1 10 0 0 13 1 7 0 0
                                                   14 1 7 6 0 15 2 6 0 0 0 16 1
                                                   6 0 0 17 1 6 18 0 19 1 10 20
                                                   0 21 0 6 0 22 0 7 0 23 1 6
                                                   24 0 25 0 10 0 26 1 6 0 10
                                                   27 3 6 0 0 24 28 29 1 6 10 0
                                                   30 1 7 31 0 32 2 34 8 33 7
                                                   35 2 8 0 0 0 36 1 0 37 7 38
                                                   1 40 39 8 41 1 39 43 0 44 1
                                                   8 31 0 45 1 10 0 37 46 2 7 6
                                                   0 6 47 1 6 48 0 49 1 0 37 7
                                                   38)))))
           '|lookupComplete|)) 
