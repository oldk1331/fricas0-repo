
(/VERSIONCHECK 2) 

(DEFUN |DEGRED;degrees| (|u| $)
  (PROG (|l|)
    (RETURN
     (SEQ (LETT |l| NIL . #1=(|DEGRED;degrees|))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |u| (|spadConstant| $ 11) (QREFELT $ 13)))
                 (GO G191)))
               (SEQ (LETT |l| (CONS (SPADCALL |u| (QREFELT $ 15)) |l|) . #1#)
                    (EXIT (LETT |u| (SPADCALL |u| (QREFELT $ 16)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |l|))))) 

(DEFUN |DEGRED;reduce;SupR;2| (|u| $)
  (PROG (#1=#:G144 #2=#:G141 #3=#:G139 |g| #4=#:G133 #5=#:G132 #6=#:G134
         #7=#:G148 |d|)
    (RETURN
     (SEQ
      (LETT |g|
            (PROGN
             (LETT #4# NIL . #8=(|DEGRED;reduce;SupR;2|))
             (SEQ (LETT |d| NIL . #8#)
                  (LETT #7# (|DEGRED;degrees| |u| $) . #8#) G190
                  (COND
                   ((OR (ATOM #7#) (PROGN (LETT |d| (CAR #7#) . #8#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #6# |d| . #8#)
                     (COND (#4# (LETT #5# (GCD #5# #6#) . #8#))
                           ('T
                            (PROGN
                             (LETT #5# #6# . #8#)
                             (LETT #4# 'T . #8#)))))))
                  (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
             (COND (#4# #5#) ('T 0)))
            . #8#)
      (LETT |u|
            (PROG2
                (LETT #2#
                      (SPADCALL |u|
                                (PROG1 (LETT #3# |g| . #8#)
                                  (|check_subtype| (> #3# 0)
                                                   '(|PositiveInteger|) #3#))
                                (QREFELT $ 18))
                      . #8#)
                (QCDR #2#)
              (|check_union| (QEQCAR #2# 0)
                             (|SparseUnivariatePolynomial| (QREFELT $ 6)) #2#))
            . #8#)
      (EXIT
       (CONS |u|
             (PROG1 (LETT #1# |g| . #8#)
               (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#)))))))) 

(DEFUN |DEGRED;rootOfUnity| (|j| |n| $)
  (PROG (|arg|)
    (RETURN
     (SEQ
      (COND ((EQL |j| 0) (|spadConstant| $ 22))
            ('T
             (SEQ
              (LETT |arg|
                    (SPADCALL
                     (SPADCALL (SPADCALL 2 |j| (QREFELT $ 25))
                               (SPADCALL (QREFELT $ 26)) (QREFELT $ 27))
                     (SPADCALL |n| (QREFELT $ 28)) (QREFELT $ 29))
                    |DEGRED;rootOfUnity|)
              (EXIT
               (SPADCALL (SPADCALL |arg| (QREFELT $ 30))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 22) (QREFELT $ 37))
                           (SPADCALL 1 2 (QREFELT $ 36)) (QREFELT $ 40))
                          (SPADCALL |arg| (QREFELT $ 41)) (QREFELT $ 42))
                         (QREFELT $ 43)))))))))) 

(DEFUN |DEGRED;expand;EPiL;4| (|s| |g| $)
  (PROG (#1=#:G154 |i| #2=#:G153)
    (RETURN
     (SEQ
      (COND ((EQL |g| 1) (LIST |s|))
            ('T
             (PROGN
              (LETT #2# NIL . #3=(|DEGRED;expand;EPiL;4|))
              (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |g| 1) . #3#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #2#
                           (CONS
                            (SPADCALL (|DEGRED;rootOfUnity| |i| |g| $)
                                      (SPADCALL |s|
                                                (SPADCALL 1 |g| (QREFELT $ 36))
                                                (QREFELT $ 40))
                                      (QREFELT $ 42))
                            #2#)
                           . #3#)))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))))))) 

(DECLAIM (NOTINLINE |DegreeReductionPackage;|)) 

(DEFUN |DegreeReductionPackage| (&REST #1=#:G155)
  (PROG ()
    (RETURN
     (PROG (#2=#:G156)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|DegreeReductionPackage|)
                                           '|domainEqualList|)
                . #3=(|DegreeReductionPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |DegreeReductionPackage;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|DegreeReductionPackage|))))))))))) 

(DEFUN |DegreeReductionPackage;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|DegreeReductionPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|DegreeReductionPackage| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 46) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|DegreeReductionPackage|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|DegreeReductionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |Zero|) (4 . |Zero|) (|SparseUnivariatePolynomial| 6)
              (8 . |Zero|) (|Boolean|) (12 . ~=) (|NonNegativeInteger|)
              (18 . |degree|) (23 . |reductum|) (|Union| $ '"failed")
              (28 . |divideExponents|) (|Record| (|:| |pol| 10) (|:| |deg| 23))
              |DEGRED;reduce;SupR;2| (|Expression| 7) (34 . |One|)
              (|PositiveInteger|) (|Integer|) (38 . *) (44 . |pi|) (48 . *)
              (54 . |coerce|) (59 . /) (65 . |cos|) (70 . |One|) (74 . |One|)
              (78 . -) (83 . -) (|Fraction| 24) (88 . /) (94 . -)
              (|SparseMultivariatePolynomial| 7 (|Kernel| 21)) (99 . |One|)
              (103 . ^) (109 . |sin|) (114 . *) (120 . +) (|List| 21)
              |DEGRED;expand;EPiL;4|)
           '#(|reduce| 126 |expand| 131) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 45
                                                 '(0 6 0 8 0 7 0 9 0 10 0 11 2
                                                   10 12 0 0 13 1 10 14 0 15 1
                                                   10 0 0 16 2 10 17 0 14 18 0
                                                   21 0 22 2 24 0 23 0 25 0 21
                                                   0 26 2 21 0 24 0 27 1 21 0
                                                   24 28 2 21 0 0 0 29 1 21 0 0
                                                   30 0 6 0 31 0 7 0 32 1 7 0 0
                                                   33 1 6 0 0 34 2 35 0 24 24
                                                   36 1 21 0 0 37 0 38 0 39 2
                                                   21 0 0 35 40 1 21 0 0 41 2
                                                   21 0 0 0 42 2 21 0 0 0 43 1
                                                   0 19 10 20 2 0 44 21 23
                                                   45)))))
           '|lookupComplete|)) 
