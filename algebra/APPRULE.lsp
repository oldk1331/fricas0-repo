
(/VERSIONCHECK 2) 

(DEFUN |APPRULE;applist| (|lrule| |arglist| $)
  (PROG (#1=#:G139 |arg| #2=#:G138)
    (RETURN
     (SEQ
      (PROGN
       (LETT #2# NIL . #3=(|APPRULE;applist|))
       (SEQ (LETT |arg| NIL . #3#) (LETT #1# |arglist| . #3#) G190
            (COND
             ((OR (ATOM #1#) (PROGN (LETT |arg| (CAR #1#) . #3#) NIL))
              (GO G191)))
            (SEQ
             (EXIT
              (LETT #2# (CONS (|APPRULE;app| |lrule| |arg| $) #2#) . #3#)))
            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
            (EXIT (NREVERSE #2#)))))))) 

(DEFUN |APPRULE;splitRules| (|l| $)
  (PROG (|lv| |lk| |ncr| |u| #1=#:G149 |r|)
    (RETURN
     (SEQ (LETT |ncr| NIL . #2=(|APPRULE;splitRules|)) (LETT |lk| NIL . #2#)
          (LETT |lv| NIL . #2#)
          (SEQ (LETT |r| NIL . #2#) (LETT #1# |l| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |u| (SPADCALL |r| (QREFELT $ 11)) . #2#)
                    (EXIT
                     (COND ((QEQCAR |u| 1) (LETT |ncr| (CONS |r| |ncr|) . #2#))
                           ('T
                            (SEQ
                             (LETT |lk|
                                   (CONS
                                    (SPADCALL
                                     (SPADCALL (QCDR |u|) (QREFELT $ 13))
                                     (QREFELT $ 15))
                                    |lk|)
                                   . #2#)
                             (EXIT
                              (LETT |lv|
                                    (CONS (SPADCALL (QCDR |u|) (QREFELT $ 16))
                                          |lv|)
                                    . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |lk| |lv| |ncr|)))))) 

(DEFUN |APPRULE;applyRules;L2F;3| (|l| |s| $)
  (PROG (#1=#:G154 |new| |rec|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |rec| (|APPRULE;splitRules| |l| $)
              . #2=(|APPRULE;applyRules;L2F;3|))
        (EXIT
         (SEQ G190 NIL
              (SEQ
               (LETT |new|
                     (|APPRULE;localApply| (QVELT |rec| 0) (QVELT |rec| 1)
                      (QVELT |rec| 2) |s| 1 $)
                     . #2#)
               (EXIT
                (COND
                 ((SPADCALL |new| |s| (QREFELT $ 18))
                  (PROGN (LETT #1# |s| . #2#) (GO #1#)))
                 ('T (LETT |s| |new| . #2#)))))
              NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |APPRULE;applyRules;LFPiF;4| (|l| |s| |n| $)
  (PROG (|rec|)
    (RETURN
     (SEQ
      (LETT |rec| (|APPRULE;splitRules| |l| $) |APPRULE;applyRules;LFPiF;4|)
      (EXIT
       (|APPRULE;localApply| (QVELT |rec| 0) (QVELT |rec| 1) (QVELT |rec| 2)
        |s| |n| $)))))) 

(DEFUN |APPRULE;localApply| (|lk| |lv| |lrule| |subject| |n| $)
  (PROG (#1=#:G163 |k| #2=#:G164 |v| |i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| 1 . #3=(|APPRULE;localApply|)) G190
           (COND ((|greater_SI| |i| |n|) (GO G191)))
           (SEQ
            (SEQ (LETT |v| NIL . #3#) (LETT #2# |lv| . #3#)
                 (LETT |k| NIL . #3#) (LETT #1# |lk| . #3#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL)
                       (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |subject| (SPADCALL |subject| |k| |v| (QREFELT $ 23))
                         . #3#)))
                 (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
                 (GO G190) G191 (EXIT NIL))
            (EXIT (LETT |subject| (|APPRULE;app| |lrule| |subject| $) . #3#)))
           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
      (EXIT |subject|))))) 

(DEFUN |APPRULE;rewrite| (|f| |res| |l| $)
  (PROG (|lv| |lk| #1=#:G170 |rec|)
    (RETURN
     (SEQ (LETT |lk| NIL . #2=(|APPRULE;rewrite|)) (LETT |lv| NIL . #2#)
          (SEQ (LETT |rec| NIL . #2#)
               (LETT #1# (SPADCALL |res| (QREFELT $ 27)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |lk| (CONS (SPADCALL (QCAR |rec|) (QREFELT $ 30)) |lk|)
                      . #2#)
                (EXIT (LETT |lv| (CONS (QCDR |rec|) |lv|) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (SPADCALL |f| |lk| |lv| (QREFELT $ 33)) |l|
                     (QREFELT $ 35))))))) 

(DEFUN |APPRULE;localUnquote;FLF;7| (|f| |l| $)
  (COND ((NULL |l|) |f|) ('T (SPADCALL |f| |l| (QREFELT $ 36))))) 

(PUT '|APPRULE;localUnquote;FLF;8| '|SPADreplace| '(XLAM (|f| |l|) |f|)) 

(DEFUN |APPRULE;localUnquote;FLF;8| (|f| |l| $) |f|) 

(DEFUN |APPRULE;isitwithpred| (|subject| |pat| |vars| |bad| $)
  (PROG (#1=#:G178 #2=#:G186 |v| #3=#:G175 |u|)
    (RETURN
     (SEQ
      (COND
       ((OR
         (SPADCALL
          (LETT |u|
                (SPADCALL |subject| |pat| (SPADCALL (QREFELT $ 37))
                          (QREFELT $ 40))
                . #4=(|APPRULE;isitwithpred|))
          (QREFELT $ 41))
         (PROG2 (LETT #3# (SPADCALL |u| |pat| (QREFELT $ 43)) . #4#)
             (QCDR #3#)
           (|check_union| (QEQCAR #3# 0) (|Boolean|) #3#)))
        |u|)
       ((SPADCALL |u| |bad| (QREFELT $ 45)) (SPADCALL (QREFELT $ 46)))
       ('T
        (SEQ
         (SEQ (LETT |v| NIL . #4#) (LETT #2# |vars| . #4#) G190
              (COND
               ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #4#) NIL))
                (GO G191)))
              (SEQ
               (EXIT
                (SPADCALL |v|
                          (PROG2
                              (LETT #1# (SPADCALL |v| |u| (QREFELT $ 48))
                                    . #4#)
                              (QCDR #1#)
                            (|check_union| (QEQCAR #1# 0) (QREFELT $ 8) #1#))
                          (QREFELT $ 50))))
              (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
         (EXIT
          (|APPRULE;isitwithpred| |subject| |pat| |vars| (CONS |u| |bad|)
           $))))))))) 

(DEFUN |APPRULE;isit| (|subject| |pat| $)
  (PROG (#1=#:G191 |l| |v|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |pat| (QREFELT $ 51))
        (SEQ
         (SEQ (LETT |v| NIL . #2=(|APPRULE;isit|))
              (LETT #1# (LETT |l| (SPADCALL |pat| (QREFELT $ 52)) . #2#) . #2#)
              G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #2#) NIL))
                (GO G191)))
              (SEQ (EXIT (SPADCALL |v| (QREFELT $ 53))))
              (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
         (EXIT (|APPRULE;isitwithpred| |subject| |pat| |l| NIL $))))
       ('T
        (SPADCALL |subject| |pat| (SPADCALL (QREFELT $ 37))
                  (QREFELT $ 40)))))))) 

(DEFUN |APPRULE;app| (|lrule| |subject| $)
  (PROG (#1=#:G216 #2=#:G213 #3=#:G211 |f| |ee| |e| #4=#:G204 #5=#:G203
         #6=#:G205 #7=#:G225 #8=#:G128 |l| #9=#:G201 #10=#:G200 #11=#:G202
         #12=#:G224 #13=#:G127 |k| #14=#:G193 #15=#:G222 |u| #16=#:G223 |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |r| NIL . #17=(|APPRULE;app|)) (LETT #16# |lrule| . #17#)
               G190
               (COND
                ((OR (ATOM #16#) (PROGN (LETT |r| (CAR #16#) . #17#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL
                    (SPADCALL
                     (LETT |u|
                           (|APPRULE;isit| |subject|
                            (SPADCALL |r| (QREFELT $ 54)) $)
                           . #17#)
                     (QREFELT $ 41)))
                   (PROGN
                    (LETT #14#
                          (PROGN
                           (LETT #15#
                                 (|APPRULE;rewrite|
                                  (SPADCALL |r| (QREFELT $ 55)) |u|
                                  (SPADCALL |r| (QREFELT $ 56)) $)
                                 . #17#)
                           (GO #15#))
                          . #17#)
                    (GO #14#))))))
               (LETT #16# (CDR #16#) . #17#) (GO G190) G191 (EXIT NIL)))
         #14# (EXIT #14#))
        (LETT |k| (SPADCALL |subject| (QREFELT $ 58)) . #17#)
        (EXIT
         (COND
          ((QEQCAR |k| 0)
           (SPADCALL (SPADCALL (QCDR |k|) (QREFELT $ 60))
                     (|APPRULE;applist| |lrule|
                      (SPADCALL (QCDR |k|) (QREFELT $ 62)) $)
                     (QREFELT $ 63)))
          (#18='T
           (SEQ (LETT |l| (SPADCALL |subject| (QREFELT $ 65)) . #17#)
                (EXIT
                 (COND
                  ((QEQCAR |l| 0)
                   (PROGN
                    (LETT #9# NIL . #17#)
                    (SEQ (LETT #13# NIL . #17#)
                         (LETT #12# (|APPRULE;applist| |lrule| (QCDR |l|) $)
                               . #17#)
                         G190
                         (COND
                          ((OR (ATOM #12#)
                               (PROGN (LETT #13# (CAR #12#) . #17#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #11# #13# . #17#)
                            (COND
                             (#9#
                              (LETT #10# (SPADCALL #10# #11# (QREFELT $ 66))
                                    . #17#))
                             ('T
                              (PROGN
                               (LETT #10# #11# . #17#)
                               (LETT #9# 'T . #17#)))))))
                         (LETT #12# (CDR #12#) . #17#) (GO G190) G191
                         (EXIT NIL))
                    (COND (#9# #10#) (#18# (|spadConstant| $ 67)))))
                  (#18#
                   (SEQ (LETT |l| (SPADCALL |subject| (QREFELT $ 68)) . #17#)
                        (EXIT
                         (COND
                          ((QEQCAR |l| 0)
                           (PROGN
                            (LETT #4# NIL . #17#)
                            (SEQ (LETT #8# NIL . #17#)
                                 (LETT #7#
                                       (|APPRULE;applist| |lrule| (QCDR |l|) $)
                                       . #17#)
                                 G190
                                 (COND
                                  ((OR (ATOM #7#)
                                       (PROGN (LETT #8# (CAR #7#) . #17#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #6# #8# . #17#)
                                    (COND
                                     (#4#
                                      (LETT #5#
                                            (SPADCALL #5# #6# (QREFELT $ 69))
                                            . #17#))
                                     ('T
                                      (PROGN
                                       (LETT #5# #6# . #17#)
                                       (LETT #4# 'T . #17#)))))))
                                 (LETT #7# (CDR #7#) . #17#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#4# #5#) (#18# (|spadConstant| $ 70)))))
                          (#18#
                           (SEQ
                            (LETT |e| (SPADCALL |subject| (QREFELT $ 73))
                                  . #17#)
                            (EXIT
                             (COND
                              ((QEQCAR |e| 0)
                               (SEQ (LETT |ee| (QCDR |e|) . #17#)
                                    (LETT |f|
                                          (|APPRULE;app| |lrule| (QCAR |ee|) $)
                                          . #17#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL (QCDR |ee|) (QREFELT $ 75))
                                       (SPADCALL |f|
                                                 (PROG1
                                                     (LETT #3# (QCDR |ee|)
                                                           . #17#)
                                                   (|check_subtype| (>= #3# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    #3#))
                                                 (QREFELT $ 77)))
                                      (#18#
                                       (SPADCALL
                                        (PROG2
                                            (LETT #2#
                                                  (SPADCALL |f| (QREFELT $ 79))
                                                  . #17#)
                                            (QCDR #2#)
                                          (|check_union| (QEQCAR #2# 0)
                                                         (QREFELT $ 8) #2#))
                                        (PROG1
                                            (LETT #1# (- (QCDR |ee|)) . #17#)
                                          (|check_subtype| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           #1#))
                                        (QREFELT $ 77)))))))
                              (#18# |subject|)))))))))))))))))
      #15# (EXIT #15#))))) 

(DEFUN |ApplyRules| (&REST #1=#:G226)
  (PROG ()
    (RETURN
     (PROG (#2=#:G227)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ApplyRules|)
                                           '|domainEqualList|)
                . #3=(|ApplyRules|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ApplyRules;|) #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|ApplyRules|))))))))))) 

(DEFUN |ApplyRules;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ApplyRules|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|ApplyRules| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 80) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ApplyRules| (LIST DV$1 DV$2 DV$3)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#2| '(|ConvertibleTo| (|InputForm|)))
        (QSETREFV $ 35
                  (CONS (|dispatchFunction| |APPRULE;localUnquote;FLF;7|) $)))
       ('T
        (QSETREFV $ 35
                  (CONS (|dispatchFunction| |APPRULE;localUnquote;FLF;8|) $))))
      $)))) 

(MAKEPROP '|ApplyRules| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Union| 12 '"failed") (|RewriteRule| 6 7 8)
              (0 . |retractIfCan|) (|Equation| 8) (5 . |lhs|) (|Kernel| $)
              (10 . |retract|) (15 . |rhs|) (|Boolean|) (20 . =) (|List| 10)
              |APPRULE;applyRules;L2F;3| (|PositiveInteger|)
              |APPRULE;applyRules;LFPiF;4| (26 . |eval|)
              (|Record| (|:| |key| 28) (|:| |entry| 8)) (|List| 24)
              (|PatternMatchResult| 6 8) (33 . |destruct|) (|Symbol|)
              (|Kernel| 8) (38 . |kernel|) (|List| 14) (|List| $) (43 . |eval|)
              (|List| 28) (50 . |localUnquote|) (56 . |eval|) (62 . |new|)
              (|PatternMatchResult| 6 $) (|Pattern| 6) (66 . |patternMatch|)
              (73 . |failed?|) (|Union| 17 '"failed") (78 . |satisfy?|)
              (|List| 26) (84 . |member?|) (90 . |failed|)
              (|Union| 8 '"failed") (94 . |getMatch|) (|PatternFunctions1| 6 8)
              (100 . |addBadValue|) (106 . |hasTopPredicate?|)
              (111 . |variables|) (116 . |resetBadValues|) (121 . |pattern|)
              (126 . |rhs|) (131 . |quotedOperators|) (|Union| 14 '"failed")
              (136 . |retractIfCan|) (|BasicOperator|) (141 . |operator|)
              (|List| 8) (146 . |argument|) (151 . |elt|)
              (|Union| 32 '#1="failed") (157 . |isPlus|) (162 . +)
              (168 . |Zero|) (172 . |isTimes|) (177 . *) (183 . |One|)
              (|Record| (|:| |val| $) (|:| |exponent| 74)) (|Union| 71 '#1#)
              (187 . |isPower|) (|Integer|) (192 . |positive?|)
              (|NonNegativeInteger|) (197 . ^) (|Union| $ '"failed")
              (203 . |recip|))
           '#(|localUnquote| 208 |applyRules| 214) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 79
                                                 '(1 10 9 0 11 1 12 8 0 13 1 8
                                                   14 0 15 1 12 8 0 16 2 8 17 0
                                                   0 18 3 8 0 0 14 0 23 1 26 25
                                                   0 27 1 29 0 28 30 3 8 0 0 31
                                                   32 33 2 0 8 8 34 35 2 8 0 0
                                                   34 36 0 26 0 37 3 8 38 0 39
                                                   38 40 1 26 17 0 41 2 26 42 0
                                                   39 43 2 44 17 26 0 45 0 26 0
                                                   46 2 26 47 39 0 48 2 49 39
                                                   39 8 50 1 39 17 0 51 1 39 32
                                                   0 52 1 39 0 0 53 1 10 39 0
                                                   54 1 10 8 0 55 1 10 34 0 56
                                                   1 8 57 0 58 1 29 59 0 60 1
                                                   29 61 0 62 2 8 0 59 32 63 1
                                                   8 64 0 65 2 8 0 0 0 66 0 8 0
                                                   67 1 8 64 0 68 2 8 0 0 0 69
                                                   0 8 0 70 1 8 72 0 73 1 74 17
                                                   0 75 2 8 0 0 76 77 1 8 78 0
                                                   79 2 0 8 8 34 35 2 0 8 19 8
                                                   20 3 0 8 19 8 21 22)))))
           '|lookupComplete|)) 
