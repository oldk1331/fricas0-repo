
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
      (LETT M (SPADCALL |s| |s| (|spadConstant| $ 22) (QREFELT $ 24)) . #9#)
      (LETT |m1|
            (PROG1 (LETT #7# (- |m| 1) . #9#)
              (|check_subtype| (> #7# 0) '(|PositiveInteger|) #7#))
            . #9#)
      (LETT |an| (SPADCALL |op| (QREFELT $ 27)) . #9#)
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
                                        (SPADCALL |op| |j| (QREFELT $ 28)) |an|
                                        (QREFELT $ 30))
                                       . #9#)
                                 (QCDR #4#)
                               (|check_union| (QEQCAR #4# 0) (QREFELT $ 6)
                                              #4#))
                             (QREFELT $ 31)))))
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
                          (QREFELT $ 34))
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
                                   (|spadConstant| $ 25) (QREFELT $ 35))))))
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
                          ((SPADCALL (SPADCALL |a| |j| (QREFELT $ 36))
                                     (|spadConstant| $ 22) (QREFELT $ 38))
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
                                            (SPADCALL |a| |j| (QREFELT $ 36))
                                            (QREFELT $ 31)))
                                          ('T
                                           (SPADCALL |a| |j| (QREFELT $ 36))))
                                         (QREFELT $ 35))))))))))
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
                                (|spadConstant| $ 25) (QREFELT $ 35))))))))
                (EXIT (SPADCALL M |i| |eq| (QREFELT $ 39))))
           (LETT |i| (|inc_SI| |i|) . #9#) (GO G190) G191 (EXIT NIL))
      (EXIT (CONS M |ww|)))))) 

(DEFUN |ASSOCEQ;uncouplingMatrices;MV;3| (|m| $)
  (PROG (#1=#:G172 |i| #2=#:G173 |mi| |v| |n|)
    (RETURN
     (SEQ (LETT |n| (QVSIZE |m|) . #3=(|ASSOCEQ;uncouplingMatrices;MV;3|))
          (LETT |v| (MAKEARR1 |n| (SPADCALL 1 0 (QREFELT $ 43))) . #3#)
          (SPADCALL |v| 1 (LETT |mi| |m| . #3#) (QREFELT $ 44))
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
                                   |mi| (QREFELT $ 47))
                                  (SPADCALL |mi| |m| (QREFELT $ 48))
                                  (QREFELT $ 49))
                                 . #3#)
                           (QREFELT $ 44))))
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
    (RETURN (PROGN (SPADCALL |diff| |z1| (QREFELT $ 45)))))) 

(DEFUN |ASSOCEQ;makeeq| (|v| |m| |i| |n| $)
  (PROG (|j| #1=#:G179 #2=#:G178)
    (RETURN
     (SEQ
      (VECTOR (SPADCALL |v| |i| (QREFELT $ 51))
              (SPADCALL (|ASSOCEQ;makeop| (SPADCALL |m| |i| (QREFELT $ 15)) $)
                        (|spadConstant| $ 26) (QREFELT $ 52))
              (PROGN
               (LETT #2# NIL . #3=(|ASSOCEQ;makeeq|))
               (SEQ (LETT |j| 1 . #3#) G190
                    (COND ((|greater_SI| |j| |n|) (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL |j| |i| (QREFELT $ 53))
                        (LETT #2# (CONS (SPADCALL |v| |j| (QREFELT $ 51)) #2#)
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
                       ((SPADCALL |j| |i| (QREFELT $ 53))
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
      (LETT |u| (SPADCALL |op| |m| (QREFELT $ 56))
            . #2=(|ASSOCEQ;associatedEquations;LPiR;5|))
      (EXIT
       (COND ((QEQCAR |u| 1) (|ASSOCEQ;computeIt| |op| |m| 1 $))
             (#3='T
              (SEQ (LETT |v| (SPADCALL (QCDR |u|) (QREFELT $ 57)) . #2#)
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
                                             (QREFELT $ 34))))
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
        (LETT |rec| (SPADCALL |op| |m| (QREFELT $ 42))
              . #3=(|ASSOCEQ;computeIt|))
        (LETT |a| (SPADCALL (QCAR |rec|) (QREFELT $ 50)) . #3#)
        (LETT |n| (QVSIZE |a|) . #3#)
        (SEQ
         (EXIT
          (SEQ (LETT |i| |k| . #3#) G190 (COND ((> |i| |n|) (GO G191)))
               (SEQ
                (LETT |u|
                      (SPADCALL (SPADCALL |a| |i| (QREFELT $ 13))
                                (QREFELT $ 57))
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
                                 (SPADCALL (SPADCALL |v| |i| (QREFELT $ 36))
                                           |i| (QREFELT $ 60))
                                 (QREFELT $ 61))
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
      (LETT $ (GETREFV 62) . #1#)
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
         (QSETREFV $ 59
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
              (31 . |Zero|) (35 . |Zero|) (39 . |new|) (46 . |One|)
              (50 . |One|) (54 . |leadingCoefficient|) (59 . |coefficient|)
              (|Union| $ '"failed") (65 . |exquo|) (71 . -) (|List| 41)
              (|Vector| 32) (76 . |setelt|) (83 . |setelt|) (90 . |elt|)
              (|Boolean|) (96 . ~=) (102 . |setRow!|)
              (|Record| (|:| |mat| 10) (|:| |vec| 33)) (|PositiveInteger|)
              |ASSOCEQ;associatedSystem;LPiR;2| (109 . |zero|) (115 . |setelt|)
              (122 . |elt|) (|Mapping| 6 6) (128 . |map|) (134 . *) (140 . +)
              |ASSOCEQ;uncouplingMatrices;MV;3| (146 . |elt|) (152 . -)
              (158 . ~=) (|Union| 10 '"failed")
              (|PrecomputedAssociatedEquations| 6 7)
              (164 . |firstUncouplingMatrix|) (170 . |inverse|)
              (|Record| (|:| |minor| 32) (|:| |eq| 7)
                        (|:| |minors| (|List| 32)) (|:| |ops| (|List| 7)))
              (175 . |associatedEquations|) (181 . |monomial|) (187 . +))
           '#(|uncouplingMatrices| 193 |associatedSystem| 198
              |associatedEquations| 204)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 61
                                                 '(0 7 0 8 2 12 10 0 11 13 2 10
                                                   14 0 11 15 1 14 16 0 17 1 10
                                                   0 18 19 1 7 20 0 21 0 6 0 22
                                                   0 7 0 23 3 10 0 20 20 6 24 0
                                                   6 0 25 0 7 0 26 1 7 6 0 27 2
                                                   7 6 0 20 28 2 6 29 0 0 30 1
                                                   6 0 0 31 3 33 32 0 11 32 34
                                                   3 14 6 0 11 6 35 2 14 6 0 11
                                                   36 2 6 37 0 0 38 3 10 0 0 11
                                                   14 39 2 10 0 20 20 43 3 12
                                                   10 0 11 10 44 2 7 6 0 6 45 2
                                                   10 0 46 0 47 2 10 0 0 0 48 2
                                                   10 0 0 0 49 2 33 32 0 11 51
                                                   2 7 0 0 0 52 2 20 37 0 0 53
                                                   2 55 54 7 41 56 1 10 29 0 57
                                                   2 0 58 7 41 59 2 7 0 6 20 60
                                                   2 7 0 0 0 61 1 0 12 10 50 2
                                                   0 40 7 41 42 2 1 58 7 41
                                                   59)))))
           '|lookupComplete|)) 
