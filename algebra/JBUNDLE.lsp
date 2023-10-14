
(/VERSIONCHECK 2) 

(DEFUN |JBUNDLE;setNotation;2S;1| (|s| $)
  (SEQ (SPADCALL "only repeated index notation possible" (QREFELT $ 18))
       (EXIT '|Repeated|))) 

(PUT '|JBUNDLE;getNotation;S;2| '|SPADreplace| '(XLAM NIL '|Repeated|)) 

(DEFUN |JBUNDLE;getNotation;S;2| ($) '|Repeated|) 

(DEFUN |JBUNDLE;multiIndex;$L;3| (|jv| $)
  (SPADCALL (CDR (CDR |jv|)) (QREFELT $ 22))) 

(DEFUN |JBUNDLE;index;$Pi;4| (|jv| $)
  (PROG (#1=#:G142)
    (RETURN
     (PROG1 (LETT #1# (|SPADfirst| (CDR |jv|)) |JBUNDLE;index;$Pi;4|)
       (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))) 

(DEFUN |JBUNDLE;type;$S;5| (|jv| $)
  (PROG (|t|)
    (RETURN
     (SEQ (LETT |t| (|SPADfirst| |jv|) |JBUNDLE;type;$S;5|)
          (EXIT
           (COND ((ZEROP |t|) '|Const|) ((EQL |t| 1) '|Indep|)
                 ((EQL |t| 2) '|Dep|) ('T '|Deriv|))))))) 

(DEFUN |JBUNDLE;CheckZeroIndex| (|il| $)
  (PROG (#1=#:G150 #2=#:G151 |i|)
    (RETURN
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
                ((NULL (ZEROP |i|)) (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT 'T)))
      #1# (EXIT #1#))))) 

(DEFUN |JBUNDLE;X;Pi$;7| (|up| $)
  (COND
   ((SPADCALL |up| (QREFELT $ 8) (QREFELT $ 30))
    (|error| "Improper upper index"))
   ('T (LIST 1 |up|)))) 

(DEFUN |JBUNDLE;U;Pi$;8| (|up| $)
  (PROG (#1=#:G156 |i| #2=#:G155)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |up| (QREFELT $ 9) (QREFELT $ 30))
        (|error| "Improper upper index"))
       ('T
        (CONS 2
              (CONS |up|
                    (PROGN
                     (LETT #2# NIL . #3=(|JBUNDLE;U;Pi$;8|))
                     (SEQ (LETT |i| 1 . #3#) (LETT #1# (QREFELT $ 8) . #3#)
                          G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ (EXIT (LETT #2# (CONS 0 #2#) . #3#)))
                          (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))))))))) 

(DEFUN |JBUNDLE;Pm;PiL$;9| (|up| |lo| $)
  (COND
   ((SPADCALL |up| (QREFELT $ 9) (QREFELT $ 30))
    (|error| "Improper upper index"))
   ((SPADCALL (SPADCALL |lo| (QREFELT $ 33)) (QREFELT $ 8) (QREFELT $ 34))
    (|error| "Improper multi-index"))
   ((|JBUNDLE;CheckZeroIndex| |lo| $) (SPADCALL |up| (QREFELT $ 32)))
   ('T (CONS 3 (CONS |up| |lo|))))) 

(DEFUN |JBUNDLE;coerce;S$;10| (|s| $)
  (PROG (#1=#:G164 #2=#:G161 |pos|)
    (RETURN
     (SEQ
      (LETT |pos| (SPADCALL |s| (QREFELT $ 6) (QREFELT $ 37))
            . #3=(|JBUNDLE;coerce;S$;10|))
      (EXIT
       (COND
        ((< |pos| (SPADCALL (QREFELT $ 6) (QREFELT $ 38)))
         (SEQ (LETT |pos| (SPADCALL |s| (QREFELT $ 7) (QREFELT $ 37)) . #3#)
              (EXIT
               (COND
                ((< |pos| (SPADCALL (QREFELT $ 7) (QREFELT $ 38)))
                 (|error| "illegal symbol in JetBundle"))
                (#4='T
                 (SPADCALL
                  (PROG1 (LETT #2# |pos| . #3#)
                    (|check_subtype| (> #2# 0) '(|PositiveInteger|) #2#))
                  (QREFELT $ 32)))))))
        (#4#
         (SPADCALL
          (PROG1 (LETT #1# |pos| . #3#)
            (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
          (QREFELT $ 31))))))))) 

(DEFUN |JBUNDLE;D;SL$;11| (|u| |der| $)
  (PROG (#1=#:G172 |lower| #2=#:G168 |pos| #3=#:G176 |d| |up|)
    (RETURN
     (SEQ
      (LETT |up| (SPADCALL |u| (QREFELT $ 7) (QREFELT $ 37))
            . #4=(|JBUNDLE;D;SL$;11|))
      (EXIT
       (COND
        ((< |up| (SPADCALL (QREFELT $ 7) (QREFELT $ 38)))
         (|error| #5="illegal symbol in JetBundle"))
        ('T
         (SEQ (LETT |lower| NIL . #4#)
              (SEQ (LETT |d| NIL . #4#) (LETT #3# |der| . #4#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |d| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |pos| (SPADCALL |d| (QREFELT $ 6) (QREFELT $ 37))
                          . #4#)
                    (EXIT
                     (COND
                      ((< |pos| (SPADCALL (QREFELT $ 6) (QREFELT $ 38)))
                       (|error| #5#))
                      ('T
                       (LETT |lower|
                             (CONS
                              (PROG1 (LETT #2# |pos| . #4#)
                                (|check_subtype| (> #2# 0) '(|PositiveInteger|)
                                                 #2#))
                              |lower|)
                             . #4#)))))
                   (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |lower| (NREVERSE |lower|) . #4#)
              (EXIT
               (SPADCALL
                (PROG1 (LETT #1# |up| . #4#)
                  (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))
                |lower| (QREFELT $ 42))))))))))) 

(PUT '|JBUNDLE;One;$;12| '|SPADreplace| '(XLAM NIL (LIST 0 1))) 

(DEFUN |JBUNDLE;One;$;12| ($) (LIST 0 1)) 

(DEFUN |JBUNDLE;numIndVar;Pi;13| ($)
  (PROG (#1=#:G178)
    (RETURN
     (PROG1 (LETT #1# (QREFELT $ 8) |JBUNDLE;numIndVar;Pi;13|)
       (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))) 

(DEFUN |JBUNDLE;numDepVar;Pi;14| ($)
  (PROG (#1=#:G180)
    (RETURN
     (PROG1 (LETT #1# (QREFELT $ 9) |JBUNDLE;numDepVar;Pi;14|)
       (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))) 

(DEFUN |JBUNDLE;name;$S;15| (|jv| $)
  (PROG (|lower| #1=#:G188 |j| |res| |mu| |i| |jt|)
    (RETURN
     (SEQ
      (COND
       ((EQUAL
         (LETT |jt| (SPADCALL |jv| (QREFELT $ 27)) . #2=(|JBUNDLE;name;$S;15|))
         '|Const|)
        '|1|)
       (#3='T
        (SEQ (LETT |i| (SPADCALL |jv| (QREFELT $ 26)) . #2#)
             (EXIT
              (COND ((EQUAL |jt| '|Indep|) (QAREF1O (QREFELT $ 13) |i| 1))
                    ((EQUAL |jt| '|Dep|) (QAREF1O (QREFELT $ 14) |i| 1))
                    (#3#
                     (SEQ (LETT |mu| (SPADCALL |jv| (QREFELT $ 47)) . #2#)
                          (LETT |res| (QAREF1O (QREFELT $ 14) |i| 1) . #2#)
                          (LETT |lower| NIL . #2#)
                          (SEQ (LETT |j| NIL . #2#) (LETT #1# |mu| . #2#) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |j| (CAR #1#) . #2#) NIL))
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
                           (SPADCALL |res| |lower| (QREFELT $ 50)))))))))))))) 

(PUT '|JBUNDLE;opdisp| '|SPADreplace| '|SPADfirst|) 

(DEFUN |JBUNDLE;opdisp| (|l| $) (|SPADfirst| |l|)) 

(DEFUN |JBUNDLE;coerce;$E;17| (|jv| $)
  (PROG (|arg| #1=#:G196 |i| #2=#:G195 |jop| |tmp| |opname|)
    (RETURN
     (SEQ
      (COND
       ((EQUAL (SPADCALL |jv| (QREFELT $ 27)) '|Const|) (|spadConstant| $ 53))
       ('T
        (SEQ
         (LETT |opname| (SPADCALL |jv| (QREFELT $ 51))
               . #3=(|JBUNDLE;coerce;$E;17|))
         (LETT |jop| (SPADCALL |opname| (QREFELT $ 55)) . #3#)
         (SPADCALL |jop| (CONS (|function| |JBUNDLE;opdisp|) $) (QREFELT $ 57))
         (LETT |tmp| (SPADCALL |jv| (QREFELT $ 60)) . #3#)
         (LETT |jop| (SPADCALL |jop| '|%symbol| |tmp| (QREFELT $ 61)) . #3#)
         (LETT |tmp| (SPADCALL (SPADCALL |jv| (QREFELT $ 62)) (QREFELT $ 64))
               . #3#)
         (LETT |jop| (SPADCALL |jop| '|%weight| |tmp| (QREFELT $ 61)) . #3#)
         (LETT |tmp| (SPADCALL (SPADCALL |jv| (QREFELT $ 27)) (QREFELT $ 66))
               . #3#)
         (LETT |jop| (SPADCALL |jop| '|%jet| |tmp| (QREFELT $ 61)) . #3#)
         (LETT |arg|
               (SPADCALL
                (LIST (SPADCALL |opname| (QREFELT $ 67))
                      (SPADCALL (SPADCALL |jv| (QREFELT $ 26)) (QREFELT $ 68)))
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |i| NIL . #3#)
                      (LETT #1# (SPADCALL |jv| (QREFELT $ 47)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |i| (QREFELT $ 68)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 70))
               . #3#)
         (EXIT (SPADCALL |jop| |arg| (QREFELT $ 72)))))))))) 

(DEFUN |JetBundle| (&REST #1=#:G203)
  (PROG ()
    (RETURN
     (PROG (#2=#:G204)
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
              (PROG1 (APPLY (|function| |JetBundle;|) #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|JetBundle|))))))))))) 

(DEFUN |JetBundle;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|JetBundle|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|JetBundle| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 79) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|JetBundle| (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 8 (LENGTH |#1|))
      (QSETREFV $ 9 (LENGTH |#2|))
      (QSETREFV $ 13 (SPADCALL |#1| (QREFELT $ 12)))
      (QSETREFV $ 14 (SPADCALL |#2| (QREFELT $ 12)))
      (QSETREFV $ 15 (|List| (|NonNegativeInteger|)))
      $)))) 

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
              |JBUNDLE;coerce;S$;10| (43 . |empty|) (|List| 25) (47 . |Pr|)
              |JBUNDLE;D;SL$;11| |JBUNDLE;One;$;12| |JBUNDLE;numIndVar;Pi;13|
              |JBUNDLE;numDepVar;Pi;14| (53 . |repeatedIndex|) (58 . |coerce|)
              (|List| 17) (63 . |subscript|) |JBUNDLE;name;$S;15|
              (|Expression| 36) (69 . |One|) (|BasicOperator|)
              (73 . |operator|) (|Mapping| 17 49) (78 . |display|) (|None|)
              (|NoneFunctions1| $$) (84 . |coerce|) (89 . |setProperty|)
              (96 . |weight|) (|NoneFunctions1| 29) (101 . |coerce|)
              (|NoneFunctions1| 19) (106 . |coerce|) (111 . |coerce|)
              (116 . |coerce|) (|List| 52) (121 . |concat!|) (|List| $)
              (127 . |kernel|) |JBUNDLE;coerce;$E;17| (|Union| $ '"failed")
              (|Union| $ '"0") (|List| 41) (|String|) (|SingleInteger|))
           '#(~= 133 |weight| 139 |variables| 144 |type| 155 |smaller?| 160
              |setNotation| 166 |repeatedIndex| 171 |r2m| 176 |order| 181
              |one?| 186 |numIndVar| 191 |numDepVar| 195 |name| 199
              |multiIndex| 204 |min| 209 |max| 215 |m2r| 221 |latex| 226
              |integrateIfCan| 231 |integrate| 237 |index| 243 |hash| 248
              |getNotation| 253 |dimS| 257 |dimJ| 262 |differentiate| 267
              |derivativeOf?| 273 |coerce| 279 |class| 294 |allRepeated| 304 X
              309 U 318 |Pr| 327 |Pm| 333 P 339 |One| 361 D 365 >= 371 > 377 =
              383 <= 389 < 395)
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
                                       '(1 11 0 10 12 1 17 16 0 18 1 15 0 0 22
                                         2 29 28 0 0 30 1 15 29 0 33 2 29 28 0
                                         0 34 2 10 36 19 0 37 1 10 36 0 38 0 17
                                         0 40 2 0 0 25 41 42 1 0 41 0 47 1 19
                                         17 0 48 2 19 0 0 49 50 0 52 0 53 1 54
                                         0 19 55 2 54 0 0 56 57 1 59 58 2 60 3
                                         54 0 0 19 58 61 1 0 29 0 62 1 63 58 29
                                         64 1 65 58 19 66 1 52 0 19 67 1 52 0
                                         36 68 2 69 0 0 0 70 2 52 0 54 71 72 2
                                         0 28 0 0 1 1 0 29 0 62 2 0 71 29 25 1
                                         1 0 71 29 1 1 0 19 0 27 2 0 28 0 0 1 1
                                         0 19 19 20 1 0 41 0 47 1 0 23 41 1 1 0
                                         29 0 1 1 0 28 0 1 0 0 25 45 0 0 25 46
                                         1 0 19 0 51 1 0 23 0 24 2 0 0 0 0 1 2
                                         0 0 0 0 1 1 0 41 23 1 1 0 77 0 1 2 0
                                         74 0 25 1 2 0 0 0 25 1 1 0 25 0 26 1 0
                                         78 0 1 0 0 19 21 1 0 29 29 1 1 0 29 29
                                         1 2 0 75 0 25 1 2 0 23 0 0 1 1 0 0 19
                                         39 1 0 52 0 73 1 0 17 0 1 1 0 29 23 1
                                         1 0 29 0 1 1 0 76 23 1 0 0 0 1 1 0 0
                                         25 31 0 0 0 1 1 0 0 25 32 2 0 0 25 41
                                         42 2 0 0 25 23 35 1 0 0 29 1 2 0 0 25
                                         29 1 1 0 0 23 1 2 0 0 25 23 1 0 0 0 44
                                         2 0 0 19 10 43 2 0 28 0 0 1 2 0 28 0 0
                                         1 2 0 28 0 0 1 2 0 28 0 0 1 2 0 28 0 0
                                         1)))))
           '|lookupComplete|)) 
