
(DEFUN |SCPKG;matrix2Vector| (|m| $)
  (PROG (|li| |lili|)
    (RETURN
     (SEQ
      (LETT |lili| (SPADCALL |m| (QREFELT $ 9)) . #1=(|SCPKG;matrix2Vector|))
      (LETT |li| (SPADCALL (ELT $ 11) |lili| (QREFELT $ 13)) . #1#)
      (EXIT (SPADCALL |li| (QREFELT $ 15))))))) 

(DEFUN |SCPKG;coordinates;MLV;2| (|x| |b| $)
  (PROG (#1=#:G123 |res| |i| |transitionMatrix| |n| |m| #2=#:G118)
    (RETURN
     (SEQ
      (LETT |m|
            (PROG1
                (LETT #2# (SPADCALL |b| (QREFELT $ 18))
                      . #3=(|SCPKG;coordinates;MLV;2|))
              (|check_subtype| (>= #2# 0) '(|NonNegativeInteger|) #2#))
            . #3#)
      (LETT |n|
            (* (ANROWS (SPADCALL |b| 1 (QREFELT $ 20)))
               (ANCOLS (SPADCALL |b| 1 (QREFELT $ 20))))
            . #3#)
      (LETT |transitionMatrix| (MAKE_MATRIX1 |n| |m| (|spadConstant| $ 21))
            . #3#)
      (SEQ (LETT |i| 1 . #3#) G190 (COND ((|greater_SI| |i| |m|) (GO G191)))
           (SEQ
            (EXIT
             (SPADCALL |transitionMatrix| |i|
                       (|SCPKG;matrix2Vector| (SPADCALL |b| |i| (QREFELT $ 20))
                        $)
                       (QREFELT $ 22))))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (LETT |res|
            (SPADCALL |transitionMatrix| (|SCPKG;matrix2Vector| |x| $)
                      (QREFELT $ 26))
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
  (PROG (|k| |covec| |j| |i| |sC| #1=#:G135 #2=#:G136 |m| #3=#:G127)
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
                            (MAKE_MATRIX1 |m| |m| (|spadConstant| $ 21)))))
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
                                    (QREFELT $ 28))
                          |b| (QREFELT $ 27))
                         . #4#)
                   (EXIT
                    (SEQ (LETT |k| 1 . #4#) G190
                         (COND ((|greater_SI| |k| |m|) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL (SPADCALL |sC| |k| (QREFELT $ 30)) |i| |j|
                                     (SPADCALL |covec| |k| (QREFELT $ 31))
                                     (QREFELT $ 32))))
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
           ((OR (SPADCALL (ANROWS |mt|) |nn| (QREFELT $ 36))
                (SPADCALL (ANCOLS |mt|) |nn| (QREFELT $ 36)))
            (EXIT
             (|error|
              "structuralConstants: size of second argument does not agree with number of generators"))))
          (LETT |gamma| NIL . #1#)
          (LETT |lscopy| (SPADCALL |ls| (QREFELT $ 38)) . #1#)
          (SEQ G190
               (COND ((NULL (COND ((NULL |lscopy|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ
                (LETT |mat| (MAKE_MATRIX1 |nn| |nn| (|spadConstant| $ 40))
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
                                     (SPADCALL |p| |ls| (QREFELT $ 41)) 1
                                     (QREFELT $ 42))
                                    (|error|
                                     "structuralConstants: entries of second argument must be linear polynomials in the generators"))
                                   ((SPADCALL
                                     (LETT |c|
                                           (SPADCALL |p| |s| 1 (QREFELT $ 44))
                                           . #1#)
                                     (|spadConstant| $ 40) (QREFELT $ 45))
                                    (QSETAREF2O |mat| |i| |j| |c| 1 1)))))
                            (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
                (LETT |gamma| (CONS |mat| |gamma|) . #1#)
                (EXIT (LETT |lscopy| (CDR |lscopy|) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (REVERSE |gamma|) (QREFELT $ 48))))))) 

(DEFUN |SCPKG;structuralConstants;LMV;5| (|ls| |mt| $)
  (PROG (|lscopy| |gamma| |c| |p| |q| |r| |j| |i| |s| |mat| |nn|)
    (RETURN
     (SEQ (LETT |nn| (LENGTH |ls|) . #1=(|SCPKG;structuralConstants;LMV;5|))
          (COND
           ((OR (SPADCALL (ANROWS |mt|) |nn| (QREFELT $ 36))
                (SPADCALL (ANCOLS |mt|) |nn| (QREFELT $ 36)))
            (EXIT
             (|error|
              "structuralConstants: size of second argument does not agree with number of generators"))))
          (LETT |gamma| NIL . #1#)
          (LETT |lscopy| (SPADCALL |ls| (QREFELT $ 38)) . #1#)
          (SEQ G190
               (COND ((NULL (COND ((NULL |lscopy|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ
                (LETT |mat| (MAKE_MATRIX1 |nn| |nn| (|spadConstant| $ 52))
                      . #1#)
                (LETT |s| (|SPADfirst| |lscopy|) . #1#)
                (SEQ (LETT |i| 1 . #1#) G190
                     (COND ((|greater_SI| |i| |nn|) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1 . #1#) G190
                            (COND ((|greater_SI| |j| |nn|) (GO G191)))
                            (SEQ (LETT |r| (QAREF2O |mt| |i| |j| 1 1) . #1#)
                                 (LETT |q| (SPADCALL |r| (QREFELT $ 53)) . #1#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL
                                     (SPADCALL |q| |ls| (QREFELT $ 41)) 0
                                     (QREFELT $ 36))
                                    (|error|
                                     "structuralConstants: entries of second argument must be (linear) polynomials in the generators"))
                                   ('T
                                    (SEQ
                                     (LETT |p| (SPADCALL |r| (QREFELT $ 54))
                                           . #1#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |p| |ls| (QREFELT $ 41)) 1
                                         (QREFELT $ 42))
                                        (|error|
                                         "structuralConstants: entries of second argument must be linear polynomials in the generators"))
                                       ((SPADCALL
                                         (LETT |c|
                                               (SPADCALL |p| |s| 1
                                                         (QREFELT $ 44))
                                               . #1#)
                                         (|spadConstant| $ 40) (QREFELT $ 45))
                                        (QSETAREF2O |mat| |i| |j|
                                                    (SPADCALL |c| |q|
                                                              (QREFELT $ 55))
                                                    1 1)))))))))
                            (LETT |j| (|inc_SI| |j|) . #1#) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|) . #1#) (GO G190) G191 (EXIT NIL))
                (LETT |gamma| (CONS |mat| |gamma|) . #1#)
                (EXIT (LETT |lscopy| (CDR |lscopy|) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (REVERSE |gamma|) (QREFELT $ 58))))))) 

(DECLAIM (NOTINLINE |StructuralConstantsPackage;|)) 

(DEFUN |StructuralConstantsPackage| (#1=#:G158)
  (PROG ()
    (RETURN
     (PROG (#2=#:G159)
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
      (LETT $ (GETREFV 61) . #1#)
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
              (27 . |One|) (31 . |elt|) (37 . |Zero|) (41 . |setColumn!|)
              (|Union| 14 '"failed")
              (|Record| (|:| |particular| 23) (|:| |basis| (|List| 14)))
              (|LinearSystemMatrixPackage| 6 14 14 8) (48 . |solve|)
              |SCPKG;coordinates;MLV;2| (54 . *) (|Vector| 8) (60 . |elt|)
              (66 . |elt|) (72 . |setelt|) |SCPKG;structuralConstants;LV;3|
              (|Boolean|) (|NonNegativeInteger|) (80 . ~=) (|List| 43)
              (86 . |copy|) (|Polynomial| 6) (91 . |Zero|) (95 . |totalDegree|)
              (101 . >) (|Symbol|) (107 . |coefficient|) (114 . ~=) (|List| 49)
              (|Vector| 49) (120 . |vector|) (|Matrix| 39)
              |SCPKG;structuralConstants;LMV;4| (|Fraction| 39) (125 . |Zero|)
              (129 . |denom|) (134 . |numer|) (139 . /) (|List| 59)
              (|Vector| 59) (145 . |vector|) (|Matrix| 51)
              |SCPKG;structuralConstants;LMV;5|)
           '#(|structuralConstants| 150 |coordinates| 167) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 60
                                                 '(1 8 7 0 9 2 10 0 0 0 11 2 7
                                                   10 12 0 13 1 14 0 10 15 1 17
                                                   16 0 18 0 6 0 19 2 17 8 0 16
                                                   20 0 6 0 21 3 8 0 0 16 14 22
                                                   2 25 24 8 14 26 2 8 0 0 0 28
                                                   2 29 8 0 16 30 2 14 6 0 16
                                                   31 4 8 6 0 16 16 6 32 2 35
                                                   34 0 0 36 1 37 0 0 38 0 39 0
                                                   40 2 39 35 0 37 41 2 35 34 0
                                                   0 42 3 39 0 0 43 35 44 2 39
                                                   34 0 0 45 1 47 0 46 48 0 51
                                                   0 52 1 51 39 0 53 1 51 39 0
                                                   54 2 51 0 39 39 55 1 57 0 56
                                                   58 2 0 47 37 49 50 2 0 57 37
                                                   59 60 1 0 29 17 33 2 0 14 8
                                                   17 27)))))
           '|lookupComplete|)) 
