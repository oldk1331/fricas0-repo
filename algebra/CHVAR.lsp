
(SDEFUN |CHVAR;eval;UPUP2FUPUP;1|
        ((|p| UPUP) (|x| |Fraction| UP) (|y| |Fraction| UP) ($ UPUP))
        (SPROG NIL
               (SPADCALL
                (SPADCALL (CONS #'|CHVAR;eval;UPUP2FUPUP;1!0| (VECTOR $ |x|))
                          |p| (QREFELT $ 12))
                (SPADCALL |y| 1 (QREFELT $ 17)) (QREFELT $ 18)))) 

(SDEFUN |CHVAR;eval;UPUP2FUPUP;1!0| ((|s| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|CHVAR;eval;UPUP2FUPUP;1|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |s| |x| (QREFELT $ 10)))))) 

(SDEFUN |CHVAR;good?| ((|a| F) (|p| UP) (|q| UP) ($ |Boolean|))
        (COND
         ((SPADCALL (SPADCALL |p| |a| (QREFELT $ 20)) (|spadConstant| $ 21)
                    (QREFELT $ 23))
          (SPADCALL (SPADCALL |q| |a| (QREFELT $ 20)) (|spadConstant| $ 21)
                    (QREFELT $ 23)))
         ('T 'NIL))) 

(SDEFUN |CHVAR;algPoly|
        ((|p| UPUP)
         ($ |Record| (|:| |coef| (|Fraction| UP)) (|:| |poly| UPUP)))
        (SPROG ((|q| (UPUP)) (|c| (UP)) (|d| (UP)) (|a| (UP)))
               (SEQ
                (COND
                 ((SPADCALL
                   (LETT |a|
                         (SPADCALL
                          (SPADCALL
                           (LETT |q| (SPADCALL |p| (QREFELT $ 25))
                                 . #1=(|CHVAR;algPoly|))
                           (QREFELT $ 26))
                          (QREFELT $ 27))
                         . #1#)
                   (QREFELT $ 28))
                  (|CHVAR;RPrim| (|spadConstant| $ 14) |a| |q| $))
                 ('T
                  (SEQ
                   (LETT |c| (LETT |d| (SPADCALL |a| (QREFELT $ 29)) . #1#)
                         . #1#)
                   (LETT |q|
                         (SPADCALL
                          (SPADCALL |q|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |d| (QREFELT $ 30))
                                               (QREFELT $ 31))
                                     1 (QREFELT $ 17))
                                    (QREFELT $ 18))
                          (QREFELT $ 25))
                         . #1#)
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND
                            ((SPADCALL
                              (LETT |a|
                                    (SPADCALL (SPADCALL |q| (QREFELT $ 26))
                                              (QREFELT $ 27))
                                    . #1#)
                              (QREFELT $ 28))
                             'NIL)
                            ('T 'T)))
                          (GO G191)))
                        (SEQ
                         (LETT |c|
                               (SPADCALL |c|
                                         (LETT |d|
                                               (SPADCALL |a| |d|
                                                         (QREFELT $ 32))
                                               . #1#)
                                         (QREFELT $ 33))
                               . #1#)
                         (EXIT
                          (LETT |q|
                                (SPADCALL
                                 (SPADCALL |q|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |d| (QREFELT $ 30))
                                             (QREFELT $ 31))
                                            1 (QREFELT $ 17))
                                           (QREFELT $ 18))
                                 (QREFELT $ 25))
                                . #1#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT (|CHVAR;RPrim| |c| |a| |q| $)))))))) 

(SDEFUN |CHVAR;RPrim|
        ((|c| UP) (|a| UP) (|q| UPUP)
         ($ |Record| (|:| |coef| (|Fraction| UP)) (|:| |poly| UPUP)))
        (COND
         ((SPADCALL |a| (|spadConstant| $ 14) (QREFELT $ 34))
          (CONS (SPADCALL |c| (QREFELT $ 30)) |q|))
         ('T
          (CONS (SPADCALL (SPADCALL |a| |c| (QREFELT $ 33)) (QREFELT $ 30))
                (SPADCALL
                 (SPADCALL |q|
                           (SPADCALL
                            (SPADCALL (SPADCALL |a| (QREFELT $ 30))
                                      (QREFELT $ 31))
                            1 (QREFELT $ 17))
                           (QREFELT $ 18))
                 (QREFELT $ 25)))))) 

(SDEFUN |CHVAR;chvar;2UPUPR;5|
        ((|f| UPUP) (|modulus| UPUP)
         ($ |Record| (|:| |func| UPUP) (|:| |poly| UPUP)
          (|:| |c1| (|Fraction| UP)) (|:| |c2| (|Fraction| UP))
          (|:| |deg| (|NonNegativeInteger|))))
        (SPROG
         ((|t| #1=(|Fraction| UP)) (|r2c| (UP))
          (|r2| #2=(|Record| (|:| |coef| (|Fraction| UP)) (|:| |poly| UPUP)))
          (|x| (|Fraction| UP)) (|a| (F)) (|inf_deg| (|NonNegativeInteger|))
          (|f1| (UPUP)) (|r1inv| #1#) (|r1| #2#))
         (SEQ
          (LETT |r1| (SPADCALL |modulus| (QREFELT $ 36))
                . #3=(|CHVAR;chvar;2UPUPR;5|))
          (LETT |f1|
                (SPADCALL |f|
                          (SPADCALL
                           (LETT |r1inv| (SPADCALL (QCAR |r1|) (QREFELT $ 31))
                                 . #3#)
                           1 (QREFELT $ 17))
                          (QREFELT $ 18))
                . #3#)
          (COND
           ((SPADCALL (SPADCALL (QCAR |r1|) (QREFELT $ 37))
                      (|spadConstant| $ 14) (QREFELT $ 34))
            (COND
             ((|CHVAR;infIntegral?| |f1| (QCDR |r1|) $)
              (EXIT
               (SEQ
                (LETT |inf_deg|
                      (SPADCALL (SPADCALL (QCAR |r1|) (QREFELT $ 38))
                                (QREFELT $ 39))
                      . #3#)
                (EXIT
                 (VECTOR |f1| (QCDR |r1|)
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 40))
                          (QREFELT $ 30))
                         (QCAR |r1|) |inf_deg|))))))))
          (LETT |x|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (LETT |a| (SPADCALL |f1| (QCDR |r1|) (QREFELT $ 41)) . #3#)
                   (QREFELT $ 42))
                  (QREFELT $ 30))
                 (SPADCALL
                  (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 40))
                            (QREFELT $ 30))
                  (QREFELT $ 31))
                 (QREFELT $ 43))
                . #3#)
          (LETT |r2c|
                (SPADCALL
                 (QCAR
                  (LETT |r2|
                        (SPADCALL
                         (SPADCALL
                          (CONS #'|CHVAR;chvar;2UPUPR;5!0| (VECTOR $ |x|))
                          (QCDR |r1|) (QREFELT $ 12))
                         (QREFELT $ 36))
                        . #3#))
                 (QREFELT $ 27))
                . #3#)
          (LETT |t|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 40))
                            (SPADCALL |a| (QREFELT $ 42)) (QREFELT $ 44))
                  (QREFELT $ 30))
                 (QREFELT $ 31))
                . #3#)
          (EXIT
           (VECTOR
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL (|spadConstant| $ 13) 2 (QREFELT $ 40))
                         (QREFELT $ 30))
               (QREFELT $ 31))
              (SPADCALL |f1| |x| (SPADCALL (QCAR |r2|) (QREFELT $ 31))
                        (QREFELT $ 19))
              (QREFELT $ 45))
             (QREFELT $ 46))
            (QCDR |r2|) |t|
            (SPADCALL (QCAR |r1|) (SPADCALL |r2c| |t| (QREFELT $ 47))
                      (QREFELT $ 48))
            (SPADCALL |r2c| (QREFELT $ 39))))))) 

(SDEFUN |CHVAR;chvar;2UPUPR;5!0| ((|s| NIL) ($$ NIL))
        (PROG (|x| $)
          (LETT |x| (QREFELT $$ 1) . #1=(|CHVAR;chvar;2UPUPR;5|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |s| |x| (QREFELT $ 10)))))) 

(SDEFUN |CHVAR;infIntegral?| ((|p| UPUP) (|modulus| UPUP) ($ |Boolean|))
        (SPROG
         ((|degp| (|Fraction| (|Integer|))) (|c| (|Fraction| UP))
          (|degy| (|Fraction| (|Integer|))) (|ninv| (|Fraction| (|Integer|)))
          (|r|
           (|Union|
            (|Record| (|:| |radicand| (|Fraction| UP))
                      (|:| |deg| (|NonNegativeInteger|)))
            "failed")))
         (SEQ
          (LETT |r| (SPADCALL |modulus| (QREFELT $ 53))
                . #1=(|CHVAR;infIntegral?|))
          (EXIT
           (COND ((QEQCAR |r| 1) 'NIL)
                 ('T
                  (SEQ
                   (LETT |ninv|
                         (SPADCALL (SPADCALL (QCDR (QCDR |r|)) (QREFELT $ 56))
                                   (QREFELT $ 57))
                         . #1#)
                   (LETT |degy|
                         (SPADCALL
                          (SPADCALL (SPADCALL (QCAR (QCDR |r|)) (QREFELT $ 27))
                                    (QREFELT $ 39))
                          |ninv| (QREFELT $ 58))
                         . #1#)
                   (LETT |degp| (|spadConstant| $ 59) . #1#)
                   (SEQ G190
                        (COND
                         ((NULL
                           (SPADCALL |p| (|spadConstant| $ 61) (QREFELT $ 62)))
                          (GO G191)))
                        (SEQ (LETT |c| (SPADCALL |p| (QREFELT $ 26)) . #1#)
                             (LETT |degp|
                                   (SPADCALL |degp|
                                             (SPADCALL
                                              (SPADCALL
                                               (-
                                                (+ 2
                                                   (SPADCALL
                                                    (SPADCALL |c|
                                                              (QREFELT $ 38))
                                                    (QREFELT $ 39)))
                                                (SPADCALL
                                                 (SPADCALL |c| (QREFELT $ 37))
                                                 (QREFELT $ 39)))
                                               (QREFELT $ 56))
                                              (SPADCALL
                                               (SPADCALL |p| (QREFELT $ 63))
                                               |degy| (QREFELT $ 58))
                                              (QREFELT $ 64))
                                             (QREFELT $ 65))
                                   . #1#)
                             (EXIT
                              (LETT |p| (SPADCALL |p| (QREFELT $ 66)) . #1#)))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT (SPADCALL |degp| |ninv| (QREFELT $ 67)))))))))) 

(SDEFUN |CHVAR;mkIntegral;UPUPR;7|
        ((|p| UPUP)
         ($ |Record| (|:| |coef| (|Fraction| UP)) (|:| |poly| UPUP)))
        (SPROG
         ((|rp|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Fraction| UP)) (|:| |radicand| UP)))
          (|r|
           (|Union|
            (|Record| (|:| |radicand| (|Fraction| UP))
                      (|:| |deg| (|NonNegativeInteger|)))
            "failed")))
         (SEQ
          (LETT |r| (SPADCALL |p| (QREFELT $ 53))
                . #1=(|CHVAR;mkIntegral;UPUPR;7|))
          (EXIT
           (COND ((QEQCAR |r| 1) (|CHVAR;algPoly| |p| $))
                 ('T
                  (SEQ
                   (LETT |rp|
                         (SPADCALL (QCAR (QCDR |r|)) (QCDR (QCDR |r|))
                                   (QREFELT $ 69))
                         . #1#)
                   (EXIT
                    (CONS (QVELT |rp| 1)
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 70) (QVELT |rp| 0)
                                     (QREFELT $ 17))
                           (SPADCALL (SPADCALL (QVELT |rp| 2) (QREFELT $ 30))
                                     (QREFELT $ 71))
                           (QREFELT $ 72))))))))))) 

(SDEFUN |CHVAR;goodPoint;2UPUPF;8| ((|p| UPUP) (|modulus| UPUP) ($ F))
        (SPROG
         ((#1=#:G165 NIL) (#2=#:G166 NIL) (|a| (F)) (|i| NIL) (|d| (UP))
          (|q| (UP))
          (|r|
           (|Union|
            (|Record| (|:| |radicand| (|Fraction| UP))
                      (|:| |deg| (|NonNegativeInteger|)))
            "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |q|
                  (SEQ
                   (LETT |r| (SPADCALL |modulus| (QREFELT $ 53))
                         . #3=(|CHVAR;goodPoint;2UPUPF;8|))
                   (EXIT
                    (COND
                     ((QEQCAR |r| 1)
                      (SPADCALL
                       (SPADCALL |modulus| (SPADCALL |modulus| (QREFELT $ 73))
                                 (QREFELT $ 74))
                       (QREFELT $ 27)))
                     ('T (SPADCALL (QCAR (QCDR |r|)) (QREFELT $ 27))))))
                  . #3#)
            (LETT |d| (SPADCALL |p| (QREFELT $ 75)) . #3#)
            (EXIT
             (SEQ (LETT |i| 0 . #3#) G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((|CHVAR;good?|
                       (LETT |a| (SPADCALL |i| (QREFELT $ 76)) . #3#) |q| |d|
                       $)
                      (PROGN (LETT #2# |a| . #3#) (GO #4=#:G164)))
                     ('T
                      (SEQ
                       (EXIT
                        (COND
                         ((|CHVAR;good?| (SPADCALL |a| (QREFELT $ 77)) |q| |d|
                           $)
                          (PROGN
                           (LETT #1#
                                 (PROGN
                                  (LETT #2# (SPADCALL |a| (QREFELT $ 77))
                                        . #3#)
                                  (GO #4#))
                                 . #3#)
                           (GO #5=#:G160)))))
                       #5# (EXIT #1#))))))
                  (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL)))))
          #4# (EXIT #2#)))) 

(SDEFUN |CHVAR;radPoly;UPUPU;9|
        ((|p| UPUP)
         ($ |Union|
          (|Record| (|:| |radicand| (|Fraction| UP))
                    (|:| |deg| (|NonNegativeInteger|)))
          "failed"))
        (SPROG ((|r| (|Union| (|Fraction| UP) "failed")))
               (SEQ
                (LETT |r|
                      (SPADCALL (SPADCALL |p| (QREFELT $ 66)) (QREFELT $ 79))
                      |CHVAR;radPoly;UPUPU;9|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (CONS (SPADCALL (QCDR |r|) (QREFELT $ 80))
                                    (SPADCALL |p| (QREFELT $ 63)))))))))) 

(SDEFUN |CHVAR;rootPoly;FNniR;10|
        ((|g| |Fraction| UP) (|m| |NonNegativeInteger|)
         ($ |Record| (|:| |exponent| (|NonNegativeInteger|))
          (|:| |coef| (|Fraction| UP)) (|:| |radicand| UP)))
        (SPROG
         ((#1=#:G181 NIL) (#2=#:G180 (UP)) (#3=#:G182 (UP)) (#4=#:G186 NIL)
          (#5=#:G104 NIL)
          (|pr|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| UP)
                     (|:| |radicand| (|List| UP))))
          (#6=#:G178 NIL) (|d| (UP)))
         (SEQ
          (COND ((SPADCALL |g| (QREFELT $ 81)) (|error| "Should not happen"))
                (#7='T
                 (SEQ
                  (LETT |pr|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |g| (QREFELT $ 38))
                                    (SPADCALL
                                     (LETT |d| (SPADCALL |g| (QREFELT $ 37))
                                           . #8=(|CHVAR;rootPoly;FNniR;10|))
                                     (PROG1 (LETT #6# (- |m| 1) . #8#)
                                       (|check_subtype2| (>= #6# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #6#))
                                     (QREFELT $ 82))
                                    (QREFELT $ 33))
                          (QREFELT $ 84))
                         |m| (QREFELT $ 88))
                        . #8#)
                  (EXIT
                   (VECTOR (QVELT |pr| 0)
                           (SPADCALL |d| (QVELT |pr| 1) (QREFELT $ 89))
                           (PROGN
                            (LETT #1# NIL . #8#)
                            (SEQ (LETT #5# NIL . #8#)
                                 (LETT #4# (QVELT |pr| 2) . #8#) G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN (LETT #5# (CAR #4#) . #8#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #3# #5# . #8#)
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #3# (QREFELT $ 33))
                                            . #8#))
                                     ('T
                                      (PROGN
                                       (LETT #2# #3# . #8#)
                                       (LETT #1# 'T . #8#)))))))
                                 (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#1# #2#)
                                  (#7# (|spadConstant| $ 14)))))))))))) 

(DECLAIM (NOTINLINE |ChangeOfVariable;|)) 

(DEFUN |ChangeOfVariable| (&REST #1=#:G187)
  (SPROG NIL
         (PROG (#2=#:G188)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ChangeOfVariable|)
                                               '|domainEqualList|)
                    . #3=(|ChangeOfVariable|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ChangeOfVariable;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ChangeOfVariable|)))))))))) 

(DEFUN |ChangeOfVariable;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ChangeOfVariable|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|ChangeOfVariable| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 90) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ChangeOfVariable|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ChangeOfVariable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Fraction| $) (0 . |elt|) (|Mapping| 15 15)
              (6 . |map|) (12 . |One|) (16 . |One|) (|Fraction| 7)
              (|NonNegativeInteger|) (20 . |monomial|) (26 . |elt|)
              |CHVAR;eval;UPUP2FUPUP;1| (32 . |elt|) (38 . |Zero|) (|Boolean|)
              (42 . ~=) (|UnivariatePolynomialCommonDenominator| 7 15 8)
              (48 . |clearDenominator|) (53 . |leadingCoefficient|)
              (58 . |retract|) (63 . |ground?|) (68 . |squareFreePart|)
              (73 . |coerce|) (78 . |inv|) (83 . |gcd|) (89 . *) (95 . =)
              (|Record| (|:| |coef| 15) (|:| |poly| 8))
              |CHVAR;mkIntegral;UPUPR;7| (101 . |denom|) (106 . |numer|)
              (111 . |degree|) (116 . |monomial|) |CHVAR;goodPoint;2UPUPF;8|
              (122 . |coerce|) (127 . +) (133 . -) (139 . *) (145 . -)
              (150 . |elt|) (156 . *)
              (|Record| (|:| |func| 8) (|:| |poly| 8) (|:| |c1| 15)
                        (|:| |c2| 15) (|:| |deg| 16))
              |CHVAR;chvar;2UPUPR;5|
              (|Record| (|:| |radicand| 15) (|:| |deg| 16))
              (|Union| 51 '"failed") |CHVAR;radPoly;UPUPU;9| (|Integer|)
              (|Fraction| 54) (162 . |coerce|) (167 . |inv|) (172 . *)
              (178 . |Zero|) (182 . |Zero|) (186 . |Zero|) (190 . ~=)
              (196 . |degree|) (201 . +) (207 . |max|) (213 . |reductum|)
              (218 . <=)
              (|Record| (|:| |exponent| 16) (|:| |coef| 15) (|:| |radicand| 7))
              |CHVAR;rootPoly;FNniR;10| (224 . |One|) (228 . |coerce|)
              (233 . -) (239 . |differentiate|) (244 . |resultant|)
              (250 . |commonDenominator|) (255 . |coerce|) (260 . -)
              (|Union| 15 '"failed") (265 . |retractIfCan|) (270 . -)
              (275 . |zero?|) (280 . ^) (|Factored| $) (286 . |squareFree|)
              (|Record| (|:| |exponent| 16) (|:| |coef| 7)
                        (|:| |radicand| (|List| 7)))
              (|Factored| 7) (|FactoredFunctions| 7) (291 . |nthRoot|)
              (297 . /))
           '#(|rootPoly| 303 |radPoly| 309 |mkIntegral| 314 |goodPoint| 319
              |eval| 325 |chvar| 332)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 89
                                                 '(2 7 9 9 9 10 2 8 0 11 0 12 0
                                                   6 0 13 0 7 0 14 2 8 0 15 16
                                                   17 2 8 0 0 0 18 2 7 6 0 6 20
                                                   0 6 0 21 2 6 22 0 0 23 1 24
                                                   8 8 25 1 8 15 0 26 1 15 7 0
                                                   27 1 7 22 0 28 1 7 0 0 29 1
                                                   15 0 7 30 1 15 0 0 31 2 7 0
                                                   0 0 32 2 7 0 0 0 33 2 7 22 0
                                                   0 34 1 15 7 0 37 1 15 7 0 38
                                                   1 7 16 0 39 2 7 0 6 16 40 1
                                                   7 0 6 42 2 15 0 0 0 43 2 7 0
                                                   0 0 44 2 8 0 15 0 45 1 8 0 0
                                                   46 2 7 9 0 9 47 2 15 0 0 0
                                                   48 1 55 0 54 56 1 55 0 0 57
                                                   2 55 0 54 0 58 0 55 0 59 0 7
                                                   0 60 0 8 0 61 2 8 22 0 0 62
                                                   1 8 16 0 63 2 55 0 0 0 64 2
                                                   55 0 0 0 65 1 8 0 0 66 2 55
                                                   22 0 0 67 0 15 0 70 1 8 0 15
                                                   71 2 8 0 0 0 72 1 8 0 0 73 2
                                                   8 15 0 0 74 1 24 7 8 75 1 6
                                                   0 54 76 1 6 0 0 77 1 8 78 0
                                                   79 1 15 0 0 80 1 15 22 0 81
                                                   2 7 0 0 16 82 1 7 83 0 84 2
                                                   87 85 86 16 88 2 15 0 7 7 89
                                                   2 0 68 15 16 69 1 0 52 8 53
                                                   1 0 35 8 36 2 0 6 8 8 41 3 0
                                                   8 8 15 15 19 2 0 49 8 8
                                                   50)))))
           '|lookupComplete|)) 
