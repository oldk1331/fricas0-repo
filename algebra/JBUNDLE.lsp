
(SDEFUN |JBUNDLE;setNotation;2S;1| ((|s| |Symbol|) ($ |Symbol|))
        (SEQ (SPADCALL "only repeated index notation possible" (QREFELT $ 18))
             (EXIT '|Repeated|))) 

(PUT '|JBUNDLE;getNotation;S;2| '|SPADreplace| '(XLAM NIL '|Repeated|)) 

(SDEFUN |JBUNDLE;getNotation;S;2| (($ |Symbol|)) '|Repeated|) 

(SDEFUN |JBUNDLE;multiIndex;$L;3| ((|jv| $) ($ |List| (|NonNegativeInteger|)))
        (SPADCALL (CDR (CDR |jv|)) (QREFELT $ 22))) 

(SDEFUN |JBUNDLE;index;$Pi;4| ((|jv| $) ($ |PositiveInteger|))
        (SPROG ((#1=#:G121 NIL))
               (PROG1 (LETT #1# (|SPADfirst| (CDR |jv|)) |JBUNDLE;index;$Pi;4|)
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |JBUNDLE;type;$S;5| ((|jv| $) ($ |Symbol|))
        (SPROG ((|t| (|NonNegativeInteger|)))
               (SEQ (LETT |t| (|SPADfirst| |jv|) |JBUNDLE;type;$S;5|)
                    (EXIT
                     (COND ((ZEROP |t|) '|Const|) ((EQL |t| 1) '|Indep|)
                           ((EQL |t| 2) '|Dep|) ('T '|Deriv|)))))) 

(SDEFUN |JBUNDLE;CheckZeroIndex|
        ((|il| |List| (|NonNegativeInteger|)) ($ |Boolean|))
        (SPROG ((#1=#:G130 NIL) (#2=#:G131 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| NIL . #3=(|JBUNDLE;CheckZeroIndex|))
                       (LETT #2# |il| . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL (ZEROP |i|))
                           (PROGN (LETT #1# 'NIL . #3#) (GO #4=#:G129))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #4# (EXIT #1#)))) 

(SDEFUN |JBUNDLE;X;Pi$;7| ((|up| |PositiveInteger|) ($ $))
        (COND
         ((SPADCALL |up| (QREFELT $ 8) (QREFELT $ 30))
          (|error| "Improper upper index"))
         ('T (LIST 1 |up|)))) 

(SDEFUN |JBUNDLE;U;Pi$;8| ((|up| |PositiveInteger|) ($ $))
        (SPROG ((#1=#:G136 NIL) (|i| NIL) (#2=#:G135 NIL))
               (SEQ
                (COND
                 ((SPADCALL |up| (QREFELT $ 9) (QREFELT $ 30))
                  (|error| "Improper upper index"))
                 ('T
                  (CONS 2
                        (CONS |up|
                              (PROGN
                               (LETT #2# NIL . #3=(|JBUNDLE;U;Pi$;8|))
                               (SEQ (LETT |i| 1 . #3#)
                                    (LETT #1# (QREFELT $ 8) . #3#) G190
                                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                                    (SEQ (EXIT (LETT #2# (CONS 0 #2#) . #3#)))
                                    (LETT |i| (|inc_SI| |i|) . #3#) (GO G190)
                                    G191 (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |JBUNDLE;Pm;PiL$;9|
        ((|up| |PositiveInteger|) (|lo| |List| (|NonNegativeInteger|)) ($ $))
        (COND
         ((SPADCALL |up| (QREFELT $ 9) (QREFELT $ 30))
          (|error| "Improper upper index"))
         ((SPADCALL (SPADCALL |lo| (QREFELT $ 33)) (QREFELT $ 8)
                    (QREFELT $ 34))
          (|error| "Improper multi-index"))
         ((|JBUNDLE;CheckZeroIndex| |lo| $) (SPADCALL |up| (QREFELT $ 32)))
         ('T (CONS 3 (CONS |up| |lo|))))) 

(SDEFUN |JBUNDLE;coerce;S$;10| ((|s| |Symbol|) ($ $))
        (SPROG ((#1=#:G144 NIL) (#2=#:G141 NIL) (|pos| (|Integer|)))
               (SEQ
                (LETT |pos| (SPADCALL |s| (QREFELT $ 6) (QREFELT $ 37))
                      . #3=(|JBUNDLE;coerce;S$;10|))
                (EXIT
                 (COND
                  ((< |pos| (SPADCALL (QREFELT $ 6) (QREFELT $ 38)))
                   (SEQ
                    (LETT |pos| (SPADCALL |s| (QREFELT $ 7) (QREFELT $ 37))
                          . #3#)
                    (EXIT
                     (COND
                      ((< |pos| (SPADCALL (QREFELT $ 7) (QREFELT $ 38)))
                       (|error| "illegal symbol in JetBundle"))
                      (#4='T
                       (SPADCALL
                        (PROG1 (LETT #2# |pos| . #3#)
                          (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                            '(|Integer|) #2#))
                        (QREFELT $ 32)))))))
                  (#4#
                   (SPADCALL
                    (PROG1 (LETT #1# |pos| . #3#)
                      (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                        '(|Integer|) #1#))
                    (QREFELT $ 31)))))))) 

(SDEFUN |JBUNDLE;D;SL$;11| ((|u| |Symbol|) (|der| |List| (|Symbol|)) ($ $))
        (SPROG
         ((#1=#:G152 NIL) (|lower| (|List| (|PositiveInteger|)))
          (#2=#:G148 NIL) (|pos| #3=(|Integer|)) (#4=#:G156 NIL) (|d| NIL)
          (|up| #3#))
         (SEQ
          (LETT |up| (SPADCALL |u| (QREFELT $ 7) (QREFELT $ 37))
                . #5=(|JBUNDLE;D;SL$;11|))
          (EXIT
           (COND
            ((< |up| (SPADCALL (QREFELT $ 7) (QREFELT $ 38)))
             (|error| #6="illegal symbol in JetBundle"))
            ('T
             (SEQ (LETT |lower| NIL . #5#)
                  (SEQ (LETT |d| NIL . #5#) (LETT #4# |der| . #5#) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |d| (CAR #4#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |pos| (SPADCALL |d| (QREFELT $ 6) (QREFELT $ 37))
                              . #5#)
                        (EXIT
                         (COND
                          ((< |pos| (SPADCALL (QREFELT $ 6) (QREFELT $ 38)))
                           (|error| #6#))
                          ('T
                           (LETT |lower|
                                 (CONS
                                  (PROG1 (LETT #2# |pos| . #5#)
                                    (|check_subtype2| (> #2# 0)
                                                      '(|PositiveInteger|)
                                                      '(|Integer|) #2#))
                                  |lower|)
                                 . #5#)))))
                       (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                  (LETT |lower| (NREVERSE |lower|) . #5#)
                  (EXIT
                   (SPADCALL
                    (PROG1 (LETT #1# |up| . #5#)
                      (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                        '(|Integer|) #1#))
                    |lower| (QREFELT $ 41)))))))))) 

(PUT '|JBUNDLE;One;$;12| '|SPADreplace| '(XLAM NIL (LIST 0 1))) 

(SDEFUN |JBUNDLE;One;$;12| (($ $)) (LIST 0 1)) 

(SDEFUN |JBUNDLE;numIndVar;Pi;13| (($ |PositiveInteger|))
        (SPROG ((#1=#:G158 NIL))
               (PROG1 (LETT #1# (QREFELT $ 8) |JBUNDLE;numIndVar;Pi;13|)
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |JBUNDLE;numDepVar;Pi;14| (($ |PositiveInteger|))
        (SPROG ((#1=#:G160 NIL))
               (PROG1 (LETT #1# (QREFELT $ 9) |JBUNDLE;numDepVar;Pi;14|)
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |JBUNDLE;name;$S;15| ((|jv| $) ($ |Symbol|))
        (SPROG
         ((|lower| (|List| (|OutputForm|))) (#1=#:G168 NIL) (|j| NIL)
          (|res| (|Symbol|)) (|mu| (|List| (|PositiveInteger|)))
          (|i| (|PositiveInteger|)) (|jt| (|Symbol|)))
         (SEQ
          (COND
           ((EQUAL
             (LETT |jt| (SPADCALL |jv| (QREFELT $ 27))
                   . #2=(|JBUNDLE;name;$S;15|))
             '|Const|)
            '|1|)
           (#3='T
            (SEQ (LETT |i| (SPADCALL |jv| (QREFELT $ 26)) . #2#)
                 (EXIT
                  (COND ((EQUAL |jt| '|Indep|) (QAREF1O (QREFELT $ 13) |i| 1))
                        ((EQUAL |jt| '|Dep|) (QAREF1O (QREFELT $ 14) |i| 1))
                        (#3#
                         (SEQ (LETT |mu| (SPADCALL |jv| (QREFELT $ 46)) . #2#)
                              (LETT |res| (QAREF1O (QREFELT $ 14) |i| 1) . #2#)
                              (LETT |lower| NIL . #2#)
                              (SEQ (LETT |j| NIL . #2#) (LETT #1# |mu| . #2#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |j| (CAR #1#) . #2#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |lower|
                                           (CONS
                                            (SPADCALL
                                             (QAREF1O (QREFELT $ 13) |j| 1)
                                             (QREFELT $ 48))
                                            |lower|)
                                           . #2#)))
                                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |lower| (NREVERSE |lower|) . #2#)
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
           ((EQUAL (SPADCALL |jv| (QREFELT $ 27)) '|Const|)
            (|spadConstant| $ 53))
           ('T
            (SEQ
             (LETT |opname| (SPADCALL |jv| (QREFELT $ 51))
                   . #3=(|JBUNDLE;coerce;$E;17|))
             (LETT |jop| (SPADCALL |opname| (QREFELT $ 55)) . #3#)
             (SPADCALL |jop| (CONS (|function| |JBUNDLE;opdisp|) $)
                       (QREFELT $ 57))
             (LETT |tmp| (SPADCALL |jv| (QREFELT $ 60)) . #3#)
             (LETT |jop| (SPADCALL |jop| '|%symbol| |tmp| (QREFELT $ 61))
                   . #3#)
             (LETT |tmp|
                   (SPADCALL (SPADCALL |jv| (QREFELT $ 62)) (QREFELT $ 64))
                   . #3#)
             (LETT |jop| (SPADCALL |jop| '|%weight| |tmp| (QREFELT $ 61))
                   . #3#)
             (LETT |tmp|
                   (SPADCALL (SPADCALL |jv| (QREFELT $ 27)) (QREFELT $ 66))
                   . #3#)
             (LETT |jop| (SPADCALL |jop| '|%jet| |tmp| (QREFELT $ 61)) . #3#)
             (LETT |arg|
                   (SPADCALL
                    (LIST (SPADCALL |opname| (QREFELT $ 67))
                          (SPADCALL (SPADCALL |jv| (QREFELT $ 26))
                                    (QREFELT $ 68)))
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |i| NIL . #3#)
                          (LETT #1# (SPADCALL |jv| (QREFELT $ 46)) . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL |i| (QREFELT $ 68)) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    (QREFELT $ 70))
                   . #3#)
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
                                               '|domainEqualList|)
                    . #3=(|JetBundle|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |JetBundle;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|JetBundle|)))))))))) 

(DEFUN |JetBundle;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|JetBundle|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|JetBundle| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 80) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
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
              (|List| 19) (|Vector| 19) (0 . |construct|) '|nameX| '|nameU|
              '|Rep| (|Void|) (|OutputForm|) (5 . |print|) (|Symbol|)
              |JBUNDLE;setNotation;2S;1| |JBUNDLE;getNotation;S;2|
              (10 . |copy|) (|List| 29) |JBUNDLE;multiIndex;$L;3|
              (|PositiveInteger|) |JBUNDLE;index;$Pi;4| |JBUNDLE;type;$S;5|
              (|Boolean|) (|NonNegativeInteger|) (15 . >) |JBUNDLE;X;Pi$;7|
              |JBUNDLE;U;Pi$;8| (21 . |#|) (26 . ~=) |JBUNDLE;Pm;PiL$;9|
              (|Integer|) (32 . |position|) (38 . |minIndex|)
              |JBUNDLE;coerce;S$;10| (|List| 25) (43 . |Pr|) |JBUNDLE;D;SL$;11|
              |JBUNDLE;One;$;12| |JBUNDLE;numIndVar;Pi;13|
              |JBUNDLE;numDepVar;Pi;14| (49 . |repeatedIndex|) (54 . |empty|)
              (58 . |coerce|) (|List| 17) (63 . |subscript|)
              |JBUNDLE;name;$S;15| (|Expression| 36) (69 . |One|)
              (|BasicOperator|) (73 . |operator|) (|Mapping| 17 49)
              (78 . |display|) (|None|) (|NoneFunctions1| $$) (84 . |coerce|)
              (89 . |setProperty|) (96 . |weight|) (|NoneFunctions1| 29)
              (101 . |coerce|) (|NoneFunctions1| 19) (106 . |coerce|)
              (111 . |coerce|) (116 . |coerce|) (|List| 52) (121 . |concat!|)
              (|List| $) (127 . |kernel|) |JBUNDLE;coerce;$E;17|
              (|Union| $ '"failed") (|Union| $ '"0") (|List| 40) (|HashState|)
              (|String|) (|SingleInteger|))
           '#(~= 133 |weight| 139 |variables| 144 |type| 155 |smaller?| 160
              |setNotation| 166 |repeatedIndex| 171 |r2m| 176 |order| 181
              |one?| 186 |numIndVar| 191 |numDepVar| 195 |name| 199
              |multiIndex| 204 |min| 209 |max| 215 |m2r| 221 |latex| 226
              |integrateIfCan| 231 |integrate| 237 |index| 243 |hashUpdate!|
              248 |hash| 254 |getNotation| 259 |dimS| 263 |dimJ| 268
              |differentiate| 273 |derivativeOf?| 279 |coerce| 285 |class| 300
              |allRepeated| 310 X 315 U 324 |Pr| 333 |Pm| 339 P 345 |One| 367 D
              371 >= 377 > 383 = 389 <= 395 < 401)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|JetBundleCategory&| |OrderedSet&| NIL |SetCategory&|
                     |BasicType&| NIL |PartialOrder&| NIL)
                  (CONS
                   '#((|JetBundleCategory|) (|OrderedSet|) (|Comparable|)
                      (|SetCategory|) (|BasicType|) (|CoercibleTo| 52)
                      (|PartialOrder|) (|CoercibleTo| 17))
                   (|makeByteWordVec2| 79
                                       '(1 11 0 10 12 1 17 16 0 18 1 15 0 0 22
                                         2 29 28 0 0 30 1 15 29 0 33 2 29 28 0
                                         0 34 2 10 36 19 0 37 1 10 36 0 38 2 0
                                         0 25 40 41 1 0 40 0 46 0 17 0 47 1 19
                                         17 0 48 2 19 0 0 49 50 0 52 0 53 1 54
                                         0 19 55 2 54 0 0 56 57 1 59 58 2 60 3
                                         54 0 0 19 58 61 1 0 29 0 62 1 63 58 29
                                         64 1 65 58 19 66 1 52 0 19 67 1 52 0
                                         36 68 2 69 0 0 0 70 2 52 0 54 71 72 2
                                         0 28 0 0 1 1 0 29 0 62 2 0 71 29 25 1
                                         1 0 71 29 1 1 0 19 0 27 2 0 28 0 0 1 1
                                         0 19 19 20 1 0 40 0 46 1 0 23 40 1 1 0
                                         29 0 1 1 0 28 0 1 0 0 25 44 0 0 25 45
                                         1 0 19 0 51 1 0 23 0 24 2 0 0 0 0 1 2
                                         0 0 0 0 1 1 0 40 23 1 1 0 78 0 1 2 0
                                         74 0 25 1 2 0 0 0 25 1 1 0 25 0 26 2 0
                                         77 77 0 1 1 0 79 0 1 0 0 19 21 1 0 29
                                         29 1 1 0 29 29 1 2 0 75 0 25 1 2 0 23
                                         0 0 1 1 0 0 19 39 1 0 52 0 73 1 0 17 0
                                         1 1 0 29 0 1 1 0 29 23 1 1 0 76 23 1 0
                                         0 0 1 1 0 0 25 31 0 0 0 1 1 0 0 25 32
                                         2 0 0 25 40 41 2 0 0 25 23 35 1 0 0 29
                                         1 1 0 0 23 1 2 0 0 25 29 1 2 0 0 25 23
                                         1 0 0 0 43 2 0 0 19 10 42 2 0 28 0 0 1
                                         2 0 28 0 0 1 2 0 28 0 0 1 2 0 28 0 0 1
                                         2 0 28 0 0 1)))))
           '|lookupComplete|)) 
