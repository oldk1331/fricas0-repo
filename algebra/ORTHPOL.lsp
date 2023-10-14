
(DEFUN |ORTHPOL;laguerreL;Nni2R;1| (|n| |x| $)
  (PROG (|p0| |p1| |#G9| |#G8| #1=#:G106 |i| |#G6| |#G5|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) (|spadConstant| $ 8))
            ('T
             (SEQ
              (PROGN
               (LETT |#G5|
                     (SPADCALL (SPADCALL |x| (QREFELT $ 9))
                               (|spadConstant| $ 8) (QREFELT $ 10))
                     . #2=(|ORTHPOL;laguerreL;Nni2R;1|))
               (LETT |#G6| (|spadConstant| $ 8) . #2#)
               (LETT |p1| |#G5| . #2#)
               (LETT |p0| |#G6| . #2#))
              (SEQ (LETT |i| 1 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT |#G8|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL 2 (SPADCALL |i| (QREFELT $ 12))
                                          (QREFELT $ 14))
                                (|spadConstant| $ 8) (QREFELT $ 10))
                               |x| (QREFELT $ 15))
                              |p1| (QREFELT $ 16))
                             (SPADCALL (SPADCALL |i| 2 (QREFELT $ 18)) |p0|
                                       (QREFELT $ 19))
                             (QREFELT $ 15))
                            . #2#)
                      (LETT |#G9| |p1| . #2#)
                      (LETT |p1| |#G8| . #2#)
                      (LETT |p0| |#G9| . #2#))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |p1|)))))))) 

(DEFUN |ORTHPOL;laguerreL;2Nni2R;2| (|m| |n| |x| $)
  (PROG (|p1| |p0| |cx| #1=#:G108 #2=#:G114 |j| |mi| |ni|)
    (RETURN
     (SEQ (LETT |ni| |n| . #3=(|ORTHPOL;laguerreL;2Nni2R;2|))
          (LETT |mi| |m| . #3#)
          (LETT |cx|
                (*
                 (* (EXPT -1 |m|) (SPADCALL |ni| (- |ni| |mi|) (QREFELT $ 22)))
                 (SPADCALL |ni| (QREFELT $ 23)))
                . #3#)
          (LETT |p0| (|spadConstant| $ 8) . #3#)
          (LETT |p1| (SPADCALL |cx| (QREFELT $ 12)) . #3#)
          (SEQ (LETT |j| 1 . #3#) (LETT #2# (- |ni| |mi|) . #3#) G190
               (COND ((|greater_SI| |j| #2#) (GO G191)))
               (SEQ (LETT |cx| (- (* |cx| (+ (- (- |ni| |mi|) |j|) 1))) . #3#)
                    (LETT |cx|
                          (PROG2
                              (LETT #1#
                                    (SPADCALL |cx| (* (+ |mi| |j|) |j|)
                                              (QREFELT $ 25))
                                    . #3#)
                              (QCDR #1#)
                            (|check_union| (QEQCAR #1# 0) (|Integer|) #1#))
                          . #3#)
                    (LETT |p0| (SPADCALL |p0| |x| (QREFELT $ 16)) . #3#)
                    (EXIT
                     (LETT |p1|
                           (SPADCALL |p1| (SPADCALL |cx| |p0| (QREFELT $ 26))
                                     (QREFELT $ 10))
                           . #3#)))
               (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT |p1|))))) 

(DEFUN |ORTHPOL;chebyshevT;Nni2R;3| (|n| |x| $)
  (PROG (|p0| |p1| |#G20| |#G19| #1=#:G118 |i| |#G17| |#G16|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) (|spadConstant| $ 8))
            ('T
             (SEQ
              (PROGN
               (LETT |#G16| |x| . #2=(|ORTHPOL;chebyshevT;Nni2R;3|))
               (LETT |#G17| (|spadConstant| $ 8) . #2#)
               (LETT |p1| |#G16| . #2#)
               (LETT |p0| |#G17| . #2#))
              (SEQ (LETT |i| 1 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT |#G19|
                            (SPADCALL
                             (SPADCALL (SPADCALL 2 |x| (QREFELT $ 14)) |p1|
                                       (QREFELT $ 16))
                             |p0| (QREFELT $ 15))
                            . #2#)
                      (LETT |#G20| |p1| . #2#)
                      (LETT |p1| |#G19| . #2#)
                      (LETT |p0| |#G20| . #2#))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |p1|)))))))) 

(DEFUN |ORTHPOL;chebyshevU;Nni2R;4| (|n| |x| $)
  (PROG (|p0| |p1| |#G27| |#G26| #1=#:G122 |i| |#G24| |#G23|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) (|spadConstant| $ 8))
            ('T
             (SEQ
              (PROGN
               (LETT |#G23| (SPADCALL 2 |x| (QREFELT $ 14))
                     . #2=(|ORTHPOL;chebyshevU;Nni2R;4|))
               (LETT |#G24| (|spadConstant| $ 8) . #2#)
               (LETT |p1| |#G23| . #2#)
               (LETT |p0| |#G24| . #2#))
              (SEQ (LETT |i| 1 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT |#G26|
                            (SPADCALL
                             (SPADCALL (SPADCALL 2 |x| (QREFELT $ 14)) |p1|
                                       (QREFELT $ 16))
                             |p0| (QREFELT $ 15))
                            . #2#)
                      (LETT |#G27| |p1| . #2#)
                      (LETT |p1| |#G26| . #2#)
                      (LETT |p0| |#G27| . #2#))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |p1|)))))))) 

(DEFUN |ORTHPOL;hermiteH;Nni2R;5| (|n| |x| $)
  (PROG (|p0| |p1| |#G34| |#G33| #1=#:G126 |i| |#G31| |#G30|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) (|spadConstant| $ 8))
            ('T
             (SEQ
              (PROGN
               (LETT |#G30| (SPADCALL 2 |x| (QREFELT $ 14))
                     . #2=(|ORTHPOL;hermiteH;Nni2R;5|))
               (LETT |#G31| (|spadConstant| $ 8) . #2#)
               (LETT |p1| |#G30| . #2#)
               (LETT |p0| |#G31| . #2#))
              (SEQ (LETT |i| 1 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT |#G33|
                            (SPADCALL
                             (SPADCALL (SPADCALL 2 |x| (QREFELT $ 14)) |p1|
                                       (QREFELT $ 16))
                             (SPADCALL (SPADCALL 2 |i| (QREFELT $ 30)) |p0|
                                       (QREFELT $ 19))
                             (QREFELT $ 15))
                            . #2#)
                      (LETT |#G34| |p1| . #2#)
                      (LETT |p1| |#G33| . #2#)
                      (LETT |p0| |#G34| . #2#))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |p1|)))))))) 

(DEFUN |ORTHPOL;legendreP;Nni2R;6| (|n| |x| $)
  (PROG (|p0| |p1| |#G39| |#G38| |c| #1=#:G131 |i|)
    (RETURN
     (SEQ
      (COND ((EQL |n| 0) (|spadConstant| $ 8))
            ('T
             (SEQ
              (LETT |p0| (|spadConstant| $ 8)
                    . #2=(|ORTHPOL;legendreP;Nni2R;6|))
              (LETT |p1| |x| . #2#)
              (SEQ (LETT |i| 1 . #2#) (LETT #1# (- |n| 1) . #2#) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |c| (SPADCALL 1 (+ |i| 1) (QREFELT $ 33)) . #2#)
                        (EXIT
                         (PROGN
                          (LETT |#G38|
                                (SPADCALL |c|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (+ (SPADCALL 2 |i| (QREFELT $ 30))
                                                1)
                                             |x| (QREFELT $ 19))
                                            |p1| (QREFELT $ 16))
                                           (SPADCALL |i| |p0| (QREFELT $ 19))
                                           (QREFELT $ 15))
                                          (QREFELT $ 34))
                                . #2#)
                          (LETT |#G39| |p1| . #2#)
                          (LETT |p1| |#G38| . #2#)
                          (LETT |p0| |#G39| . #2#))))
                   (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |p1|)))))))) 

(DECLAIM (NOTINLINE |OrthogonalPolynomialFunctions;|)) 

(DEFUN |OrthogonalPolynomialFunctions| (#1=#:G132)
  (PROG ()
    (RETURN
     (PROG (#2=#:G133)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|OrthogonalPolynomialFunctions|)
                                           '|domainEqualList|)
                . #3=(|OrthogonalPolynomialFunctions|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|OrthogonalPolynomialFunctions;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|OrthogonalPolynomialFunctions|))))))))))) 

(DEFUN |OrthogonalPolynomialFunctions;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|OrthogonalPolynomialFunctions|))
      (LETT |dv$| (LIST '|OrthogonalPolynomialFunctions| DV$1) . #1#)
      (LETT $ (GETREFV 36) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|OrthogonalPolynomialFunctions|
                  (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 35
                  (CONS (|dispatchFunction| |ORTHPOL;legendreP;Nni2R;6|) $))))
      $)))) 

(MAKEPROP '|OrthogonalPolynomialFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|) (4 . |One|)
              (8 . -) (13 . +) (|Integer|) (19 . |coerce|) (|PositiveInteger|)
              (24 . *) (30 . -) (36 . *) (|NonNegativeInteger|) (42 . ^)
              (48 . *) |ORTHPOL;laguerreL;Nni2R;1| (54 . ^) (60 . |binomial|)
              (66 . |factorial|) (|Union| $ '"failed") (71 . |exquo|) (77 . *)
              |ORTHPOL;laguerreL;2Nni2R;2| |ORTHPOL;chebyshevT;Nni2R;3|
              |ORTHPOL;chebyshevU;Nni2R;4| (83 . *) |ORTHPOL;hermiteH;Nni2R;5|
              (|Fraction| 11) (89 . /) (95 . *) (101 . |legendreP|))
           '#(|legendreP| 107 |laguerreL| 113 |hermiteH| 126 |chebyshevU| 132
              |chebyshevT| 138)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 35
                                                 '(0 6 0 7 0 6 0 8 1 6 0 0 9 2
                                                   6 0 0 0 10 1 6 0 11 12 2 6 0
                                                   13 0 14 2 6 0 0 0 15 2 6 0 0
                                                   0 16 2 17 0 0 13 18 2 6 0 17
                                                   0 19 2 6 0 0 17 21 2 11 0 0
                                                   0 22 1 11 0 0 23 2 11 24 0 0
                                                   25 2 6 0 11 0 26 2 17 0 13 0
                                                   30 2 32 0 11 11 33 2 6 0 32
                                                   0 34 2 0 6 17 6 35 2 1 6 17
                                                   6 35 2 0 6 17 6 20 3 0 6 17
                                                   17 6 27 2 0 6 17 6 31 2 0 6
                                                   17 6 29 2 0 6 17 6 28)))))
           '|lookupComplete|)) 
