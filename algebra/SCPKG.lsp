
(/VERSIONCHECK 2) 

(DEFUN |SCPKG;matrix2Vector| (|m| $)
  (PROG (|li| |lili|)
    (RETURN
     (SEQ
      (LETT |lili| (SPADCALL |m| (QREFELT $ 9)) . #1=(|SCPKG;matrix2Vector|))
      (LETT |li| (SPADCALL (ELT $ 11) |lili| (QREFELT $ 13)) . #1#)
      (EXIT (SPADCALL |li| (QREFELT $ 15))))))) 

(DEFUN |SCPKG;coordinates;MLV;2| (|x| |b| $)
  (PROG (#1=#:G147 |res| |i| |transitionMatrix| |n| |m| #2=#:G142)
    (RETURN
     (SEQ
      (LETT |m|
            (PROG1
                (LETT #2# (SPADCALL |b| (QREFELT $ 18))
                      . #3=(|SCPKG;coordinates;MLV;2|))
              (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
            . #3#)
      (LETT |n|
            (* (QVSIZE (SPADCALL |b| 1 (QREFELT $ 20)))
               (SPADCALL (SPADCALL |b| 1 (QREFELT $ 20)) (QREFELT $ 22)))
            . #3#)
      (LETT |transitionMatrix|
            (SPADCALL |n| |m| (|spadConstant| $ 23) (QREFELT $ 24)) . #3#)
      (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |m|) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |transitionMatrix| |i|
                       (|SCPKG;matrix2Vector| (SPADCALL |b| |i| (QREFELT $ 20))
                        $)
                       (QREFELT $ 25))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (LETT |res|
            (SPADCALL |transitionMatrix| (|SCPKG;matrix2Vector| |x| $)
                      (QREFELT $ 29))
            . #3#)
      (COND
       ((NULL (NULL (QCDR |res|)))
        (|error| "coordinates: the second argument is linearly dependent")))
      (EXIT
       (COND
        ((QEQCAR (QCAR |res|) 1)
         (|error|
          "coordinates: first argument is not in linear span of second argument"))
        ('T
         (PROG2 (LETT #1# (QCAR |res|) . #3#)
             (QCDR #1#)
           (|check_union| (QEQCAR #1# 0) (|Vector| (QREFELT $ 6)) #1#))))))))) 

(DEFUN |SCPKG;structuralConstants;LV;3| (|b| $)
  (PROG (|k| |covec| |j| |i| |sC| #1=#:G159 #2=#:G160 |m| #3=#:G151)
    (RETURN
     (SEQ
      (LETT |m|
            (PROG1
                (LETT #3# (SPADCALL |b| (QREFELT $ 18))
                      . #4=(|SCPKG;structuralConstants;LV;3|))
              (|check_subtype| (>= #3# 0) '(|NonNegativeInteger|) #3#))
            . #4#)
      (LETT |sC|
            (PROGN
             (LETT #2# (GETREFV |m|) . #4#)
             (SEQ (LETT |k| 1 . #4#) (LETT #1# 0 . #4#) G190
                  (COND ((|greater_SI| |k| |m|) (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #2# #1#
                            (SPADCALL |m| |m| (|spadConstant| $ 23)
                                      (QREFELT $ 24)))))
                  (LETT #1#
                        (PROG1 (|inc_SI| #1#) (LETT |k| (|inc_SI| |k|) . #4#))
                        . #4#)
                  (GO G190) G191 (EXIT NIL))
             #2#)
            . #4#)
      (SEQ (LETT |i| 1 . #4#) G190 (COND ((|greater_SI| |i| |m|) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |j| 1 . #4#) G190
                  (COND ((|greater_SI| |j| |m|) (GO G191)))
                  (SEQ
                   (LETT |covec|
                         (SPADCALL
                          (SPADCALL (SPADCALL |b| |i| (QREFELT $ 20))
                                    (SPADCALL |b| |j| (QREFELT $ 20))
                                    (QREFELT $ 31))
                          |b| (QREFELT $ 30))
                         . #4#)
                   (EXIT
                    (SEQ (LETT |k| 1 . #4#) G190
                         (COND ((|greater_SI| |k| |m|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL (SPADCALL |sC| |k| (QREFELT $ 33)) |i| |j|
                                     (SPADCALL |covec| |k| (QREFELT $ 34))
                                     (QREFELT $ 35))))
                         (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191
                         (EXIT NIL))))
                  (LETT |j| (|inc_SI| |j|) . #4#) (GO G190) G191 (EXIT NIL))))
           (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
      (EXIT |sC|))))) 

(DEFUN |SCPKG;structuralConstants;LMV;4| (|ls| |mt| $)
  (PROG (|lscopy| |gamma| |c| |p| |j| |i| |s| |mat| |nn|)
    (RETURN
     (SEQ (LETT |nn| (LENGTH |ls|) . #1=(|SCPKG;structuralConstants;LMV;4|))
          (COND
           ((OR (SPADCALL (QVSIZE |mt|) |nn| (QREFELT $ 38))
                (SPADCALL (SPADCALL |mt| (QREFELT $ 40)) |nn| (QREFELT $ 38)))
            (EXIT
             (|error|
              "structuralConstants: size of second argument does not agree with number of generators"))))
          (LETT |gamma| NIL . #1#)
          (LETT |lscopy| (SPADCALL |ls| (QREFELT $ 42)) . #1#)
          (SEQ G190
               (COND ((NULL (COND ((NULL |lscopy|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ
                (LETT |mat|
                      (SPADCALL |nn| |nn| (|spadConstant| $ 44) (QREFELT $ 45))
                      . #1#)
                (LETT |s| (|SPADfirst| |lscopy|) . #1#)
                (SEQ (LETT |i| 1 . #1#) G190
                     (COND ((|greater_SI| |i| |nn|) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1 . #1#) G190
                            (COND ((|greater_SI| |j| |nn|) (GO G191)))
                            (SEQ (LETT |p| (QAREF2O |mt| |i| |j| 1 1) . #1#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL
                                     (SPADCALL |p| |ls| (QREFELT $ 46)) 1
                                     (QREFELT $ 47))
                                    (|error|
                                     "structuralConstants: entries of second argument must be linear polynomials in the generators"))
                                   ((SPADCALL
                                     (LETT |c|
                                           (SPADCALL |p| |s| 1 (QREFELT $ 49))
                                           . #1#)
                                     (|spadConstant| $ 44) (QREFELT $ 50))
                                    (QSETAREF2O |mat| |i| |j| |c| 1 1)))))
                            (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
                (LETT |gamma| (CONS |mat| |gamma|) . #1#)
                (EXIT (LETT |lscopy| (CDR |lscopy|) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (REVERSE |gamma|) (QREFELT $ 53))))))) 

(DEFUN |SCPKG;structuralConstants;LMV;5| (|ls| |mt| $)
  (PROG (|lscopy| |gamma| |c| |p| |q| |r| |j| |i| |s| |mat| |nn|)
    (RETURN
     (SEQ (LETT |nn| (LENGTH |ls|) . #1=(|SCPKG;structuralConstants;LMV;5|))
          (COND
           ((OR (SPADCALL (QVSIZE |mt|) |nn| (QREFELT $ 38))
                (SPADCALL (SPADCALL |mt| (QREFELT $ 56)) |nn| (QREFELT $ 38)))
            (EXIT
             (|error|
              "structuralConstants: size of second argument does not agree with number of generators"))))
          (LETT |gamma| NIL . #1#)
          (LETT |lscopy| (SPADCALL |ls| (QREFELT $ 42)) . #1#)
          (SEQ G190
               (COND ((NULL (COND ((NULL |lscopy|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ
                (LETT |mat|
                      (SPADCALL |nn| |nn| (|spadConstant| $ 58) (QREFELT $ 59))
                      . #1#)
                (LETT |s| (|SPADfirst| |lscopy|) . #1#)
                (SEQ (LETT |i| 1 . #1#) G190
                     (COND ((|greater_SI| |i| |nn|) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1 . #1#) G190
                            (COND ((|greater_SI| |j| |nn|) (GO G191)))
                            (SEQ (LETT |r| (QAREF2O |mt| |i| |j| 1 1) . #1#)
                                 (LETT |q| (SPADCALL |r| (QREFELT $ 60)) . #1#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL
                                     (SPADCALL |q| |ls| (QREFELT $ 46)) 0
                                     (QREFELT $ 38))
                                    (|error|
                                     "structuralConstants: entries of second argument must be (linear) polynomials in the generators"))
                                   ('T
                                    (SEQ
                                     (LETT |p| (SPADCALL |r| (QREFELT $ 61))
                                           . #1#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |p| |ls| (QREFELT $ 46)) 1
                                         (QREFELT $ 47))
                                        (|error|
                                         "structuralConstants: entries of second argument must be linear polynomials in the generators"))
                                       ((SPADCALL
                                         (LETT |c|
                                               (SPADCALL |p| |s| 1
                                                         (QREFELT $ 49))
                                               . #1#)
                                         (|spadConstant| $ 44) (QREFELT $ 50))
                                        (QSETAREF2O |mat| |i| |j|
                                                    (SPADCALL |c| |q|
                                                              (QREFELT $ 62))
                                                    1 1)))))))))
                            (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
                (LETT |gamma| (CONS |mat| |gamma|) . #1#)
                (EXIT (LETT |lscopy| (CDR |lscopy|) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (REVERSE |gamma|) (QREFELT $ 65))))))) 

(DECLAIM (NOTINLINE |StructuralConstantsPackage;|)) 

(DEFUN |StructuralConstantsPackage| (#1=#:G182)
  (PROG ()
    (RETURN
     (PROG (#2=#:G183)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|StructuralConstantsPackage|)
                                           '|domainEqualList|)
                . #3=(|StructuralConstantsPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|StructuralConstantsPackage;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|StructuralConstantsPackage|))))))))))) 

(DEFUN |StructuralConstantsPackage;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|StructuralConstantsPackage|))
      (LETT |dv$| (LIST '|StructuralConstantsPackage| DV$1) . #1#)
      (LETT $ (GETREFV 67) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|StructuralConstantsPackage| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|StructuralConstantsPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|List| 10) (|Matrix| 6)
              (0 . |listOfLists|) (|List| 6) (5 . |concat|)
              (|Mapping| 10 10 10) (11 . |reduce|) (|Vector| 6)
              (17 . |construct|) (|Integer|) (|List| 8) (22 . |maxIndex|)
              (27 . |One|) (31 . |elt|) (|NonNegativeInteger|) (37 . |ncols|)
              (42 . |Zero|) (46 . |new|) (53 . |setColumn!|)
              (|Union| 14 '"failed")
              (|Record| (|:| |particular| 26) (|:| |basis| (|List| 14)))
              (|LinearSystemMatrixPackage| 6 14 14 8) (60 . |solve|)
              |SCPKG;coordinates;MLV;2| (66 . *) (|Vector| 8) (72 . |elt|)
              (78 . |elt|) (84 . |setelt|) |SCPKG;structuralConstants;LV;3|
              (|Boolean|) (92 . ~=) (|Matrix| 43) (98 . |ncols|) (|List| 48)
              (103 . |copy|) (|Polynomial| 6) (108 . |Zero|) (112 . |new|)
              (119 . |totalDegree|) (125 . >) (|Symbol|) (131 . |coefficient|)
              (138 . ~=) (|List| 39) (|Vector| 39) (144 . |vector|)
              |SCPKG;structuralConstants;LMV;4| (|Matrix| 57) (149 . |ncols|)
              (|Fraction| 43) (154 . |Zero|) (158 . |new|) (165 . |denom|)
              (170 . |numer|) (175 . /) (|List| 55) (|Vector| 55)
              (181 . |vector|) |SCPKG;structuralConstants;LMV;5|)
           '#(|structuralConstants| 186 |coordinates| 203) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 66
                                                 '(1 8 7 0 9 2 10 0 0 0 11 2 7
                                                   10 12 0 13 1 14 0 10 15 1 17
                                                   16 0 18 0 6 0 19 2 17 8 0 16
                                                   20 1 8 21 0 22 0 6 0 23 3 8
                                                   0 21 21 6 24 3 8 0 0 16 14
                                                   25 2 28 27 8 14 29 2 8 0 0 0
                                                   31 2 32 8 0 16 33 2 14 6 0
                                                   16 34 4 8 6 0 16 16 6 35 2
                                                   21 37 0 0 38 1 39 21 0 40 1
                                                   41 0 0 42 0 43 0 44 3 39 0
                                                   21 21 43 45 2 43 21 0 41 46
                                                   2 21 37 0 0 47 3 43 0 0 48
                                                   21 49 2 43 37 0 0 50 1 52 0
                                                   51 53 1 55 21 0 56 0 57 0 58
                                                   3 55 0 21 21 57 59 1 57 43 0
                                                   60 1 57 43 0 61 2 57 0 43 43
                                                   62 1 64 0 63 65 2 0 52 41 39
                                                   54 2 0 64 41 55 66 1 0 32 17
                                                   36 2 0 14 8 17 30)))))
           '|lookupComplete|)) 
