
(/VERSIONCHECK 2) 

(DEFUN |ODEPRIM;UP2UP2| (|p| $) (SPADCALL (ELT $ 12) |p| (QREFELT $ 16))) 

(DEFUN |ODEPRIM;indicialEquations;LL;2| (|op| $)
  (SPADCALL |op| (SPADCALL |op| (QREFELT $ 17)) (QREFELT $ 20))) 

(DEFUN |ODEPRIM;indicialEquation;LFUP;3| (|op| |a| $)
  (|ODEPRIM;indeq|
   (SPADCALL (SPADCALL (|spadConstant| $ 22) 1 (QREFELT $ 25))
             (SPADCALL |a| (QREFELT $ 12)) (QREFELT $ 26))
   |op| $)) 

(DEFUN |ODEPRIM;splitDenominator;LQLR;4| (|op| |lg| $)
  (PROG (#1=#:G145 |g| #2=#:G144 |l| |f| |cd|)
    (RETURN
     (SEQ
      (LETT |cd| (SPADCALL (SPADCALL |op| (QREFELT $ 29)) (QREFELT $ 32))
            . #3=(|ODEPRIM;splitDenominator;LQLR;4|))
      (LETT |f|
            (SPADCALL (QCDR |cd|) (SPADCALL (QCAR |cd|) (QREFELT $ 34))
                      (QREFELT $ 36))
            . #3#)
      (LETT |l| (|spadConstant| $ 37) . #3#)
      (SEQ G190
           (COND
            ((NULL (SPADCALL |op| (|spadConstant| $ 40) (QREFELT $ 42)))
             (GO G191)))
           (SEQ
            (LETT |l|
                  (SPADCALL |l|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL |f| (SPADCALL |op| (QREFELT $ 43))
                                        (QREFELT $ 44))
                              (QREFELT $ 45))
                             (SPADCALL |op| (QREFELT $ 46)) (QREFELT $ 47))
                            (QREFELT $ 48))
                  . #3#)
            (EXIT (LETT |op| (SPADCALL |op| (QREFELT $ 49)) . #3#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT
       (CONS |l|
             (PROGN
              (LETT #2# NIL . #3#)
              (SEQ (LETT |g| NIL . #3#) (LETT #1# |lg| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #2# (CONS (SPADCALL |f| |g| (QREFELT $ 44)) #2#)
                           . #3#)))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))))) 

(DEFUN |ODEPRIM;tau| (|p| |pp| |q| |n| $)
  (PROG (#1=#:G147)
    (RETURN
     (SPADCALL
      (SPADCALL (SPADCALL |pp| |n| (QREFELT $ 52))
                (PROG2
                    (LETT #1#
                          (SPADCALL |q|
                                    (SPADCALL |p|
                                              (SPADCALL |q| |p| (QREFELT $ 53))
                                              (QREFELT $ 52))
                                    (QREFELT $ 55))
                          |ODEPRIM;tau|)
                    (QCDR #1#)
                  (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))
                (QREFELT $ 56))
      |p| (QREFELT $ 57))))) 

(DEFUN |ODEPRIM;indicialEquations;LQL;6| (|op| $)
  (SPADCALL (QCAR (SPADCALL |op| NIL (QREFELT $ 51))) (QREFELT $ 21))) 

(DEFUN |ODEPRIM;indicialEquations;LQUPL;7| (|op| |p| $)
  (SPADCALL (QCAR (SPADCALL |op| NIL (QREFELT $ 51))) |p| (QREFELT $ 20))) 

(DEFUN |ODEPRIM;indicialEquation;LQFUP;8| (|op| |a| $)
  (|ODEPRIM;indeq|
   (SPADCALL (SPADCALL (|spadConstant| $ 22) 1 (QREFELT $ 25))
             (SPADCALL |a| (QREFELT $ 12)) (QREFELT $ 26))
   (QCAR (SPADCALL |op| NIL (QREFELT $ 51))) $)) 

(DEFUN |ODEPRIM;UPfact| (|n| $)
  (PROG (#1=#:G161 #2=#:G160 #3=#:G162 #4=#:G166 #5=#:G159 |i| |z|)
    (RETURN
     (SEQ
      (COND ((ZEROP |n|) (|spadConstant| $ 23))
            (#6='T
             (SEQ
              (LETT |z| (SPADCALL (|spadConstant| $ 22) 1 (QREFELT $ 25))
                    . #7=(|ODEPRIM;UPfact|))
              (EXIT
               (PROGN
                (LETT #1# NIL . #7#)
                (SEQ (LETT |i| 0 . #7#)
                     (LETT #4#
                           (PROG1 (LETT #5# (- |n| 1) . #7#)
                             (|check_subtype| (>= #5# 0)
                                              '(|NonNegativeInteger|) #5#))
                           . #7#)
                     G190 (COND ((|greater_SI| |i| #4#) (GO G191)))
                     (SEQ
                      (EXIT
                       (PROGN
                        (LETT #3#
                              (SPADCALL |z|
                                        (SPADCALL (SPADCALL |i| (QREFELT $ 62))
                                                  (QREFELT $ 12))
                                        (QREFELT $ 26))
                              . #7#)
                        (COND
                         (#1#
                          (LETT #2# (SPADCALL #2# #3# (QREFELT $ 56)) . #7#))
                         ('T
                          (PROGN (LETT #2# #3# . #7#) (LETT #1# 'T . #7#)))))))
                     (LETT |i| (|inc_SI| |i|) . #7#) (GO G190) G191 (EXIT NIL))
                (COND (#1# #2#) (#6# (|spadConstant| $ 23)))))))))))) 

(DEFUN |ODEPRIM;indicialEq| (|c| |lamb| |lf| $)
  (PROG (|s| #1=#:G170 |i| #2=#:G171 |f| |cc| |cp|)
    (RETURN
     (SEQ
      (LETT |cp| (SPADCALL (QREFELT $ 11) |c| (QREFELT $ 63))
            . #3=(|ODEPRIM;indicialEq|))
      (LETT |cc| (|ODEPRIM;UP2UP2| |c| $) . #3#)
      (LETT |s| (|spadConstant| $ 64) . #3#)
      (SEQ (LETT |f| NIL . #3#) (LETT #2# |lf| . #3#) (LETT |i| NIL . #3#)
           (LETT #1# |lamb| . #3#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #3#) NIL) (ATOM #2#)
                 (PROGN (LETT |f| (CAR #2#) . #3#) NIL))
             (GO G191)))
           (SEQ
            (EXIT
             (LETT |s|
                   (SPADCALL |s|
                             (SPADCALL (|ODEPRIM;UPfact| |i| $)
                                       (|ODEPRIM;UP2UP2|
                                        (|ODEPRIM;tau| |c| |cp| |f| |i| $) $)
                                       (QREFELT $ 65))
                             (QREFELT $ 66))
                   . #3#)))
           (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
           (GO G190) G191 (EXIT NIL))
      (EXIT (SPADCALL (SPADCALL |cc| |s| (QREFELT $ 67)) (QREFELT $ 68))))))) 

(DEFUN |ODEPRIM;NPmulambda| (|c| |l| $)
  (PROG (|lf| |lamb| |mup| |m| |d| |a|)
    (RETURN
     (SEQ
      (LETT |lamb|
            (LIST
             (LETT |d| (SPADCALL |l| (QREFELT $ 69))
                   . #1=(|ODEPRIM;NPmulambda|)))
            . #1#)
      (LETT |lf| (LIST (LETT |a| (SPADCALL |l| (QREFELT $ 17)) . #1#)) . #1#)
      (LETT |mup| (- |d| (SPADCALL |a| |c| (QREFELT $ 53))) . #1#)
      (SEQ G190
           (COND
            ((NULL
              (SPADCALL (LETT |l| (SPADCALL |l| (QREFELT $ 70)) . #1#)
                        (|spadConstant| $ 37) (QREFELT $ 71)))
             (GO G191)))
           (SEQ (LETT |a| (SPADCALL |l| (QREFELT $ 17)) . #1#)
                (LETT |m|
                      (- (LETT |d| (SPADCALL |l| (QREFELT $ 69)) . #1#)
                         (SPADCALL |a| |c| (QREFELT $ 53)))
                      . #1#)
                (EXIT
                 (COND
                  ((SPADCALL |m| |mup| (QREFELT $ 72))
                   (SEQ (LETT |mup| |m| . #1#) (LETT |lamb| (LIST |d|) . #1#)
                        (EXIT (LETT |lf| (LIST |a|) . #1#))))
                  ((EQL |m| |mup|)
                   (SEQ (LETT |lamb| (CONS |d| |lamb|) . #1#)
                        (EXIT (LETT |lf| (CONS |a| |lf|) . #1#)))))))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT (VECTOR |mup| |lamb| |lf|)))))) 

(DEFUN |ODEPRIM;NPbound| (|c| |l| |e| $)
  (PROG (#1=#:G181 #2=#:G180 |n| |rec|)
    (RETURN
     (SEQ
      (LETT |rec| (|ODEPRIM;NPmulambda| |c| |l| $) . #3=(|ODEPRIM;NPbound|))
      (LETT |n|
            (MAX 0
                 (-
                  (SPADCALL
                   (|ODEPRIM;indicialEq| |c| (QVELT |rec| 1) (QVELT |rec| 2) $)
                   (QREFELT $ 74))))
            . #3#)
      (EXIT
       (COND
        ((SPADCALL |e| (QREFELT $ 75))
         (PROG1 (LETT #2# |n| . #3#)
           (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#)))
        ('T
         (PROG1
             (LETT #1#
                   (MAX |n|
                        (- (SPADCALL |e| |c| (QREFELT $ 53)) (QVELT |rec| 0)))
                   . #3#)
           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#))))))))) 

(DEFUN |ODEPRIM;hdenom| (|l| |d| |e| $)
  (PROG (#1=#:G186 #2=#:G185 #3=#:G187 #4=#:G189 |dd|)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #5=(|ODEPRIM;hdenom|))
       (SEQ (LETT |dd| NIL . #5#)
            (LETT #4#
                  (SPADCALL
                   (SPADCALL |d| (SPADCALL |l| (QREFELT $ 77)) (QREFELT $ 80))
                   (QREFELT $ 83))
                  . #5#)
            G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT |dd| (CAR #4#) . #5#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3#
                     (SPADCALL (QCAR |dd|)
                               (|ODEPRIM;NPbound| (QCAR |dd|) |l| |e| $)
                               (QREFELT $ 52))
                     . #5#)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 56)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
            (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 23)))))))) 

(DEFUN |ODEPRIM;denom0| (|n| |l| |d| |e| |h| $)
  (PROG (#1=#:G192 #2=#:G191 #3=#:G193 #4=#:G195 #5=#:G197 |hh|)
    (RETURN
     (SEQ
      (SPADCALL (|ODEPRIM;hdenom| |l| |d| |e| $)
                (PROGN
                 (LETT #1# NIL . #6=(|ODEPRIM;denom0|))
                 (SEQ (LETT |hh| NIL . #6#)
                      (LETT #5#
                            (SPADCALL (SPADCALL |h| |e| (QREFELT $ 84))
                                      (QREFELT $ 83))
                            . #6#)
                      G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |hh| (CAR #5#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3#
                               (SPADCALL (QCAR |hh|)
                                         (PROG1
                                             (LETT #4#
                                                   (MAX 0
                                                        (-
                                                         (SPADCALL |e|
                                                                   (QCAR |hh|)
                                                                   (QREFELT $
                                                                            53))
                                                         |n|))
                                                   . #6#)
                                           (|check_subtype| (>= #4# 0)
                                                            '(|NonNegativeInteger|)
                                                            #4#))
                                         (QREFELT $ 52))
                               . #6#)
                         (COND
                          (#1#
                           (LETT #2# (SPADCALL #2# #3# (QREFELT $ 56)) . #6#))
                          ('T
                           (PROGN
                            (LETT #2# #3# . #6#)
                            (LETT #1# 'T . #6#)))))))
                      (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
                 (COND (#1# #2#) ('T (|spadConstant| $ 23))))
                (QREFELT $ 56)))))) 

(DEFUN |ODEPRIM;separateZeros| (|d| |e| $)
  (PROG (#1=#:G199 |g|)
    (RETURN
     (PROG2
         (LETT #1#
               (SPADCALL
                (LETT |g| (SPADCALL |e| (QREFELT $ 86))
                      . #2=(|ODEPRIM;separateZeros|))
                (SPADCALL |g| (SPADCALL |d| (QREFELT $ 86)) (QREFELT $ 87))
                (QREFELT $ 55))
               . #2#)
         (QCDR #1#)
       (|check_union| (QEQCAR #1# 0) (QREFELT $ 7) #1#))))) 

(DEFUN |ODEPRIM;indeq| (|c| |l| $)
  (PROG (|rec|)
    (RETURN
     (SEQ (LETT |rec| (|ODEPRIM;NPmulambda| |c| |l| $) |ODEPRIM;indeq|)
          (EXIT
           (|ODEPRIM;indicialEq| |c| (QVELT |rec| 1) (QVELT |rec| 2) $)))))) 

(DEFUN |ODEPRIM;indicialEquations;LUPL;17| (|op| |p| $)
  (PROG (#1=#:G210 |dd| #2=#:G209)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|ODEPRIM;indicialEquations;LUPL;17|))
       (SEQ (LETT |dd| NIL . #3#)
            (LETT #1#
                  (SPADCALL
                   (SPADCALL |p| (SPADCALL |op| (QREFELT $ 77)) (QREFELT $ 80))
                   (QREFELT $ 83))
                  . #3#)
            G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |dd| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2#
                    (CONS
                     (CONS (QCAR |dd|) (|ODEPRIM;indeq| (QCAR |dd|) |op| $))
                     #2#)
                    . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |ODEPRIM;denomLODE;LFU;18| (|l| |g| $)
  (PROG (|n| |h| |e| |d|)
    (RETURN
     (SEQ
      (LETT |d| (SPADCALL |l| (QREFELT $ 17))
            . #1=(|ODEPRIM;denomLODE;LFU;18|))
      (EXIT
       (COND
        ((SPADCALL |g| (QREFELT $ 88))
         (CONS 0 (|ODEPRIM;hdenom| |l| |d| (|spadConstant| $ 39) $)))
        (#2='T
         (SEQ
          (LETT |h|
                (|ODEPRIM;separateZeros| |d|
                 (LETT |e| (SPADCALL |g| (QREFELT $ 89)) . #1#) $)
                . #1#)
          (LETT |n| (SPADCALL |l| (QREFELT $ 69)) . #1#)
          (EXIT
           (COND
            ((QEQCAR
              (SPADCALL |e| (SPADCALL |h| (+ |n| 1) (QREFELT $ 52))
                        (QREFELT $ 55))
              1)
             (CONS 1 "failed"))
            (#2# (CONS 0 (|ODEPRIM;denom0| |n| |l| |d| |e| |h| $))))))))))))) 

(DEFUN |ODEPRIM;denomLODE;LLUP;19| (|l| |lg| $)
  (PROG (|h| |e| #1=#:G224 #2=#:G223 #3=#:G225 #4=#:G229 |g| |d| #5=#:G221)
    (RETURN
     (SEQ
      (COND
       ((NULL |lg|)
        (PROG2
            (LETT #5# (SPADCALL |l| (|spadConstant| $ 92) (QREFELT $ 91))
                  . #6=(|ODEPRIM;denomLODE;LLUP;19|))
            (QCDR #5#)
          (|check_union| (QEQCAR #5# 0) (QREFELT $ 7) #5#)))
       (#7='T
        (SEQ (LETT |d| (SPADCALL |l| (QREFELT $ 17)) . #6#)
             (LETT |h|
                   (|ODEPRIM;separateZeros| |d|
                    (LETT |e|
                          (PROGN
                           (LETT #1# NIL . #6#)
                           (SEQ (LETT |g| NIL . #6#) (LETT #4# |lg| . #6#) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |g| (CAR #4#) . #6#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #3# (SPADCALL |g| (QREFELT $ 89))
                                         . #6#)
                                   (COND
                                    (#1#
                                     (LETT #2#
                                           (SPADCALL #2# #3# (QREFELT $ 93))
                                           . #6#))
                                    ('T
                                     (PROGN
                                      (LETT #2# #3# . #6#)
                                      (LETT #1# 'T . #6#)))))))
                                (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                                (EXIT NIL))
                           (COND (#1# #2#) (#7# (|spadConstant| $ 23))))
                          . #6#)
                    $)
                   . #6#)
             (EXIT
              (|ODEPRIM;denom0| (SPADCALL |l| (QREFELT $ 69)) |l| |d| |e| |h|
               $))))))))) 

(DEFUN |PrimitiveRatDE| (&REST #1=#:G230)
  (PROG ()
    (RETURN
     (PROG (#2=#:G231)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PrimitiveRatDE|)
                                           '|domainEqualList|)
                . #3=(|PrimitiveRatDE|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PrimitiveRatDE;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|PrimitiveRatDE|))))))))))) 

(DEFUN |PrimitiveRatDE;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PrimitiveRatDE|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|PrimitiveRatDE| DV$1 DV$2 DV$3 DV$4) . #1#)
      (LETT $ (GETREFV 95) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PrimitiveRatDE|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
      $)))) 

(MAKEPROP '|PrimitiveRatDE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . D) '|diff| (4 . |coerce|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 7 13) (9 . |map|)
              (15 . |leadingCoefficient|)
              (|Record| (|:| |center| 7) (|:| |equation| 7)) (|List| 18)
              |ODEPRIM;indicialEquations;LUPL;17|
              |ODEPRIM;indicialEquations;LL;2| (20 . |One|) (24 . |One|)
              (|NonNegativeInteger|) (28 . |monomial|) (34 . -)
              |ODEPRIM;indicialEquation;LFUP;3| (|List| 35)
              (40 . |coefficients|) (|Record| (|:| |num| 76) (|:| |den| 7))
              (|InnerCommonDenominator| 7 35 76 28) (45 . |splitDenominator|)
              (|List| $) (50 . |gcd|) (|Fraction| 7) (55 . /) (61 . |Zero|)
              (65 . |Zero|) (69 . |Zero|) (73 . |Zero|) (|Boolean|) (77 . ~=)
              (83 . |leadingCoefficient|) (88 . *) (94 . |retract|)
              (99 . |degree|) (104 . |monomial|) (110 . +) (116 . |reductum|)
              (|Record| (|:| |eq| 8) (|:| |rh| 28))
              |ODEPRIM;splitDenominator;LQLR;4| (121 . ^) (127 . |order|)
              (|Union| $ '"failed") (133 . |exquo|) (139 . *) (145 . |rem|)
              |ODEPRIM;indicialEquations;LQL;6|
              |ODEPRIM;indicialEquations;LQUPL;7|
              |ODEPRIM;indicialEquation;LQFUP;8| (|Integer|) (151 . |coerce|)
              (156 . |elt|) (162 . |Zero|) (166 . *) (172 . +)
              (178 . |resultant|) (184 . |primitivePart|) (189 . |degree|)
              (194 . |reductum|) (199 . ~=) (205 . >) (|BoundIntegerRoots| 6 7)
              (211 . |integerBound|) (216 . |zero?|) (|List| 7)
              (221 . |coefficients|) (|Factored| 7)
              (|BalancedFactorisation| 6 7) (226 . |balancedFactorisation|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 61)) (|List| 81)
              (232 . |factors|) (237 . |balancedFactorisation|) (243 . |Zero|)
              (247 . |squareFreePart|) (252 . |gcd|) (258 . |zero?|)
              (263 . |denom|) (|Union| 7 '"failed") |ODEPRIM;denomLODE;LFU;18|
              (268 . |Zero|) (272 . |lcm|) |ODEPRIM;denomLODE;LLUP;19|)
           '#(|splitDenominator| 278 |indicialEquations| 284 |indicialEquation|
              306 |denomLODE| 318)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 94
                                                 '(0 8 0 10 1 7 0 6 12 2 15 13
                                                   14 7 16 1 8 7 0 17 0 6 0 22
                                                   0 7 0 23 2 7 0 6 24 25 2 7 0
                                                   0 0 26 1 9 28 0 29 1 31 30
                                                   28 32 1 7 0 33 34 2 35 0 7 7
                                                   36 0 8 0 37 0 6 0 38 0 7 0
                                                   39 0 9 0 40 2 9 41 0 0 42 1
                                                   9 35 0 43 2 35 0 0 0 44 1 35
                                                   7 0 45 1 9 24 0 46 2 8 0 7
                                                   24 47 2 8 0 0 0 48 1 9 0 0
                                                   49 2 7 0 0 24 52 2 7 24 0 0
                                                   53 2 7 54 0 0 55 2 7 0 0 0
                                                   56 2 7 0 0 0 57 1 6 0 61 62
                                                   2 8 7 0 7 63 0 13 0 64 2 13
                                                   0 7 0 65 2 13 0 0 0 66 2 13
                                                   7 0 0 67 1 7 0 0 68 1 8 24 0
                                                   69 1 8 0 0 70 2 8 41 0 0 71
                                                   2 61 41 0 0 72 1 73 61 7 74
                                                   1 7 41 0 75 1 8 76 0 77 2 79
                                                   78 7 76 80 1 78 82 0 83 2 79
                                                   78 7 7 84 0 78 0 85 1 7 0 0
                                                   86 2 7 0 0 0 87 1 35 41 0 88
                                                   1 35 7 0 89 0 35 0 92 2 7 0
                                                   0 0 93 2 0 50 9 28 51 2 0 19
                                                   8 7 20 1 0 19 8 21 1 0 19 9
                                                   58 2 0 19 9 7 59 2 0 7 8 6
                                                   27 2 0 7 9 6 60 2 0 7 8 28
                                                   94 2 0 90 8 35 91)))))
           '|lookupComplete|)) 
