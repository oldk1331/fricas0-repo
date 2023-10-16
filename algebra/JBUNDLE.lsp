
(SDEFUN |JBUNDLE;setNotation;2S;1| ((|s| |Symbol|) ($ |Symbol|))
        (SEQ
         (SPADCALL
          (SPADCALL "only repeated index notation possible" (QREFELT $ 18))
          (QREFELT $ 20))
         (EXIT '|Repeated|))) 

(PUT '|JBUNDLE;getNotation;S;2| '|SPADreplace| '(XLAM NIL '|Repeated|)) 

(SDEFUN |JBUNDLE;getNotation;S;2| (($ |Symbol|)) '|Repeated|) 

(SDEFUN |JBUNDLE;multiIndex;$L;3| ((|jv| $) ($ |List| (|NonNegativeInteger|)))
        (SPADCALL (CDR (CDR |jv|)) (QREFELT $ 24))) 

(SDEFUN |JBUNDLE;index;$Pi;4| ((|jv| $) ($ |PositiveInteger|))
        (SPROG ((#1=#:G121 NIL))
               (PROG1 (LETT #1# (|SPADfirst| (CDR |jv|)))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |JBUNDLE;type;$S;5| ((|jv| $) ($ |Symbol|))
        (SPROG ((|t| (|NonNegativeInteger|)))
               (SEQ (LETT |t| (|SPADfirst| |jv|))
                    (EXIT
                     (COND ((ZEROP |t|) '|Const|) ((EQL |t| 1) '|Indep|)
                           ((EQL |t| 2) '|Dep|) ('T '|Deriv|)))))) 

(SDEFUN |JBUNDLE;CheckZeroIndex|
        ((|il| |List| (|NonNegativeInteger|)) ($ |Boolean|))
        (SPROG ((#1=#:G130 NIL) (#2=#:G131 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| NIL) (LETT #2# |il|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (ZEROP |i|))
                           (PROGN (LETT #1# NIL) (GO #3=#:G129))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |JBUNDLE;X;Pi$;7| ((|up| |PositiveInteger|) ($ $))
        (COND
         ((SPADCALL |up| (QREFELT $ 8) (QREFELT $ 32))
          (|error| "Improper upper index"))
         ('T (LIST 1 |up|)))) 

(SDEFUN |JBUNDLE;U;Pi$;8| ((|up| |PositiveInteger|) ($ $))
        (SPROG ((#1=#:G136 NIL) (|i| NIL) (#2=#:G135 NIL))
               (SEQ
                (COND
                 ((SPADCALL |up| (QREFELT $ 9) (QREFELT $ 32))
                  (|error| "Improper upper index"))
                 ('T
                  (CONS 2
                        (CONS |up|
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |i| 1) (LETT #1# (QREFELT $ 8)) G190
                                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                                    (SEQ (EXIT (LETT #2# (CONS 0 #2#))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |JBUNDLE;Pm;PiL$;9|
        ((|up| |PositiveInteger|) (|lo| |List| (|NonNegativeInteger|)) ($ $))
        (COND
         ((SPADCALL |up| (QREFELT $ 9) (QREFELT $ 32))
          (|error| "Improper upper index"))
         ((SPADCALL (SPADCALL |lo| (QREFELT $ 36)) (QREFELT $ 8)
                    (QREFELT $ 37))
          (|error| "Improper multi-index"))
         ((|JBUNDLE;CheckZeroIndex| |lo| $) (SPADCALL |up| (QREFELT $ 35)))
         ('T (CONS 3 (CONS |up| |lo|))))) 

(SDEFUN |JBUNDLE;coerce;S$;10| ((|s| |Symbol|) ($ $))
        (SPROG ((#1=#:G144 NIL) (#2=#:G141 NIL) (|pos| (|Integer|)))
               (SEQ (LETT |pos| (SPADCALL |s| (QREFELT $ 6) (QREFELT $ 40)))
                    (EXIT
                     (COND
                      ((< |pos| (SPADCALL (QREFELT $ 6) (QREFELT $ 41)))
                       (SEQ
                        (LETT |pos|
                              (SPADCALL |s| (QREFELT $ 7) (QREFELT $ 40)))
                        (EXIT
                         (COND
                          ((< |pos| (SPADCALL (QREFELT $ 7) (QREFELT $ 41)))
                           (|error| "illegal symbol in JetBundle"))
                          (#3='T
                           (SPADCALL
                            (PROG1 (LETT #2# |pos|)
                              (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                                '(|Integer|) #2#))
                            (QREFELT $ 35)))))))
                      (#3#
                       (SPADCALL
                        (PROG1 (LETT #1# |pos|)
                          (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                            '(|Integer|) #1#))
                        (QREFELT $ 34)))))))) 

(SDEFUN |JBUNDLE;D;SL$;11| ((|u| |Symbol|) (|der| |List| (|Symbol|)) ($ $))
        (SPROG
         ((#1=#:G152 NIL) (|lower| (|List| (|PositiveInteger|)))
          (#2=#:G148 NIL) (|pos| #3=(|Integer|)) (#4=#:G156 NIL) (|d| NIL)
          (|up| #3#))
         (SEQ (LETT |up| (SPADCALL |u| (QREFELT $ 7) (QREFELT $ 40)))
              (EXIT
               (COND
                ((< |up| (SPADCALL (QREFELT $ 7) (QREFELT $ 41)))
                 (|error| #5="illegal symbol in JetBundle"))
                ('T
                 (SEQ (LETT |lower| NIL)
                      (SEQ (LETT |d| NIL) (LETT #4# |der|) G190
                           (COND
                            ((OR (ATOM #4#) (PROGN (LETT |d| (CAR #4#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |pos|
                                  (SPADCALL |d| (QREFELT $ 6) (QREFELT $ 40)))
                            (EXIT
                             (COND
                              ((< |pos|
                                  (SPADCALL (QREFELT $ 6) (QREFELT $ 41)))
                               (|error| #5#))
                              ('T
                               (LETT |lower|
                                     (CONS
                                      (PROG1 (LETT #2# |pos|)
                                        (|check_subtype2| (> #2# 0)
                                                          '(|PositiveInteger|)
                                                          '(|Integer|) #2#))
                                      |lower|))))))
                           (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                      (LETT |lower| (NREVERSE |lower|))
                      (EXIT
                       (SPADCALL
                        (PROG1 (LETT #1# |up|)
                          (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                            '(|Integer|) #1#))
                        |lower| (QREFELT $ 44)))))))))) 

(PUT '|JBUNDLE;One;$;12| '|SPADreplace| '(XLAM NIL (LIST 0 1))) 

(SDEFUN |JBUNDLE;One;$;12| (($ $)) (LIST 0 1)) 

(SDEFUN |JBUNDLE;numIndVar;Pi;13| (($ |PositiveInteger|))
        (SPROG ((#1=#:G158 NIL))
               (PROG1 (LETT #1# (QREFELT $ 8))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |JBUNDLE;numDepVar;Pi;14| (($ |PositiveInteger|))
        (SPROG ((#1=#:G160 NIL))
               (PROG1 (LETT #1# (QREFELT $ 9))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |JBUNDLE;name;$S;15| ((|jv| $) ($ |Symbol|))
        (SPROG
         ((|lower| (|List| (|OutputForm|))) (#1=#:G168 NIL) (|j| NIL)
          (|res| (|Symbol|)) (|mu| (|List| (|PositiveInteger|)))
          (|i| (|PositiveInteger|)) (|jt| (|Symbol|)))
         (SEQ
          (COND
           ((EQUAL (LETT |jt| (SPADCALL |jv| (QREFELT $ 29))) '|Const|) '|1|)
           (#2='T
            (SEQ (LETT |i| (SPADCALL |jv| (QREFELT $ 28)))
                 (EXIT
                  (COND ((EQUAL |jt| '|Indep|) (QAREF1O (QREFELT $ 13) |i| 1))
                        ((EQUAL |jt| '|Dep|) (QAREF1O (QREFELT $ 14) |i| 1))
                        (#2#
                         (SEQ (LETT |mu| (SPADCALL |jv| (QREFELT $ 48)))
                              (LETT |res| (QAREF1O (QREFELT $ 14) |i| 1))
                              (LETT |lower| NIL)
                              (SEQ (LETT |j| NIL) (LETT #1# |mu|) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |j| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |lower|
                                           (CONS
                                            (SPADCALL
                                             (QAREF1O (QREFELT $ 13) |j| 1)
                                             (QREFELT $ 49))
                                            |lower|))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |lower| (NREVERSE |lower|))
                              (EXIT
                               (SPADCALL |res| |lower|
                                         (QREFELT $ 51))))))))))))) 

(PUT '|JBUNDLE;opdisp| '|SPADreplace| '|SPADfirst|) 

(SDEFUN |JBUNDLE;opdisp| ((|l| |List| (|OutputForm|)) ($ |OutputForm|))
        (|SPADfirst| |l|)) 

(SDEFUN |JBUNDLE;coerce;$E;17| ((|jv| $) ($ |Expression| (|Integer|)))
        (SPROG
         ((|arg| (|List| (|Expression| (|Integer|)))) (#1=#:G176 NIL) (|i| NIL)
          (#2=#:G175 NIL) (|jop| (|BasicOperator|)) (|tmp| (|None|))
          (|opname| (|Symbol|)))
         (SEQ
          (COND
           ((EQUAL (SPADCALL |jv| (QREFELT $ 29)) '|Const|)
            (|spadConstant| $ 54))
           ('T
            (SEQ (LETT |opname| (SPADCALL |jv| (QREFELT $ 52)))
                 (LETT |jop| (SPADCALL |opname| (QREFELT $ 56)))
                 (SPADCALL |jop| (CONS (|function| |JBUNDLE;opdisp|) $)
                           (QREFELT $ 58))
                 (LETT |tmp| (SPADCALL |jv| (QREFELT $ 61)))
                 (LETT |jop| (SPADCALL |jop| '|%symbol| |tmp| (QREFELT $ 62)))
                 (LETT |tmp|
                       (SPADCALL (SPADCALL |jv| (QREFELT $ 63))
                                 (QREFELT $ 65)))
                 (LETT |jop| (SPADCALL |jop| '|%weight| |tmp| (QREFELT $ 62)))
                 (LETT |tmp|
                       (SPADCALL (SPADCALL |jv| (QREFELT $ 29))
                                 (QREFELT $ 67)))
                 (LETT |jop| (SPADCALL |jop| '|%jet| |tmp| (QREFELT $ 62)))
                 (LETT |arg|
                       (SPADCALL
                        (LIST (SPADCALL |opname| (QREFELT $ 68))
                              (SPADCALL (SPADCALL |jv| (QREFELT $ 28))
                                        (QREFELT $ 69)))
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |i| NIL)
                              (LETT #1# (SPADCALL |jv| (QREFELT $ 48))) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |i| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |i| (QREFELT $ 69))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QREFELT $ 71)))
                 (EXIT (SPADCALL |jop| |arg| (QREFELT $ 73))))))))) 

(DECLAIM (NOTINLINE |JetBundle;|)) 

(DEFUN |JetBundle| (&REST #1=#:G183)
  (SPROG NIL
         (PROG (#2=#:G184)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|JetBundle|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |JetBundle;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|JetBundle|)))))))))) 

(DEFUN |JetBundle;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|JetBundle| DV$1 DV$2))
          (LETT $ (GETREFV 80))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|JetBundle| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 (LENGTH |#1|))
          (QSETREFV $ 9 (LENGTH |#2|))
          (QSETREFV $ 13 (SPADCALL |#1| (QREFELT $ 12)))
          (QSETREFV $ 14 (SPADCALL |#2| (QREFELT $ 12)))
          (QSETREFV $ 15 (|List| (|NonNegativeInteger|)))
          $))) 

(MAKEPROP '|JetBundle| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|nn| '|mm|
              (|List| 21) (|Vector| 21) (0 . |construct|) '|nameX| '|nameU|
              '|Rep| (|String|) (|OutputForm|) (5 . |message|) (|Void|)
              (10 . |print|) (|Symbol|) |JBUNDLE;setNotation;2S;1|
              |JBUNDLE;getNotation;S;2| (15 . |copy|) (|List| 31)
              |JBUNDLE;multiIndex;$L;3| (|PositiveInteger|)
              |JBUNDLE;index;$Pi;4| |JBUNDLE;type;$S;5| (|Boolean|)
              (|NonNegativeInteger|) (20 . >)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |JBUNDLE;One;$;12|) $))
              |JBUNDLE;X;Pi$;7| |JBUNDLE;U;Pi$;8| (26 . |#|) (31 . ~=)
              |JBUNDLE;Pm;PiL$;9| (|Integer|) (37 . |position|)
              (43 . |minIndex|) |JBUNDLE;coerce;S$;10| (|List| 27) (48 . |Pr|)
              |JBUNDLE;D;SL$;11| |JBUNDLE;numIndVar;Pi;13|
              |JBUNDLE;numDepVar;Pi;14| (54 . |repeatedIndex|) (59 . |coerce|)
              (|List| 17) (64 . |subscript|) |JBUNDLE;name;$S;15|
              (|Expression| 39) (70 . |One|) (|BasicOperator|)
              (74 . |operator|) (|Mapping| 17 50) (79 . |display|) (|None|)
              (|NoneFunctions1| $$) (85 . |coerce|) (90 . |setProperty|)
              (97 . |weight|) (|NoneFunctions1| 31) (102 . |coerce|)
              (|NoneFunctions1| 21) (107 . |coerce|) (112 . |coerce|)
              (117 . |coerce|) (|List| 53) (122 . |concat!|) (|List| $)
              (128 . |kernel|) |JBUNDLE;coerce;$E;17| (|Union| $ '"failed")
              (|Union| $ '"0") (|List| 43) (|HashState|) (|SingleInteger|))
           '#(~= 134 |weight| 140 |variables| 145 |type| 156 |smaller?| 161
              |setNotation| 167 |repeatedIndex| 172 |r2m| 177 |order| 182
              |one?| 187 |numIndVar| 192 |numDepVar| 196 |name| 200
              |multiIndex| 205 |min| 210 |max| 216 |m2r| 222 |latex| 227
              |integrateIfCan| 232 |integrate| 238 |index| 244 |hashUpdate!|
              249 |hash| 255 |getNotation| 260 |dimS| 264 |dimJ| 269
              |differentiate| 274 |derivativeOf?| 280 |coerce| 286 |class| 301
              |allRepeated| 311 X 316 U 325 |Pr| 334 |Pm| 340 P 346 |One| 368 D
              372 >= 378 > 384 = 390 <= 396 < 402)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|JetBundleCategory&| |OrderedSet&| NIL |SetCategory&|
                     |BasicType&| NIL |PartialOrder&| NIL)
                  (CONS
                   '#((|JetBundleCategory|) (|OrderedSet|) (|Comparable|)
                      (|SetCategory|) (|BasicType|) (|CoercibleTo| 53)
                      (|PartialOrder|) (|CoercibleTo| 17))
                   (|makeByteWordVec2| 79
                                       '(1 11 0 10 12 1 17 0 16 18 1 17 19 0 20
                                         1 15 0 0 24 2 31 30 0 0 32 1 15 31 0
                                         36 2 31 30 0 0 37 2 10 39 21 0 40 1 10
                                         39 0 41 2 0 0 27 43 44 1 0 43 0 48 1
                                         21 17 0 49 2 21 0 0 50 51 0 53 0 54 1
                                         55 0 21 56 2 55 0 0 57 58 1 60 59 2 61
                                         3 55 0 0 21 59 62 1 0 31 0 63 1 64 59
                                         31 65 1 66 59 21 67 1 53 0 21 68 1 53
                                         0 39 69 2 70 0 0 0 71 2 53 0 55 72 73
                                         2 0 30 0 0 1 1 0 31 0 63 2 0 72 31 27
                                         1 1 0 72 31 1 1 0 21 0 29 2 0 30 0 0 1
                                         1 0 21 21 22 1 0 43 0 48 1 0 25 43 1 1
                                         0 31 0 1 1 0 30 0 1 0 0 27 46 0 0 27
                                         47 1 0 21 0 52 1 0 25 0 26 2 0 0 0 0 1
                                         2 0 0 0 0 1 1 0 43 25 1 1 0 16 0 1 2 0
                                         75 0 27 1 2 0 0 0 27 1 1 0 27 0 28 2 0
                                         78 78 0 1 1 0 79 0 1 0 0 21 23 1 0 31
                                         31 1 1 0 31 31 1 2 0 76 0 27 1 2 0 25
                                         0 0 1 1 0 0 21 42 1 0 53 0 74 1 0 17 0
                                         1 1 0 31 0 1 1 0 31 25 1 1 0 77 25 1 0
                                         0 0 1 1 0 0 27 34 0 0 0 1 1 0 0 27 35
                                         2 0 0 27 43 44 2 0 0 27 25 38 1 0 0 31
                                         1 1 0 0 25 1 2 0 0 27 31 1 2 0 0 27 25
                                         1 0 0 0 33 2 0 0 21 10 45 2 0 30 0 0 1
                                         2 0 30 0 0 1 2 0 30 0 0 1 2 0 30 0 0 1
                                         2 0 30 0 0 1)))))
           '|lookupComplete|)) 
