
(SDEFUN |APPRULE;applist|
        ((|lrule| |List| (|RewriteRule| |Base| R F)) (|arglist| |List| F)
         ($ |List| F))
        (SPROG ((#1=#:G115 NIL) (|arg| NIL) (#2=#:G114 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|APPRULE;applist|))
                 (SEQ (LETT |arg| NIL . #3#) (LETT #1# |arglist| . #3#) G190
                      (COND
                       ((OR (ATOM #1#)
                            (PROGN (LETT |arg| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|APPRULE;app| |lrule| |arg| $) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |APPRULE;splitRules|
        ((|l| |List| (|RewriteRule| |Base| R F))
         ($ |Record| (|:| |lker| (|List| (|Kernel| F))) (|:| |lval| (|List| F))
          (|:| |rl| (|List| (|RewriteRule| |Base| R F)))))
        (SPROG
         ((|lv| (|List| F)) (|lk| (|List| (|Kernel| F)))
          (|ncr| (|List| (|RewriteRule| |Base| R F)))
          (|u| (|Union| (|Equation| F) "failed")) (#1=#:G125 NIL) (|r| NIL))
         (SEQ (LETT |ncr| NIL . #2=(|APPRULE;splitRules|))
              (LETT |lk| NIL . #2#) (LETT |lv| NIL . #2#)
              (SEQ (LETT |r| NIL . #2#) (LETT #1# |l| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |u| (SPADCALL |r| (QREFELT $ 11)) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |u| 1) (LETT |ncr| (CONS |r| |ncr|) . #2#))
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
              (EXIT (VECTOR |lk| |lv| |ncr|))))) 

(SDEFUN |APPRULE;applyRules;L2F;3|
        ((|l| |List| (|RewriteRule| |Base| R F)) (|s| F) ($ F))
        (SPROG
         ((#1=#:G130 NIL) (|new| (F))
          (|rec|
           (|Record| (|:| |lker| (|List| (|Kernel| F))) (|:| |lval| (|List| F))
                     (|:| |rl| (|List| (|RewriteRule| |Base| R F))))))
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
                     ((SPADCALL |new| |s| (QREFELT $ 20))
                      (PROGN (LETT #1# |s| . #2#) (GO #1#)))
                     ('T (LETT |s| |new| . #2#)))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #1# (EXIT #1#)))) 

(SDEFUN |APPRULE;applyRules;LFPiF;4|
        ((|l| |List| (|RewriteRule| |Base| R F)) (|s| F)
         (|n| |PositiveInteger|) ($ F))
        (SPROG
         ((|rec|
           (|Record| (|:| |lker| (|List| (|Kernel| F))) (|:| |lval| (|List| F))
                     (|:| |rl| (|List| (|RewriteRule| |Base| R F))))))
         (SEQ
          (LETT |rec| (|APPRULE;splitRules| |l| $)
                |APPRULE;applyRules;LFPiF;4|)
          (EXIT
           (|APPRULE;localApply| (QVELT |rec| 0) (QVELT |rec| 1)
            (QVELT |rec| 2) |s| |n| $))))) 

(SDEFUN |APPRULE;localApply|
        ((|lk| |List| (|Kernel| F)) (|lv| |List| F)
         (|lrule| |List| (|RewriteRule| |Base| R F)) (|subject| F)
         (|n| |PositiveInteger|) ($ F))
        (SPROG ((#1=#:G139 NIL) (|k| NIL) (#2=#:G140 NIL) (|v| NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1 . #3=(|APPRULE;localApply|)) G190
                     (COND ((|greater_SI| |i| |n|) (GO G191)))
                     (SEQ
                      (SEQ (LETT |v| NIL . #3#) (LETT #2# |lv| . #3#)
                           (LETT |k| NIL . #3#) (LETT #1# |lk| . #3#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |k| (CAR #1#) . #3#) NIL)
                                 (ATOM #2#)
                                 (PROGN (LETT |v| (CAR #2#) . #3#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |subject|
                                   (SPADCALL |subject| |k| |v| (QREFELT $ 25))
                                   . #3#)))
                           (LETT #1#
                                 (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#))
                                 . #3#)
                           (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (LETT |subject| (|APPRULE;app| |lrule| |subject| $)
                             . #3#)))
                     (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
                (EXIT |subject|)))) 

(SDEFUN |APPRULE;rewrite|
        ((|f| F) (|res| |PatternMatchResult| |Base| F) (|l| |List| (|Symbol|))
         ($ F))
        (SPROG
         ((|lv| (|List| F)) (|lk| (|List| (|Kernel| F))) (#1=#:G146 NIL)
          (|rec| NIL))
         (SEQ (LETT |lk| NIL . #2=(|APPRULE;rewrite|)) (LETT |lv| NIL . #2#)
              (SEQ (LETT |rec| NIL . #2#)
                   (LETT #1# (SPADCALL |res| (QREFELT $ 28)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |lk|
                          (CONS (SPADCALL (QCAR |rec|) (QREFELT $ 31)) |lk|)
                          . #2#)
                    (EXIT (LETT |lv| (CONS (QCDR |rec|) |lv|) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |f| |lk| |lv| (QREFELT $ 34)) |l|
                         (QREFELT $ 36)))))) 

(SDEFUN |APPRULE;localUnquote;FLF;7| ((|f| F) (|l| |List| (|Symbol|)) ($ F))
        (COND ((NULL |l|) |f|) ('T (SPADCALL |f| |l| (QREFELT $ 37))))) 

(PUT '|APPRULE;localUnquote;FLF;8| '|SPADreplace| '(XLAM (|f| |l|) |f|)) 

(SDEFUN |APPRULE;localUnquote;FLF;8| ((|f| F) (|l| |List| (|Symbol|)) ($ F))
        |f|) 

(SDEFUN |APPRULE;isitwithpred|
        ((|subject| F) (|pat| |Pattern| |Base|)
         (|vars| |List| (|Pattern| |Base|))
         (|bad| |List| (|PatternMatchResult| |Base| F))
         ($ |PatternMatchResult| |Base| F))
        (SPROG
         ((#1=#:G154 NIL) (#2=#:G162 NIL) (|v| NIL) (#3=#:G151 NIL)
          (|u| (|PatternMatchResult| |Base| F)))
         (SEQ
          (COND
           ((OR
             (SPADCALL
              (LETT |u|
                    (SPADCALL |subject| |pat| (SPADCALL (QREFELT $ 18))
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
                                (|check_union| (QEQCAR #1# 0) (QREFELT $ 8)
                                               #1#))
                              (QREFELT $ 50))))
                  (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
             (EXIT
              (|APPRULE;isitwithpred| |subject| |pat| |vars| (CONS |u| |bad|)
               $)))))))) 

(SDEFUN |APPRULE;isit|
        ((|subject| F) (|pat| |Pattern| |Base|)
         ($ |PatternMatchResult| |Base| F))
        (SPROG ((#1=#:G167 NIL) (|l| (|List| (|Pattern| |Base|))) (|v| NIL))
               (SEQ
                (COND
                 ((SPADCALL |pat| (QREFELT $ 51))
                  (SEQ
                   (SEQ (LETT |v| NIL . #2=(|APPRULE;isit|))
                        (LETT #1#
                              (LETT |l| (SPADCALL |pat| (QREFELT $ 52)) . #2#)
                              . #2#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |v| (CAR #1#) . #2#) NIL))
                          (GO G191)))
                        (SEQ (EXIT (SPADCALL |v| (QREFELT $ 53))))
                        (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                   (EXIT (|APPRULE;isitwithpred| |subject| |pat| |l| NIL $))))
                 ('T
                  (SPADCALL |subject| |pat| (SPADCALL (QREFELT $ 18))
                            (QREFELT $ 40))))))) 

(SDEFUN |APPRULE;app|
        ((|lrule| |List| (|RewriteRule| |Base| R F)) (|subject| F) ($ F))
        (SPROG
         ((#1=#:G192 NIL) (#2=#:G189 NIL) (#3=#:G187 NIL) (|f| (F))
          (|ee| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|))))
          (|e|
           (|Union| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|)))
                    #4="failed"))
          (#5=#:G180 NIL) (#6=#:G179 (F)) (#7=#:G181 (F)) (#8=#:G201 NIL)
          (#9=#:G104 NIL) (|l| (|Union| (|List| F) #4#)) (#10=#:G177 NIL)
          (#11=#:G176 (F)) (#12=#:G178 (F)) (#13=#:G200 NIL) (#14=#:G103 NIL)
          (|k| (|Union| (|Kernel| F) "failed")) (#15=#:G169 NIL)
          (#16=#:G198 NIL) (|u| (|PatternMatchResult| |Base| F))
          (#17=#:G199 NIL) (|r| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (EXIT
              (SEQ (LETT |r| NIL . #18=(|APPRULE;app|))
                   (LETT #17# |lrule| . #18#) G190
                   (COND
                    ((OR (ATOM #17#) (PROGN (LETT |r| (CAR #17#) . #18#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL
                        (SPADCALL
                         (LETT |u|
                               (|APPRULE;isit| |subject|
                                (SPADCALL |r| (QREFELT $ 54)) $)
                               . #18#)
                         (QREFELT $ 41)))
                       (PROGN
                        (LETT #15#
                              (PROGN
                               (LETT #16#
                                     (|APPRULE;rewrite|
                                      (SPADCALL |r| (QREFELT $ 55)) |u|
                                      (SPADCALL |r| (QREFELT $ 56)) $)
                                     . #18#)
                               (GO #16#))
                              . #18#)
                        (GO #15#))))))
                   (LETT #17# (CDR #17#) . #18#) (GO G190) G191 (EXIT NIL)))
             #15# (EXIT #15#))
            (LETT |k| (SPADCALL |subject| (QREFELT $ 58)) . #18#)
            (EXIT
             (COND
              ((QEQCAR |k| 0)
               (SPADCALL (SPADCALL (QCDR |k|) (QREFELT $ 60))
                         (|APPRULE;applist| |lrule|
                          (SPADCALL (QCDR |k|) (QREFELT $ 62)) $)
                         (QREFELT $ 63)))
              (#19='T
               (SEQ (LETT |l| (SPADCALL |subject| (QREFELT $ 65)) . #18#)
                    (EXIT
                     (COND
                      ((QEQCAR |l| 0)
                       (PROGN
                        (LETT #10# NIL . #18#)
                        (SEQ (LETT #14# NIL . #18#)
                             (LETT #13#
                                   (|APPRULE;applist| |lrule| (QCDR |l|) $)
                                   . #18#)
                             G190
                             (COND
                              ((OR (ATOM #13#)
                                   (PROGN (LETT #14# (CAR #13#) . #18#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT #12# #14# . #18#)
                                (COND
                                 (#10#
                                  (LETT #11#
                                        (SPADCALL #11# #12# (QREFELT $ 66))
                                        . #18#))
                                 ('T
                                  (PROGN
                                   (LETT #11# #12# . #18#)
                                   (LETT #10# 'T . #18#)))))))
                             (LETT #13# (CDR #13#) . #18#) (GO G190) G191
                             (EXIT NIL))
                        (COND (#10# #11#) (#19# (|spadConstant| $ 67)))))
                      (#19#
                       (SEQ
                        (LETT |l| (SPADCALL |subject| (QREFELT $ 68)) . #18#)
                        (EXIT
                         (COND
                          ((QEQCAR |l| 0)
                           (PROGN
                            (LETT #5# NIL . #18#)
                            (SEQ (LETT #9# NIL . #18#)
                                 (LETT #8#
                                       (|APPRULE;applist| |lrule| (QCDR |l|) $)
                                       . #18#)
                                 G190
                                 (COND
                                  ((OR (ATOM #8#)
                                       (PROGN (LETT #9# (CAR #8#) . #18#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #7# #9# . #18#)
                                    (COND
                                     (#5#
                                      (LETT #6#
                                            (SPADCALL #6# #7# (QREFELT $ 69))
                                            . #18#))
                                     ('T
                                      (PROGN
                                       (LETT #6# #7# . #18#)
                                       (LETT #5# 'T . #18#)))))))
                                 (LETT #8# (CDR #8#) . #18#) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#5# #6#) (#19# (|spadConstant| $ 70)))))
                          (#19#
                           (SEQ
                            (LETT |e| (SPADCALL |subject| (QREFELT $ 73))
                                  . #18#)
                            (EXIT
                             (COND
                              ((QEQCAR |e| 0)
                               (SEQ (LETT |ee| (QCDR |e|) . #18#)
                                    (LETT |f|
                                          (|APPRULE;app| |lrule| (QCAR |ee|) $)
                                          . #18#)
                                    (EXIT
                                     (COND
                                      ((SPADCALL (QCDR |ee|) (QREFELT $ 75))
                                       (SPADCALL |f|
                                                 (PROG1
                                                     (LETT #3# (QCDR |ee|)
                                                           . #18#)
                                                   (|check_subtype| (>= #3# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    #3#))
                                                 (QREFELT $ 77)))
                                      (#19#
                                       (SPADCALL
                                        (PROG2
                                            (LETT #2#
                                                  (SPADCALL |f| (QREFELT $ 79))
                                                  . #18#)
                                            (QCDR #2#)
                                          (|check_union| (QEQCAR #2# 0)
                                                         (QREFELT $ 8) #2#))
                                        (PROG1
                                            (LETT #1# (- (QCDR |ee|)) . #18#)
                                          (|check_subtype| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           #1#))
                                        (QREFELT $ 77)))))))
                              (#19# |subject|)))))))))))))))))
          #16# (EXIT #16#)))) 

(DECLAIM (NOTINLINE |ApplyRules;|)) 

(DEFUN |ApplyRules| (&REST #1=#:G202)
  (SPROG NIL
         (PROG (#2=#:G203)
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
                  (PROG1 (APPLY (|function| |ApplyRules;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|ApplyRules|)))))))))) 

(DEFUN |ApplyRules;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
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
            (QSETREFV $ 36
                      (CONS (|dispatchFunction| |APPRULE;localUnquote;FLF;7|)
                            $)))
           ('T
            (QSETREFV $ 36
                      (CONS (|dispatchFunction| |APPRULE;localUnquote;FLF;8|)
                            $))))
          $))) 

(MAKEPROP '|ApplyRules| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Union| 12 '"failed") (|RewriteRule| 6 7 8)
              (0 . |retractIfCan|) (|Equation| 8) (5 . |lhs|) (|Kernel| $)
              (10 . |retract|) (15 . |rhs|) (|PatternMatchResult| 6 8)
              (20 . |new|) (|Boolean|) (24 . =) (|List| 10)
              |APPRULE;applyRules;L2F;3| (|PositiveInteger|)
              |APPRULE;applyRules;LFPiF;4| (30 . |eval|)
              (|Record| (|:| |key| 29) (|:| |entry| 8)) (|List| 26)
              (37 . |destruct|) (|Symbol|) (|Kernel| 8) (42 . |kernel|)
              (|List| 14) (|List| $) (47 . |eval|) (|List| 29)
              (54 . |localUnquote|) (60 . |eval|) (|PatternMatchResult| 6 $)
              (|Pattern| 6) (66 . |patternMatch|) (73 . |failed?|)
              (|Union| 19 '"failed") (78 . |satisfy?|) (|List| 17)
              (84 . |member?|) (90 . |failed|) (|Union| 8 '"failed")
              (94 . |getMatch|) (|PatternFunctions1| 6 8) (100 . |addBadValue|)
              (106 . |hasTopPredicate?|) (111 . |variables|)
              (116 . |resetBadValues|) (121 . |pattern|) (126 . |rhs|)
              (131 . |quotedOperators|) (|Union| 14 '"failed")
              (136 . |retractIfCan|) (|BasicOperator|) (141 . |operator|)
              (|List| 8) (146 . |argument|) (151 . |elt|)
              (|Union| 33 '#1="failed") (157 . |isPlus|) (162 . +)
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
                                                   14 0 15 1 12 8 0 16 0 17 0
                                                   18 2 8 19 0 0 20 3 8 0 0 14
                                                   0 25 1 17 27 0 28 1 30 0 29
                                                   31 3 8 0 0 32 33 34 2 0 8 8
                                                   35 36 2 8 0 0 35 37 3 8 38 0
                                                   39 38 40 1 17 19 0 41 2 17
                                                   42 0 39 43 2 44 19 17 0 45 0
                                                   17 0 46 2 17 47 39 0 48 2 49
                                                   39 39 8 50 1 39 19 0 51 1 39
                                                   33 0 52 1 39 0 0 53 1 10 39
                                                   0 54 1 10 8 0 55 1 10 35 0
                                                   56 1 8 57 0 58 1 30 59 0 60
                                                   1 30 61 0 62 2 8 0 59 33 63
                                                   1 8 64 0 65 2 8 0 0 0 66 0 8
                                                   0 67 1 8 64 0 68 2 8 0 0 0
                                                   69 0 8 0 70 1 8 72 0 73 1 74
                                                   19 0 75 2 8 0 0 76 77 1 8 78
                                                   0 79 2 0 8 8 35 36 2 0 8 21
                                                   8 22 3 0 8 21 8 23 24)))))
           '|lookupComplete|)) 
