
(SDEFUN |IJB;setNotation;2S;1| ((|s| |Symbol|) ($ |Symbol|))
        (SPROG ((|t| (|Symbol|)))
               (SEQ
                (COND
                 ((NULL
                   (SPADCALL |s| (LIST '|Multi| '|Repeated|) (QREFELT $ 16)))
                  (|error| "Unknown notation"))
                 ('T
                  (SEQ (LETT |t| (QREFELT $ 12) |IJB;setNotation;2S;1|)
                       (SETELT $ 12 |s|) (EXIT |t|))))))) 

(SDEFUN |IJB;getNotation;S;2| (($ |Symbol|)) (QREFELT $ 12)) 

(SDEFUN |IJB;multiIndex;$L;3| ((|jv| $) ($ |List| (|NonNegativeInteger|)))
        (SPADCALL (CDR (CDR |jv|)) (QREFELT $ 19))) 

(SDEFUN |IJB;index;$Pi;4| ((|jv| $) ($ |PositiveInteger|))
        (SPROG ((#1=#:G115 NIL))
               (PROG1 (LETT #1# (|SPADfirst| (CDR |jv|)) |IJB;index;$Pi;4|)
                 (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#)))) 

(SDEFUN |IJB;type;$S;5| ((|jv| $) ($ |Symbol|))
        (SPROG ((|t| (|NonNegativeInteger|)))
               (SEQ (LETT |t| (|SPADfirst| |jv|) |IJB;type;$S;5|)
                    (EXIT
                     (COND ((ZEROP |t|) '|Const|) ((EQL |t| 1) '|Indep|)
                           ((EQL |t| 2) '|Dep|) ('T '|Deriv|)))))) 

(SDEFUN |IJB;CheckZeroIndex|
        ((|il| |List| (|NonNegativeInteger|)) ($ |Boolean|))
        (SPROG ((#1=#:G124 NIL) (#2=#:G125 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| NIL . #3=(|IJB;CheckZeroIndex|))
                       (LETT #2# |il| . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (ZEROP |i|))
                           (PROGN (LETT #1# 'NIL . #3#) (GO #4=#:G123))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #4# (EXIT #1#)))) 

(SDEFUN |IJB;X;Pi$;7| ((|up| |PositiveInteger|) ($ $))
        (COND
         ((SPADCALL |up| (QREFELT $ 9) (QREFELT $ 25))
          (|error| "Improper upper index"))
         ('T (LIST 1 |up|)))) 

(SDEFUN |IJB;U;Pi$;8| ((|up| |PositiveInteger|) ($ $))
        (SPROG ((#1=#:G130 NIL) (|i| NIL) (#2=#:G129 NIL))
               (SEQ
                (COND
                 ((SPADCALL |up| (QREFELT $ 10) (QREFELT $ 25))
                  (|error| "Improper upper index"))
                 ('T
                  (CONS 2
                        (CONS |up|
                              (PROGN
                               (LETT #2# NIL . #3=(|IJB;U;Pi$;8|))
                               (SEQ (LETT |i| 1 . #3#)
                                    (LETT #1# (QREFELT $ 9) . #3#) G190
                                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                                    (SEQ (EXIT (LETT #2# (CONS 0 #2#) . #3#)))
                                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190)
                                    G191 (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |IJB;Pm;PiL$;9|
        ((|up| |PositiveInteger|) (|lo| |List| (|NonNegativeInteger|)) ($ $))
        (COND
         ((SPADCALL |up| (QREFELT $ 10) (QREFELT $ 25))
          (|error| "Improper upper index"))
         ((SPADCALL (SPADCALL |lo| (QREFELT $ 29)) (QREFELT $ 9)
                    (QREFELT $ 30))
          (|error| |errmsg1|))
         ((|IJB;CheckZeroIndex| |lo| $) (SPADCALL |up| (QREFELT $ 27)))
         ('T (CONS 3 (CONS |up| |lo|))))) 

(PUT '|IJB;One;$;10| '|SPADreplace| '(XLAM NIL (LIST 0 1))) 

(SDEFUN |IJB;One;$;10| (($ $)) (LIST 0 1)) 

(SDEFUN |IJB;numIndVar;Pi;11| (($ |PositiveInteger|)) (QREFELT $ 9)) 

(SDEFUN |IJB;numDepVar;Pi;12| (($ |PositiveInteger|)) (QREFELT $ 10)) 

(SDEFUN |IJB;name;$S;13| ((|jv| $) ($ |Symbol|))
        (SPROG
         ((#1=#:G153 NIL) (|j| NIL) (#2=#:G152 NIL) (#3=#:G151 NIL)
          (#4=#:G150 NIL) (#5=#:G149 NIL) (|i| NIL) (#6=#:G148 NIL)
          (#7=#:G147 NIL) (#8=#:G146 NIL) (|jt| (|Symbol|)))
         (SEQ
          (LETT |jt| (SPADCALL |jv| (QREFELT $ 24)) . #9=(|IJB;name;$S;13|))
          (EXIT
           (COND ((EQUAL |jt| '|Const|) '|1|)
                 ((EQUAL |jt| '|Indep|)
                  (COND
                   ((SPADCALL (QREFELT $ 9) 1 (QREFELT $ 25))
                    (SPADCALL (QREFELT $ 6)
                              (LIST
                               (SPADCALL (SPADCALL |jv| (QREFELT $ 23))
                                         (QREFELT $ 36)))
                              (QREFELT $ 38)))
                   (#10='T (QREFELT $ 6))))
                 ((EQUAL |jt| '|Dep|)
                  (COND
                   ((SPADCALL (QREFELT $ 10) 1 (QREFELT $ 25))
                    (SPADCALL (QREFELT $ 7)
                              (LIST
                               (SPADCALL (SPADCALL |jv| (QREFELT $ 23))
                                         (QREFELT $ 36)))
                              (QREFELT $ 38)))
                   (#10# (QREFELT $ 7))))
                 ((EQUAL (SPADCALL (QREFELT $ 18)) '|Multi|)
                  (COND
                   ((SPADCALL (QREFELT $ 10) 1 (QREFELT $ 25))
                    (SPADCALL (QREFELT $ 8)
                              (VECTOR
                               (LIST
                                (SPADCALL
                                 (SPADCALL
                                  (PROGN
                                   (LETT #8# NIL . #9#)
                                   (SEQ (LETT |i| NIL . #9#)
                                        (LETT #7#
                                              (SPADCALL |jv| (QREFELT $ 21))
                                              . #9#)
                                        G190
                                        (COND
                                         ((OR (ATOM #7#)
                                              (PROGN
                                               (LETT |i| (CAR #7#) . #9#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #8#
                                                (CONS
                                                 (SPADCALL |i| (QREFELT $ 39))
                                                 #8#)
                                                . #9#)))
                                        (LETT #7# (CDR #7#) . #9#) (GO G190)
                                        G191 (EXIT (NREVERSE #8#))))
                                  (QREFELT $ 41))
                                 (QREFELT $ 42)))
                               (LIST
                                (SPADCALL (SPADCALL |jv| (QREFELT $ 23))
                                          (QREFELT $ 36)))
                               NIL NIL NIL)
                              (QREFELT $ 44)))
                   (#10#
                    (SPADCALL (QREFELT $ 8)
                              (LIST
                               (SPADCALL
                                (SPADCALL
                                 (PROGN
                                  (LETT #6# NIL . #9#)
                                  (SEQ (LETT |i| NIL . #9#)
                                       (LETT #5# (SPADCALL |jv| (QREFELT $ 21))
                                             . #9#)
                                       G190
                                       (COND
                                        ((OR (ATOM #5#)
                                             (PROGN
                                              (LETT |i| (CAR #5#) . #9#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #6#
                                               (CONS
                                                (SPADCALL |i| (QREFELT $ 39))
                                                #6#)
                                               . #9#)))
                                       (LETT #5# (CDR #5#) . #9#) (GO G190)
                                       G191 (EXIT (NREVERSE #6#))))
                                 (QREFELT $ 41))
                                (QREFELT $ 42)))
                              (QREFELT $ 45)))))
                 ((SPADCALL (QREFELT $ 10) 1 (QREFELT $ 25))
                  (SPADCALL (QREFELT $ 8)
                            (VECTOR
                             (LIST
                              (SPADCALL
                               (PROGN
                                (LETT #4# NIL . #9#)
                                (SEQ (LETT |j| NIL . #9#)
                                     (LETT #3# (SPADCALL |jv| (QREFELT $ 47))
                                           . #9#)
                                     G190
                                     (COND
                                      ((OR (ATOM #3#)
                                           (PROGN
                                            (LETT |j| (CAR #3#) . #9#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #4#
                                             (CONS
                                              (SPADCALL |j| (QREFELT $ 36))
                                              #4#)
                                             . #9#)))
                                     (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                                     (EXIT (NREVERSE #4#))))
                               (QREFELT $ 48)))
                             (LIST
                              (SPADCALL (SPADCALL |jv| (QREFELT $ 23))
                                        (QREFELT $ 36)))
                             NIL NIL NIL)
                            (QREFELT $ 44)))
                 (#10#
                  (SPADCALL (QREFELT $ 8)
                            (LIST
                             (SPADCALL
                              (PROGN
                               (LETT #2# NIL . #9#)
                               (SEQ (LETT |j| NIL . #9#)
                                    (LETT #1# (SPADCALL |jv| (QREFELT $ 47))
                                          . #9#)
                                    G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN
                                           (LETT |j| (CAR #1#) . #9#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS (SPADCALL |j| (QREFELT $ 36))
                                                  #2#)
                                            . #9#)))
                                    (LETT #1# (CDR #1#) . #9#) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT $ 48)))
                            (QREFELT $ 45)))))))) 

(PUT '|IJB;opdisp| '|SPADreplace| '|SPADfirst|) 

(SDEFUN |IJB;opdisp| ((|l| |List| (|OutputForm|)) ($ |OutputForm|))
        (|SPADfirst| |l|)) 

(SDEFUN |IJB;coerce;$E;15| ((|jv| $) ($ |Expression| (|Integer|)))
        (SPROG
         ((|arg| (|List| (|Expression| (|Integer|)))) (#1=#:G164 NIL) (|j| NIL)
          (#2=#:G163 NIL) (#3=#:G162 NIL) (|i| NIL) (#4=#:G161 NIL)
          (|jop| (|BasicOperator|)) (|tmp| (|None|)) (|opname| (|Symbol|)))
         (SEQ
          (COND
           ((EQUAL (SPADCALL |jv| (QREFELT $ 24)) '|Const|)
            (|spadConstant| $ 51))
           (#5='T
            (SEQ
             (LETT |opname| (SPADCALL |jv| (QREFELT $ 49))
                   . #6=(|IJB;coerce;$E;15|))
             (LETT |jop| (SPADCALL |opname| (QREFELT $ 53)) . #6#)
             (SPADCALL |jop| (CONS (|function| |IJB;opdisp|) $) (QREFELT $ 55))
             (LETT |tmp| (SPADCALL |jv| (QREFELT $ 58)) . #6#)
             (LETT |jop| (SPADCALL |jop| '|%symbol| |tmp| (QREFELT $ 59))
                   . #6#)
             (LETT |tmp|
                   (SPADCALL (SPADCALL |jv| (QREFELT $ 60)) (QREFELT $ 62))
                   . #6#)
             (LETT |jop| (SPADCALL |jop| '|%weight| |tmp| (QREFELT $ 59))
                   . #6#)
             (LETT |tmp|
                   (SPADCALL (SPADCALL |jv| (QREFELT $ 24)) (QREFELT $ 64))
                   . #6#)
             (LETT |jop| (SPADCALL |jop| '|%jet| |tmp| (QREFELT $ 59)) . #6#)
             (COND
              ((EQUAL (SPADCALL (QREFELT $ 18)) '|Multi|)
               (LETT |arg|
                     (PROGN
                      (LETT #4# NIL . #6#)
                      (SEQ (LETT |i| NIL . #6#)
                           (LETT #3# (SPADCALL |jv| (QREFELT $ 21)) . #6#) G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN (LETT |i| (CAR #3#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #4# (CONS (SPADCALL |i| (QREFELT $ 66)) #4#)
                                   . #6#)))
                           (LETT #3# (CDR #3#) . #6#) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     . #6#))
              (#5#
               (LETT |arg|
                     (PROGN
                      (LETT #2# NIL . #6#)
                      (SEQ (LETT |j| NIL . #6#)
                           (LETT #1# (SPADCALL |jv| (QREFELT $ 47)) . #6#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |j| (CAR #1#) . #6#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2# (CONS (SPADCALL |j| (QREFELT $ 66)) #2#)
                                   . #6#)))
                           (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     . #6#)))
             (LETT |arg|
                   (SPADCALL
                    (LIST (SPADCALL |opname| (QREFELT $ 67))
                          (SPADCALL (SPADCALL |jv| (QREFELT $ 23))
                                    (QREFELT $ 66)))
                    |arg| (QREFELT $ 69))
                   . #6#)
             (EXIT (SPADCALL |jop| |arg| (QREFELT $ 70))))))))) 

(DECLAIM (NOTINLINE |IndexedJetBundle;|)) 

(DEFUN |IndexedJetBundle| (&REST #1=#:G171)
  (SPROG NIL
         (PROG (#2=#:G172)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IndexedJetBundle|)
                                               '|domainEqualList|)
                    . #3=(|IndexedJetBundle|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |IndexedJetBundle;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|IndexedJetBundle|)))))))))) 

(DEFUN |IndexedJetBundle;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|IndexedJetBundle|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|IndexedJetBundle| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
    (LETT $ (GETREFV 78) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|IndexedJetBundle|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 11 (|List| (|NonNegativeInteger|)))
    (QSETREFV $ 12 '|Repeated|)
    $))) 

(MAKEPROP '|IndexedJetBundle| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) '|Rep| '|notation|
              (|Boolean|) (|Symbol|) (|List| 14) (0 . |member?|)
              |IJB;setNotation;2S;1| |IJB;getNotation;S;2| (6 . |copy|)
              (|List| 28) |IJB;multiIndex;$L;3| (|PositiveInteger|)
              |IJB;index;$Pi;4| |IJB;type;$S;5| (11 . >) |IJB;X;Pi$;7|
              |IJB;U;Pi$;8| (|NonNegativeInteger|) (17 . |#|) (22 . ~=)
              |IJB;Pm;PiL$;9| |IJB;One;$;10| |IJB;numIndVar;Pi;11|
              |IJB;numDepVar;Pi;12| (|OutputForm|) (28 . |coerce|) (|List| 35)
              (33 . |superscript|) (39 . |coerce|) (|List| $)
              (44 . |commaSeparate|) (49 . |bracket|)
              (|Record| (|:| |sub| 37) (|:| |sup| 37) (|:| |presup| 37)
                        (|:| |presub| 37) (|:| |args| 37))
              (54 . |script|) (60 . |subscript|) (|List| 22)
              (66 . |repeatedIndex|) (71 . |blankSeparate|) |IJB;name;$S;13|
              (|Expression| 65) (76 . |One|) (|BasicOperator|)
              (80 . |operator|) (|Mapping| 35 37) (85 . |display|) (|None|)
              (|NoneFunctions1| $$) (91 . |coerce|) (96 . |setProperty|)
              (103 . |weight|) (|NoneFunctions1| 28) (108 . |coerce|)
              (|NoneFunctions1| 14) (113 . |coerce|) (|Integer|)
              (118 . |coerce|) (123 . |coerce|) (|List| 50) (128 . |concat!|)
              (134 . |kernel|) |IJB;coerce;$E;15| (|Union| $ '"failed")
              (|Union| $ '"0") (|List| 46) (|HashState|) (|String|)
              (|SingleInteger|))
           '#(~= 140 |weight| 146 |variables| 151 |type| 162 |smaller?| 167
              |setNotation| 173 |repeatedIndex| 178 |r2m| 183 |order| 188
              |one?| 193 |numIndVar| 198 |numDepVar| 202 |name| 206
              |multiIndex| 211 |min| 216 |max| 222 |m2r| 228 |latex| 233
              |integrateIfCan| 238 |integrate| 244 |index| 250 |hashUpdate!|
              255 |hash| 261 |getNotation| 266 |dimS| 270 |dimJ| 275
              |differentiate| 280 |derivativeOf?| 286 |coerce| 292 |class| 302
              |allRepeated| 312 X 317 U 326 |Pr| 335 |Pm| 341 P 347 |One| 369
              >= 373 > 379 = 385 <= 391 < 397)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|JetBundleCategory&| |OrderedSet&| NIL |SetCategory&|
                     |BasicType&| NIL |PartialOrder&| NIL)
                  (CONS
                   '#((|JetBundleCategory|) (|OrderedSet|) (|Comparable|)
                      (|SetCategory|) (|BasicType|) (|CoercibleTo| 50)
                      (|PartialOrder|) (|CoercibleTo| 35))
                   (|makeByteWordVec2| 77
                                       '(2 15 13 14 0 16 1 11 0 0 19 2 22 13 0
                                         0 25 1 11 28 0 29 2 28 13 0 0 30 1 22
                                         35 0 36 2 14 0 0 37 38 1 28 35 0 39 1
                                         35 0 40 41 1 35 0 0 42 2 14 0 0 43 44
                                         2 14 0 0 37 45 1 0 46 0 47 1 35 0 40
                                         48 0 50 0 51 1 52 0 14 53 2 52 0 0 54
                                         55 1 57 56 2 58 3 52 0 0 14 56 59 1 0
                                         28 0 60 1 61 56 28 62 1 63 56 14 64 1
                                         50 0 65 66 1 50 0 14 67 2 68 0 0 0 69
                                         2 50 0 52 40 70 2 0 13 0 0 1 1 0 28 0
                                         60 1 0 40 28 1 2 0 40 28 22 1 1 0 14 0
                                         24 2 0 13 0 0 1 1 0 14 14 17 1 0 46 0
                                         47 1 0 20 46 1 1 0 28 0 1 1 0 13 0 1 0
                                         0 22 33 0 0 22 34 1 0 14 0 49 1 0 20 0
                                         21 2 0 0 0 0 1 2 0 0 0 0 1 1 0 46 20 1
                                         1 0 76 0 1 2 0 72 0 22 1 2 0 0 0 22 1
                                         1 0 22 0 23 2 0 75 75 0 1 1 0 77 0 1 0
                                         0 14 18 1 0 28 28 1 1 0 28 28 1 2 0 73
                                         0 22 1 2 0 20 0 0 1 1 0 50 0 71 1 0 35
                                         0 1 1 0 28 0 1 1 0 28 20 1 1 0 74 20 1
                                         0 0 0 1 1 0 0 22 26 0 0 0 1 1 0 0 22
                                         27 2 0 0 22 46 1 2 0 0 22 20 31 1 0 0
                                         28 1 1 0 0 20 1 2 0 0 22 28 1 2 0 0 22
                                         20 1 0 0 0 32 2 0 13 0 0 1 2 0 13 0 0
                                         1 2 0 13 0 0 1 2 0 13 0 0 1 2 0 13 0 0
                                         1)))))
           '|lookupComplete|)) 
