
(/VERSIONCHECK 2) 

(DEFUN |ELFUTS;sncndnre| (|m| |s0| |c0| |d0| |scd| |dx| |sign| $)
  (PROG ()
    (RETURN
     (LIST
      (SPADCALL |s0| (CONS #'|ELFUTS;sncndnre!0| (VECTOR |dx| $ |scd|))
                (QREFELT $ 16))
      (SPADCALL |c0| (CONS #'|ELFUTS;sncndnre!1| (VECTOR |dx| $ |scd| |sign|))
                (QREFELT $ 16))
      (SPADCALL |d0|
                (CONS #'|ELFUTS;sncndnre!2| (VECTOR |dx| |scd| $ |m| |sign|))
                (QREFELT $ 16)))))) 

(DEFUN |ELFUTS;sncndnre!2| ($$)
  (PROG (|sign| |m| $ |scd| |dx|)
    (LETT |sign| (QREFELT $$ 4) . #1=(|ELFUTS;sncndnre|))
    (LETT |m| (QREFELT $$ 3) . #1#)
    (LETT $ (QREFELT $$ 2) . #1#)
    (LETT |scd| (QREFELT $$ 1) . #1#)
    (LETT |dx| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL
        (SPADCALL (SPADCALL |sign| |m| (QREFELT $ 22))
                  (SPADCALL |scd| (|spadConstant| $ 20) (QREFELT $ 12))
                  (QREFELT $ 21))
        (SPADCALL |scd| 2 (QREFELT $ 12)) (QREFELT $ 14))
       |dx| (QREFELT $ 14)))))) 

(DEFUN |ELFUTS;sncndnre!1| ($$)
  (PROG (|sign| |scd| $ |dx|)
    (LETT |sign| (QREFELT $$ 3) . #1=(|ELFUTS;sncndnre|))
    (LETT |scd| (QREFELT $$ 2) . #1#)
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |dx| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL
        (SPADCALL |sign| (SPADCALL |scd| (|spadConstant| $ 20) (QREFELT $ 12))
                  (QREFELT $ 21))
        (SPADCALL |scd| 3 (QREFELT $ 12)) (QREFELT $ 14))
       |dx| (QREFELT $ 14)))))) 

(DEFUN |ELFUTS;sncndnre!0| ($$)
  (PROG (|scd| $ |dx|)
    (LETT |scd| (QREFELT $$ 2) . #1=(|ELFUTS;sncndnre|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |dx| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (SPADCALL
       (SPADCALL (SPADCALL |scd| 2 (QREFELT $ 12))
                 (SPADCALL |scd| 3 (QREFELT $ 12)) (QREFELT $ 14))
       |dx| (QREFELT $ 14)))))) 

(DEFUN |ELFUTS;sncndn;SCoefL;2| (|z| |m| $)
  (PROG (|dn1| |cn1| |sn1| |invden| #1=#:G136 |c1| |dn0| |cn0| |sn0| |scd|
         |z0|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |z| (QREFELT $ 24))
        (LIST (SPADCALL (|spadConstant| $ 25) (QREFELT $ 27))
              (SPADCALL (|spadConstant| $ 17) (QREFELT $ 27))
              (SPADCALL (|spadConstant| $ 17) (QREFELT $ 27))))
       (#2='T
        (SEQ
         (LETT |z0| (SPADCALL |z| (QREFELT $ 28))
               . #3=(|ELFUTS;sncndn;SCoefL;2|))
         (EXIT
          (COND
           ((SPADCALL |z0| (|spadConstant| $ 25) (QREFELT $ 29))
            (SPADCALL (CONS #'|ELFUTS;sncndn;SCoefL;2!0| (VECTOR |z| $ |m|)) 3
                      (QREFELT $ 34)))
           ((QREFELT $ 8)
            (SEQ
             (LETT |scd|
                   (SPADCALL
                    (CONS #'|ELFUTS;sncndn;SCoefL;2!1| (VECTOR |z| $ |m|)) 3
                    (QREFELT $ 34))
                   . #3#)
             (LETT |sn0| (SPADCALL |z0| |m| (QREFELT $ 35)) . #3#)
             (LETT |cn0| (SPADCALL |z0| |m| (QREFELT $ 36)) . #3#)
             (LETT |dn0| (SPADCALL |z0| |m| (QREFELT $ 37)) . #3#)
             (LETT |c1|
                   (SPADCALL |m| (SPADCALL |sn0| 2 (QREFELT $ 38))
                             (QREFELT $ 22))
                   . #3#)
             (LETT |invden|
                   (PROG2
                       (LETT #1#
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (|spadConstant| $ 17) (QREFELT $ 27))
                               (SPADCALL
                                (SPADCALL |c1|
                                          (SPADCALL |scd| 1 (QREFELT $ 12))
                                          (QREFELT $ 21))
                                (SPADCALL |scd| 1 (QREFELT $ 12))
                                (QREFELT $ 14))
                               (QREFELT $ 39))
                              (QREFELT $ 41))
                             . #3#)
                       (QCDR #1#)
                     (|check_union| (QEQCAR #1# 0) (|Stream| (QREFELT $ 6))
                                    #1#))
                   . #3#)
             (LETT |sn1|
                   (SPADCALL |invden|
                             (SPADCALL
                              (SPADCALL (SPADCALL |cn0| |dn0| (QREFELT $ 22))
                                        (SPADCALL |scd| 1 (QREFELT $ 12))
                                        (QREFELT $ 21))
                              (SPADCALL
                               (SPADCALL |sn0|
                                         (SPADCALL |scd| 2 (QREFELT $ 12))
                                         (QREFELT $ 21))
                               (SPADCALL |scd| 3 (QREFELT $ 12))
                               (QREFELT $ 14))
                              (QREFELT $ 42))
                             (QREFELT $ 14))
                   . #3#)
             (LETT |cn1|
                   (SPADCALL |invden|
                             (SPADCALL
                              (SPADCALL |cn0| (SPADCALL |scd| 2 (QREFELT $ 12))
                                        (QREFELT $ 21))
                              (SPADCALL
                               (SPADCALL (SPADCALL |sn0| |dn0| (QREFELT $ 22))
                                         (SPADCALL |scd| 1 (QREFELT $ 12))
                                         (QREFELT $ 21))
                               (SPADCALL |scd| 3 (QREFELT $ 12))
                               (QREFELT $ 14))
                              (QREFELT $ 39))
                             (QREFELT $ 14))
                   . #3#)
             (LETT |dn1|
                   (SPADCALL |invden|
                             (SPADCALL
                              (SPADCALL |dn0| (SPADCALL |scd| 3 (QREFELT $ 12))
                                        (QREFELT $ 21))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |m| |sn0| (QREFELT $ 22))
                                          |cn0| (QREFELT $ 22))
                                (SPADCALL |scd| 1 (QREFELT $ 12))
                                (QREFELT $ 21))
                               (SPADCALL |scd| 2 (QREFELT $ 12))
                               (QREFELT $ 14))
                              (QREFELT $ 39))
                             (QREFELT $ 14))
                   . #3#)
             (EXIT (LIST |sn1| |cn1| |dn1|))))
           (#2#
            (|error|
             "ELFUTS:sncndn: constant coefficient should be 0"))))))))))) 

(DEFUN |ELFUTS;sncndn;SCoefL;2!1| (|x| $$)
  (PROG (|m| $ |z|)
    (LETT |m| (QREFELT $$ 2) . #1=(|ELFUTS;sncndn;SCoefL;2|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |z| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|ELFUTS;sncndnre| |m| (|spadConstant| $ 25) (|spadConstant| $ 17)
       (|spadConstant| $ 17) |x| (SPADCALL |z| (QREFELT $ 30))
       (SPADCALL (|spadConstant| $ 17) (QREFELT $ 31)) $))))) 

(DEFUN |ELFUTS;sncndn;SCoefL;2!0| (|x| $$)
  (PROG (|m| $ |z|)
    (LETT |m| (QREFELT $$ 2) . #1=(|ELFUTS;sncndn;SCoefL;2|))
    (LETT $ (QREFELT $$ 1) . #1#)
    (LETT |z| (QREFELT $$ 0) . #1#)
    (RETURN
     (PROGN
      (|ELFUTS;sncndnre| |m| (|spadConstant| $ 25) (|spadConstant| $ 17)
       (|spadConstant| $ 17) |x| (SPADCALL |z| (QREFELT $ 30))
       (SPADCALL (|spadConstant| $ 17) (QREFELT $ 31)) $))))) 

(DEFUN |ELFUTS;jacobiSn;UTSCoefUTS;3| (|z| |m| $)
  (SPADCALL
   (SPADCALL (SPADCALL (SPADCALL |z| (QREFELT $ 44)) |m| (QREFELT $ 43)) 1
             (QREFELT $ 12))
   (QREFELT $ 45))) 

(DEFUN |ELFUTS;jacobiCn;UTSCoefUTS;4| (|z| |m| $)
  (SPADCALL
   (SPADCALL (SPADCALL (SPADCALL |z| (QREFELT $ 44)) |m| (QREFELT $ 43)) 2
             (QREFELT $ 12))
   (QREFELT $ 45))) 

(DEFUN |ELFUTS;jacobiDn;UTSCoefUTS;5| (|z| |m| $)
  (SPADCALL
   (SPADCALL (SPADCALL (SPADCALL |z| (QREFELT $ 44)) |m| (QREFELT $ 43)) 3
             (QREFELT $ 12))
   (QREFELT $ 45))) 

(DEFUN |ELFUTS;ellipticE;UTSCoefUTS;6| (|z| |m| $)
  (PROG (|c0| |z0| |s2| |s1| |dz| |cz|)
    (RETURN
     (SEQ
      (LETT |cz| (SPADCALL |z| (QREFELT $ 44))
            . #1=(|ELFUTS;ellipticE;UTSCoefUTS;6|))
      (EXIT
       (COND ((SPADCALL |cz| (QREFELT $ 24)) (|spadConstant| $ 26))
             (#2='T
              (SEQ (LETT |dz| (SPADCALL |z| (QREFELT $ 49)) . #1#)
                   (LETT |s1|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18)
                                    (SPADCALL |m|
                                              (SPADCALL |z| 2 (QREFELT $ 50))
                                              (QREFELT $ 51))
                                    (QREFELT $ 52))
                          (QREFELT $ 53))
                         . #1#)
                   (LETT |s2|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18)
                                    (SPADCALL |z| 2 (QREFELT $ 50))
                                    (QREFELT $ 52))
                          (SPADCALL (SPADCALL 1 2 (QREFELT $ 55))
                                    (QREFELT $ 56))
                          (QREFELT $ 57))
                         . #1#)
                   (LETT |z0| (SPADCALL |z| 0 (QREFELT $ 59)) . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL |z0| (|spadConstant| $ 25) (QREFELT $ 29))
                      (SPADCALL
                       (SPADCALL (SPADCALL |s1| |s2| (QREFELT $ 60)) |dz|
                                 (QREFELT $ 60))
                       (QREFELT $ 61)))
                     ((QREFELT $ 8)
                      (SEQ (LETT |c0| (SPADCALL |z0| |m| (QREFELT $ 62)) . #1#)
                           (EXIT
                            (SPADCALL (SPADCALL |c0| (QREFELT $ 63))
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |s1| |s2| (QREFELT $ 60))
                                        |dz| (QREFELT $ 60))
                                       (QREFELT $ 61))
                                      (QREFELT $ 64)))))
                     (#2#
                      (|error|
                       "ELFUTS:ellipticE: constant coefficient should be 0")))))))))))) 

(DEFUN |ELFUTS;ellipticF;UTSCoefUTS;7| (|z| |m| $)
  (PROG (|c0| |z0| |s2| |s1| |dz| |cz|)
    (RETURN
     (SEQ
      (LETT |cz| (SPADCALL |z| (QREFELT $ 44))
            . #1=(|ELFUTS;ellipticF;UTSCoefUTS;7|))
      (EXIT
       (COND ((SPADCALL |cz| (QREFELT $ 24)) (|spadConstant| $ 26))
             (#2='T
              (SEQ (LETT |dz| (SPADCALL |z| (QREFELT $ 49)) . #1#)
                   (LETT |s1|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18)
                                    (SPADCALL |m|
                                              (SPADCALL |z| 2 (QREFELT $ 50))
                                              (QREFELT $ 51))
                                    (QREFELT $ 52))
                          (SPADCALL (SPADCALL 1 2 (QREFELT $ 55))
                                    (QREFELT $ 56))
                          (QREFELT $ 57))
                         . #1#)
                   (LETT |s2|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18)
                                    (SPADCALL |z| 2 (QREFELT $ 50))
                                    (QREFELT $ 52))
                          (SPADCALL (SPADCALL 1 2 (QREFELT $ 55))
                                    (QREFELT $ 56))
                          (QREFELT $ 57))
                         . #1#)
                   (LETT |z0| (SPADCALL |z| 0 (QREFELT $ 59)) . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL |z0| (|spadConstant| $ 25) (QREFELT $ 29))
                      (SPADCALL
                       (SPADCALL (SPADCALL |s1| |s2| (QREFELT $ 60)) |dz|
                                 (QREFELT $ 60))
                       (QREFELT $ 61)))
                     ((QREFELT $ 8)
                      (SEQ (LETT |c0| (SPADCALL |z0| |m| (QREFELT $ 66)) . #1#)
                           (EXIT
                            (SPADCALL (SPADCALL |c0| (QREFELT $ 63))
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |s1| |s2| (QREFELT $ 60))
                                        |dz| (QREFELT $ 60))
                                       (QREFELT $ 61))
                                      (QREFELT $ 64)))))
                     (#2#
                      (|error|
                       "ELFUTS:ellipticF: constant coefficient should be 0")))))))))))) 

(DEFUN |ELFUTS;ellipticPi;UTS2CoefUTS;8| (|z| |n| |m| $)
  (PROG (|c0| |z0| |ss| |s2| |s1| |dz| |cz|)
    (RETURN
     (SEQ
      (LETT |cz| (SPADCALL |z| (QREFELT $ 44))
            . #1=(|ELFUTS;ellipticPi;UTS2CoefUTS;8|))
      (EXIT
       (COND ((SPADCALL |cz| (QREFELT $ 24)) (|spadConstant| $ 26))
             (#2='T
              (SEQ (LETT |dz| (SPADCALL |z| (QREFELT $ 49)) . #1#)
                   (LETT |s1|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18)
                                    (SPADCALL |m|
                                              (SPADCALL |z| 2 (QREFELT $ 50))
                                              (QREFELT $ 51))
                                    (QREFELT $ 52))
                          (SPADCALL (SPADCALL 1 2 (QREFELT $ 55))
                                    (QREFELT $ 56))
                          (QREFELT $ 57))
                         . #1#)
                   (LETT |s2|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18)
                                    (SPADCALL |z| 2 (QREFELT $ 50))
                                    (QREFELT $ 52))
                          (SPADCALL (SPADCALL 1 2 (QREFELT $ 55))
                                    (QREFELT $ 56))
                          (QREFELT $ 57))
                         . #1#)
                   (LETT |ss|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| $ 18)
                                       (SPADCALL |n|
                                                 (SPADCALL |z| 2
                                                           (QREFELT $ 50))
                                                 (QREFELT $ 51))
                                       (QREFELT $ 52))
                             (SPADCALL (|spadConstant| $ 68) (QREFELT $ 56))
                             (QREFELT $ 57))
                            |s1| (QREFELT $ 60))
                           |s2| (QREFELT $ 60))
                          |dz| (QREFELT $ 60))
                         . #1#)
                   (LETT |z0| (SPADCALL |z| 0 (QREFELT $ 59)) . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL |z0| (|spadConstant| $ 25) (QREFELT $ 29))
                      (SPADCALL |ss| (QREFELT $ 61)))
                     ((QREFELT $ 8)
                      (SEQ
                       (LETT |c0| (SPADCALL |z0| |n| |m| (QREFELT $ 69)) . #1#)
                       (EXIT
                        (SPADCALL (SPADCALL |c0| (QREFELT $ 63))
                                  (SPADCALL |ss| (QREFELT $ 61))
                                  (QREFELT $ 64)))))
                     (#2#
                      (|error|
                       "ELFUTS:ellipticPi: constant coefficient should be 0")))))))))))) 

(DEFUN |EllipticFunctionsUnivariateTaylorSeries| (&REST #1=#:G157)
  (PROG ()
    (RETURN
     (PROG (#2=#:G158)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|EllipticFunctionsUnivariateTaylorSeries|)
                                           '|domainEqualList|)
                . #3=(|EllipticFunctionsUnivariateTaylorSeries|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY
                   (|function| |EllipticFunctionsUnivariateTaylorSeries;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|EllipticFunctionsUnivariateTaylorSeries|))))))))))) 

(DEFUN |EllipticFunctionsUnivariateTaylorSeries;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|EllipticFunctionsUnivariateTaylorSeries|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|EllipticFunctionsUnivariateTaylorSeries| DV$1 DV$2)
            . #1#)
      (LETT $ (GETREFV 71) . #1#)
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
      (|haddProp| |$ConstructorCache|
                  '|EllipticFunctionsUnivariateTaylorSeries| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (|HasCategory| |#1| '(|SpecialFunctionCategory|)))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 65
                   (CONS (|dispatchFunction| |ELFUTS;ellipticE;UTSCoefUTS;6|)
                         $))
         (QSETREFV $ 67
                   (CONS (|dispatchFunction| |ELFUTS;ellipticF;UTSCoefUTS;7|)
                         $))
         (QSETREFV $ 70
                   (CONS (|dispatchFunction| |ELFUTS;ellipticPi;UTS2CoefUTS;8|)
                         $)))))
      $)))) 

(MAKEPROP '|EllipticFunctionsUnivariateTaylorSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'SPFCN
              (|Stream| 6) (|Integer|) (|List| 9) (0 . |elt|)
              (|StreamTaylorSeriesOperations| 6) (6 . *) (|Mapping| 9)
              (12 . |lazyIntegrate|) (18 . |One|) (22 . |One|)
              (|PositiveInteger|) (26 . |One|) (30 . *) (36 . *) (|Boolean|)
              (42 . |empty?|) (47 . |Zero|) (51 . |Zero|) (55 . |coerce|)
              (60 . |frst|) (65 . =) (71 . |deriv|) (76 . -) (|Mapping| 11 11)
              (|ParadoxicalCombinatorsForStreams| 6) (81 . Y) (87 . |jacobiSn|)
              (93 . |jacobiCn|) (99 . |jacobiDn|) (105 . ^) (111 . -)
              (|Union| 9 '"failed") (117 . |recip|) (122 . +)
              |ELFUTS;sncndn;SCoefL;2| (128 . |coefficients|) (133 . |series|)
              |ELFUTS;jacobiSn;UTSCoefUTS;3| |ELFUTS;jacobiCn;UTSCoefUTS;4|
              |ELFUTS;jacobiDn;UTSCoefUTS;5| (138 . |differentiate|) (143 . ^)
              (149 . *) (155 . -) (161 . |sqrt|) (|Fraction| 10) (166 . /)
              (172 . -) (177 . ^) (|NonNegativeInteger|) (183 . |coefficient|)
              (189 . *) (195 . |integrate|) (200 . |ellipticE|)
              (206 . |coerce|) (211 . +) (217 . |ellipticE|)
              (223 . |ellipticF|) (229 . |ellipticF|) (235 . |One|)
              (239 . |ellipticPi|) (246 . |ellipticPi|))
           '#(|sncndn| 253 |jacobiSn| 259 |jacobiDn| 265 |jacobiCn| 271
              |ellipticPi| 277 |ellipticF| 284 |ellipticE| 290)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 70
                                                 '(2 11 9 0 10 12 2 13 9 9 9 14
                                                   2 13 9 6 15 16 0 6 0 17 0 7
                                                   0 18 0 19 0 20 2 13 9 6 9 21
                                                   2 6 0 0 0 22 1 9 23 0 24 0 6
                                                   0 25 0 7 0 26 1 13 9 6 27 1
                                                   9 6 0 28 2 6 23 0 0 29 1 13
                                                   9 9 30 1 6 0 0 31 2 33 11 32
                                                   10 34 2 6 0 0 0 35 2 6 0 0 0
                                                   36 2 6 0 0 0 37 2 6 0 0 19
                                                   38 2 13 9 9 9 39 1 13 40 9
                                                   41 2 13 9 9 9 42 1 7 9 0 44
                                                   1 7 0 9 45 1 7 0 0 49 2 7 0
                                                   0 19 50 2 7 0 6 0 51 2 7 0 0
                                                   0 52 1 7 0 0 53 2 54 0 10 10
                                                   55 1 54 0 0 56 2 7 0 0 54 57
                                                   2 7 6 0 58 59 2 7 0 0 0 60 1
                                                   7 0 0 61 2 6 0 0 0 62 1 7 0
                                                   6 63 2 7 0 0 0 64 2 0 7 7 6
                                                   65 2 6 0 0 0 66 2 0 7 7 6 67
                                                   0 54 0 68 3 6 0 0 0 0 69 3 0
                                                   7 7 6 6 70 2 0 11 9 6 43 2 0
                                                   7 7 6 46 2 0 7 7 6 48 2 0 7
                                                   7 6 47 3 1 7 7 6 6 70 2 1 7
                                                   7 6 67 2 1 7 7 6 65)))))
           '|lookupComplete|)) 
