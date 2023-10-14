
(/VERSIONCHECK 2) 

(DEFUN |ASSOCEQ;makeMatrix| (|v| |n| $)
  (PROG (#1=#:G132 |i| #2=#:G131)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|ASSOCEQ;makeMatrix|))
        (SEQ (LETT |i| 1 . #3#) (LETT #1# (QVSIZE |v|) . #3#) G190
             (COND ((|greater_SI| |i| #1#) (GO G191)))
             (SEQ
              (EXIT
               (LETT #2#
                     (CONS
                      (SPADCALL
                       (SPADCALL (SPADCALL |v| |i| (QREFELT $ 13)) |n|
                                 (QREFELT $ 15))
                       (QREFELT $ 17))
                      #2#)
                     . #3#)))
             (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
             (EXIT (NREVERSE #2#))))
       (QREFELT $ 19)))))) 

(DEFUN |ASSOCEQ;associatedSystem;LPiR;2| (|op| |m| $)
  (PROG (|u| #1=#:G154 #2=#:G149 |j| #3=#:G142 |k| |wi| |eq| |i| |a| #4=#:G138
         #5=#:G166 #6=#:G165 |an| |m1| #7=#:G136 M |ww| |s| |w| S |n|
         #8=#:G135)
    (RETURN
     (SEQ
      (LETT S
            (|SetOfMIntegersInOneToN| |m|
                                      (LETT |n|
                                            (PROG1
                                                (LETT #8#
                                                      (SPADCALL |op|
                                                                (QREFELT $ 21))
                                                      . #9=(|ASSOCEQ;associatedSystem;LPiR;2|))
                                              (|check_subtype| (> #8# 0)
                                                               '(|PositiveInteger|)
                                                               #8#))
                                            . #9#))
            . #9#)
      (LETT |w|
            (SPADCALL
             (|compiledLookupCheck| '|enumerate| (LIST (LIST '|Vector| '$)) S))
            . #9#)
      (LETT |s|
            (SPADCALL
             (|compiledLookupCheck| '|size| (LIST (LIST '|NonNegativeInteger|))
                                    S))
            . #9#)
      (LETT |ww| (MAKEARR1 |s| NIL) . #9#)
      (LETT M (MAKE_MATRIX1 |s| |s| (|spadConstant| $ 22)) . #9#)
      (LETT |m1|
            (PROG1 (LETT #7# (- |m| 1) . #9#)
              (|check_subtype| (> #7# 0) '(|PositiveInteger|) #7#))
            . #9#)
      (LETT |an| (SPADCALL |op| (QREFELT $ 26)) . #9#)
      (LETT |a|
            (PROGN
             (LETT #6# (GETREFV |n|) . #9#)
             (SEQ (LETT |j| 0 . #9#) (LETT #5# (- |n| 1) . #9#) G190
                  (COND ((|greater_SI| |j| #5#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SETELT #6# |j|
                            (SPADCALL
                             (PROG2
                                 (LETT #4#
                                       (SPADCALL
                                        (SPADCALL |op| |j| (QREFELT $ 27)) |an|
                                        (QREFELT $ 29))
                                       . #9#)
                                 (QCDR #4#)
                               (|check_union| (QEQCAR #4# 0) (QREFELT $ 6)
                                              #4#))
                             (QREFELT $ 30)))))
                  (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191 (EXIT NIL))
             #6#)
            . #9#)
      (SEQ (LETT |i| 1 . #9#) G190 (COND ((|greater_SI| |i| |s|) (GO G191)))
           (SEQ (LETT |eq| (MAKEARR1 |s| (|spadConstant| $ 22)) . #9#)
                (LETT |wi|
                      (SPADCALL |w| |i|
                                (|compiledLookupCheck| '|elt|
                                                       (LIST (|devaluate| S) '$
                                                             (LIST '|Integer|))
                                                       (|Vector| S)))
                      . #9#)
                (SPADCALL |ww| |i|
                          (SPADCALL |wi|
                                    (|compiledLookupCheck| '|elements|
                                                           (LIST
                                                            (LIST '|List|
                                                                  (LIST
                                                                   '|PositiveInteger|))
                                                            '$)
                                                           S))
                          (QREFELT $ 33))
                (SEQ (LETT |k| 1 . #9#) G190
                     (COND ((|greater_SI| |k| |m1|) (GO G191)))
                     (SEQ
                      (LETT |u|
                            (SPADCALL |wi|
                                      (PROG1 (LETT #3# |k| . #9#)
                                        (|check_subtype| (> #3# 0)
                                                         '(|PositiveInteger|)
                                                         #3#))
                                      (|compiledLookupCheck|
                                       '|incrementKthElement|
                                       (LIST (LIST '|Union| '$ '#10="failed")
                                             '$ (LIST '|PositiveInteger|))
                                       S))
                            . #9#)
                      (EXIT
                       (COND
                        ((QEQCAR |u| 0)
                         (SPADCALL |eq|
                                   (SPADCALL (QCDR |u|)
                                             (|compiledLookupCheck| '|lookup|
                                                                    (LIST
                                                                     (LIST
                                                                      '|PositiveInteger|)
                                                                     '$)
                                                                    S))
                                   (|spadConstant| $ 24) (QREFELT $ 34))))))
                     (LETT |k| (|inc_SI| |k|) . #9#) (GO G190) G191 (EXIT NIL))
                (COND
                 ((SPADCALL |n| |wi|
                            (|compiledLookupCheck| '|member?|
                                                   (LIST (LIST '|Boolean|)
                                                         (LIST
                                                          '|PositiveInteger|)
                                                         '$)
                                                   S))
                  (SEQ (LETT |j| 1 . #9#) G190
                       (COND ((|greater_SI| |j| |n|) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |a| |j| (QREFELT $ 35))
                                     (|spadConstant| $ 22) (QREFELT $ 37))
                           (SEQ
                            (LETT |u|
                                  (SPADCALL |wi| |m|
                                            (PROG1 (LETT #2# |j| . #9#)
                                              (|check_subtype| (> #2# 0)
                                                               '(|PositiveInteger|)
                                                               #2#))
                                            (|compiledLookupCheck|
                                             '|replaceKthElement|
                                             (LIST (LIST '|Union| '$ '#10#) '$
                                                   (LIST '|PositiveInteger|)
                                                   (LIST '|PositiveInteger|))
                                             S))
                                  . #9#)
                            (EXIT
                             (COND
                              ((QEQCAR |u| 0)
                               (SPADCALL |eq|
                                         (SPADCALL (QCDR |u|)
                                                   (|compiledLookupCheck|
                                                    '|lookup|
                                                    (LIST
                                                     (LIST '|PositiveInteger|)
                                                     '$)
                                                    S))
                                         (COND
                                          ((ODDP
                                            (SPADCALL |wi| |m|
                                                      (PROG1
                                                          (LETT #1# |j| . #9#)
                                                        (|check_subtype|
                                                         (> #1# 0)
                                                         '(|PositiveInteger|)
                                                         #1#))
                                                      (|compiledLookupCheck|
                                                       '|delta|
                                                       (LIST
                                                        (LIST
                                                         '|NonNegativeInteger|)
                                                        '$
                                                        (LIST
                                                         '|PositiveInteger|)
                                                        (LIST
                                                         '|PositiveInteger|))
                                                       S)))
                                           (SPADCALL
                                            (SPADCALL |a| |j| (QREFELT $ 35))
                                            (QREFELT $ 30)))
                                          ('T
                                           (SPADCALL |a| |j| (QREFELT $ 35))))
                                         (QREFELT $ 34))))))))))
                       (LETT |j| (|inc_SI| |j|) . #9#) (GO G190) G191
                       (EXIT NIL)))
                 ('T
                  (SEQ
                   (LETT |u|
                         (SPADCALL |wi| |m|
                                   (|compiledLookupCheck|
                                    '|incrementKthElement|
                                    (LIST (LIST '|Union| '$ '#10#) '$
                                          (LIST '|PositiveInteger|))
                                    S))
                         . #9#)
                   (EXIT
                    (COND
                     ((QEQCAR |u| 0)
                      (SPADCALL |eq|
                                (SPADCALL (QCDR |u|)
                                          (|compiledLookupCheck| '|lookup|
                                                                 (LIST
                                                                  (LIST
                                                                   '|PositiveInteger|)
                                                                  '$)
                                                                 S))
                                (|spadConstant| $ 24) (QREFELT $ 34))))))))
                (EXIT (SPADCALL M |i| |eq| (QREFELT $ 38))))
           (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
      (EXIT (CONS M |ww|)))))) 

(DEFUN |ASSOCEQ;uncouplingMatrices;MV;3| (|m| $)
  (PROG (#1=#:G172 |i| #2=#:G173 |mi| |v| |n|)
    (RETURN
     (SEQ (LETT |n| (ANROWS |m|) . #3=(|ASSOCEQ;uncouplingMatrices;MV;3|))
          (LETT |v| (MAKEARR1 |n| (SPADCALL 1 0 (QREFELT $ 42))) . #3#)
          (SPADCALL |v| 1 (LETT |mi| |m| . #3#) (QREFELT $ 43))
          (SEQ (LETT |i| 2 . #3#) G190
               (COND ((|greater_SI| |i| |n|) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |v| |i|
                           (LETT |mi|
                                 (SPADCALL
                                  (SPADCALL
                                   (CONS #'|ASSOCEQ;uncouplingMatrices;MV;3!0|
                                         (VECTOR $ (QREFELT $ 9)))
                                   |mi| (QREFELT $ 46))
                                  (SPADCALL |mi| |m| (QREFELT $ 47))
                                  (QREFELT $ 48))
                                 . #3#)
                           (QREFELT $ 43))))
               (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROGN
            (LETT #2# (GETREFV |n|) . #3#)
            (SEQ (LETT |i| 1 . #3#) (LETT #1# 0 . #3#) G190
                 (COND ((|greater_SI| |i| |n|) (GO G191)))
                 (SEQ (EXIT (SETELT #2# #1# (|ASSOCEQ;makeMatrix| |v| |i| $))))
                 (LETT #1#
                       (PROG1 (|inc_SI| #1#) (LETT |i| (|inc_SI| |i|) . #3#))
                       . #3#)
                 (GO G190) G191 (EXIT NIL))
            #2#)))))) 

(DEFUN |ASSOCEQ;uncouplingMatrices;MV;3!0| (|z1| $$)
  (PROG (|diff| $)
    (LETT |diff| (QREFELT $$ 1) . #1=(|ASSOCEQ;uncouplingMatrices;MV;3|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL |diff| |z1| (QREFELT $ 44)))))) 

(DEFUN |ASSOCEQ;makeeq| (|v| |m| |i| |n| $)
  (PROG (|j| #1=#:G179 #2=#:G178)
    (RETURN
     (SEQ
      (VECTOR (SPADCALL |v| |i| (QREFELT $ 50))
              (SPADCALL (|ASSOCEQ;makeop| (SPADCALL |m| |i| (QREFELT $ 15)) $)
                        (|spadConstant| $ 25) (QREFELT $ 51))
              (PROGN
               (LETT #2# NIL . #3=(|ASSOCEQ;makeeq|))
               (SEQ (LETT |j| 1 . #3#) G190
                    (COND ((|greater_SI| |j| |n|) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL |j| |i| (QREFELT $ 52))
                        (LETT #2# (CONS (SPADCALL |v| |j| (QREFELT $ 50)) #2#)
                              . #3#)))))
                    (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))
              (PROGN
               (LETT #1# NIL . #3#)
               (SEQ (LETT |j| 1 . #3#) G190
                    (COND ((|greater_SI| |j| |n|) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL |j| |i| (QREFELT $ 52))
                        (LETT #1#
                              (CONS
                               (|ASSOCEQ;makeop|
                                (SPADCALL |m| |j| (QREFELT $ 15)) $)
                               #1#)
                              . #3#)))))
                    (LETT |j| (|inc_SI| |j|) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #1#))))))))) 

(DEFUN |ASSOCEQ;associatedEquations;LPiR;5| (|op| |m| $)
  (PROG (|i| |ww| |s| |w| S #1=#:G184 |v| |u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL |op| |m| (QREFELT $ 55))
            . #2=(|ASSOCEQ;associatedEquations;LPiR;5|))
      (EXIT
       (COND ((QEQCAR |u| 1) (|ASSOCEQ;computeIt| |op| |m| 1 $))
             (#3='T
              (SEQ (LETT |v| (SPADCALL (QCDR |u|) (QREFELT $ 56)) . #2#)
                   (EXIT
                    (COND ((QEQCAR |v| 1) (|ASSOCEQ;computeIt| |op| |m| 2 $))
                          (#3#
                           (SEQ
                            (LETT S
                                  (|SetOfMIntegersInOneToN| |m|
                                                            (PROG1
                                                                (LETT #1#
                                                                      (SPADCALL
                                                                       |op|
                                                                       (QREFELT
                                                                        $ 21))
                                                                      . #2#)
                                                              (|check_subtype|
                                                               (> #1# 0)
                                                               '(|PositiveInteger|)
                                                               #1#)))
                                  . #2#)
                            (LETT |w|
                                  (SPADCALL
                                   (|compiledLookupCheck| '|enumerate|
                                                          (LIST
                                                           (LIST '|Vector| '$))
                                                          S))
                                  . #2#)
                            (LETT |s|
                                  (SPADCALL
                                   (|compiledLookupCheck| '|size|
                                                          (LIST
                                                           (LIST
                                                            '|NonNegativeInteger|))
                                                          S))
                                  . #2#)
                            (LETT |ww| (MAKEARR1 |s| NIL) . #2#)
                            (SEQ (LETT |i| 1 . #2#) G190
                                 (COND ((|greater_SI| |i| |s|) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SPADCALL |ww| |i|
                                             (SPADCALL
                                              (SPADCALL |w| |i|
                                                        (|compiledLookupCheck|
                                                         '|elt|
                                                         (LIST (|devaluate| S)
                                                               '$
                                                               (LIST
                                                                '|Integer|))
                                                         (|Vector| S)))
                                              (|compiledLookupCheck|
                                               '|elements|
                                               (LIST
                                                (LIST '|List|
                                                      (LIST
                                                       '|PositiveInteger|))
                                                '$)
                                               S))
                                             (QREFELT $ 33))))
                                 (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (|ASSOCEQ;makeeq| |ww| (QCDR |v|) 1 |s|
                              $)))))))))))))) 

(DEFUN |ASSOCEQ;computeIt| (|op| |m| |k| $)
  (PROG (#1=#:G197 #2=#:G199 |u| |i| |n| |a| |rec|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |rec| (SPADCALL |op| |m| (QREFELT $ 41))
              . #3=(|ASSOCEQ;computeIt|))
        (LETT |a| (SPADCALL (QCAR |rec|) (QREFELT $ 49)) . #3#)
        (LETT |n| (QVSIZE |a|) . #3#)
        (SEQ
         (EXIT
          (SEQ (LETT |i| |k| . #3#) G190 (COND ((> |i| |n|) (GO G191)))
               (SEQ
                (LETT |u|
                      (SPADCALL (SPADCALL |a| |i| (QREFELT $ 13))
                                (QREFELT $ 56))
                      . #3#)
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (PROGN
                    (LETT #1#
                          (PROGN
                           (LETT #2#
                                 (|ASSOCEQ;makeeq| (QCDR |rec|) (QCDR |u|) |i|
                                  |n| $)
                                 . #3#)
                           (GO #2#))
                          . #3#)
                    (GO #1#))))))
               (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (|error| "associatedEquations: full degenerate case"))))
      #2# (EXIT #2#))))) 

(DEFUN |ASSOCEQ;makeop| (|v| $)
  (PROG (|op| #1=#:G203 |i|)
    (RETURN
     (SEQ (LETT |op| (|spadConstant| $ 23) . #2=(|ASSOCEQ;makeop|))
          (SEQ (LETT |i| 1 . #2#) (LETT #1# (QVSIZE |v|) . #2#) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |op|
                       (SPADCALL |op|
                                 (SPADCALL (SPADCALL |v| |i| (QREFELT $ 35))
                                           |i| (QREFELT $ 59))
                                 (QREFELT $ 60))
                       . #2#)))
               (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |op|))))) 

(DECLAIM (NOTINLINE |AssociatedEquations;|)) 

(DEFUN |AssociatedEquations| (&REST #1=#:G204)
  (PROG ()
    (RETURN
     (PROG (#2=#:G205)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|AssociatedEquations|)
                                           '|domainEqualList|)
                . #3=(|AssociatedEquations|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |AssociatedEquations;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|AssociatedEquations|))))))))))) 

(DEFUN |AssociatedEquations;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|AssociatedEquations|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|AssociatedEquations| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 61) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1| '(|Field|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|AssociatedEquations| (LIST DV$1 DV$2)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 9 (SPADCALL (QREFELT $ 8)))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 58
                   (CONS
                    (|dispatchFunction| |ASSOCEQ;associatedEquations;LPiR;5|)
                    $)))))
      $)))) 

(MAKEPROP '|AssociatedEquations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . D)
              '|diff| (|Matrix| 6) (|Integer|) (|Vector| 10) (4 . |elt|)
              (|Vector| 6) (10 . |row|) (|List| 6) (16 . |parts|) (|List| 16)
              (21 . |matrix|) (|NonNegativeInteger|) (26 . |degree|)
              (31 . |Zero|) (35 . |Zero|) (39 . |One|) (43 . |One|)
              (47 . |leadingCoefficient|) (52 . |coefficient|)
              (|Union| $ '"failed") (58 . |exquo|) (64 . -) (|List| 40)
              (|Vector| 31) (69 . |setelt|) (76 . |setelt|) (83 . |elt|)
              (|Boolean|) (89 . ~=) (95 . |setRow!|)
              (|Record| (|:| |mat| 10) (|:| |vec| 32)) (|PositiveInteger|)
              |ASSOCEQ;associatedSystem;LPiR;2| (102 . |zero|) (108 . |setelt|)
              (115 . |elt|) (|Mapping| 6 6) (121 . |map|) (127 . *) (133 . +)
              |ASSOCEQ;uncouplingMatrices;MV;3| (139 . |elt|) (145 . -)
              (151 . ~=) (|Union| 10 '"failed")
              (|PrecomputedAssociatedEquations| 6 7)
              (157 . |firstUncouplingMatrix|) (163 . |inverse|)
              (|Record| (|:| |minor| 31) (|:| |eq| 7)
                        (|:| |minors| (|List| 31)) (|:| |ops| (|List| 7)))
              (168 . |associatedEquations|) (174 . |monomial|) (180 . +))
           '#(|uncouplingMatrices| 186 |associatedSystem| 191
              |associatedEquations| 197)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 60
                                                 '(0 7 0 8 2 12 10 0 11 13 2 10
                                                   14 0 11 15 1 14 16 0 17 1 10
                                                   0 18 19 1 7 20 0 21 0 6 0 22
                                                   0 7 0 23 0 6 0 24 0 7 0 25 1
                                                   7 6 0 26 2 7 6 0 20 27 2 6
                                                   28 0 0 29 1 6 0 0 30 3 32 31
                                                   0 11 31 33 3 14 6 0 11 6 34
                                                   2 14 6 0 11 35 2 6 36 0 0 37
                                                   3 10 0 0 11 14 38 2 10 0 20
                                                   20 42 3 12 10 0 11 10 43 2 7
                                                   6 0 6 44 2 10 0 45 0 46 2 10
                                                   0 0 0 47 2 10 0 0 0 48 2 32
                                                   31 0 11 50 2 7 0 0 0 51 2 20
                                                   36 0 0 52 2 54 53 7 40 55 1
                                                   10 28 0 56 2 0 57 7 40 58 2
                                                   7 0 6 20 59 2 7 0 0 0 60 1 0
                                                   12 10 49 2 0 39 7 40 41 2 1
                                                   57 7 40 58)))))
           '|lookupComplete|)) 
