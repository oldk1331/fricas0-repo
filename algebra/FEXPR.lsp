
(/VERSIONCHECK 2) 

(DEFUN |FEXPR;mkEqn| (|s1| |s2| $)
  (SPADCALL (SPADCALL |s2| (QREFELT $ 14))
            (SPADCALL
             (SPADCALL |s1| (SPADCALL |s2| (QREFELT $ 16)) (QREFELT $ 17))
             (QREFELT $ 14))
            (QREFELT $ 19))) 

(DEFUN |FEXPR;fixUpSymbols| (|u| $)
  (PROG (#1=#:G177 |i| #2=#:G176 |sym| |syms| #3=#:G175 |s| #4=#:G174 #5=#:G154
         #6=#:G172 #7=#:G173)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |syms| (SPADCALL |u| (QREFELT $ 21)) . #8=(|FEXPR;fixUpSymbols|))
        (COND
         ((EQL (LENGTH (QREFELT $ 6)) 1)
          (COND
           ((ZEROP (LENGTH (QREFELT $ 7)))
            (EXIT
             (COND ((NULL (EQL (LENGTH |syms|) 1)) (CONS 1 "failed"))
                   ('T
                    (CONS 0
                          (SPADCALL |u|
                                    (SPADCALL
                                     (SPADCALL (|SPADfirst| |syms|)
                                               (QREFELT $ 14))
                                     (SPADCALL (|SPADfirst| (QREFELT $ 6))
                                               (QREFELT $ 14))
                                     (QREFELT $ 19))
                                    (QREFELT $ 24))))))))))
        (COND
         ((ZEROP (LENGTH (QREFELT $ 6)))
          (COND
           ((EQL (LENGTH (QREFELT $ 7)) 1)
            (EXIT
             (SEQ
              (SEQ
               (EXIT
                (SEQ (LETT |s| NIL . #8#) (LETT #7# |syms| . #8#) G190
                     (COND
                      ((OR (ATOM #7#) (PROGN (LETT |s| (CAR #7#) . #8#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((NULL (SPADCALL |s| (QREFELT $ 26)))
                         (PROGN
                          (LETT #5#
                                (PROGN
                                 (LETT #6# (CONS 1 "failed") . #8#)
                                 (GO #6#))
                                . #8#)
                          (GO #5#))))))
                     (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL)))
               #5# (EXIT #5#))
              (COND
               ((NULL
                 (EQL
                  (LENGTH
                   (LETT |syms|
                         (SPADCALL
                          (PROGN
                           (LETT #4# NIL . #8#)
                           (SEQ (LETT |s| NIL . #8#) (LETT #3# |syms| . #8#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |s| (CAR #3#) . #8#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS (SPADCALL |s| (QREFELT $ 27))
                                              #4#)
                                        . #8#)))
                                (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (QREFELT $ 28))
                         . #8#))
                  1))
                (EXIT (CONS 1 "failed"))))
              (LETT |sym| (|SPADfirst| (QREFELT $ 7)) . #8#)
              (EXIT
               (CONS 0
                     (SPADCALL |u|
                               (PROGN
                                (LETT #2# NIL . #8#)
                                (SEQ (LETT |i| NIL . #8#)
                                     (LETT #1# (SPADCALL |u| (QREFELT $ 21))
                                           . #8#)
                                     G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN
                                            (LETT |i| (CAR #1#) . #8#)
                                            NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS (|FEXPR;mkEqn| |sym| |i| $)
                                                   #2#)
                                             . #8#)))
                                     (LETT #1# (CDR #1#) . #8#) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))
                               (QREFELT $ 30))))))))))
        (EXIT (CONS 1 "failed"))))
      #6# (EXIT #6#))))) 

(DEFUN |FEXPR;extraSymbols?| (|u| $)
  (PROG (|extras| |syms| #1=#:G182 |v| #2=#:G181)
    (RETURN
     (SEQ
      (LETT |syms|
            (PROGN
             (LETT #2# NIL . #3=(|FEXPR;extraSymbols?|))
             (SEQ (LETT |v| NIL . #3#)
                  (LETT #1# (SPADCALL |u| (QREFELT $ 21)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 27)) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (LETT |extras|
            (SPADCALL |syms|
                      (SPADCALL (QREFELT $ 6) (QREFELT $ 7) (QREFELT $ 31))
                      (QREFELT $ 32))
            . #3#)
      (EXIT (COND ((NULL |extras|) 'NIL) ('T 'T))))))) 

(DEFUN |FEXPR;checkSymbols| (|u| $)
  (PROG (#1=#:G192 |v| #2=#:G191 |m| |extras| |syms| #3=#:G190 #4=#:G189)
    (RETURN
     (SEQ
      (LETT |syms|
            (PROGN
             (LETT #4# NIL . #5=(|FEXPR;checkSymbols|))
             (SEQ (LETT |v| NIL . #5#)
                  (LETT #3# (SPADCALL |u| (QREFELT $ 21)) . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 27)) #4#) . #5#)))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (LETT |extras|
            (SPADCALL |syms|
                      (SPADCALL (QREFELT $ 6) (QREFELT $ 7) (QREFELT $ 31))
                      (QREFELT $ 32))
            . #5#)
      (COND
       ((NULL (NULL |extras|))
        (EXIT
         (SEQ (LETT |m| (|FEXPR;fixUpSymbols| |u| $) . #5#)
              (EXIT
               (COND ((QEQCAR |m| 0) (QCDR |m|))
                     ('T
                      (|error| "Extra symbols detected:"
                               (SPADCALL
                                (PROGN
                                 (LETT #2# NIL . #5#)
                                 (SEQ (LETT |v| NIL . #5#)
                                      (LETT #1# |extras| . #5#) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN
                                             (LETT |v| (CAR #1#) . #5#)
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (SPADCALL |v| (QREFELT $ 34))
                                               #2#)
                                              . #5#)))
                                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                (QREFELT $ 37))))))))))
      (EXIT |u|))))) 

(DEFUN |FEXPR;notSymbol?| (|v| $)
  (PROG (|s|)
    (RETURN
     (SEQ (LETT |s| (SPADCALL |v| (QREFELT $ 39)) |FEXPR;notSymbol?|)
          (COND ((SPADCALL |s| (QREFELT $ 6) (QREFELT $ 40)) (EXIT 'NIL))
                ((SPADCALL |s| (QREFELT $ 26))
                 (COND
                  ((SPADCALL (SPADCALL |s| (QREFELT $ 27)) (QREFELT $ 7)
                             (QREFELT $ 40))
                   (EXIT 'NIL)))))
          (EXIT 'T))))) 

(DEFUN |FEXPR;extraOperators?| (|u| $)
  (PROG (|extras| |fortranFunctions| |ops| #1=#:G202 |v| #2=#:G201)
    (RETURN
     (SEQ
      (LETT |ops|
            (PROGN
             (LETT #2# NIL . #3=(|FEXPR;extraOperators?|))
             (SEQ (LETT |v| NIL . #3#)
                  (LETT #1# (SPADCALL |u| (QREFELT $ 42)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((|FEXPR;notSymbol?| |v| $)
                      (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 39)) #2#)
                            . #3#)))))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (COND
       ((QREFELT $ 12)
        (LETT |fortranFunctions| (APPEND (QREFELT $ 9) (QREFELT $ 11)) . #3#))
       (#4='T (LETT |fortranFunctions| (QREFELT $ 9) . #3#)))
      (LETT |extras| (SPADCALL |ops| |fortranFunctions| (QREFELT $ 32)) . #3#)
      (EXIT (COND ((NULL |extras|) 'NIL) (#4# 'T))))))) 

(DEFUN |FEXPR;checkOperators| (|u| $)
  (PROG (#1=#:G211 |v| #2=#:G210 |extras| |fortranFunctions| |ops| #3=#:G209
         #4=#:G208)
    (RETURN
     (SEQ
      (LETT |ops|
            (PROGN
             (LETT #4# NIL . #5=(|FEXPR;checkOperators|))
             (SEQ (LETT |v| NIL . #5#)
                  (LETT #3# (SPADCALL |u| (QREFELT $ 42)) . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((|FEXPR;notSymbol?| |v| $)
                      (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 39)) #4#)
                            . #5#)))))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (COND
       ((QREFELT $ 12)
        (LETT |fortranFunctions| (APPEND (QREFELT $ 9) (QREFELT $ 11)) . #5#))
       ('T (LETT |fortranFunctions| (QREFELT $ 9) . #5#)))
      (LETT |extras| (SPADCALL |ops| |fortranFunctions| (QREFELT $ 32)) . #5#)
      (COND
       ((NULL (NULL |extras|))
        (EXIT
         (|error| "Non FORTRAN-77 functions detected:"
                  (SPADCALL
                   (PROGN
                    (LETT #2# NIL . #5#)
                    (SEQ (LETT |v| NIL . #5#) (LETT #1# |extras| . #5#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |v| (CAR #1#) . #5#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 34)) #2#)
                                 . #5#)))
                         (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   (QREFELT $ 37))))))
      (EXIT (SPADCALL (QREFELT $ 44))))))) 

(DEFUN |FEXPR;checkForNagOperators| (|u| $)
  (PROG (|piSub| |piOp|)
    (RETURN
     (SEQ
      (COND
       ((QREFELT $ 12)
        (SEQ
         (LETT |piOp| (SPADCALL 'X01AAF (QREFELT $ 45))
               . #1=(|FEXPR;checkForNagOperators|))
         (LETT |piSub|
               (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 47)) (QREFELT $ 49))
                         (SPADCALL |piOp| (|spadConstant| $ 50) (QREFELT $ 51))
                         (QREFELT $ 19))
               . #1#)
         (EXIT (SPADCALL |u| |piSub| (QREFELT $ 24)))))
       ('T |u|)))))) 

(DEFUN |FEXPR;retractIfCan;PU;9| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 54)) (QREFELT $ 56))) 

(DEFUN |FEXPR;retract;P$;10| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 54)) (QREFELT $ 58))) 

(DEFUN |FEXPR;retractIfCan;FU;11| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 61)) (QREFELT $ 56))) 

(DEFUN |FEXPR;retract;F$;12| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 61)) (QREFELT $ 58))) 

(DEFUN |FEXPR;int2R| (|u| $) (SPADCALL |u| (QREFELT $ 65))) 

(DEFUN |FEXPR;retractIfCan;EU;14| (|u| $)
  (SPADCALL (SPADCALL (CONS (|function| |FEXPR;int2R|) $) |u| (QREFELT $ 68))
            (QREFELT $ 69))) 

(DEFUN |FEXPR;retract;E$;15| (|u| $)
  (SPADCALL (SPADCALL (CONS (|function| |FEXPR;int2R|) $) |u| (QREFELT $ 68))
            (QREFELT $ 70))) 

(DEFUN |FEXPR;retractIfCan;PU;16| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 73)) (QREFELT $ 74))) 

(DEFUN |FEXPR;retract;P$;17| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 73)) (QREFELT $ 76))) 

(DEFUN |FEXPR;retractIfCan;FU;18| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 79)) (QREFELT $ 74))) 

(DEFUN |FEXPR;retract;F$;19| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 79)) (QREFELT $ 76))) 

(DEFUN |FEXPR;float2R| (|u| $) (SPADCALL |u| (QREFELT $ 83))) 

(DEFUN |FEXPR;retractIfCan;EU;21| (|u| $)
  (SPADCALL (SPADCALL (CONS (|function| |FEXPR;float2R|) $) |u| (QREFELT $ 86))
            (QREFELT $ 69))) 

(DEFUN |FEXPR;retract;E$;22| (|u| $)
  (SPADCALL (SPADCALL (CONS (|function| |FEXPR;float2R|) $) |u| (QREFELT $ 86))
            (QREFELT $ 70))) 

(DEFUN |FEXPR;useNagFunctions;B;23| ($) (QREFELT $ 12)) 

(DEFUN |FEXPR;useNagFunctions;2B;24| (|v| $)
  (PROG (|old|)
    (RETURN
     (SEQ (LETT |old| (QREFELT $ 12) |FEXPR;useNagFunctions;2B;24|)
          (SETELT $ 12 |v|) (EXIT |old|))))) 

(DEFUN |FEXPR;log10;2$;25| (|x| $)
  (SPADCALL (SPADCALL '|log10| (QREFELT $ 45)) |x| (QREFELT $ 89))) 

(DEFUN |FEXPR;pi;$;26| ($)
  (SPADCALL (SPADCALL 'X01AAF (QREFELT $ 45)) (|spadConstant| $ 91)
            (QREFELT $ 89))) 

(PUT '|FEXPR;coerce;$E;27| '|SPADreplace| '(XLAM (|u|) |u|)) 

(DEFUN |FEXPR;coerce;$E;27| (|u| $) |u|) 

(DEFUN |FEXPR;retractIfCan;EU;28| (|u| $)
  (PROG (#1=#:G262 |m|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((|FEXPR;extraSymbols?| |u| $)
          (SEQ
           (LETT |m| (|FEXPR;fixUpSymbols| |u| $)
                 . #2=(|FEXPR;retractIfCan;EU;28|))
           (EXIT
            (COND
             ((QEQCAR |m| 1)
              (PROGN (LETT #1# (CONS 1 "failed") . #2#) (GO #1#)))
             (#3='T (LETT |u| (QCDR |m|) . #2#)))))))
        (EXIT
         (COND ((|FEXPR;extraOperators?| |u| $) (CONS 1 "failed"))
               (#3# (CONS 0 (|FEXPR;checkForNagOperators| |u| $)))))))
      #1# (EXIT #1#))))) 

(DEFUN |FEXPR;retract;E$;29| (|u| $)
  (SEQ (LETT |u| (|FEXPR;checkSymbols| |u| $) |FEXPR;retract;E$;29|)
       (|FEXPR;checkOperators| |u| $)
       (EXIT (|FEXPR;checkForNagOperators| |u| $)))) 

(DEFUN |FEXPR;retractIfCan;SU;30| (|u| $)
  (SEQ
   (COND
    ((NULL (SPADCALL |u| (QREFELT $ 6) (QREFELT $ 40)))
     (COND
      ((SPADCALL |u| (QREFELT $ 26))
       (COND
        ((NULL
          (SPADCALL (SPADCALL |u| (QREFELT $ 27)) (QREFELT $ 7)
                    (QREFELT $ 40)))
         (EXIT (CONS 1 #1="failed")))))
      ('T (EXIT (CONS 1 #1#))))))
   (EXIT (CONS 0 (SPADCALL |u| (QREFELT $ 14)))))) 

(DEFUN |FEXPR;retract;S$;31| (|u| $)
  (PROG (|res|)
    (RETURN
     (SEQ (LETT |res| (SPADCALL |u| (QREFELT $ 93)) |FEXPR;retract;S$;31|)
          (EXIT
           (COND
            ((QEQCAR |res| 1)
             (|error| "Illegal Symbol Detected:" (|::| |u| (|String|))))
            ('T (QCDR |res|)))))))) 

(DEFUN |FortranExpression| (&REST #1=#:G288)
  (PROG ()
    (RETURN
     (PROG (#2=#:G289)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|FortranExpression|)
                                           '|domainEqualList|)
                . #3=(|FortranExpression|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |FortranExpression;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|FortranExpression|))))))))))) 

(DEFUN |FortranExpression;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|FortranExpression|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|FortranExpression| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 109) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Float|)))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|FortranExpression|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 4))
      (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
           (|augmentPredVector| $ 8))
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9
                '(|abs| |sqrt| |exp| |log| |log10| |sin| |cos| |tan| |asin|
                  |acos| |atan| |sinh| |cosh| |tanh| |nthRoot| |%power|))
      (QSETREFV $ 11 '(|pi| X01AAF))
      (QSETREFV $ 12 'T)
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 57
                   (CONS (|dispatchFunction| |FEXPR;retractIfCan;PU;9|) $))
         (QSETREFV $ 59 (CONS (|dispatchFunction| |FEXPR;retract;P$;10|) $))
         (QSETREFV $ 62
                   (CONS (|dispatchFunction| |FEXPR;retractIfCan;FU;11|) $))
         (QSETREFV $ 63 (CONS (|dispatchFunction| |FEXPR;retract;F$;12|) $))
         (QSETREFV $ 56
                   (CONS (|dispatchFunction| |FEXPR;retractIfCan;EU;14|) $))
         (QSETREFV $ 58 (CONS (|dispatchFunction| |FEXPR;retract;E$;15|) $)))))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 75
                   (CONS (|dispatchFunction| |FEXPR;retractIfCan;PU;16|) $))
         (QSETREFV $ 77 (CONS (|dispatchFunction| |FEXPR;retract;P$;17|) $))
         (QSETREFV $ 80
                   (CONS (|dispatchFunction| |FEXPR;retractIfCan;FU;18|) $))
         (QSETREFV $ 81 (CONS (|dispatchFunction| |FEXPR;retract;F$;19|) $))
         (QSETREFV $ 74
                   (CONS (|dispatchFunction| |FEXPR;retractIfCan;EU;21|) $))
         (QSETREFV $ 76 (CONS (|dispatchFunction| |FEXPR;retract;E$;22|) $)))))
      $)))) 

(MAKEPROP '|FortranExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Expression| 8) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|f77Functions| |FEXPR;pi;$;26|
              '|nagFunctions| '|useNagFunctionsFlag| (|Symbol|) (0 . |coerce|)
              (|Record| (|:| |sub| (|List| 35)) (|:| |sup| (|List| 35))
                        (|:| |presup| (|List| 35)) (|:| |presub| (|List| 35))
                        (|:| |args| (|List| 35)))
              (5 . |scripts|) (10 . |script|) (|Equation| 5) (16 . |equation|)
              (|List| 13) (22 . |variables|) (27 . |One|) (|Equation| $)
              (31 . |subst|) (|Boolean|) (37 . |scripted?|) (42 . |name|)
              (47 . |removeDuplicates!|) (|List| 23) (52 . |subst|)
              (58 . |setUnion|) (64 . |setDifference|) (|String|)
              (70 . |string|) (|OutputForm|) (|List| 33) (75 . |coerce|)
              (|BasicOperator|) (80 . |name|) (85 . |member?|) (|List| 38)
              (91 . |operators|) (|Void|) (96 . |void|) (100 . |operator|)
              (|Pi|) (105 . |pi|) (|PiCoercions| 8) (109 . |coerce|)
              (114 . |Zero|) (118 . |kernel|) (|Polynomial| 64)
              (|Expression| 64) (124 . |coerce|) (|Union| $ '"failed")
              (129 . |retractIfCan|) (134 . |retractIfCan|) (139 . |retract|)
              (144 . |retract|) (|Fraction| 52) (149 . |coerce|)
              (154 . |retractIfCan|) (159 . |retract|) (|Integer|)
              (164 . |coerce|) (|Mapping| 8 64) (|ExpressionFunctions2| 64 8)
              (169 . |map|) |FEXPR;retractIfCan;EU;28| |FEXPR;retract;E$;29|
              (|Polynomial| 82) (|Expression| 82) (175 . |coerce|)
              (180 . |retractIfCan|) (185 . |retractIfCan|) (190 . |retract|)
              (195 . |retract|) (|Fraction| 71) (200 . |coerce|)
              (205 . |retractIfCan|) (210 . |retract|) (|Float|)
              (215 . |coerce|) (|Mapping| 8 82) (|ExpressionFunctions2| 82 8)
              (220 . |map|) |FEXPR;useNagFunctions;B;23|
              |FEXPR;useNagFunctions;2B;24| (226 . |kernel|)
              |FEXPR;log10;2$;25| (232 . |Zero|) |FEXPR;coerce;$E;27|
              |FEXPR;retractIfCan;SU;30| |FEXPR;retract;S$;31|
              (|SparseUnivariatePolynomial| $) (|Kernel| $) (|List| 98)
              (|NonNegativeInteger|) (|Union| 8 '"failed") (|PositiveInteger|)
              (|Mapping| $ 105) (|Mapping| $ $) (|List| 102) (|List| 101)
              (|List| $) (|List| 96) (|Union| 96 '"failed") (|SingleInteger|))
           '#(~= 236 |zero?| 242 |variables| 247 |useNagFunctions| 252 |tower|
              261 |tanh| 266 |tan| 271 |subtractIfCan| 276 |subst| 282 |sqrt|
              301 |smaller?| 306 |sinh| 312 |sin| 317 |sample| 322
              |retractIfCan| 326 |retract| 376 |recip| 426 |pi| 431 |paren| 435
              |operators| 445 |operator| 450 |one?| 455 |odd?| 460 |minPoly|
              465 |map| 470 |mainKernel| 476 |log10| 481 |log| 486 |latex| 491
              |kernels| 496 |kernel| 501 |is?| 513 |height| 525 |hash| 530
              |freeOf?| 535 |exp| 547 |even?| 552 |eval| 557 |elt| 653
              |distribute| 749 |differentiate| 760 |definingPolynomial| 786
              |cosh| 791 |cos| 796 |coerce| 801 |characteristic| 826 |box| 830
              |belong?| 840 |atan| 845 |asin| 850 |acos| 855 |abs| 860 ^ 865
              |Zero| 877 |One| 881 D 885 = 911 - 917 + 928 * 934)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0))
            (CONS
             '#(|Algebra&| |PartialDifferentialRing&| |Module&| NIL |Ring&| NIL
                NIL NIL NIL |AbelianGroup&| NIL NIL |ExpressionSpace&|
                |Monoid&| NIL |AbelianMonoid&| NIL |SemiGroup&|
                |AbelianSemiGroup&| |SetCategory&| |Evalable&| |RetractableTo&|
                NIL |BasicType&| |InnerEvalable&| |InnerEvalable&|
                |RetractableTo&| NIL)
             (CONS
              '#((|Algebra| 8) (|PartialDifferentialRing| 13) (|Module| 8)
                 (|BiModule| 8 8) (|Ring|) (|RightModule| 8) (|LeftModule| 8)
                 (|LeftModule| $$) (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|ExpressionSpace|) (|Monoid|)
                 (|SemiRng|) (|AbelianMonoid|) (|Comparable|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|Evalable| $$)
                 (|RetractableTo| 8) (|unitsKnown|) (|BasicType|)
                 (|InnerEvalable| $$ $$) (|InnerEvalable| (|Kernel| $$) $$)
                 (|RetractableTo| (|Kernel| $$)) (|CoercibleTo| 35))
              (|makeByteWordVec2| 108
                                  '(1 5 0 13 14 1 13 15 0 16 2 13 0 0 15 17 2
                                    18 0 5 5 19 1 5 20 0 21 0 0 0 22 2 5 0 0 23
                                    24 1 13 25 0 26 1 13 0 0 27 1 20 0 0 28 2 5
                                    0 0 29 30 2 20 0 0 0 31 2 20 0 0 0 32 1 13
                                    33 0 34 1 36 35 0 37 1 38 13 0 39 2 20 25
                                    13 0 40 1 5 41 0 42 0 43 0 44 1 38 0 13 45
                                    0 46 0 47 1 48 5 46 49 0 5 0 50 2 5 0 38 0
                                    51 1 53 0 52 54 1 0 55 53 56 1 0 55 52 57 1
                                    0 0 53 58 1 0 0 52 59 1 53 0 60 61 1 0 55
                                    60 62 1 0 0 60 63 1 8 0 64 65 2 67 5 66 53
                                    68 1 72 0 71 73 1 0 55 72 74 1 0 55 71 75 1
                                    0 0 72 76 1 0 0 71 77 1 72 0 78 79 1 0 55
                                    78 80 1 0 0 78 81 1 8 0 82 83 2 85 5 84 72
                                    86 2 0 0 38 0 89 0 0 0 91 2 0 25 0 0 1 1 0
                                    25 0 1 1 0 20 0 1 1 0 25 25 88 0 0 25 87 1
                                    0 106 0 1 1 0 0 0 1 1 0 0 0 1 2 0 55 0 0 1
                                    2 0 0 0 29 1 3 0 0 0 106 105 1 2 0 0 0 23 1
                                    1 0 0 0 1 2 0 25 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    0 0 0 1 1 2 55 71 75 1 2 55 78 80 1 2 55 72
                                    74 1 1 55 52 57 1 1 55 60 62 1 1 55 53 56 1
                                    0 55 13 93 1 0 55 5 69 1 0 99 0 1 1 0 107 0
                                    1 1 2 0 71 77 1 2 0 78 81 1 2 0 72 76 1 1 0
                                    52 59 1 1 0 60 63 1 1 0 53 58 1 0 0 13 94 1
                                    0 0 5 70 1 0 8 0 1 1 0 96 0 1 1 0 55 0 1 0
                                    0 0 10 1 0 0 0 1 1 0 0 105 1 1 0 41 0 1 1 0
                                    38 38 1 1 0 25 0 1 1 4 25 0 1 1 3 95 96 1 2
                                    0 0 102 96 1 1 0 107 0 1 1 0 0 0 90 1 0 0 0
                                    1 1 0 33 0 1 1 0 106 0 1 2 0 0 38 105 1 2 0
                                    0 38 0 89 2 0 25 0 13 1 2 0 25 0 38 1 1 0
                                    98 0 1 1 0 108 0 1 2 0 25 0 0 1 2 0 25 0 13
                                    1 1 0 0 0 1 1 4 25 0 1 3 0 0 0 38 101 1 3 0
                                    0 0 38 102 1 3 0 0 0 41 103 1 3 0 0 0 41
                                    104 1 3 0 0 0 13 101 1 3 0 0 0 13 102 1 3 0
                                    0 0 20 103 1 3 0 0 0 20 104 1 3 0 0 0 105
                                    105 1 2 0 0 0 23 1 3 0 0 0 0 0 1 3 0 0 0
                                    106 105 1 2 0 0 0 29 1 3 0 0 0 96 0 1 2 0 0
                                    38 105 1 9 0 0 38 0 0 0 0 0 0 0 0 1 10 0 0
                                    38 0 0 0 0 0 0 0 0 0 1 7 0 0 38 0 0 0 0 0 0
                                    1 8 0 0 38 0 0 0 0 0 0 0 1 5 0 0 38 0 0 0 0
                                    1 6 0 0 38 0 0 0 0 0 1 3 0 0 38 0 0 1 4 0 0
                                    38 0 0 0 1 2 0 0 38 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 0 20 1 2 0 0 0 13 1 3 0 0 0 20 97 1
                                    3 0 0 0 13 98 1 1 3 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 5 0 92 1 0 0 64 1 1 0 0 8 1 1 0 0 96
                                    1 1 0 35 0 1 0 0 98 1 1 0 0 0 1 1 0 0 105 1
                                    1 0 25 38 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 2 0 0 0 100 1 2 0 0 0 98 1 0 0 0 91
                                    0 0 0 22 2 0 0 0 20 1 2 0 0 0 13 1 3 0 0 0
                                    20 97 1 3 0 0 0 13 98 1 2 0 25 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 100 0 1 2
                                    0 0 98 0 1 2 0 0 64 0 1 2 0 0 0 0 1 2 0 0 0
                                    8 1 2 0 0 8 0 1)))))
           '|lookupComplete|)) 
