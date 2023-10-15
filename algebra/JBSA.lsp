
(SDEFUN |JBSA;setNotation;2S;1| ((|s| |Symbol|) ($ |Symbol|))
        (SEQ (SPADCALL "only repeated index notation possible" (QREFELT $ 34))
             (EXIT '|Repeated|))) 

(PUT '|JBSA;getNotation;S;2| '|SPADreplace| '(XLAM NIL '|Repeated|)) 

(SDEFUN |JBSA;getNotation;S;2| (($ |Symbol|)) '|Repeated|) 

(SDEFUN |JBSA;multiIndex;$L;3| ((|jv| $) ($ |List| (|NonNegativeInteger|)))
        (SPADCALL |jv| (QREFELT $ 38))) 

(SDEFUN |JBSA;index;$Pi;4| ((|jv| $) ($ |PositiveInteger|))
        (SPADCALL |jv| (QREFELT $ 40))) 

(SDEFUN |JBSA;type;$S;5| ((|jv| $) ($ |Symbol|)) (SPADCALL |jv| (QREFELT $ 42))) 

(SDEFUN |JBSA;X;Pi$;6| ((|up| |PositiveInteger|) ($ $))
        (SPADCALL |up| (QREFELT $ 44))) 

(SDEFUN |JBSA;U;Pi$;7| ((|up| |PositiveInteger|) ($ $))
        (SPADCALL |up| (QREFELT $ 46))) 

(SDEFUN |JBSA;Pm;PiL$;8|
        ((|up| |PositiveInteger|) (|lo| |List| (|NonNegativeInteger|)) ($ $))
        (SPADCALL |up| |lo| (QREFELT $ 48))) 

(SDEFUN |JBSA;coerce;S$;9| ((|s| |Symbol|) ($ $)) (SPADCALL |s| (QREFELT $ 50))) 

(SDEFUN |JBSA;D;SL$;10| ((|u| |Symbol|) (|der| |List| (|Symbol|)) ($ $))
        (SPADCALL |u| |der| (QREFELT $ 53))) 

(SDEFUN |JBSA;One;$;11| (($ $)) (|spadConstant| $ 55)) 

(SDEFUN |JBSA;numIndVar;Pi;12| (($ |PositiveInteger|))
        (+ (QREFELT $ 11) (QREFELT $ 13))) 

(SDEFUN |JBSA;numDepVar;Pi;13| (($ |PositiveInteger|))
        (+ (QREFELT $ 11) (QREFELT $ 13))) 

(SDEFUN |JBSA;name;$S;14| ((|jv| $) ($ |Symbol|))
        (SPADCALL |jv| (QREFELT $ 58))) 

(SDEFUN |JBSA;coerce;$E;15| ((|jv| $) ($ |Expression| (|Integer|)))
        (SPADCALL |jv| (QREFELT $ 61))) 

(DECLAIM (NOTINLINE |JetBundleSymAna;|)) 

(DEFUN |JetBundleSymAna| (&REST #1=#:G151)
  (SPROG NIL
         (PROG (#2=#:G152)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|JetBundleSymAna|)
                                               '|domainEqualList|)
                    . #3=(|JetBundleSymAna|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |JetBundleSymAna;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetBundleSymAna|)))))))))) 

(DEFUN |JetBundleSymAna;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G150 NIL) (|i| NIL) (#2=#:G149 NIL) (#3=#:G148 NIL) (#4=#:G147 NIL)
    (#5=#:G146 NIL) (|jv| NIL) (#6=#:G145 NIL) (#7=#:G114 NIL) (#8=#:G144 NIL)
    (#9=#:G143 NIL) (#10=#:G111 NIL) (#11=#:G142 NIL) (#12=#:G141 NIL)
    (|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|) . #13=(|JetBundleSymAna|))
     (LETT DV$2 (|devaluate| |#2|) . #13#)
     (LETT DV$3 (|devaluate| |#3|) . #13#)
     (LETT |dv$| (LIST '|JetBundleSymAna| DV$1 DV$2 DV$3) . #13#)
     (LETT $ (GETREFV 71) . #13#)
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #13#))
     (|haddProp| |$ConstructorCache| '|JetBundleSymAna| (LIST DV$1 DV$2 DV$3)
                 (CONS 1 $))
     (|stuffDomainSlots| $)
     (QSETREFV $ 6 |#1|)
     (QSETREFV $ 7 |#2|)
     (QSETREFV $ 8 |#3|)
     (SETF |pv$| (QREFELT $ 3))
     (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
     (QSETREFV $ 13 (SPADCALL (QREFELT $ 12)))
     (QSETREFV $ 18
               (SPADCALL
                (PROGN
                 (LETT #12# NIL . #13#)
                 (SEQ (LETT |i| 1 . #13#) (LETT #11# (QREFELT $ 11) . #13#)
                      G190 (COND ((|greater_SI| |i| #11#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #12#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #10# |i| . #13#)
                                  (|check_subtype2| (> #10# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #10#))
                                (QREFELT $ 14))
                               #12#)
                              . #13#)))
                      (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                      (EXIT (NREVERSE #12#))))
                (PROGN
                 (LETT #9# NIL . #13#)
                 (SEQ (LETT |i| 1 . #13#) (LETT #8# (QREFELT $ 13) . #13#) G190
                      (COND ((|greater_SI| |i| #8#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #9#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #7# |i| . #13#)
                                  (|check_subtype2| (> #7# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #7#))
                                (QREFELT $ 15))
                               #9#)
                              . #13#)))
                      (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                      (EXIT (NREVERSE #9#))))
                (QREFELT $ 17)))
     (QSETREFV $ 21
               (PROGN
                (LETT #6# NIL . #13#)
                (SEQ (LETT |jv| NIL . #13#) (LETT #5# (QREFELT $ 18) . #13#)
                     G190
                     (COND
                      ((OR (ATOM #5#) (PROGN (LETT |jv| (CAR #5#) . #13#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #6# (CONS (SPADCALL |jv| (QREFELT $ 20)) #6#)
                             . #13#)))
                     (LETT #5# (CDR #5#) . #13#) (GO G190) G191
                     (EXIT (NREVERSE #6#)))))
     (QSETREFV $ 22 NIL)
     (COND
      ((QEQCAR |#2| 0)
       (COND
        ((SPADCALL (QREFELT $ 11) 1 (QREFELT $ 26))
         (SETELT $ 22
                 (PROGN
                  (LETT #4# NIL . #13#)
                  (SEQ (LETT |i| 1 . #13#) (LETT #3# (QREFELT $ 11) . #13#)
                       G190 (COND ((|greater_SI| |i| #3#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #4#
                               (CONS
                                (SPADCALL (QCDR |#2|)
                                          (LIST (SPADCALL |i| (QREFELT $ 29)))
                                          (QREFELT $ 31))
                                #4#)
                               . #13#)))
                       (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                       (EXIT (NREVERSE #4#))))))
        ('T (SETELT $ 22 (LIST (QCDR |#2|))))))
      ('T (SETELT $ 22 (QCDR |#2|))))
     (COND
      ((QEQCAR |#3| 0)
       (COND
        ((SPADCALL (QREFELT $ 13) 1 (QREFELT $ 26))
         (SETELT $ 22
                 (APPEND (QREFELT $ 22)
                         (PROGN
                          (LETT #2# NIL . #13#)
                          (SEQ (LETT |i| 1 . #13#)
                               (LETT #1# (QREFELT $ 13) . #13#) G190
                               (COND ((|greater_SI| |i| #1#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS
                                        (SPADCALL (QCDR |#3|)
                                                  (LIST
                                                   (SPADCALL |i|
                                                             (QREFELT $ 29)))
                                                  (QREFELT $ 31))
                                        #2#)
                                       . #13#)))
                               (LETT |i| (|inc_SI| |i|) . #13#) (GO G190) G191
                               (EXIT (NREVERSE #2#)))))))
        ('T (SETELT $ 22 (APPEND (QREFELT $ 22) (LIST (QCDR |#3|)))))))
      ('T (SETELT $ 22 (APPEND (QREFELT $ 22) (QCDR |#3|)))))
     (QSETREFV $ 32 (|JetBundle| (QREFELT $ 21) (QREFELT $ 22)))
     $)))) 

(MAKEPROP '|JetBundleSymAna| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|PositiveInteger|) (0 . |numIndVar|) '|nn|
              (4 . |numDepVar|) '|mm| (8 . X) (13 . U) (|List| 6)
              (18 . |concat!|) '|vars| (|Symbol|) (24 . |name|) '|indVars|
              '|depVars|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JBSA;One;$;11|) $))
              (29 . |One|) (|Boolean|) (33 . >) (|OutputForm|)
              (|NonNegativeInteger|) (39 . |coerce|) (|List| 27)
              (44 . |superscript|) '|Rep| (|Void|) (50 . |print|)
              |JBSA;setNotation;2S;1| |JBSA;getNotation;S;2| (|List| 28)
              (55 . |multiIndex|) |JBSA;multiIndex;$L;3| (60 . |index|)
              |JBSA;index;$Pi;4| (65 . |type|) |JBSA;type;$S;5| (70 . X)
              |JBSA;X;Pi$;6| (75 . U) |JBSA;U;Pi$;7| (80 . |Pm|)
              |JBSA;Pm;PiL$;8| (86 . |coerce|) |JBSA;coerce;S$;9| (|List| 19)
              (91 . D) |JBSA;D;SL$;10| (97 . |One|) |JBSA;numIndVar;Pi;12|
              |JBSA;numDepVar;Pi;13| (101 . |name|) |JBSA;name;$S;14|
              (|Expression| (|Integer|)) (106 . |coerce|) |JBSA;coerce;$E;15|
              (|List| $) (|List| 9) (|Union| $ '"failed") (|Union| $ '"0")
              (|List| 64) (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 111 |weight| 117 |variables| 122 |type| 133 |smaller?| 138
              |setNotation| 144 |repeatedIndex| 149 |r2m| 154 |order| 159
              |one?| 164 |numIndVar| 169 |numDepVar| 173 |name| 177
              |multiIndex| 182 |min| 187 |max| 193 |m2r| 199 |latex| 204
              |integrateIfCan| 209 |integrate| 215 |index| 221 |hashUpdate!|
              226 |hash| 232 |getNotation| 237 |dimS| 241 |dimJ| 246
              |differentiate| 251 |derivativeOf?| 257 |coerce| 263 |class| 278
              |allRepeated| 288 X 293 U 302 |Pr| 311 |Pm| 317 P 323 |One| 345 D
              349 >= 355 > 361 = 367 <= 373 < 379)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|JetBundleCategory&| |OrderedSet&| NIL |SetCategory&|
                     |BasicType&| NIL |PartialOrder&| NIL)
                  (CONS
                   '#((|JetBundleCategory|) (|OrderedSet|) (|Comparable|)
                      (|SetCategory|) (|BasicType|) (|CoercibleTo| 60)
                      (|PartialOrder|) (|CoercibleTo| 27))
                   (|makeByteWordVec2| 70
                                       '(0 6 9 10 0 6 9 12 1 6 0 9 14 1 6 0 9
                                         15 2 16 0 0 0 17 1 6 19 0 20 0 6 0 24
                                         2 9 25 0 0 26 1 28 27 0 29 2 19 0 0 30
                                         31 1 27 33 0 34 1 32 37 0 38 1 32 9 0
                                         40 1 32 19 0 42 1 32 0 9 44 1 32 0 9
                                         46 2 32 0 9 37 48 1 32 0 19 50 2 32 0
                                         19 52 53 0 32 0 55 1 32 19 0 58 1 32
                                         60 0 61 2 0 25 0 0 1 1 0 28 0 1 2 0 63
                                         28 9 1 1 0 63 28 1 1 0 19 0 43 2 0 25
                                         0 0 1 1 0 19 19 35 1 0 64 0 1 1 0 37
                                         64 1 1 0 28 0 1 1 0 25 0 1 0 0 9 56 0
                                         0 9 57 1 0 19 0 59 1 0 37 0 39 2 0 0 0
                                         0 1 2 0 0 0 0 1 1 0 64 37 1 1 0 69 0 1
                                         2 0 65 0 9 1 2 0 0 0 9 1 1 0 9 0 41 2
                                         0 68 68 0 1 1 0 70 0 1 0 0 19 36 1 0
                                         28 28 1 1 0 28 28 1 2 0 66 0 9 1 2 0
                                         37 0 0 1 1 0 0 19 51 1 0 60 0 62 1 0
                                         27 0 1 1 0 28 0 1 1 0 28 37 1 1 0 67
                                         37 1 0 0 0 1 1 0 0 9 45 0 0 0 1 1 0 0
                                         9 47 2 0 0 9 64 1 2 0 0 9 37 49 1 0 0
                                         28 1 1 0 0 37 1 2 0 0 9 28 1 2 0 0 9
                                         37 1 0 0 0 23 2 0 0 19 52 54 2 0 25 0
                                         0 1 2 0 25 0 0 1 2 0 25 0 0 1 2 0 25 0
                                         0 1 2 0 25 0 0 1)))))
           '|lookupComplete|)) 
