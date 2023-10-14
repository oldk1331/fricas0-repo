
(/VERSIONCHECK 2) 

(DEFUN |FEXPR;mkEqn| (|s1| |s2| $)
  (SPADCALL (SPADCALL |s2| (QREFELT $ 13))
            (SPADCALL
             (SPADCALL |s1| (SPADCALL |s2| (QREFELT $ 15)) (QREFELT $ 16))
             (QREFELT $ 13))
            (QREFELT $ 18))) 

(DEFUN |FEXPR;fixUpSymbols| (|u| $)
  (PROG (#1=#:G177 |i| #2=#:G176 |sym| |syms| #3=#:G175 |s| #4=#:G174 #5=#:G154
         #6=#:G172 #7=#:G173)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |syms| (SPADCALL |u| (QREFELT $ 20)) . #8=(|FEXPR;fixUpSymbols|))
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
                                               (QREFELT $ 13))
                                     (SPADCALL (|SPADfirst| (QREFELT $ 6))
                                               (QREFELT $ 13))
                                     (QREFELT $ 18))
                                    (QREFELT $ 23))))))))))
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
                        ((NULL (SPADCALL |s| (QREFELT $ 25)))
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
                                        (CONS (SPADCALL |s| (QREFELT $ 26))
                                              #4#)
                                        . #8#)))
                                (LETT #3# (CDR #3#) . #8#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (QREFELT $ 27))
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
                                     (LETT #1# (SPADCALL |u| (QREFELT $ 20))
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
                               (QREFELT $ 29))))))))))
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
                  (LETT #1# (SPADCALL |u| (QREFELT $ 20)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 26)) #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (LETT |extras|
            (SPADCALL |syms|
                      (SPADCALL (QREFELT $ 6) (QREFELT $ 7) (QREFELT $ 30))
                      (QREFELT $ 31))
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
                  (LETT #3# (SPADCALL |u| (QREFELT $ 20)) . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 26)) #4#) . #5#)))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (LETT |extras|
            (SPADCALL |syms|
                      (SPADCALL (QREFELT $ 6) (QREFELT $ 7) (QREFELT $ 30))
                      (QREFELT $ 31))
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
                                               (SPADCALL |v| (QREFELT $ 33))
                                               #2#)
                                              . #5#)))
                                      (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                                      (EXIT (NREVERSE #2#))))
                                (QREFELT $ 36))))))))))
      (EXIT |u|))))) 

(DEFUN |FEXPR;notSymbol?| (|v| $)
  (PROG (|s|)
    (RETURN
     (SEQ (LETT |s| (SPADCALL |v| (QREFELT $ 38)) |FEXPR;notSymbol?|)
          (COND ((SPADCALL |s| (QREFELT $ 6) (QREFELT $ 39)) (EXIT 'NIL))
                ((SPADCALL |s| (QREFELT $ 25))
                 (COND
                  ((SPADCALL (SPADCALL |s| (QREFELT $ 26)) (QREFELT $ 7)
                             (QREFELT $ 39))
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
                  (LETT #1# (SPADCALL |u| (QREFELT $ 41)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((|FEXPR;notSymbol?| |v| $)
                      (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 38)) #2#)
                            . #3#)))))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (COND
       ((QREFELT $ 11)
        (LETT |fortranFunctions| (APPEND (QREFELT $ 9) (QREFELT $ 10)) . #3#))
       (#4='T (LETT |fortranFunctions| (QREFELT $ 9) . #3#)))
      (LETT |extras| (SPADCALL |ops| |fortranFunctions| (QREFELT $ 31)) . #3#)
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
                  (LETT #3# (SPADCALL |u| (QREFELT $ 41)) . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((|FEXPR;notSymbol?| |v| $)
                      (LETT #4# (CONS (SPADCALL |v| (QREFELT $ 38)) #4#)
                            . #5#)))))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#))))
            . #5#)
      (COND
       ((QREFELT $ 11)
        (LETT |fortranFunctions| (APPEND (QREFELT $ 9) (QREFELT $ 10)) . #5#))
       ('T (LETT |fortranFunctions| (QREFELT $ 9) . #5#)))
      (LETT |extras| (SPADCALL |ops| |fortranFunctions| (QREFELT $ 31)) . #5#)
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
                           (LETT #2# (CONS (SPADCALL |v| (QREFELT $ 33)) #2#)
                                 . #5#)))
                         (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   (QREFELT $ 36))))))
      (EXIT (SPADCALL (QREFELT $ 43))))))) 

(DEFUN |FEXPR;checkForNagOperators| (|u| $)
  (PROG (|piSub| |piOp|)
    (RETURN
     (SEQ
      (COND
       ((QREFELT $ 11)
        (SEQ
         (LETT |piOp| (SPADCALL 'X01AAF (QREFELT $ 44))
               . #1=(|FEXPR;checkForNagOperators|))
         (LETT |piSub|
               (SPADCALL (SPADCALL (SPADCALL (QREFELT $ 46)) (QREFELT $ 48))
                         (SPADCALL |piOp| (|spadConstant| $ 49) (QREFELT $ 50))
                         (QREFELT $ 18))
               . #1#)
         (EXIT (SPADCALL |u| |piSub| (QREFELT $ 23)))))
       ('T |u|)))))) 

(DEFUN |FEXPR;retractIfCan;PU;9| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 53)) (QREFELT $ 55))) 

(DEFUN |FEXPR;retract;P$;10| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 53)) (QREFELT $ 57))) 

(DEFUN |FEXPR;retractIfCan;FU;11| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 60)) (QREFELT $ 55))) 

(DEFUN |FEXPR;retract;F$;12| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 60)) (QREFELT $ 57))) 

(DEFUN |FEXPR;int2R| (|u| $) (SPADCALL |u| (QREFELT $ 64))) 

(DEFUN |FEXPR;retractIfCan;EU;14| (|u| $)
  (SPADCALL (SPADCALL (CONS (|function| |FEXPR;int2R|) $) |u| (QREFELT $ 67))
            (QREFELT $ 68))) 

(DEFUN |FEXPR;retract;E$;15| (|u| $)
  (SPADCALL (SPADCALL (CONS (|function| |FEXPR;int2R|) $) |u| (QREFELT $ 67))
            (QREFELT $ 69))) 

(DEFUN |FEXPR;retractIfCan;PU;16| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 72)) (QREFELT $ 73))) 

(DEFUN |FEXPR;retract;P$;17| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 72)) (QREFELT $ 75))) 

(DEFUN |FEXPR;retractIfCan;FU;18| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 78)) (QREFELT $ 73))) 

(DEFUN |FEXPR;retract;F$;19| (|u| $)
  (SPADCALL (SPADCALL |u| (QREFELT $ 78)) (QREFELT $ 75))) 

(DEFUN |FEXPR;float2R| (|u| $) (SPADCALL |u| (QREFELT $ 82))) 

(DEFUN |FEXPR;retractIfCan;EU;21| (|u| $)
  (SPADCALL (SPADCALL (CONS (|function| |FEXPR;float2R|) $) |u| (QREFELT $ 85))
            (QREFELT $ 68))) 

(DEFUN |FEXPR;retract;E$;22| (|u| $)
  (SPADCALL (SPADCALL (CONS (|function| |FEXPR;float2R|) $) |u| (QREFELT $ 85))
            (QREFELT $ 69))) 

(DEFUN |FEXPR;useNagFunctions;B;23| ($) (QREFELT $ 11)) 

(DEFUN |FEXPR;useNagFunctions;2B;24| (|v| $)
  (PROG (|old|)
    (RETURN
     (SEQ (LETT |old| (QREFELT $ 11) |FEXPR;useNagFunctions;2B;24|)
          (SETELT $ 11 |v|) (EXIT |old|))))) 

(DEFUN |FEXPR;log10;2$;25| (|x| $)
  (SPADCALL (SPADCALL '|log10| (QREFELT $ 44)) |x| (QREFELT $ 88))) 

(DEFUN |FEXPR;pi;$;26| ($)
  (SPADCALL (SPADCALL 'X01AAF (QREFELT $ 44)) (|spadConstant| $ 90)
            (QREFELT $ 88))) 

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
    ((NULL (SPADCALL |u| (QREFELT $ 6) (QREFELT $ 39)))
     (COND
      ((SPADCALL |u| (QREFELT $ 25))
       (COND
        ((NULL
          (SPADCALL (SPADCALL |u| (QREFELT $ 26)) (QREFELT $ 7)
                    (QREFELT $ 39)))
         (EXIT (CONS 1 #1="failed")))))
      ('T (EXIT (CONS 1 #1#))))))
   (EXIT (CONS 0 (SPADCALL |u| (QREFELT $ 13)))))) 

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
      (LETT $ (GETREFV 110) . #1#)
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
      (QSETREFV $ 10 '(|pi| X01AAF))
      (QSETREFV $ 11 'T)
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 56
                   (CONS (|dispatchFunction| |FEXPR;retractIfCan;PU;9|) $))
         (QSETREFV $ 58 (CONS (|dispatchFunction| |FEXPR;retract;P$;10|) $))
         (QSETREFV $ 61
                   (CONS (|dispatchFunction| |FEXPR;retractIfCan;FU;11|) $))
         (QSETREFV $ 62 (CONS (|dispatchFunction| |FEXPR;retract;F$;12|) $))
         (QSETREFV $ 55
                   (CONS (|dispatchFunction| |FEXPR;retractIfCan;EU;14|) $))
         (QSETREFV $ 57 (CONS (|dispatchFunction| |FEXPR;retract;E$;15|) $)))))
      (COND
       ((|testBitVector| |pv$| 2)
        (PROGN
         (QSETREFV $ 74
                   (CONS (|dispatchFunction| |FEXPR;retractIfCan;PU;16|) $))
         (QSETREFV $ 76 (CONS (|dispatchFunction| |FEXPR;retract;P$;17|) $))
         (QSETREFV $ 79
                   (CONS (|dispatchFunction| |FEXPR;retractIfCan;FU;18|) $))
         (QSETREFV $ 80 (CONS (|dispatchFunction| |FEXPR;retract;F$;19|) $))
         (QSETREFV $ 73
                   (CONS (|dispatchFunction| |FEXPR;retractIfCan;EU;21|) $))
         (QSETREFV $ 75 (CONS (|dispatchFunction| |FEXPR;retract;E$;22|) $)))))
      $)))) 

(MAKEPROP '|FortranExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Expression| 8) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|f77Functions| '|nagFunctions|
              '|useNagFunctionsFlag| (|Symbol|) (0 . |coerce|)
              (|Record| (|:| |sub| (|List| 34)) (|:| |sup| (|List| 34))
                        (|:| |presup| (|List| 34)) (|:| |presub| (|List| 34))
                        (|:| |args| (|List| 34)))
              (5 . |scripts|) (10 . |script|) (|Equation| 5) (16 . |equation|)
              (|List| 12) (22 . |variables|) (27 . |One|) (|Equation| $)
              (31 . |subst|) (|Boolean|) (37 . |scripted?|) (42 . |name|)
              (47 . |removeDuplicates!|) (|List| 22) (52 . |subst|)
              (58 . |setUnion|) (64 . |setDifference|) (|String|)
              (70 . |string|) (|OutputForm|) (|List| 32) (75 . |coerce|)
              (|BasicOperator|) (80 . |name|) (85 . |member?|) (|List| 37)
              (91 . |operators|) (|Void|) (96 . |void|) (100 . |operator|)
              (|Pi|) (105 . |pi|) (|PiCoercions| 8) (109 . |coerce|)
              (114 . |Zero|) (118 . |kernel|) (|Polynomial| 63)
              (|Expression| 63) (124 . |coerce|) (|Union| $ '"failed")
              (129 . |retractIfCan|) (134 . |retractIfCan|) (139 . |retract|)
              (144 . |retract|) (|Fraction| 51) (149 . |coerce|)
              (154 . |retractIfCan|) (159 . |retract|) (|Integer|)
              (164 . |coerce|) (|Mapping| 8 63) (|ExpressionFunctions2| 63 8)
              (169 . |map|) |FEXPR;retractIfCan;EU;28| |FEXPR;retract;E$;29|
              (|Polynomial| 81) (|Expression| 81) (175 . |coerce|)
              (180 . |retractIfCan|) (185 . |retractIfCan|) (190 . |retract|)
              (195 . |retract|) (|Fraction| 70) (200 . |coerce|)
              (205 . |retractIfCan|) (210 . |retract|) (|Float|)
              (215 . |coerce|) (|Mapping| 8 81) (|ExpressionFunctions2| 81 8)
              (220 . |map|) |FEXPR;useNagFunctions;B;23|
              |FEXPR;useNagFunctions;2B;24| (226 . |kernel|)
              |FEXPR;log10;2$;25| (232 . |Zero|) |FEXPR;pi;$;26|
              |FEXPR;coerce;$E;27| |FEXPR;retractIfCan;SU;30|
              |FEXPR;retract;S$;31| (|SparseUnivariatePolynomial| $)
              (|Kernel| $) (|List| 98) (|NonNegativeInteger|)
              (|Union| 8 '"failed") (|PositiveInteger|) (|Mapping| $ $)
              (|Mapping| $ 105) (|List| 102) (|List| 101) (|List| $)
              (|List| 96) (|Union| 96 '"failed") (|HashState|)
              (|SingleInteger|))
           '#(~= 236 |zero?| 242 |variables| 247 |useNagFunctions| 252 |tower|
              261 |tanh| 266 |tan| 271 |subtractIfCan| 276 |subst| 282 |sqrt|
              301 |smaller?| 306 |sinh| 312 |sin| 317 |sample| 322
              |retractIfCan| 326 |retract| 376 |recip| 426 |pi| 431 |paren| 435
              |operators| 445 |operator| 450 |one?| 455 |odd?| 460 |minPoly|
              465 |map| 470 |mainKernel| 476 |log10| 481 |log| 486 |latex| 491
              |kernels| 496 |kernel| 501 |is?| 513 |height| 525 |hashUpdate!|
              530 |hash| 536 |freeOf?| 541 |exp| 553 |even?| 558 |eval| 563
              |elt| 659 |distribute| 755 |differentiate| 766
              |definingPolynomial| 792 |cosh| 797 |cos| 802 |coerce| 807
              |characteristic| 832 |box| 836 |belong?| 846 |atan| 851 |asin|
              856 |acos| 861 |abs| 866 ^ 871 |Zero| 883 |One| 887 D 891 = 917 -
              923 + 934 * 940)
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
              '#((|Algebra| 8) (|PartialDifferentialRing| 12) (|Module| 8)
                 (|BiModule| 8 8) (|Ring|) (|RightModule| 8) (|LeftModule| 8)
                 (|LeftModule| $$) (|Rng|) (|AbelianGroup|) (|SemiRing|)
                 (|CancellationAbelianMonoid|) (|ExpressionSpace|) (|Monoid|)
                 (|SemiRng|) (|AbelianMonoid|) (|Comparable|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|Evalable| $$)
                 (|RetractableTo| 8) (|unitsKnown|) (|BasicType|)
                 (|InnerEvalable| $$ $$) (|InnerEvalable| (|Kernel| $$) $$)
                 (|RetractableTo| (|Kernel| $$)) (|CoercibleTo| 34))
              (|makeByteWordVec2| 109
                                  '(1 5 0 12 13 1 12 14 0 15 2 12 0 0 14 16 2
                                    17 0 5 5 18 1 5 19 0 20 0 0 0 21 2 5 0 0 22
                                    23 1 12 24 0 25 1 12 0 0 26 1 19 0 0 27 2 5
                                    0 0 28 29 2 19 0 0 0 30 2 19 0 0 0 31 1 12
                                    32 0 33 1 35 34 0 36 1 37 12 0 38 2 19 24
                                    12 0 39 1 5 40 0 41 0 42 0 43 1 37 0 12 44
                                    0 45 0 46 1 47 5 45 48 0 5 0 49 2 5 0 37 0
                                    50 1 52 0 51 53 1 0 54 52 55 1 0 54 51 56 1
                                    0 0 52 57 1 0 0 51 58 1 52 0 59 60 1 0 54
                                    59 61 1 0 0 59 62 1 8 0 63 64 2 66 5 65 52
                                    67 1 71 0 70 72 1 0 54 71 73 1 0 54 70 74 1
                                    0 0 71 75 1 0 0 70 76 1 71 0 77 78 1 0 54
                                    77 79 1 0 0 77 80 1 8 0 81 82 2 84 5 83 71
                                    85 2 0 0 37 0 88 0 0 0 90 2 0 24 0 0 1 1 0
                                    24 0 1 1 0 19 0 1 1 0 24 24 87 0 0 24 86 1
                                    0 106 0 1 1 0 0 0 1 1 0 0 0 1 2 0 54 0 0 1
                                    3 0 0 0 106 105 1 2 0 0 0 22 1 2 0 0 0 28 1
                                    1 0 0 0 1 2 0 24 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    0 0 0 1 1 2 54 70 74 1 2 54 77 79 1 2 54 71
                                    73 1 1 54 51 56 1 1 54 59 61 1 1 54 52 55 1
                                    0 54 12 93 1 0 54 5 68 1 0 99 0 1 1 0 107 0
                                    1 1 2 0 70 76 1 2 0 77 80 1 2 0 71 75 1 1 0
                                    51 58 1 1 0 59 62 1 1 0 52 57 1 0 0 12 94 1
                                    0 0 5 69 1 0 8 0 1 1 0 96 0 1 1 0 54 0 1 0
                                    0 0 91 1 0 0 105 1 1 0 0 0 1 1 0 40 0 1 1 0
                                    37 37 1 1 0 24 0 1 1 4 24 0 1 1 3 95 96 1 2
                                    0 0 101 96 1 1 0 107 0 1 1 0 0 0 89 1 0 0 0
                                    1 1 0 32 0 1 1 0 106 0 1 2 0 0 37 0 88 2 0
                                    0 37 105 1 2 0 24 0 37 1 2 0 24 0 12 1 1 0
                                    98 0 1 2 0 108 108 0 1 1 0 109 0 1 2 0 24 0
                                    12 1 2 0 24 0 0 1 1 0 0 0 1 1 4 24 0 1 3 0
                                    0 0 37 101 1 3 0 0 0 40 103 1 3 0 0 0 37
                                    102 1 3 0 0 0 12 101 1 3 0 0 0 40 104 1 3 0
                                    0 0 19 103 1 3 0 0 0 12 102 1 3 0 0 0 19
                                    104 1 3 0 0 0 0 0 1 3 0 0 0 105 105 1 2 0 0
                                    0 28 1 2 0 0 0 22 1 3 0 0 0 96 0 1 3 0 0 0
                                    106 105 1 10 0 0 37 0 0 0 0 0 0 0 0 0 1 2 0
                                    0 37 105 1 8 0 0 37 0 0 0 0 0 0 0 1 9 0 0
                                    37 0 0 0 0 0 0 0 0 1 6 0 0 37 0 0 0 0 0 1 7
                                    0 0 37 0 0 0 0 0 0 1 4 0 0 37 0 0 0 1 5 0 0
                                    37 0 0 0 0 1 2 0 0 37 0 1 3 0 0 37 0 0 1 2
                                    0 0 0 0 1 1 0 0 0 1 2 0 0 0 19 1 2 0 0 0 12
                                    1 3 0 0 0 19 97 1 3 0 0 0 12 98 1 1 3 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 1 0 5 0 92 1 0 0 63 1 1
                                    0 0 8 1 1 0 0 96 1 1 0 34 0 1 0 0 98 1 1 0
                                    0 105 1 1 0 0 0 1 1 0 24 37 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 100 1 2 0
                                    0 0 98 1 0 0 0 90 0 0 0 21 2 0 0 0 19 1 2 0
                                    0 0 12 1 3 0 0 0 19 97 1 3 0 0 0 12 98 1 2
                                    0 24 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 100 0 1 2 0 0 98 0 1 2 0 0 63 0 1 2
                                    0 0 0 0 1 2 0 0 8 0 1 2 0 0 0 8 1)))))
           '|lookupComplete|)) 
