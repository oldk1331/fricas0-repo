
(SDEFUN |LEXP;ident|
        ((|l1| |List|
          (|Record| (|:| |k| #1=(|LyndonWord| |VarSet|)) (|:| |c| R)))
         (|l2| |List| (|Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R)))
         ($ |List| (|Equation| R)))
        (SPROG
         ((|r| (R)) (|c2| (R)) (|u2| #1#) (|c1| (R)) (|u1| #1#) (#2=#:G117 NIL)
          (|t| NIL) (#3=#:G116 NIL) (#4=#:G115 NIL) (#5=#:G114 NIL))
         (SEQ
          (COND
           ((NULL |l1|)
            (PROGN
             (LETT #5# NIL . #6=(|LEXP;ident|))
             (SEQ (LETT |t| NIL . #6#) (LETT #4# |l2| . #6#) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |t| (CAR #4#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #5#
                          (CONS
                           (SPADCALL (|spadConstant| $ 10) (QCDR |t|)
                                     (QREFELT $ 12))
                           #5#)
                          . #6#)))
                  (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                  (EXIT (NREVERSE #5#)))))
           ((NULL |l2|)
            (PROGN
             (LETT #3# NIL . #6#)
             (SEQ (LETT |t| NIL . #6#) (LETT #2# |l1| . #6#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #3#
                          (CONS
                           (SPADCALL (QCDR |t|) (|spadConstant| $ 10)
                                     (QREFELT $ 12))
                           #3#)
                          . #6#)))
                  (LETT #2# (CDR #2#) . #6#) (GO G190) G191
                  (EXIT (NREVERSE #3#)))))
           (#7='T
            (SEQ (LETT |u1| (QCAR (|SPADfirst| |l1|)) . #6#)
                 (LETT |c1| (QCDR (|SPADfirst| |l1|)) . #6#)
                 (LETT |u2| (QCAR (|SPADfirst| |l2|)) . #6#)
                 (LETT |c2| (QCDR (|SPADfirst| |l2|)) . #6#)
                 (EXIT
                  (COND
                   ((SPADCALL |u1| |u2| (QREFELT $ 15))
                    (SEQ (LETT |r| (SPADCALL |c1| |c2| (QREFELT $ 16)) . #6#)
                         (EXIT
                          (COND
                           ((SPADCALL |r| (|spadConstant| $ 10) (QREFELT $ 17))
                            (|LEXP;ident| (CDR |l1|) (CDR |l2|) $))
                           (#7#
                            (CONS (SPADCALL |c1| |c2| (QREFELT $ 12))
                                  (|LEXP;ident| (CDR |l1|) (CDR |l2|) $)))))))
                   ((SPADCALL |u1| |u2| (QREFELT $ 18))
                    (CONS (SPADCALL (|spadConstant| $ 10) |c2| (QREFELT $ 12))
                          (|LEXP;ident| |l1| (CDR |l2|) $)))
                   (#7#
                    (CONS (SPADCALL |c1| (|spadConstant| $ 10) (QREFELT $ 12))
                          (|LEXP;ident| (CDR |l1|) |l2| $))))))))))) 

(SDEFUN |LEXP;compareTerm1s|
        ((|u| |Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R))
         (|v| |Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R))
         ($ |Boolean|))
        (SPADCALL (QCAR |v|) (QCAR |u|) (QREFELT $ 18))) 

(SDEFUN |LEXP;out|
        ((|t| |Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R))
         ($ |OutputForm|))
        (COND
         ((SPADCALL (QCDR |t|) (|spadConstant| $ 19) (QREFELT $ 17))
          (SPADCALL (NUM2USTR (|STR_to_CHAR| "e"))
                    (SPADCALL (QCAR |t|) (QREFELT $ 21)) (QREFELT $ 22)))
         ('T
          (SPADCALL (NUM2USTR (|STR_to_CHAR| "e"))
                    (SPADCALL (SPADCALL (QCDR |t|) (QREFELT $ 23))
                              (SPADCALL (QCAR |t|) (QREFELT $ 21))
                              (QREFELT $ 24))
                    (QREFELT $ 22))))) 

(SDEFUN |LEXP;identification;2$L;4| ((|x| $) (|y| $) ($ |List| (|Equation| R)))
        (SPROG
         ((|l2|
           #1=(|List|
               (|Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R))))
          (|l1| #1#))
         (SEQ
          (LETT |l1| (SPADCALL |x| (QREFELT $ 27))
                . #2=(|LEXP;identification;2$L;4|))
          (LETT |l2| (SPADCALL |y| (QREFELT $ 27)) . #2#)
          (EXIT (|LEXP;ident| |l1| |l2| $))))) 

(SDEFUN |LEXP;LyndonCoordinates;$L;5|
        ((|x| $)
         ($ |List| (|Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R))))
        (SPROG
         ((|lt|
           (|List| (|Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R))))
          (#1=#:G129 NIL) (|l| (|Union| (|LyndonWord| |VarSet|) "failed"))
          (#2=#:G137 NIL) (|t| NIL) (#3=#:G136 NIL))
         (SEQ
          (LETT |lt|
                (PROGN
                 (LETT #3# NIL . #4=(|LEXP;LyndonCoordinates;$L;5|))
                 (SEQ (LETT |t| NIL . #4#)
                      (LETT #2# (SPADCALL |x| (QREFELT $ 32)) . #4#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((QEQCAR
                           (LETT |l| (SPADCALL (QCAR |t|) (QREFELT $ 35))
                                 . #4#)
                           0)
                          (LETT #3#
                                (CONS
                                 (CONS
                                  (PROG2 (LETT #1# |l| . #4#)
                                      (QCDR #1#)
                                    (|check_union| (QEQCAR #1# 0)
                                                   (|LyndonWord| (QREFELT $ 6))
                                                   #1#))
                                  (QCDR |t|))
                                 #3#)
                                . #4#)))))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #4#)
          (EXIT
           (LETT |lt|
                 (SPADCALL (CONS (|function| |LEXP;compareTerm1s|) $) |lt|
                           (QREFELT $ 37))
                 . #4#))))) 

(SDEFUN |LEXP;*;3$;6| ((|x| $) (|y| $) ($ $))
        (SPROG ((#1=#:G139 NIL))
               (SPADCALL |x| |y|
                         (PROG1 (LETT #1# (QREFELT $ 8) |LEXP;*;3$;6|)
                           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                            #1#))
                         (QREFELT $ 39)))) 

(SDEFUN |LEXP;exp;Lp$;7| ((|p| |LiePolynomial| |VarSet| R) ($ $))
        (SPROG ((#1=#:G142 NIL))
               (SPADCALL (SPADCALL |p| (QREFELT $ 42))
                         (PROG1 (LETT #1# (QREFELT $ 8) |LEXP;exp;Lp$;7|)
                           (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|)
                                            #1#))
                         (QREFELT $ 43)))) 

(SDEFUN |LEXP;log;$Lp;8| ((|p| $) ($ |LiePolynomial| |VarSet| R))
        (SPROG ((#1=#:G149 NIL) (#2=#:G147 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL |p|
                                    (PROG1
                                        (LETT #2# (QREFELT $ 8)
                                              . #3=(|LEXP;log;$Lp;8|))
                                      (|check_subtype| (>= #2# 0)
                                                       '(|NonNegativeInteger|)
                                                       #2#))
                                    (QREFELT $ 45))
                          (QREFELT $ 47))
                         . #3#)
                   (QCDR #1#)
                 (|check_union| (QEQCAR #1# 0)
                                (|LiePolynomial| (QREFELT $ 6) (QREFELT $ 7))
                                #1#)))) 

(SDEFUN |LEXP;coerce;$Of;9| ((|p| $) ($ |OutputForm|))
        (SPROG
         ((#1=#:G159 NIL) (|t| NIL) (#2=#:G158 NIL)
          (|lt|
           (|List| (|Record| (|:| |k| (|LyndonWord| |VarSet|)) (|:| |c| R)))))
         (SEQ
          (COND
           ((SPADCALL |p| (|spadConstant| $ 49) (QREFELT $ 50))
            (SPADCALL (|spadConstant| $ 19) (QREFELT $ 23)))
           ('T
            (SEQ
             (LETT |lt| (SPADCALL |p| (QREFELT $ 27))
                   . #3=(|LEXP;coerce;$Of;9|))
             (EXIT
              (SPADCALL (ELT $ 24)
                        (PROGN
                         (LETT #2# NIL . #3#)
                         (SEQ (LETT |t| NIL . #3#) (LETT #1# |lt| . #3#) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2# (CONS (|LEXP;out| |t| $) #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QREFELT $ 53))))))))) 

(SDEFUN |LEXP;LyndonBasis;LL;10|
        ((|lv| |List| |VarSet|) ($ |List| (|LiePolynomial| |VarSet| R)))
        (SPROG ((#1=#:G163 NIL) (|l| NIL) (#2=#:G162 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|LEXP;LyndonBasis;LL;10|))
                 (SEQ (LETT |l| NIL . #3#)
                      (LETT #1# (SPADCALL |lv| (QREFELT $ 8) (QREFELT $ 58))
                            . #3#)
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |l| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |l| (QREFELT $ 59)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(PUT '|LEXP;coerce;$Xpbwp;11| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |LEXP;coerce;$Xpbwp;11| ((|p| $) ($ |XPBWPolynomial| |VarSet| R)) |p|) 

(SDEFUN |LEXP;inv;2$;12| ((|x| $) ($ $))
        (SPROG
         ((|lt|
           (|List|
            (|Record| (|:| |k| (|PoincareBirkhoffWittLyndonBasis| |VarSet|))
                      (|:| |c| R))))
          (#1=#:G171 NIL) (|t| NIL) (#2=#:G170 NIL))
         (SEQ
          (COND
           ((SPADCALL |x| (|spadConstant| $ 49) (QREFELT $ 50))
            (|spadConstant| $ 49))
           ('T
            (SEQ
             (LETT |lt| (SPADCALL (SPADCALL |x| (QREFELT $ 63)) (QREFELT $ 32))
                   . #3=(|LEXP;inv;2$;12|))
             (LETT |lt|
                   (PROGN
                    (LETT #2# NIL . #3#)
                    (SEQ (LETT |t| NIL . #3#) (LETT #1# |lt| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2#
                                 (CONS
                                  (CONS (QCAR |t|)
                                        (COND
                                         ((ODDP
                                           (SPADCALL (QCAR |t|)
                                                     (QREFELT $ 64)))
                                          (SPADCALL (QCDR |t|) (QREFELT $ 65)))
                                         ('T (QCDR |t|))))
                                  #2#)
                                 . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   . #3#)
             (EXIT |lt|))))))) 

(DECLAIM (NOTINLINE |LieExponentials;|)) 

(DEFUN |LieExponentials| (&REST #1=#:G175)
  (SPROG NIL
         (PROG (#2=#:G176)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LieExponentials|)
                                               '|domainEqualList|)
                    . #3=(|LieExponentials|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LieExponentials;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|LieExponentials|)))))))))) 

(DEFUN |LieExponentials;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|LieExponentials|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT DV$3 (|devaluate| |#3|) . #1#)
          (LETT |dv$| (LIST '|LieExponentials| DV$1 DV$2 DV$3) . #1#)
          (LETT $ (GETREFV 73) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|LieExponentials|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (|XPBWPolynomial| |#1| |#2|))
          $))) 

(MAKEPROP '|LieExponentials| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|XPBWPolynomial| 6 7) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Rep| (0 . |Zero|) (|Equation| 7)
              (4 . |equation|) (|Boolean|) (|LyndonWord| 6) (10 . =) (16 . -)
              (22 . =) (28 . |lexico|) (34 . |One|) (|OutputForm|)
              (38 . |coerce|) (43 . ^) (49 . |coerce|) (54 . *)
              (|Record| (|:| |k| 14) (|:| |c| 7)) (|List| 25)
              |LEXP;LyndonCoordinates;$L;5| (|List| 11)
              |LEXP;identification;2$L;4| (|Record| (|:| |k| 34) (|:| |c| 7))
              (|List| 30) (60 . |listOfTerms|) (|Union| 14 '"failed")
              (|PoincareBirkhoffWittLyndonBasis| 6) (65 . |retractIfCan|)
              (|Mapping| 13 25 25) (70 . |sort|) (|NonNegativeInteger|)
              (76 . |product|) |LEXP;*;3$;6| (|LiePolynomial| 6 7)
              (83 . |coerce|) (88 . |exp|) |LEXP;exp;Lp$;7| (94 . |log|)
              (|Union| 41 '"failed") (100 . |LiePolyIfCan|) |LEXP;log;$Lp;8|
              (105 . |One|) (109 . =) (|Mapping| 20 20 20) (|List| 20)
              (115 . |reduce|) |LEXP;coerce;$Of;9| (|List| $) (|List| 6)
              (|PositiveInteger|) (121 . |LyndonWordsList|) (127 . |LiePoly|)
              (|List| 41) |LEXP;LyndonBasis;LL;10| |LEXP;coerce;$Xpbwp;11|
              (132 . |mirror|) (137 . |length|) (142 . -) |LEXP;inv;2$;12|
              (|XDistributedPolynomial| 6 7) (|Integer|) (|Union| $ '"failed")
              (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 147 |varList| 153 |sample| 158 |recip| 162 |one?| 167 |mirror|
              172 |log| 177 |listOfTerms| 182 |latex| 187 |inv| 192
              |identification| 197 |hashUpdate!| 203 |hash| 209 |exp| 214
              |conjugate| 219 |commutator| 225 |coerce| 231 ^ 246 |One| 264
              |LyndonCoordinates| 268 |LyndonBasis| 273 = 278 / 284 * 290)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|Group&| |Monoid&| |SemiGroup&| |SetCategory&|
                     |BasicType&| NIL NIL)
                  (CONS
                   '#((|Group|) (|Monoid|) (|SemiGroup|) (|SetCategory|)
                      (|BasicType|) (|unitsKnown|) (|CoercibleTo| 20))
                   (|makeByteWordVec2| 72
                                       '(0 7 0 10 2 11 0 7 7 12 2 14 13 0 0 15
                                         2 7 0 0 0 16 2 7 13 0 0 17 2 14 13 0 0
                                         18 0 7 0 19 1 14 20 0 21 2 20 0 0 0 22
                                         1 7 20 0 23 2 20 0 0 0 24 1 0 31 0 32
                                         1 34 33 0 35 2 26 0 36 0 37 3 9 0 0 0
                                         38 39 1 9 0 41 42 2 9 0 0 38 43 2 9 0
                                         0 38 45 1 9 46 0 47 0 0 0 49 2 0 13 0
                                         0 50 2 52 20 51 0 53 2 14 55 56 57 58
                                         1 41 0 14 59 1 0 0 0 63 1 34 38 0 64 1
                                         7 0 0 65 2 0 13 0 0 1 1 0 56 0 1 0 0 0
                                         1 1 0 69 0 1 1 0 13 0 1 1 0 0 0 63 1 0
                                         41 0 48 1 0 31 0 32 1 0 71 0 1 1 0 0 0
                                         66 2 0 28 0 0 29 2 0 70 70 0 1 1 0 72
                                         0 1 1 0 0 41 44 2 0 0 0 0 1 2 0 0 0 0
                                         1 1 0 67 0 1 1 0 5 0 62 1 0 20 0 54 2
                                         0 0 0 68 1 2 0 0 0 38 1 2 0 0 0 57 1 0
                                         0 0 49 1 0 26 0 27 1 0 60 56 61 2 0 13
                                         0 0 50 2 0 0 0 0 1 2 0 0 0 0 40)))))
           '|lookupComplete|)) 
