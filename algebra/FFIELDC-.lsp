
(/VERSIONCHECK 2) 

(DEFUN |FFIELDC-;differentiate;2S;1| (|x| $) (|spadConstant| $ 7)) 

(DEFUN |FFIELDC-;init;S;2| ($) (|spadConstant| $ 7)) 

(DEFUN |FFIELDC-;nextItem;SU;3| (|a| $)
  (COND
   ((SPADCALL
     (LETT |a| (SPADCALL (+ (SPADCALL |a| (QREFELT $ 11)) 1) (QREFELT $ 12))
           |FFIELDC-;nextItem;SU;3|)
     (QREFELT $ 14))
    (CONS 1 "failed"))
   ('T (CONS 0 |a|)))) 

(DEFUN |FFIELDC-;order;SOpc;4| (|e| $)
  (SPADCALL (SPADCALL |e| (QREFELT $ 17)) (QREFELT $ 20))) 

(DEFUN |FFIELDC-;conditionP;MU;5| (|mat| $)
  (PROG (|l|)
    (RETURN
     (SEQ (LETT |l| (SPADCALL |mat| (QREFELT $ 24)) |FFIELDC-;conditionP;MU;5|)
          (EXIT
           (COND ((NULL |l|) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (SPADCALL (ELT $ 25) (|SPADfirst| |l|)
                                  (QREFELT $ 28)))))))))) 

(DEFUN |FFIELDC-;charthRoot;2S;6| (|x| $)
  (SPADCALL |x| (QUOTIENT2 (SPADCALL (QREFELT $ 33)) (SPADCALL (QREFELT $ 34)))
            (QREFELT $ 35))) 

(DEFUN |FFIELDC-;charthRoot;SU;7| (|x| $)
  (CONS 0 (SPADCALL |x| (QREFELT $ 25)))) 

(DEFUN |FFIELDC-;createPrimitiveElement;S;8| ($)
  (PROG (|found| |e| #1=#:G180 |i| |start| |sm1|)
    (RETURN
     (SEQ
      (LETT |sm1| (- (SPADCALL (QREFELT $ 33)) 1)
            . #2=(|FFIELDC-;createPrimitiveElement;S;8|))
      (LETT |start|
            (COND
             ((SPADCALL (SPADCALL (QREFELT $ 39)) (CONS 1 "polynomial")
                        (QREFELT $ 40))
              (SPADCALL (QREFELT $ 34)))
             ('T 1))
            . #2#)
      (LETT |found| 'NIL . #2#)
      (SEQ (LETT |i| |start| . #2#) G190
           (COND ((NULL (COND (|found| 'NIL) ('T 'T))) (GO G191)))
           (SEQ
            (LETT |e|
                  (SPADCALL
                   (PROG1 (LETT #1# |i| . #2#)
                     (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
                   (QREFELT $ 12))
                  . #2#)
            (EXIT
             (LETT |found| (EQL (SPADCALL |e| (QREFELT $ 17)) |sm1|) . #2#)))
           (LETT |i| (+ |i| 1) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |e|))))) 

(DEFUN |FFIELDC-;primitive?;SB;9| (|a| $)
  (PROG (|equalone| #1=#:G190 |exp| |q| |explist|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |a| (QREFELT $ 14)) 'NIL)
            (#2='T
             (SEQ
              (LETT |explist| (SPADCALL (QREFELT $ 44))
                    . #3=(|FFIELDC-;primitive?;SB;9|))
              (LETT |q| (- (SPADCALL (QREFELT $ 33)) 1) . #3#)
              (LETT |equalone| 'NIL . #3#)
              (SEQ (LETT |exp| NIL . #3#) (LETT #1# |explist| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |exp| (CAR #1#) . #3#) NIL)
                         (NULL (COND (|equalone| 'NIL) ('T 'T))))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |equalone|
                           (SPADCALL
                            (SPADCALL |a| (QUOTIENT2 |q| (QCAR |exp|))
                                      (QREFELT $ 45))
                            (|spadConstant| $ 46) (QREFELT $ 47))
                           . #3#)))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT (COND (|equalone| 'NIL) (#2# 'T)))))))))) 

(DEFUN |FFIELDC-;order;SPi;10| (|e| $)
  (PROG (|ord| |goon| |a| #1=#:G199 |j| |primeDivisor| #2=#:G198 |rec| |lof|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |e| (|spadConstant| $ 7) (QREFELT $ 47))
        (|error| "order(0) is not defined "))
       ('T
        (SEQ
         (LETT |ord| (- (SPADCALL (QREFELT $ 33)) 1)
               . #3=(|FFIELDC-;order;SPi;10|))
         (LETT |a| 0 . #3#) (LETT |lof| (SPADCALL (QREFELT $ 44)) . #3#)
         (SEQ (LETT |rec| NIL . #3#) (LETT #2# |lof| . #3#) G190
              (COND
               ((OR (ATOM #2#) (PROGN (LETT |rec| (CAR #2#) . #3#) NIL))
                (GO G191)))
              (SEQ
               (LETT |a|
                     (QUOTIENT2 |ord| (LETT |primeDivisor| (QCAR |rec|) . #3#))
                     . #3#)
               (LETT |goon|
                     (SPADCALL (SPADCALL |e| |a| (QREFELT $ 45))
                               (|spadConstant| $ 46) (QREFELT $ 47))
                     . #3#)
               (SEQ (LETT |j| 0 . #3#) (LETT #1# (- (QCDR |rec|) 2) . #3#) G190
                    (COND
                     ((OR (|greater_SI| |j| #1#) (NULL |goon|)) (GO G191)))
                    (SEQ (LETT |ord| |a| . #3#)
                         (LETT |a| (QUOTIENT2 |ord| |primeDivisor|) . #3#)
                         (EXIT
                          (LETT |goon|
                                (SPADCALL (SPADCALL |e| |a| (QREFELT $ 45))
                                          (|spadConstant| $ 46) (QREFELT $ 47))
                                . #3#)))
                    (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
               (EXIT (COND (|goon| (LETT |ord| |a| . #3#)))))
              (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
         (EXIT |ord|)))))))) 

(DEFUN |FFIELDC-;discreteLog;SNni;11| (|b| $)
  (PROG (|a| |disclog| |mult| |c| |disc1| |found| |rho| |i| |end| |n|
         |exptable| |exp| #1=#:G217 |t| |fac| #2=#:G216 |f| |groupord| |gen|
         |faclist|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |b| (QREFELT $ 14))
        (|error| "discreteLog: logarithm of zero"))
       (#3='T
        (SEQ
         (LETT |faclist| (SPADCALL (QREFELT $ 44))
               . #4=(|FFIELDC-;discreteLog;SNni;11|))
         (LETT |a| |b| . #4#) (LETT |gen| (SPADCALL (QREFELT $ 50)) . #4#)
         (EXIT
          (COND ((SPADCALL |b| |gen| (QREFELT $ 47)) 1)
                (#3#
                 (SEQ (LETT |disclog| 0 . #4#) (LETT |mult| 1 . #4#)
                      (LETT |groupord| (- (SPADCALL (QREFELT $ 33)) 1) . #4#)
                      (LETT |exp| |groupord| . #4#)
                      (SEQ (LETT |f| NIL . #4#) (LETT #2# |faclist| . #4#) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |f| (CAR #2#) . #4#) NIL))
                             (GO G191)))
                           (SEQ (LETT |fac| (QCAR |f|) . #4#)
                                (EXIT
                                 (SEQ (LETT |t| 0 . #4#)
                                      (LETT #1# (- (QCDR |f|) 1) . #4#) G190
                                      (COND ((|greater_SI| |t| #1#) (GO G191)))
                                      (SEQ
                                       (LETT |exp| (QUOTIENT2 |exp| |fac|)
                                             . #4#)
                                       (LETT |exptable|
                                             (SPADCALL |fac| (QREFELT $ 52))
                                             . #4#)
                                       (LETT |n|
                                             (SPADCALL |exptable|
                                                       (QREFELT $ 53))
                                             . #4#)
                                       (LETT |c|
                                             (SPADCALL |a| |exp|
                                                       (QREFELT $ 45))
                                             . #4#)
                                       (LETT |end| (QUOTIENT2 (- |fac| 1) |n|)
                                             . #4#)
                                       (LETT |found| 'NIL . #4#)
                                       (LETT |disc1| 0 . #4#)
                                       (SEQ (LETT |i| 0 . #4#) G190
                                            (COND
                                             ((OR (|greater_SI| |i| |end|)
                                                  (NULL
                                                   (COND (|found| 'NIL)
                                                         ('T 'T))))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |rho|
                                                   (SPADCALL
                                                    (SPADCALL |c|
                                                              (QREFELT $ 11))
                                                    |exptable| (QREFELT $ 55))
                                                   . #4#)
                                             (EXIT
                                              (COND
                                               ((QEQCAR |rho| 0)
                                                (SEQ (LETT |found| 'T . #4#)
                                                     (EXIT
                                                      (LETT |disc1|
                                                            (*
                                                             (+ (* |n| |i|)
                                                                (QCDR |rho|))
                                                             |mult|)
                                                            . #4#))))
                                               ('T
                                                (LETT |c|
                                                      (SPADCALL |c|
                                                                (SPADCALL |gen|
                                                                          (*
                                                                           (QUOTIENT2
                                                                            |groupord|
                                                                            |fac|)
                                                                           (-
                                                                            |n|))
                                                                          (QREFELT
                                                                           $
                                                                           45))
                                                                (QREFELT $ 56))
                                                      . #4#)))))
                                            (LETT |i| (|inc_SI| |i|) . #4#)
                                            (GO G190) G191 (EXIT NIL))
                                       (EXIT
                                        (COND
                                         (|found|
                                          (SEQ
                                           (LETT |mult| (* |mult| |fac|) . #4#)
                                           (LETT |disclog|
                                                 (+ |disclog| |disc1|) . #4#)
                                           (EXIT
                                            (LETT |a|
                                                  (SPADCALL |a|
                                                            (SPADCALL |gen|
                                                                      (-
                                                                       |disc1|)
                                                                      (QREFELT
                                                                       $ 45))
                                                            (QREFELT $ 56))
                                                  . #4#))))
                                         ('T
                                          (|error|
                                           "discreteLog: ?? discrete logarithm")))))
                                      (LETT |t| (|inc_SI| |t|) . #4#) (GO G190)
                                      G191 (EXIT NIL))))
                           (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT |disclog|)))))))))))) 

(DEFUN |FFIELDC-;discreteLog;2SU;12| (|logbase| |b| $)
  (PROG (|a| |mult| |disclog| |rho| #1=#:G237 |rhoHelp| |exp| #2=#:G239 |t|
         |primroot| |fac| #3=#:G238 |f| |faclist| |groupord|)
    (RETURN
     (SEQ
      (EXIT
       (COND
        ((SPADCALL |b| (QREFELT $ 14))
         (SEQ (SPADCALL "discreteLog: logarithm of zero" (QREFELT $ 61))
              (EXIT (CONS 1 "failed"))))
        ((SPADCALL |logbase| (QREFELT $ 14))
         (SEQ (SPADCALL "discreteLog: logarithm to base zero" (QREFELT $ 61))
              (EXIT (CONS 1 "failed"))))
        ((SPADCALL |b| |logbase| (QREFELT $ 47)) (CONS 0 1))
        ('T
         (COND
          ((NULL
            (ZEROP
             (REM
              (LETT |groupord| (SPADCALL |logbase| (QREFELT $ 17))
                    . #4=(|FFIELDC-;discreteLog;2SU;12|))
              (SPADCALL |b| (QREFELT $ 17)))))
           (SEQ
            (SPADCALL
             "discreteLog: second argument not in cyclic group generated by first argument"
             (QREFELT $ 61))
            (EXIT (CONS 1 "failed"))))
          ('T
           (SEQ
            (LETT |faclist|
                  (SPADCALL (SPADCALL |groupord| (QREFELT $ 63))
                            (QREFELT $ 65))
                  . #4#)
            (LETT |a| |b| . #4#) (LETT |disclog| 0 . #4#) (LETT |mult| 1 . #4#)
            (LETT |exp| |groupord| . #4#)
            (SEQ (LETT |f| NIL . #4#) (LETT #3# |faclist| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |f| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ (LETT |fac| (QCAR |f|) . #4#)
                      (LETT |primroot|
                            (SPADCALL |logbase| (QUOTIENT2 |groupord| |fac|)
                                      (QREFELT $ 45))
                            . #4#)
                      (EXIT
                       (SEQ (LETT |t| 0 . #4#)
                            (LETT #2# (- (QCDR |f|) 1) . #4#) G190
                            (COND ((|greater_SI| |t| #2#) (GO G191)))
                            (SEQ (LETT |exp| (QUOTIENT2 |exp| |fac|) . #4#)
                                 (LETT |rhoHelp|
                                       (SPADCALL |primroot|
                                                 (SPADCALL |a| |exp|
                                                           (QREFELT $ 45))
                                                 |fac| (QREFELT $ 67))
                                       . #4#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |rhoHelp| 1)
                                    (PROGN
                                     (LETT #1# (CONS 1 "failed") . #4#)
                                     (GO #1#)))
                                   ('T
                                    (SEQ
                                     (LETT |rho|
                                           (SPADCALL (QCDR |rhoHelp|) |mult|
                                                     (QREFELT $ 68))
                                           . #4#)
                                     (LETT |disclog| (+ |disclog| |rho|) . #4#)
                                     (LETT |mult| (* |mult| |fac|) . #4#)
                                     (EXIT
                                      (LETT |a|
                                            (SPADCALL |a|
                                                      (SPADCALL |logbase|
                                                                (- |rho|)
                                                                (QREFELT $ 45))
                                                      (QREFELT $ 56))
                                            . #4#)))))))
                            (LETT |t| (|inc_SI| |t|) . #4#) (GO G190) G191
                            (EXIT NIL))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |disclog|))))))))
      #1# (EXIT #1#))))) 

(DEFUN |FFIELDC-;squareFreePolynomial| (|f| $) (SPADCALL |f| (QREFELT $ 73))) 

(DEFUN |FFIELDC-;factorPolynomial| (|f| $) (SPADCALL |f| (QREFELT $ 75))) 

(DEFUN |FFIELDC-;factorSquareFreePolynomial| (|f| $)
  (PROG (#1=#:G248 #2=#:G247 #3=#:G249 #4=#:G252 |u| |flist|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |f| (|spadConstant| $ 76) (QREFELT $ 77))
        (|spadConstant| $ 78))
       (#5='T
        (SEQ
         (LETT |flist| (SPADCALL |f| 'T (QREFELT $ 81))
               . #6=(|FFIELDC-;factorSquareFreePolynomial|))
         (EXIT
          (SPADCALL (SPADCALL (QCAR |flist|) (QREFELT $ 82))
                    (PROGN
                     (LETT #1# NIL . #6#)
                     (SEQ (LETT |u| NIL . #6#) (LETT #4# (QCDR |flist|) . #6#)
                          G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |u| (CAR #4#) . #6#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3#
                                   (SPADCALL (QCAR |u|) (QCDR |u|)
                                             (QREFELT $ 83))
                                   . #6#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #3# (QREFELT $ 84))
                                     . #6#))
                              ('T
                               (PROGN
                                (LETT #2# #3# . #6#)
                                (LETT #1# 'T . #6#)))))))
                          (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) (#5# (|spadConstant| $ 85))))
                    (QREFELT $ 86)))))))))) 

(DEFUN |FFIELDC-;gcdPolynomial;3Sup;16| (|f| |g| $)
  (SPADCALL |f| |g| (QREFELT $ 88))) 

(DEFUN |FiniteFieldCategory&| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FiniteFieldCategory&|))
      (LETT |dv$| (LIST '|FiniteFieldCategory&| DV$1) . #1#)
      (LETT $ (GETREFV 91) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|FiniteFieldCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|)
              |FFIELDC-;differentiate;2S;1| |FFIELDC-;init;S;2|
              (|PositiveInteger|) (4 . |lookup|) (9 . |index|) (|Boolean|)
              (14 . |zero?|) (|Union| $ '"failed") |FFIELDC-;nextItem;SU;3|
              (19 . |order|) (|Integer|) (|OnePointCompletion| 10)
              (24 . |coerce|) |FFIELDC-;order;SOpc;4| (|List| 27) (|Matrix| 6)
              (29 . |nullSpace|) (34 . |charthRoot|) (|Mapping| 6 6)
              (|Vector| 6) (39 . |map|) (|Union| (|Vector| $) '"failed")
              (|Matrix| $) |FFIELDC-;conditionP;MU;5| (|NonNegativeInteger|)
              (45 . |size|) (49 . |characteristic|) (53 . ^)
              |FFIELDC-;charthRoot;2S;6| |FFIELDC-;charthRoot;SU;7|
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (59 . |representationType|) (63 . =)
              |FFIELDC-;createPrimitiveElement;S;8|
              (|Record| (|:| |factor| 18) (|:| |exponent| 18)) (|List| 42)
              (69 . |factorsOfCyclicGroupSize|) (73 . ^) (79 . |One|) (83 . =)
              |FFIELDC-;primitive?;SB;9| |FFIELDC-;order;SPi;10|
              (89 . |primitiveElement|) (|Table| 10 32)
              (93 . |tableForDiscreteLogarithm|) (98 . |#|)
              (|Union| 32 '"failed") (103 . |search|) (109 . *)
              |FFIELDC-;discreteLog;SNni;11| (|Void|) (|String|) (|OutputForm|)
              (115 . |messagePrint|) (|Factored| $) (120 . |factor|)
              (|Factored| 18) (125 . |factors|) (|DiscreteLogarithmPackage| 6)
              (130 . |shanksDiscLogAlgorithm|) (137 . *)
              |FFIELDC-;discreteLog;2SU;12| (|Factored| 71)
              (|SparseUnivariatePolynomial| 6)
              (|UnivariatePolynomialSquareFree| 6 71) (143 . |squareFree|)
              (|DistinctDegreeFactorize| 6 71) (148 . |factor|) (153 . |Zero|)
              (157 . =) (163 . |Zero|) (|Record| (|:| |irr| 71) (|:| |pow| 18))
              (|Record| (|:| |cont| 6) (|:| |factors| (|List| 79)))
              (167 . |distdfact|) (173 . |coerce|) (178 . |primeFactor|)
              (184 . *) (190 . |One|) (194 . *) (|EuclideanDomain&| 71)
              (200 . |gcd|) (|SparseUnivariatePolynomial| $)
              |FFIELDC-;gcdPolynomial;3Sup;16|)
           '#(|primitive?| 206 |order| 211 |nextItem| 221 |init| 226
              |gcdPolynomial| 230 |discreteLog| 236 |differentiate| 247
              |createPrimitiveElement| 252 |conditionP| 256 |charthRoot| 261)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 90
                                                 '(0 6 0 7 1 6 10 0 11 1 6 0 10
                                                   12 1 6 13 0 14 1 6 10 0 17 1
                                                   19 0 18 20 1 23 22 0 24 1 6
                                                   0 0 25 2 27 0 26 0 28 0 6 32
                                                   33 0 6 32 34 2 6 0 0 32 35 0
                                                   6 38 39 2 38 13 0 0 40 0 6
                                                   43 44 2 6 0 0 18 45 0 6 0 46
                                                   2 6 13 0 0 47 0 6 0 50 1 6
                                                   51 18 52 1 51 32 0 53 2 51
                                                   54 10 0 55 2 6 0 0 0 56 1 60
                                                   58 59 61 1 18 62 0 63 1 64
                                                   43 0 65 3 66 54 6 6 32 67 2
                                                   18 0 32 0 68 1 72 70 71 73 1
                                                   74 70 71 75 0 71 0 76 2 71
                                                   13 0 0 77 0 70 0 78 2 74 80
                                                   71 13 81 1 71 0 6 82 2 70 0
                                                   71 18 83 2 70 0 0 0 84 0 70
                                                   0 85 2 70 0 71 0 86 2 87 0 0
                                                   0 88 1 0 13 0 48 1 0 10 0 49
                                                   1 0 19 0 21 1 0 15 0 16 0 0
                                                   0 9 2 0 89 89 89 90 1 0 32 0
                                                   57 2 0 54 0 0 69 1 0 0 0 8 0
                                                   0 0 41 1 0 29 30 31 1 0 0 0
                                                   36 1 0 15 0 37)))))
           '|lookupComplete|)) 
