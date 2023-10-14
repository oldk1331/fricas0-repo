
(/VERSIONCHECK 2) 

(DEFUN |CHVAR;eval;UPUP2FUPUP;1| (|p| |x| |y| $)
  (PROG ()
    (RETURN
     (SPADCALL
      (SPADCALL (CONS #'|CHVAR;eval;UPUP2FUPUP;1!0| (VECTOR $ |x|)) |p|
                (QREFELT $ 12))
      (SPADCALL |y| 1 (QREFELT $ 17)) (QREFELT $ 18))))) 

(DEFUN |CHVAR;eval;UPUP2FUPUP;1!0| (|s| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|CHVAR;eval;UPUP2FUPUP;1|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |s| |x| (QREFELT $ 10)))))) 

(DEFUN |CHVAR;good?| (|a| |p| |q| $)
  (COND
   ((SPADCALL (SPADCALL |p| |a| (QREFELT $ 20)) (|spadConstant| $ 21)
              (QREFELT $ 23))
    (SPADCALL (SPADCALL |q| |a| (QREFELT $ 20)) (|spadConstant| $ 21)
              (QREFELT $ 23)))
   ('T 'NIL))) 

(DEFUN |CHVAR;algPoly| (|p| $)
  (PROG (|q| |c| |d| |a|)
    (RETURN
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
        (SEQ (LETT |c| (LETT |d| (SPADCALL |a| (QREFELT $ 29)) . #1#) . #1#)
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
                                   (LETT |d| (SPADCALL |a| |d| (QREFELT $ 32))
                                         . #1#)
                                   (QREFELT $ 33))
                         . #1#)
                   (EXIT
                    (LETT |q|
                          (SPADCALL
                           (SPADCALL |q|
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |d| (QREFELT $ 30))
                                                (QREFELT $ 31))
                                      1 (QREFELT $ 17))
                                     (QREFELT $ 18))
                           (QREFELT $ 25))
                          . #1#)))
                  NIL (GO G190) G191 (EXIT NIL))
             (EXIT (|CHVAR;RPrim| |c| |a| |q| $))))))))) 

(DEFUN |CHVAR;RPrim| (|c| |a| |q| $)
  (COND
   ((SPADCALL |a| (|spadConstant| $ 14) (QREFELT $ 34))
    (CONS (SPADCALL |c| (QREFELT $ 30)) |q|))
   ('T
    (CONS (SPADCALL (SPADCALL |a| |c| (QREFELT $ 33)) (QREFELT $ 30))
          (SPADCALL
           (SPADCALL |q|
                     (SPADCALL
                      (SPADCALL (SPADCALL |a| (QREFELT $ 30)) (QREFELT $ 31)) 1
                      (QREFELT $ 17))
                     (QREFELT $ 18))
           (QREFELT $ 25)))))) 

(DEFUN |CHVAR;chvar;2UPUPR;5| (|f| |modulus| $)
  (PROG (|t| |r2c| |r2| |x| |a| |f1| |r1inv| |r1|)
    (RETURN
     (SEQ
      (LETT |r1| (SPADCALL |modulus| (QREFELT $ 36))
            . #1=(|CHVAR;chvar;2UPUPR;5|))
      (LETT |f1|
            (SPADCALL |f|
                      (SPADCALL
                       (LETT |r1inv| (SPADCALL (QCAR |r1|) (QREFELT $ 31))
                             . #1#)
                       1 (QREFELT $ 17))
                      (QREFELT $ 18))
            . #1#)
      (EXIT
       (COND
        ((|CHVAR;infIntegral?| |f1| (QCDR |r1|) $)
         (VECTOR |f1| (QCDR |r1|)
                 (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 37))
                           (QREFELT $ 30))
                 |r1inv|
                 (SPADCALL (SPADCALL (QCAR |r1|) (QREFELT $ 27))
                           (QREFELT $ 38))))
        ('T
         (SEQ
          (LETT |x|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL
                   (LETT |a| (SPADCALL |f1| (QCDR |r1|) (QREFELT $ 39)) . #1#)
                   (QREFELT $ 40))
                  (QREFELT $ 30))
                 (SPADCALL
                  (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 37))
                            (QREFELT $ 30))
                  (QREFELT $ 31))
                 (QREFELT $ 41))
                . #1#)
          (LETT |r2c|
                (SPADCALL
                 (QCAR
                  (LETT |r2|
                        (SPADCALL
                         (SPADCALL
                          (CONS #'|CHVAR;chvar;2UPUPR;5!0| (VECTOR $ |x|))
                          (QCDR |r1|) (QREFELT $ 12))
                         (QREFELT $ 36))
                        . #1#))
                 (QREFELT $ 27))
                . #1#)
          (LETT |t|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL (|spadConstant| $ 13) 1 (QREFELT $ 37))
                            (SPADCALL |a| (QREFELT $ 40)) (QREFELT $ 42))
                  (QREFELT $ 30))
                 (QREFELT $ 31))
                . #1#)
          (EXIT
           (VECTOR
            (SPADCALL
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL (|spadConstant| $ 13) 2 (QREFELT $ 37))
                         (QREFELT $ 30))
               (QREFELT $ 31))
              (SPADCALL |f1| |x| (SPADCALL (QCAR |r2|) (QREFELT $ 31))
                        (QREFELT $ 19))
              (QREFELT $ 43))
             (QREFELT $ 44))
            (QCDR |r2|) |t|
            (SPADCALL (QCAR |r1|) (SPADCALL |r2c| |t| (QREFELT $ 45))
                      (QREFELT $ 46))
            (SPADCALL |r2c| (QREFELT $ 38)))))))))))) 

(DEFUN |CHVAR;chvar;2UPUPR;5!0| (|s| $$)
  (PROG (|x| $)
    (LETT |x| (QREFELT $$ 1) . #1=(|CHVAR;chvar;2UPUPR;5|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |s| |x| (QREFELT $ 10)))))) 

(DEFUN |CHVAR;infIntegral?| (|p| |modulus| $)
  (PROG (|degp| |c| |degy| |ninv| |r|)
    (RETURN
     (SEQ
      (LETT |r| (SPADCALL |modulus| (QREFELT $ 51))
            . #1=(|CHVAR;infIntegral?|))
      (EXIT
       (COND ((QEQCAR |r| 1) 'NIL)
             ('T
              (SEQ
               (LETT |ninv|
                     (SPADCALL (SPADCALL (QCDR (QCDR |r|)) (QREFELT $ 54))
                               (QREFELT $ 55))
                     . #1#)
               (LETT |degy|
                     (SPADCALL
                      (SPADCALL (SPADCALL (QCAR (QCDR |r|)) (QREFELT $ 27))
                                (QREFELT $ 38))
                      |ninv| (QREFELT $ 56))
                     . #1#)
               (LETT |degp| (|spadConstant| $ 57) . #1#)
               (SEQ G190
                    (COND
                     ((NULL
                       (SPADCALL |p| (|spadConstant| $ 59) (QREFELT $ 60)))
                      (GO G191)))
                    (SEQ (LETT |c| (SPADCALL |p| (QREFELT $ 26)) . #1#)
                         (LETT |degp|
                               (SPADCALL |degp|
                                         (SPADCALL
                                          (SPADCALL
                                           (-
                                            (+ 2
                                               (SPADCALL
                                                (SPADCALL |c| (QREFELT $ 61))
                                                (QREFELT $ 38)))
                                            (SPADCALL
                                             (SPADCALL |c| (QREFELT $ 62))
                                             (QREFELT $ 38)))
                                           (QREFELT $ 54))
                                          (SPADCALL
                                           (SPADCALL |p| (QREFELT $ 63)) |degy|
                                           (QREFELT $ 56))
                                          (QREFELT $ 64))
                                         (QREFELT $ 65))
                               . #1#)
                         (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 66)) . #1#)))
                    NIL (GO G190) G191 (EXIT NIL))
               (EXIT (SPADCALL |degp| |ninv| (QREFELT $ 67))))))))))) 

(DEFUN |CHVAR;mkIntegral;UPUPR;7| (|p| $)
  (PROG (|rp| |r|)
    (RETURN
     (SEQ
      (LETT |r| (SPADCALL |p| (QREFELT $ 51))
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
                       (QREFELT $ 72)))))))))))) 

(DEFUN |CHVAR;goodPoint;2UPUPF;8| (|p| |modulus| $)
  (PROG (#1=#:G180 #2=#:G184 |a| |i| |d| |q| |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |q|
              (SEQ
               (LETT |r| (SPADCALL |modulus| (QREFELT $ 51))
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
                 ((|CHVAR;good?| (LETT |a| (SPADCALL |i| (QREFELT $ 76)) . #3#)
                   |q| |d| $)
                  (PROGN (LETT #2# |a| . #3#) (GO #2#)))
                 ('T
                  (SEQ
                   (EXIT
                    (COND
                     ((|CHVAR;good?| (SPADCALL |a| (QREFELT $ 77)) |q| |d| $)
                      (PROGN
                       (LETT #1#
                             (PROGN
                              (LETT #2# (SPADCALL |a| (QREFELT $ 77)) . #3#)
                              (GO #2#))
                             . #3#)
                       (GO #1#)))))
                   #1# (EXIT #1#))))))
              (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL)))))
      #2# (EXIT #2#))))) 

(DEFUN |CHVAR;radPoly;UPUPU;9| (|p| $)
  (PROG (|r|)
    (RETURN
     (SEQ
      (LETT |r| (SPADCALL (SPADCALL |p| (QREFELT $ 66)) (QREFELT $ 79))
            |CHVAR;radPoly;UPUPU;9|)
      (EXIT
       (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
             ('T
              (CONS 0
                    (CONS (SPADCALL (QCDR |r|) (QREFELT $ 80))
                          (SPADCALL |p| (QREFELT $ 63))))))))))) 

(DEFUN |CHVAR;rootPoly;FNniR;10| (|g| |m| $)
  (PROG (#1=#:G199 #2=#:G198 #3=#:G200 #4=#:G204 #5=#:G127 |pr| #6=#:G196 |d|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |g| (QREFELT $ 81)) (|error| "Should not happen"))
            (#7='T
             (SEQ
              (LETT |pr|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |g| (QREFELT $ 61))
                                (SPADCALL
                                 (LETT |d| (SPADCALL |g| (QREFELT $ 62))
                                       . #8=(|CHVAR;rootPoly;FNniR;10|))
                                 (PROG1 (LETT #6# (- |m| 1) . #8#)
                                   (|check_subtype| (>= #6# 0)
                                                    '(|NonNegativeInteger|)
                                                    #6#))
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
                                  (LETT #2# (SPADCALL #2# #3# (QREFELT $ 33))
                                        . #8#))
                                 ('T
                                  (PROGN
                                   (LETT #2# #3# . #8#)
                                   (LETT #1# 'T . #8#)))))))
                             (LETT #4# (CDR #4#) . #8#) (GO G190) G191
                             (EXIT NIL))
                        (COND (#1# #2#) (#7# (|spadConstant| $ 14))))))))))))) 

(DEFUN |ChangeOfVariable| (&REST #1=#:G205)
  (PROG ()
    (RETURN
     (PROG (#2=#:G206)
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
             ((NOT #2#) (HREM |$ConstructorCache| '|ChangeOfVariable|))))))))))) 

(DEFUN |ChangeOfVariable;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ChangeOfVariable|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|ChangeOfVariable| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 90) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ChangeOfVariable| (LIST DV$1 DV$2 DV$3)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

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
              |CHVAR;mkIntegral;UPUPR;7| (101 . |monomial|) (107 . |degree|)
              |CHVAR;goodPoint;2UPUPF;8| (112 . |coerce|) (117 . +) (123 . -)
              (129 . *) (135 . -) (140 . |elt|) (146 . *)
              (|Record| (|:| |func| 8) (|:| |poly| 8) (|:| |c1| 15)
                        (|:| |c2| 15) (|:| |deg| 16))
              |CHVAR;chvar;2UPUPR;5|
              (|Record| (|:| |radicand| 15) (|:| |deg| 16))
              (|Union| 49 '"failed") |CHVAR;radPoly;UPUPU;9| (|Integer|)
              (|Fraction| 52) (152 . |coerce|) (157 . |inv|) (162 . *)
              (168 . |Zero|) (172 . |Zero|) (176 . |Zero|) (180 . ~=)
              (186 . |numer|) (191 . |denom|) (196 . |degree|) (201 . +)
              (207 . |max|) (213 . |reductum|) (218 . <=)
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
                                                   0 34 2 7 0 6 16 37 1 7 16 0
                                                   38 1 7 0 6 40 2 15 0 0 0 41
                                                   2 7 0 0 0 42 2 8 0 15 0 43 1
                                                   8 0 0 44 2 7 9 0 9 45 2 15 0
                                                   0 0 46 1 53 0 52 54 1 53 0 0
                                                   55 2 53 0 52 0 56 0 53 0 57
                                                   0 7 0 58 0 8 0 59 2 8 22 0 0
                                                   60 1 15 7 0 61 1 15 7 0 62 1
                                                   8 16 0 63 2 53 0 0 0 64 2 53
                                                   0 0 0 65 1 8 0 0 66 2 53 22
                                                   0 0 67 0 15 0 70 1 8 0 15 71
                                                   2 8 0 0 0 72 1 8 0 0 73 2 8
                                                   15 0 0 74 1 24 7 8 75 1 6 0
                                                   52 76 1 6 0 0 77 1 8 78 0 79
                                                   1 15 0 0 80 1 15 22 0 81 2 7
                                                   0 0 16 82 1 7 83 0 84 2 87
                                                   85 86 16 88 2 15 0 7 7 89 2
                                                   0 68 15 16 69 1 0 50 8 51 1
                                                   0 35 8 36 2 0 6 8 8 39 3 0 8
                                                   8 15 15 19 2 0 47 8 8
                                                   48)))))
           '|lookupComplete|)) 
