
(/VERSIONCHECK 2) 

(DEFUN |PMTOOLS;negConstant| (|l| $)
  (PROG (#1=#:G167 #2=#:G169 |r| #3=#:G170 |x|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ
         (EXIT
          (SEQ (LETT |x| NIL . #4=(|PMTOOLS;negConstant|)) (LETT #3# |l| . #4#)
               G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 15)) . #4#)
                    (EXIT
                     (COND
                      ((QEQCAR |r| 0)
                       (COND
                        ((SPADCALL (QCDR |r|) (|spadConstant| $ 16)
                                   (QREFELT $ 19))
                         (PROGN
                          (LETT #1#
                                (PROGN (LETT #2# (CONS 0 |x|) . #4#) (GO #2#))
                                . #4#)
                          (GO #1#))))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
         #1# (EXIT #1#))
        (EXIT (CONS 1 "failed"))))
      #2# (EXIT #2#))))) 

(DEFUN |PMTOOLS;tryToMatch| (|lp| |rc| |ident| |pmatch| $)
  (PROG (|ls| #1=#:G181 |l| |rec| #2=#:G182 |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |rec|
              (CONS (LETT |l| (QCAR |rc|) . #3=(|PMTOOLS;tryToMatch|))
                    (LETT |ls| (QCDR |rc|) . #3#))
              . #3#)
        (SEQ (LETT |p| NIL . #3#) (LETT #2# |lp| . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (LETT |rec| (|PMTOOLS;findMatch| |p| |ls| |l| |ident| |pmatch| $)
                    . #3#)
              (EXIT
               (COND
                ((SPADCALL (LETT |l| (QCAR |rec|) . #3#) (QREFELT $ 21))
                 (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
                ('T (LETT |ls| (QCDR |rec|) . #3#)))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |rec|))))
      #1# (EXIT #1#))))) 

(DEFUN |PMTOOLS;patternMatchTimes;LLPmrMPmr;3| (|ls| |lp| |l| |pmatch| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL (QREFELT $ 13) |lp| (QREFELT $ 23))
        (SEQ
         (LETT |u| (|PMTOOLS;negConstant| |ls| $)
               . #1=(|PMTOOLS;patternMatchTimes;LLPmrMPmr;3|))
         (EXIT
          (COND ((QEQCAR |u| 1) (SPADCALL (QREFELT $ 24)))
                (#2='T
                 (SEQ
                  (COND
                   ((SPADCALL (QCDR |u|)
                              (SPADCALL (|spadConstant| $ 9) (QREFELT $ 10))
                              (QREFELT $ 25))
                    (LETT |ls| (CONS (SPADCALL (QCDR |u|) (QREFELT $ 10)) |ls|)
                          . #1#)))
                  (EXIT
                   (SPADCALL (SPADCALL (QCDR |u|) |ls| (QREFELT $ 27))
                             (SPADCALL (QREFELT $ 13) |lp| (QREFELT $ 28))
                             (CONS #'|PMTOOLS;patternMatchTimes;LLPmrMPmr;3!0|
                                   $)
                             |l| |pmatch| (QREFELT $ 32)))))))))
       (#2#
        (SPADCALL |ls| |lp|
                  (CONS #'|PMTOOLS;patternMatchTimes;LLPmrMPmr;3!1| $) |l|
                  |pmatch| (QREFELT $ 32)))))))) 

(DEFUN |PMTOOLS;patternMatchTimes;LLPmrMPmr;3!1| (|l1| $)
  (PROG (#1=#:G198 #2=#:G197 #3=#:G199 #4=#:G201 #5=#:G126)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL NIL)
       (SEQ (LETT #5# NIL NIL) (LETT #4# |l1| NIL) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#) NIL) NIL)) (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3# #5# NIL)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29)) NIL))
                     ('T (PROGN (LETT #2# #3# NIL) (LETT #1# 'T NIL)))))))
            (LETT #4# (CDR #4#) NIL) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 9)))))))) 

(DEFUN |PMTOOLS;patternMatchTimes;LLPmrMPmr;3!0| (|l1| $)
  (PROG (#1=#:G188 #2=#:G187 #3=#:G189 #4=#:G191 #5=#:G125)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL NIL)
       (SEQ (LETT #5# NIL NIL) (LETT #4# |l1| NIL) G190
            (COND
             ((OR (ATOM #4#) (PROGN (LETT #5# (CAR #4#) NIL) NIL)) (GO G191)))
            (SEQ
             (EXIT
              (PROGN
               (LETT #3# #5# NIL)
               (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 29)) NIL))
                     ('T (PROGN (LETT #2# #3# NIL) (LETT #1# 'T NIL)))))))
            (LETT #4# (CDR #4#) NIL) (GO G190) G191 (EXIT NIL))
       (COND (#1# #2#) ('T (|spadConstant| $ 9)))))))) 

(DEFUN |PMTOOLS;findMatch| (|p| |ls| |l| |ident| |pmatch| $)
  (PROG (|l1| |t| #1=#:G217 |x| #2=#:G216 |bad|)
    (RETURN
     (SEQ
      (LETT |bad|
            (COND
             ((SPADCALL |p| (QREFELT $ 34))
              (SPADCALL (SPADCALL |p| (QREFELT $ 36)) |ls| (QREFELT $ 37)))
             (#3='T NIL))
            . #4=(|PMTOOLS;findMatch|))
      (LETT |l1| (SPADCALL (QREFELT $ 24)) . #4#)
      (SEQ (LETT |x| NIL . #4#)
           (LETT #2# (SPADCALL |ls| |bad| (QREFELT $ 38)) . #4#) G190
           (COND
            ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #4#) NIL)
                 (NULL
                  (SEQ (LETT |t| |x| . #4#)
                       (EXIT
                        (SPADCALL
                         (LETT |l1| (SPADCALL |x| |p| |l| |pmatch|) . #4#)
                         (QREFELT $ 21))))))
             (GO G191)))
           (SEQ (EXIT (|spadConstant| $ 16))) (LETT #2# (CDR #2#) . #4#)
           (GO G190) G191 (EXIT NIL))
      (EXIT
       (COND
        ((SPADCALL |l1| (QREFELT $ 21))
         (SEQ
          (SEQ (LETT |x| NIL . #4#) (LETT #1# |bad| . #4#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #4#) NIL)
                     (NULL
                      (SEQ (LETT |t| |x| . #4#)
                           (EXIT
                            (SPADCALL
                             (LETT |l1| (SPADCALL |x| |p| |l| |pmatch|) . #4#)
                             (QREFELT $ 21))))))
                 (GO G191)))
               (SEQ (EXIT (|spadConstant| $ 16))) (LETT #1# (CDR #1#) . #4#)
               (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((SPADCALL |l1| (QREFELT $ 21))
             (CONS (SPADCALL |p| |ident| |l| |ident| (QREFELT $ 39)) |ls|))
            (#3# (CONS |l1| (SPADCALL |t| |ls| (QREFELT $ 27))))))))
        (#3# (CONS |l1| (SPADCALL |t| |ls| (QREFELT $ 27)))))))))) 

(DEFUN |PMTOOLS;preprocessList| (|pattern| |ls| |l| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |pattern| (QREFELT $ 34))
        (SEQ
         (LETT |u| (SPADCALL |pattern| |l| (QREFELT $ 41))
               |PMTOOLS;preprocessList|)
         (EXIT
          (COND
           ((QEQCAR |u| 0)
            (COND
             ((SPADCALL (QCDR |u|) |ls| (QREFELT $ 42))
              (CONS 0 (LIST (QCDR |u|))))
             (#1='T (CONS 1 "failed"))))
           (#1# (CONS 0 NIL))))))
       (#1# (CONS 0 NIL))))))) 

(DEFUN |PMTOOLS;filterMatchedPatterns| (|lp| |ls| |l| $)
  (PROG (#1=#:G240 |rc| #2=#:G241 |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |p| NIL . #3=(|PMTOOLS;filterMatchedPatterns|))
             (LETT #2# |lp| . #3#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ (LETT |rc| (|PMTOOLS;preprocessList| |p| |ls| |l| $) . #3#)
                  (EXIT
                   (COND
                    ((QEQCAR |rc| 1)
                     (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
                    ((NULL (NULL (QCDR |rc|)))
                     (SEQ (LETT |lp| (SPADCALL |p| |lp| (QREFELT $ 28)) . #3#)
                          (EXIT
                           (LETT |ls|
                                 (SPADCALL (|SPADfirst| (QCDR |rc|)) |ls|
                                           (QREFELT $ 27))
                                 . #3#)))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 (CONS |lp| |ls|)))))
      #1# (EXIT #1#))))) 

(DEFUN |PMTOOLS;selBestGen| (|l| $)
  (PROG (#1=#:G242 #2=#:G245 |ans| #3=#:G246 |p|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |ans| NIL . #4=(|PMTOOLS;selBestGen|))
            (SEQ (LETT |p| NIL . #4#) (LETT #3# |l| . #4#) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |p| (QREFELT $ 34))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |ans| (LIST |p|) . #4#)
                            (EXIT
                             (COND
                              ((NULL (SPADCALL |p| (QREFELT $ 43)))
                               (PROGN
                                (LETT #1#
                                      (PROGN (LETT #2# |ans| . #4#) (GO #2#))
                                      . #4#)
                                (GO #1#)))))))
                      #1# (EXIT #1#))))))
                 (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT |ans|)))
      #2# (EXIT #2#))))) 

(DEFUN |PMTOOLS;patternMatch;LLMPmrMPmr;8| (|ls| |lp| |op| |l| |pmatch| $)
  (PROG (|rec| |u| |rc| |l4| |l3| |l2| |l1| |lpm| #1=#:G336 |ident|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |ident| (SPADCALL NIL |op|)
              . #2=(|PMTOOLS;patternMatch;LLMPmrMPmr;8|))
        (LETT |rc| (|PMTOOLS;filterMatchedPatterns| |lp| |ls| |l| $) . #2#)
        (EXIT
         (COND
          ((QEQCAR |rc| 1)
           (PROGN (LETT #1# (SPADCALL (QREFELT $ 24)) . #2#) (GO #1#)))
          (#3='T
           (SEQ (LETT |lp| (QCAR (QCDR |rc|)) . #2#)
                (LETT |ls| (QCDR (QCDR |rc|)) . #2#)
                (EXIT
                 (COND ((NULL |lp|) |l|)
                       ((SPADCALL
                         (LENGTH
                          (LETT |lpm| (SPADCALL (ELT $ 44) |lp| (QREFELT $ 46))
                                . #2#))
                         1 (QREFELT $ 49))
                        (|error|
                         "More than one optional pattern in sum/product"))
                       ((< (+ (LENGTH |ls|) (LENGTH |lpm|)) (LENGTH |lp|))
                        (SPADCALL (QREFELT $ 24)))
                       (#3#
                        (SEQ
                         (COND
                          ((NULL (NULL |lpm|))
                           (COND
                            ((EQL (+ (LENGTH |ls|) 1) (LENGTH |lp|))
                             (SEQ
                              (LETT |lp|
                                    (SPADCALL (|SPADfirst| |lpm|) |lp|
                                              (QREFELT $ 28))
                                    . #2#)
                              (EXIT
                               (COND
                                ((SPADCALL
                                  (LETT |l|
                                        (SPADCALL (|SPADfirst| |lpm|) |ident|
                                                  |l| (QREFELT $ 50))
                                        . #2#)
                                  (QREFELT $ 21))
                                 (PROGN (LETT #1# |l| . #2#) (GO #1#))))))))))
                         (EXIT
                          (COND
                           ((SPADCALL
                             (LENGTH
                              (LETT |lpm|
                                    (SPADCALL (ELT $ 51) |lp| (QREFELT $ 46))
                                    . #2#))
                             1 (QREFELT $ 49))
                            (|error|
                             "More than one expandable pattern in sum/product"))
                           (#3#
                            (SEQ
                             (COND
                              ((SPADCALL (LENGTH |ls|) (LENGTH |lp|)
                                         (QREFELT $ 49))
                               (COND
                                ((NULL |lpm|)
                                 (COND
                                  ((NULL
                                    (LETT |lpm| (|PMTOOLS;selBestGen| |lp| $)
                                          . #2#))
                                   (EXIT (SPADCALL (QREFELT $ 24)))))))))
                             (COND
                              ((NULL (NULL |lpm|))
                               (LETT |lp|
                                     (SPADCALL (|SPADfirst| |lpm|) |lp|
                                               (QREFELT $ 28))
                                     . #2#)))
                             (LETT |l1|
                                   (SPADCALL (ELT $ 52) |lp| (QREFELT $ 46))
                                   . #2#)
                             (LETT |l2|
                                   (SPADCALL
                                    (CONS
                                     #'|PMTOOLS;patternMatch;LLMPmrMPmr;8!0| $)
                                    |lp| (QREFELT $ 46))
                                   . #2#)
                             (LETT |l3|
                                   (SPADCALL
                                    (CONS
                                     #'|PMTOOLS;patternMatch;LLMPmrMPmr;8!1| $)
                                    (SPADCALL
                                     (CONS
                                      #'|PMTOOLS;patternMatch;LLMPmrMPmr;8!2|
                                      $)
                                     |lp| (QREFELT $ 46))
                                    (QREFELT $ 57))
                                   . #2#)
                             (LETT |l4|
                                   (SPADCALL
                                    (CONS
                                     #'|PMTOOLS;patternMatch;LLMPmrMPmr;8!3| $)
                                    |lp| (QREFELT $ 46))
                                   . #2#)
                             (LETT |rec| (CONS |l| |ls|) . #2#)
                             (LETT |u|
                                   (|PMTOOLS;tryToMatch| |l1| |rec| |ident|
                                    |pmatch| $)
                                   . #2#)
                             (EXIT
                              (COND ((QEQCAR |u| 1) (SPADCALL (QREFELT $ 24)))
                                    (#3#
                                     (SEQ
                                      (LETT |u|
                                            (|PMTOOLS;tryToMatch| |l2|
                                             (QCDR |u|) |ident| |pmatch| $)
                                            . #2#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |u| 1)
                                         (SPADCALL (QREFELT $ 24)))
                                        (#3#
                                         (SEQ
                                          (LETT |u|
                                                (|PMTOOLS;tryToMatch| |l3|
                                                 (QCDR |u|) |ident| |pmatch| $)
                                                . #2#)
                                          (EXIT
                                           (COND
                                            ((QEQCAR |u| 1)
                                             (SPADCALL (QREFELT $ 24)))
                                            (#3#
                                             (SEQ (LETT |rec| (QCDR |u|) . #2#)
                                                  (LETT |rc|
                                                        (|PMTOOLS;filterMatchedPatterns|
                                                         |l4| (QCDR |rec|)
                                                         (QCAR |rec|) $)
                                                        . #2#)
                                                  (EXIT
                                                   (COND
                                                    ((QEQCAR |rc| 1)
                                                     (SPADCALL (QREFELT $ 24)))
                                                    (#3#
                                                     (SEQ
                                                      (LETT |rec|
                                                            (CONS (QCAR |rec|)
                                                                  (QCDR
                                                                   (QCDR
                                                                    |rc|)))
                                                            . #2#)
                                                      (LETT |u|
                                                            (|PMTOOLS;tryToMatch|
                                                             (QCAR (QCDR |rc|))
                                                             |rec| |ident|
                                                             |pmatch| $)
                                                            . #2#)
                                                      (EXIT
                                                       (COND
                                                        ((QEQCAR |u| 1)
                                                         (SPADCALL
                                                          (QREFELT $ 24)))
                                                        (#3#
                                                         (SEQ
                                                          (LETT |rec|
                                                                (QCDR |u|)
                                                                . #2#)
                                                          (LETT |l|
                                                                (QCAR |rec|)
                                                                . #2#)
                                                          (LETT |ls|
                                                                (QCDR |rec|)
                                                                . #2#)
                                                          (EXIT
                                                           (COND
                                                            ((NULL |lpm|)
                                                             (COND
                                                              ((NULL |ls|) |l|)
                                                              (#3#
                                                               (SPADCALL
                                                                (QREFELT $
                                                                         24)))))
                                                            (#3#
                                                             (SPADCALL
                                                              (|SPADfirst|
                                                               |lpm|)
                                                              (SPADCALL |ls|
                                                                        |op|)
                                                              |l|
                                                              (QREFELT $
                                                                       50)))))))))))))))))))))))))))))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |PMTOOLS;patternMatch;LLMPmrMPmr;8!3| (|p1| $)
  (COND
   ((SPADCALL |p1| (QREFELT $ 34))
    (COND
     ((OR (SPADCALL |p1| (QREFELT $ 43)) (SPADCALL |p1| (QREFELT $ 52)))
      (|spadConstant| $ 53))
     ('T (|spadConstant| $ 54))))
   ('T (|spadConstant| $ 53)))) 

(DEFUN |PMTOOLS;patternMatch;LLMPmrMPmr;8!2| (|p1| $)
  (COND
   ((OR (SPADCALL |p1| (QREFELT $ 43))
        (OR (SPADCALL |p1| (QREFELT $ 34)) (SPADCALL |p1| (QREFELT $ 52))))
    (|spadConstant| $ 53))
   ('T (|spadConstant| $ 54)))) 

(DEFUN |PMTOOLS;patternMatch;LLMPmrMPmr;8!1| (|z1| |z2| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 55)) (SPADCALL |z2| (QREFELT $ 55))
            (QREFELT $ 49))) 

(DEFUN |PMTOOLS;patternMatch;LLMPmrMPmr;8!0| (|p1| $)
  (COND
   ((SPADCALL |p1| (QREFELT $ 43))
    (COND ((SPADCALL |p1| (QREFELT $ 52)) (|spadConstant| $ 53))
          ('T (|spadConstant| $ 54))))
   ('T (|spadConstant| $ 53)))) 

(DEFUN |PatternMatchTools| (&REST #1=#:G337)
  (PROG ()
    (RETURN
     (PROG (#2=#:G338)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|PatternMatchTools|)
                                           '|domainEqualList|)
                . #3=(|PatternMatchTools|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |PatternMatchTools;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|PatternMatchTools|))))))))))) 

(DEFUN |PatternMatchTools;| (|#1| |#2| |#3|)
  (PROG (|pv$| $ |dv$| DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PatternMatchTools|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT |dv$| (LIST '|PatternMatchTools| DV$1 DV$2 DV$3) . #1#)
      (LETT $ (GETREFV 58) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PatternMatchTools|
                  (LIST DV$1 DV$2 DV$3) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 13
                (SPADCALL (SPADCALL (|spadConstant| $ 9) (QREFELT $ 10))
                          (QREFELT $ 12)))
      $)))) 

(MAKEPROP '|PatternMatchTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |One|) (4 . -) (|Pattern| 6) (9 . |convert|)
              '|mn1| (|Union| 7 '"failed") (14 . |retractIfCan|) (19 . |Zero|)
              (23 . |Zero|) (|Boolean|) (27 . |smaller?|)
              (|PatternMatchResult| 6 8) (33 . |failed?|) (|List| 11)
              (38 . |member?|) (44 . |failed|) (48 . ~=) (|List| 8)
              (54 . |remove|) (60 . |remove|) (66 . *) (|Mapping| 8 26)
              (|Mapping| 20 8 11 20) |PMTOOLS;patternMatch;LLMPmrMPmr;8|
              |PMTOOLS;patternMatchTimes;LLPmrMPmr;3| (72 . |generic?|)
              (|PatternFunctions1| 6 8) (77 . |badValues|)
              (82 . |setIntersection|) (88 . |setDifference|)
              (94 . |addMatchRestricted|) (|Union| 8 '"failed")
              (102 . |getMatch|) (108 . |member?|) (114 . |hasPredicate?|)
              (119 . |optional?|) (|Mapping| 18 11) (124 . |select|)
              (130 . |One|) (|NonNegativeInteger|) (134 . >) (140 . |addMatch|)
              (147 . |multiple?|) (152 . |constant?|) (157 . |false|)
              (161 . |true|) (165 . |depth|) (|Mapping| 18 11 11)
              (170 . |sort!|))
           '#(|patternMatchTimes| 176 |patternMatch| 184) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 57
                                                 '(0 8 0 9 1 8 0 0 10 1 8 11 0
                                                   12 1 8 14 0 15 0 7 0 16 0 8
                                                   0 17 2 7 18 0 0 19 1 20 18 0
                                                   21 2 22 18 11 0 23 0 20 0 24
                                                   2 8 18 0 0 25 2 26 0 8 0 27
                                                   2 22 0 11 0 28 2 8 0 0 0 29
                                                   1 11 18 0 34 1 35 26 11 36 2
                                                   26 0 0 0 37 2 26 0 0 0 38 4
                                                   20 0 11 8 0 8 39 2 20 40 11
                                                   0 41 2 26 18 8 0 42 1 11 18
                                                   0 43 1 11 18 0 44 2 22 0 45
                                                   0 46 0 7 0 47 2 48 18 0 0 49
                                                   3 20 0 11 8 0 50 1 11 18 0
                                                   51 1 11 18 0 52 0 18 0 53 0
                                                   18 0 54 1 11 48 0 55 2 22 0
                                                   56 0 57 4 0 20 26 22 20 31
                                                   33 5 0 20 26 22 30 20 31
                                                   32)))))
           '|lookupComplete|)) 
