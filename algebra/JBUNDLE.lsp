
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
        (COND ((> |up| (QREFELT $ 8)) (|error| "Improper upper index"))
              ('T (LIST 1 |up|)))) 

(SDEFUN |JBUNDLE;U;Pi$;8| ((|up| |PositiveInteger|) ($ $))
        (SPROG ((#1=#:G136 NIL) (|i| NIL) (#2=#:G135 NIL))
               (SEQ
                (COND ((> |up| (QREFELT $ 9)) (|error| "Improper upper index"))
                      ('T
                       (CONS 2
                             (CONS |up|
                                   (PROGN
                                    (LETT #2# NIL)
                                    (SEQ (LETT |i| 1) (LETT #1# (QREFELT $ 8))
                                         G190
                                         (COND
                                          ((|greater_SI| |i| #1#) (GO G191)))
                                         (SEQ (EXIT (LETT #2# (CONS 0 #2#))))
                                         (LETT |i| (|inc_SI| |i|)) (GO G190)
                                         G191 (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |JBUNDLE;Pm;PiL$;9|
        ((|up| |PositiveInteger|) (|lo| |List| (|NonNegativeInteger|)) ($ $))
        (COND ((> |up| (QREFELT $ 9)) (|error| "Improper upper index"))
              ((SPADCALL (SPADCALL |lo| (QREFELT $ 34)) (QREFELT $ 8)
                         (QREFELT $ 36))
               (|error| "Improper multi-index"))
              ((|JBUNDLE;CheckZeroIndex| |lo| $)
               (SPADCALL |up| (QREFELT $ 32)))
              ('T (CONS 3 (CONS |up| |lo|))))) 

(SDEFUN |JBUNDLE;coerce;S$;10| ((|s| |Symbol|) ($ $))
        (SPROG ((#1=#:G144 NIL) (#2=#:G141 NIL) (|pos| (|Integer|)))
               (SEQ (LETT |pos| (SPADCALL |s| (QREFELT $ 6) (QREFELT $ 39)))
                    (EXIT
                     (COND
                      ((< |pos| (SPADCALL (QREFELT $ 6) (QREFELT $ 40)))
                       (SEQ
                        (LETT |pos|
                              (SPADCALL |s| (QREFELT $ 7) (QREFELT $ 39)))
                        (EXIT
                         (COND
                          ((< |pos| (SPADCALL (QREFELT $ 7) (QREFELT $ 40)))
                           (|error| "illegal symbol in JetBundle"))
                          (#3='T
                           (SPADCALL
                            (PROG1 (LETT #2# |pos|)
                              (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                                '(|Integer|) #2#))
                            (QREFELT $ 32)))))))
                      (#3#
                       (SPADCALL
                        (PROG1 (LETT #1# |pos|)
                          (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                            '(|Integer|) #1#))
                        (QREFELT $ 31)))))))) 

(SDEFUN |JBUNDLE;D;SL$;11| ((|u| |Symbol|) (|der| |List| (|Symbol|)) ($ $))
        (SPROG
         ((#1=#:G152 NIL) (|lower| (|List| (|PositiveInteger|)))
          (#2=#:G148 NIL) (|pos| #3=(|Integer|)) (#4=#:G156 NIL) (|d| NIL)
          (|up| #3#))
         (SEQ (LETT |up| (SPADCALL |u| (QREFELT $ 7) (QREFELT $ 39)))
              (EXIT
               (COND
                ((< |up| (SPADCALL (QREFELT $ 7) (QREFELT $ 40)))
                 (|error| #5="illegal symbol in JetBundle"))
                ('T
                 (SEQ (LETT |lower| NIL)
                      (SEQ (LETT |d| NIL) (LETT #4# |der|) G190
                           (COND
                            ((OR (ATOM #4#) (PROGN (LETT |d| (CAR #4#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |pos|
                                  (SPADCALL |d| (QREFELT $ 6) (QREFELT $ 39)))
                            (EXIT
                             (COND
                              ((< |pos|
                                  (SPADCALL (QREFELT $ 6) (QREFELT $ 40)))
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
                        |lower| (QREFELT $ 43)))))))))) 

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
                         (SEQ (LETT |mu| (SPADCALL |jv| (QREFELT $ 47)))
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
                                             (QREFELT $ 48))
                                            |lower|))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |lower| (NREVERSE |lower|))
                              (EXIT
                               (SPADCALL |res| |lower|
                                         (QREFELT $ 50))))))))))))) 

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
            (|spadConstant| $ 53))
           ('T
            (SEQ (LETT |opname| (SPADCALL |jv| (QREFELT $ 51)))
                 (LETT |jop| (SPADCALL |opname| (QREFELT $ 55)))
                 (SPADCALL |jop| (CONS (|function| |JBUNDLE;opdisp|) $)
                           (QREFELT $ 57))
                 (LETT |tmp| (SPADCALL |jv| (QREFELT $ 60)))
                 (LETT |jop| (SPADCALL |jop| '|%symbol| |tmp| (QREFELT $ 61)))
                 (LETT |tmp|
                       (SPADCALL (SPADCALL |jv| (QREFELT $ 62))
                                 (QREFELT $ 64)))
                 (LETT |jop| (SPADCALL |jop| '|%weight| |tmp| (QREFELT $ 61)))
                 (LETT |tmp|
                       (SPADCALL (SPADCALL |jv| (QREFELT $ 29))
                                 (QREFELT $ 66)))
                 (LETT |jop| (SPADCALL |jop| '|%jet| |tmp| (QREFELT $ 61)))
                 (LETT |arg|
                       (SPADCALL
                        (LIST (SPADCALL |opname| (QREFELT $ 67))
                              (SPADCALL (SPADCALL |jv| (QREFELT $ 28))
                                        (QREFELT $ 68)))
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |i| NIL)
                              (LETT #1# (SPADCALL |jv| (QREFELT $ 47))) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |i| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |i| (QREFELT $ 68))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        (QREFELT $ 70)))
                 (EXIT (SPADCALL |jop| |arg| (QREFELT $ 72))))))))) 

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
          (LETT $ (GETREFV 79))
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
              |JBUNDLE;getNotation;S;2| (15 . |copy|) (|List| 33)
              |JBUNDLE;multiIndex;$L;3| (|PositiveInteger|)
              |JBUNDLE;index;$Pi;4| |JBUNDLE;type;$S;5|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |JBUNDLE;One;$;12|) $))
              |JBUNDLE;X;Pi$;7| |JBUNDLE;U;Pi$;8| (|NonNegativeInteger|)
              (20 . |#|) (|Boolean|) (25 . ~=) |JBUNDLE;Pm;PiL$;9| (|Integer|)
              (31 . |position|) (37 . |minIndex|) |JBUNDLE;coerce;S$;10|
              (|List| 27) (42 . |Pr|) |JBUNDLE;D;SL$;11|
              |JBUNDLE;numIndVar;Pi;13| |JBUNDLE;numDepVar;Pi;14|
              (48 . |repeatedIndex|) (53 . |coerce|) (|List| 17)
              (58 . |subscript|) |JBUNDLE;name;$S;15| (|Expression| 38)
              (64 . |One|) (|BasicOperator|) (68 . |operator|)
              (|Mapping| 17 49) (73 . |display|) (|None|) (|NoneFunctions1| $$)
              (79 . |coerce|) (84 . |setProperty|) (91 . |weight|)
              (|NoneFunctions1| 33) (96 . |coerce|) (|NoneFunctions1| 21)
              (101 . |coerce|) (106 . |coerce|) (111 . |coerce|) (|List| 52)
              (116 . |concat!|) (|List| $) (122 . |kernel|)
              |JBUNDLE;coerce;$E;17| (|Union| $ '"failed") (|Union| $ '"0")
              (|List| 42) (|HashState|) (|SingleInteger|))
           '#(~= 128 |weight| 134 |variables| 139 |type| 150 |smaller?| 155
              |setNotation| 161 |repeatedIndex| 166 |r2m| 171 |order| 176
              |one?| 181 |numIndVar| 186 |numDepVar| 190 |name| 194
              |multiIndex| 199 |min| 204 |max| 210 |m2r| 216 |latex| 221
              |integrateIfCan| 226 |integrate| 232 |index| 238 |hashUpdate!|
              243 |hash| 249 |getNotation| 254 |dimS| 258 |dimJ| 263
              |differentiate| 268 |derivativeOf?| 274 |coerce| 280 |class| 295
              |allRepeated| 305 X 310 U 319 |Pr| 328 |Pm| 334 P 340 |One| 362 D
              366 >= 372 > 378 = 384 <= 390 < 396)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|JetBundleCategory&| |OrderedSet&| NIL |SetCategory&|
                     |BasicType&| NIL |PartialOrder&| NIL)
                  (CONS
                   '#((|JetBundleCategory|) (|OrderedSet|) (|Comparable|)
                      (|SetCategory|) (|BasicType|) (|CoercibleTo| 52)
                      (|PartialOrder|) (|CoercibleTo| 17))
                   (|makeByteWordVec2| 78
                                       '(1 11 0 10 12 1 17 0 16 18 1 17 19 0 20
                                         1 15 0 0 24 1 15 33 0 34 2 33 35 0 0
                                         36 2 10 38 21 0 39 1 10 38 0 40 2 0 0
                                         27 42 43 1 0 42 0 47 1 21 17 0 48 2 21
                                         0 0 49 50 0 52 0 53 1 54 0 21 55 2 54
                                         0 0 56 57 1 59 58 2 60 3 54 0 0 21 58
                                         61 1 0 33 0 62 1 63 58 33 64 1 65 58
                                         21 66 1 52 0 21 67 1 52 0 38 68 2 69 0
                                         0 0 70 2 52 0 54 71 72 2 0 35 0 0 1 1
                                         0 33 0 62 2 0 71 33 27 1 1 0 71 33 1 1
                                         0 21 0 29 2 0 35 0 0 1 1 0 21 21 22 1
                                         0 42 0 47 1 0 25 42 1 1 0 33 0 1 1 0
                                         35 0 1 0 0 27 45 0 0 27 46 1 0 21 0 51
                                         1 0 25 0 26 2 0 0 0 0 1 2 0 0 0 0 1 1
                                         0 42 25 1 1 0 16 0 1 2 0 74 0 27 1 2 0
                                         0 0 27 1 1 0 27 0 28 2 0 77 77 0 1 1 0
                                         78 0 1 0 0 21 23 1 0 33 33 1 1 0 33 33
                                         1 2 0 75 0 27 1 2 0 25 0 0 1 1 0 0 21
                                         41 1 0 52 0 73 1 0 17 0 1 1 0 33 0 1 1
                                         0 33 25 1 1 0 76 25 1 0 0 0 1 1 0 0 27
                                         31 0 0 0 1 1 0 0 27 32 2 0 0 27 42 43
                                         2 0 0 27 25 37 1 0 0 33 1 1 0 0 25 1 2
                                         0 0 27 33 1 2 0 0 27 25 1 0 0 0 30 2 0
                                         0 21 10 44 2 0 35 0 0 1 2 0 35 0 0 1 2
                                         0 35 0 0 1 2 0 35 0 0 1 2 0 35 0 0
                                         1)))))
           '|lookupComplete|)) 
