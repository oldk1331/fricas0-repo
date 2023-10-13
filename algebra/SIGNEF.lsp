
(/VERSIONCHECK 2) 

(DEFUN |SIGNEF;sign;FSOcU;1| (|f| |x| |a| $)
  (COND ((NULL (SPADCALL |f| (QREFELT $ 10))) (CONS 1 "failed"))
        ('T (|SIGNEF;insign| |f| |x| |a| 0 $)))) 

(DEFUN |SIGNEF;sign;FSFSU;2| (|f| |x| |a| |st| $)
  (COND ((NULL (SPADCALL |f| (QREFELT $ 10))) (CONS 1 "failed"))
        ('T (|SIGNEF;psign| |f| |x| |a| |st| 0 $)))) 

(DEFUN |SIGNEF;sign;FU;3| (|f| $)
  (PROG (#1=#:G191 |r| |f2| |mapfun| #2=#:G189 |ud| |un| |u|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL (SPADCALL |f| (QREFELT $ 10))) (CONS 1 "failed"))
             ('T
              (SEQ
               (LETT |u| (SPADCALL |f| (QREFELT $ 18))
                     . #3=(|SIGNEF;sign;FU;3|))
               (EXIT
                (COND ((QEQCAR |u| 0) (SPADCALL (QCDR |u|) (QREFELT $ 21)))
                      (#4='T
                       (SEQ
                        (EXIT
                         (SEQ
                          (SEQ
                           (LETT |un|
                                 (|SIGNEF;smpsign|
                                  (SPADCALL |f| (QREFELT $ 23)) $)
                                 . #3#)
                           (EXIT
                            (COND
                             ((QEQCAR |un| 0)
                              (SEQ
                               (LETT |ud|
                                     (|SIGNEF;smpsign|
                                      (SPADCALL |f| (QREFELT $ 24)) $)
                                     . #3#)
                               (EXIT
                                (COND
                                 ((QEQCAR |ud| 0)
                                  (PROGN
                                   (LETT #2#
                                         (CONS 0 (* (QCDR |un|) (QCDR |ud|)))
                                         . #3#)
                                   (GO #2#))))))))))
                          (COND
                           ((NULL (NULL (SPADCALL |f| (QREFELT $ 26))))
                            (EXIT (CONS 1 "failed"))))
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL "rootOf" (QREFELT $ 27))
                                       (SPADCALL (ELT $ 29)
                                                 (SPADCALL |f| (QREFELT $ 31))
                                                 (QREFELT $ 34))
                                       (QREFELT $ 35))
                             (CONS 1 "failed"))
                            (#4#
                             (SEQ
                              (COND
                               ((|HasCategory| (QREFELT $ 6)
                                               (LIST '|ConvertibleTo|
                                                     '(|Float|)))
                                (SEQ
                                 (LETT |mapfun| (CONS #'|SIGNEF;sign;FU;3!0| $)
                                       . #3#)
                                 (LETT |f2|
                                       (SPADCALL |mapfun| |f| (QREFELT $ 43))
                                       . #3#)
                                 (LETT |r| (SPADCALL |f2| (QREFELT $ 45))
                                       . #3#)
                                 (COND
                                  ((QEQCAR |r| 1)
                                   (PROGN
                                    (LETT #1# (CONS 1 "failed") . #3#)
                                    (GO #1#))))
                                 (EXIT
                                  (COND
                                   ((SPADCALL (QCDR |r|) (QREFELT $ 46))
                                    (PROGN
                                     (LETT #1# (CONS 0 -1) . #3#)
                                     (GO #1#)))
                                   ((SPADCALL (QCDR |r|) (QREFELT $ 49))
                                    (PROGN
                                     (LETT #1# (CONS 0 1) . #3#)
                                     (GO #1#)))
                                   ((SPADCALL (QCDR |r|) (QREFELT $ 50))
                                    (PROGN
                                     (LETT #1# (CONS 0 0) . #3#)
                                     (GO #1#)))
                                   (#4# "failed"))))))
                              (EXIT (CONS 1 "failed"))))))))
                        #2# (EXIT #2#)))))))))
      #1# (EXIT #1#))))) 

(DEFUN |SIGNEF;sign;FU;3!0| (|z1| $)
  (SPADCALL (SPADCALL |z1| (QREFELT $ 37)) (QREFELT $ 39))) 

(DEFUN |SIGNEF;overRF| (|a| $)
  (PROG (|u| |n|)
    (RETURN
     (SEQ (LETT |n| (SPADCALL |a| (QREFELT $ 53)) . #1=(|SIGNEF;overRF|))
          (EXIT
           (COND
            ((|eql_SI| |n| 0)
             (SEQ
              (LETT |u| (SPADCALL (SPADCALL |a| (QREFELT $ 56)) (QREFELT $ 18))
                    . #1#)
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                     (#2='T (CONS 0 (SPADCALL (QCDR |u|) (QREFELT $ 58))))))))
            (#2#
             (CONS 0
                   (SPADCALL |n| (SPADCALL (QREFELT $ 59))
                             (QREFELT $ 61)))))))))) 

(DEFUN |SIGNEF;ofesign| (|a| $)
  (PROG (|n|)
    (RETURN
     (COND
      ((SPADCALL (LETT |n| (SPADCALL |a| (QREFELT $ 53)) |SIGNEF;ofesign|) 0
                 (QREFELT $ 62))
       (CONS 0 |n|))
      ('T (SPADCALL (SPADCALL |a| (QREFELT $ 56)) (QREFELT $ 51))))))) 

(DEFUN |SIGNEF;insign| (|f| |x| |a| |m| $)
  (PROG (|ur| #1=#:G226 |ul| |s| |v| |n| |u| |eq| #2=#:G232 |ua| |uf|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |m| 10 (QREFELT $ 64)) (CONS 1 "failed"))
            (#3='T
             (SEQ
              (EXIT
               (SEQ
                (SEQ
                 (LETT |uf| (SPADCALL |f| (QREFELT $ 18))
                       . #4=(|SIGNEF;insign|))
                 (EXIT
                  (COND
                   ((QEQCAR |uf| 0)
                    (SEQ (LETT |ua| (|SIGNEF;overRF| |a| $) . #4#)
                         (EXIT
                          (COND
                           ((QEQCAR |ua| 0)
                            (PROGN
                             (LETT #2#
                                   (SPADCALL (QCDR |uf|) |x| (QCDR |ua|)
                                             (QREFELT $ 65))
                                   . #4#)
                             (GO #2#))))))))))
                (LETT |eq|
                      (SPADCALL
                       (SPADCALL (SPADCALL |x| (QREFELT $ 66)) (QREFELT $ 67))
                       |a| (QREFELT $ 69))
                      . #4#)
                (LETT |u| (SPADCALL |f| |eq| (QREFELT $ 74)) . #4#)
                (EXIT
                 (COND ((QEQCAR |u| 2) (CONS 1 "failed"))
                       ((QEQCAR |u| 0)
                        (COND
                         ((SPADCALL
                           (LETT |n| (SPADCALL (QCDR |u|) (QREFELT $ 53))
                                 . #4#)
                           0 (QREFELT $ 62))
                          (CONS 0 |n|))
                         (#3#
                          (SEQ
                           (LETT |v| (SPADCALL (QCDR |u|) (QREFELT $ 56))
                                 . #4#)
                           (EXIT
                            (COND
                             ((SPADCALL |v| (|spadConstant| $ 55)
                                        (QREFELT $ 75))
                              (SEQ
                               (LETT |s|
                                     (|SIGNEF;insign|
                                      (SPADCALL |f| |x| (QREFELT $ 76)) |x| |a|
                                      (+ |m| 1) $)
                                     . #4#)
                               (EXIT
                                (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                                      (#3# (CONS 0 (- (* (QCDR |s|) |n|))))))))
                             (#3# (SPADCALL |v| (QREFELT $ 51)))))))))
                       (#3#
                        (COND
                         ((OR (QEQCAR (QCAR (QCDR |u|)) 1)
                              (QEQCAR (QCDR (QCDR |u|)) 1))
                          (CONS 1 "failed"))
                         ('T
                          (SEQ
                           (LETT |ul|
                                 (|SIGNEF;ofesign|
                                  (PROG2 (LETT #1# (QCAR (QCDR |u|)) . #4#)
                                      (QCDR #1#)
                                    (|check_union| (QEQCAR #1# 0)
                                                   (|OrderedCompletion|
                                                    (QREFELT $ 7))
                                                   #1#))
                                  $)
                                 . #4#)
                           (EXIT
                            (COND ((QEQCAR |ul| 1) (CONS 1 "failed"))
                                  (#3#
                                   (SEQ
                                    (LETT |ur|
                                          (|SIGNEF;ofesign|
                                           (PROG2
                                               (LETT #1# (QCDR (QCDR |u|))
                                                     . #4#)
                                               (QCDR #1#)
                                             (|check_union| (QEQCAR #1# 0)
                                                            (|OrderedCompletion|
                                                             (QREFELT $ 7))
                                                            #1#))
                                           $)
                                          . #4#)
                                    (EXIT
                                     (COND
                                      ((OR (QEQCAR |ur| 1)
                                           (NULL
                                            (EQL (QCDR |ul|) (QCDR |ur|))))
                                       (CONS 1 "failed"))
                                      ('T |ul|)))))))))))))))
              #2# (EXIT #2#)))))))) 

(DEFUN |SIGNEF;psign| (|f| |x| |a| |st| |m| $)
  (PROG (|s| |v| |n| |u| |eq| #1=#:G248 |ua| |uf|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |m| 10 (QREFELT $ 64)) (CONS 1 "failed"))
            ((SPADCALL |f| (|spadConstant| $ 55) (QREFELT $ 75)) (CONS 0 0))
            (#2='T
             (SEQ
              (EXIT
               (SEQ
                (SEQ
                 (LETT |uf| (SPADCALL |f| (QREFELT $ 18))
                       . #3=(|SIGNEF;psign|))
                 (EXIT
                  (COND
                   ((QEQCAR |uf| 0)
                    (SEQ (LETT |ua| (SPADCALL |a| (QREFELT $ 18)) . #3#)
                         (EXIT
                          (COND
                           ((QEQCAR |ua| 0)
                            (PROGN
                             (LETT #1#
                                   (SPADCALL (QCDR |uf|) |x| (QCDR |ua|) |st|
                                             (QREFELT $ 77))
                                   . #3#)
                             (GO #1#))))))))))
                (LETT |eq|
                      (SPADCALL (SPADCALL |x| (QREFELT $ 66)) |a|
                                (QREFELT $ 79))
                      . #3#)
                (LETT |u| (SPADCALL |f| |eq| |st| (QREFELT $ 80)) . #3#)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ((QEQCAR |u| 0)
                        (COND
                         ((SPADCALL
                           (LETT |n| (SPADCALL (QCDR |u|) (QREFELT $ 53))
                                 . #3#)
                           0 (QREFELT $ 62))
                          (CONS 0 |n|))
                         (#2#
                          (SEQ
                           (LETT |v| (SPADCALL (QCDR |u|) (QREFELT $ 56))
                                 . #3#)
                           (EXIT
                            (COND
                             ((SPADCALL |v| (|spadConstant| $ 55)
                                        (QREFELT $ 75))
                              (SEQ
                               (LETT |s|
                                     (|SIGNEF;psign|
                                      (SPADCALL |f| |x| (QREFELT $ 76)) |x| |a|
                                      |st| (+ |m| 1) $)
                                     . #3#)
                               (EXIT
                                (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                                      (#2#
                                       (CONS 0
                                             (* (SPADCALL |st| (QREFELT $ 82))
                                                (QCDR |s|))))))))
                             (#2# (SPADCALL |v| (QREFELT $ 51)))))))))))))
              #1# (EXIT #1#)))))))) 

(DEFUN |SIGNEF;smpsign| (|p| $)
  (PROG (|ans| #1=#:G262 |u| #2=#:G263 |term| |s| |r|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |r| (SPADCALL |p| (QREFELT $ 85)) . #3=(|SIGNEF;smpsign|))
            (EXIT
             (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 86)))
                   (#4='T
                    (SEQ
                     (LETT |u|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (LETT |s| (SPADCALL |p| (QREFELT $ 88)) . #3#)
                              (QREFELT $ 90))
                             (QREFELT $ 91))
                            (QREFELT $ 86))
                           . #3#)
                     (EXIT
                      (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                            (#4#
                             (SEQ (LETT |ans| (QCDR |u|) . #3#)
                                  (SEQ (LETT |term| NIL . #3#)
                                       (LETT #2# (SPADCALL |s| (QREFELT $ 95))
                                             . #3#)
                                       G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN
                                              (LETT |term| (CAR #2#) . #3#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (COND
                                          ((ODDP (QVELT |term| 2))
                                           (SEQ
                                            (LETT |u|
                                                  (|SIGNEF;sqfrSign|
                                                   (QVELT |term| 1) $)
                                                  . #3#)
                                            (EXIT
                                             (COND
                                              ((QEQCAR |u| 1)
                                               (PROGN
                                                (LETT #1# (CONS 1 "failed")
                                                      . #3#)
                                                (GO #1#)))
                                              ('T
                                               (LETT |ans| (* |ans| (QCDR |u|))
                                                     . #3#)))))))))
                                       (LETT #2# (CDR #2#) . #3#) (GO G190)
                                       G191 (EXIT NIL))
                                  (EXIT (CONS 0 |ans|))))))))))))
      #1# (EXIT #1#))))) 

(DEFUN |SIGNEF;sqfrSign| (|p| $)
  (PROG (|u| |l|)
    (RETURN
     (SEQ
      (LETT |u|
            (|SIGNEF;termSign|
             (|SPADfirst|
              (LETT |l| (SPADCALL |p| (QREFELT $ 97))
                    . #1=(|SIGNEF;sqfrSign|)))
             $)
            . #1#)
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
             ('T (|SIGNEF;listSign| (CDR |l|) (QCDR |u|) $)))))))) 

(DEFUN |SIGNEF;listSign| (|l| |s| $)
  (PROG (#1=#:G275 |u| #2=#:G276 |term|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |term| NIL . #3=(|SIGNEF;listSign|)) (LETT #2# |l| . #3#)
             G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |term| (CAR #2#) . #3#) NIL))
               (GO G191)))
             (SEQ (LETT |u| (|SIGNEF;termSign| |term| $) . #3#)
                  (EXIT
                   (COND
                    ((OR (QEQCAR |u| 1) (NULL (EQL |s| (QCDR |u|))))
                     (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#))))))
             (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 0 |s|))))
      #1# (EXIT #1#))))) 

(DEFUN |SIGNEF;termSign| (|term| $)
  (PROG (#1=#:G284 #2=#:G287 #3=#:G282 |vs| #4=#:G288 |lv| |var| |us|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |us| (SPADCALL (SPADCALL |term| (QREFELT $ 98)) (QREFELT $ 86))
              . #5=(|SIGNEF;termSign|))
        (EXIT
         (COND ((QEQCAR |us| 1) (CONS 1 "failed"))
               ('T
                (SEQ
                 (SEQ
                  (EXIT
                   (SEQ (LETT |var| NIL . #5#)
                        (LETT #4#
                              (LETT |lv| (SPADCALL |term| (QREFELT $ 100))
                                    . #5#)
                              . #5#)
                        G190
                        (COND
                         ((OR (ATOM #4#)
                              (PROGN (LETT |var| (CAR #4#) . #5#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((ODDP (SPADCALL |term| |var| (QREFELT $ 102)))
                            (PROGN
                             (LETT #1#
                                   (SEQ
                                    (EXIT
                                     (SEQ
                                      (COND
                                       ((NULL (CDR |lv|))
                                        (SEQ
                                         (LETT |vs|
                                               (|SIGNEF;kerSign|
                                                (|SPADfirst| |lv|) $)
                                               . #5#)
                                         (EXIT
                                          (COND
                                           ((QEQCAR |vs| 0)
                                            (PROGN
                                             (LETT #3#
                                                   (PROGN
                                                    (LETT #2#
                                                          (CONS 0
                                                                (* (QCDR |us|)
                                                                   (QCDR
                                                                    |vs|)))
                                                          . #5#)
                                                    (GO #2#))
                                                   . #5#)
                                             (GO #3#))))))))
                                      (EXIT
                                       (PROGN
                                        (LETT #2# (CONS 1 "failed") . #5#)
                                        (GO #2#)))))
                                    #3# (EXIT #3#))
                                   . #5#)
                             (GO #1#))))))
                        (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL)))
                  #1# (EXIT #1#))
                 (EXIT (CONS 0 (QCDR |us|)))))))))
      #2# (EXIT #2#))))) 

(DEFUN |SIGNEF;kerSign| (|k| $)
  (PROG (|s| |arg| |op|)
    (RETURN
     (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 103)) . #1=(|SIGNEF;kerSign|))
          (COND
           ((OR (SPADCALL |op| '|pi| (QREFELT $ 104))
                (OR (SPADCALL |op| '|exp| (QREFELT $ 104))
                    (OR (SPADCALL |op| '|cosh| (QREFELT $ 104))
                        (SPADCALL |op| '|sech| (QREFELT $ 104)))))
            (EXIT (CONS 0 1))))
          (EXIT
           (COND
            ((NULL (LETT |arg| (SPADCALL |k| (QREFELT $ 106)) . #1#))
             (CONS 1 "failed"))
            (#2='T
             (SEQ
              (LETT |s| (SPADCALL (|SPADfirst| |arg|) (QREFELT $ 51)) . #1#)
              (EXIT
               (COND
                ((QEQCAR |s| 1)
                 (COND
                  ((SPADCALL |op| '|nthRoot| (QREFELT $ 104))
                   (COND
                    ((SPADCALL
                      (SPADCALL (SPADCALL |arg| (QREFELT $ 107))
                                (QREFELT $ 108))
                      (QREFELT $ 109))
                     (CONS 0 1))
                    (#2# (CONS 1 "failed"))))
                  (#2# (CONS 1 "failed"))))
                ((SPADCALL |op| '|log| (QREFELT $ 104))
                 (COND ((< (QCDR |s|) 0) (CONS 1 "failed"))
                       (#2#
                        (SPADCALL
                         (SPADCALL (|SPADfirst| |arg|) (|spadConstant| $ 48)
                                   (QREFELT $ 110))
                         (QREFELT $ 51)))))
                ((OR (SPADCALL |op| '|tanh| (QREFELT $ 104))
                     (OR (SPADCALL |op| '|sinh| (QREFELT $ 104))
                         (OR (SPADCALL |op| '|csch| (QREFELT $ 104))
                             (SPADCALL |op| '|coth| (QREFELT $ 104)))))
                 |s|)
                ('T
                 (COND
                  ((SPADCALL |op| '|nthRoot| (QREFELT $ 104))
                   (COND
                    ((SPADCALL
                      (SPADCALL (SPADCALL |arg| (QREFELT $ 107))
                                (QREFELT $ 108))
                      (QREFELT $ 109))
                     (COND ((< (QCDR |s|) 0) (CONS 1 "failed")) (#2# |s|)))
                    (#2# |s|)))
                  (#2# (CONS 1 "failed")))))))))))))) 

(DEFUN |ElementaryFunctionSign| (&REST #1=#:G308)
  (PROG ()
    (RETURN
     (PROG (#2=#:G309)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|ElementaryFunctionSign|)
                                           '|domainEqualList|)
                . #3=(|ElementaryFunctionSign|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |ElementaryFunctionSign;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|ElementaryFunctionSign|))))))))))) 

(DEFUN |ElementaryFunctionSign;| (|#1| |#2|)
  (PROG (|pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ElementaryFunctionSign|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT |dv$| (LIST '|ElementaryFunctionSign| DV$1 DV$2) . #1#)
      (LETT $ (GETREFV 111) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ElementaryFunctionSign|
                  (LIST DV$1 DV$2) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|ElementaryFunctionSign| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Boolean|)
              (|TrigonometricManipulations| 6 7) (0 . |real?|)
              (|Union| 60 '"failed") (|Symbol|) (|OrderedCompletion| 7)
              |SIGNEF;sign;FSOcU;1| (|String|) |SIGNEF;sign;FSFSU;2|
              (|Union| 19 '"failed") (5 . |retractIfCan|)
              (|Fraction| (|Polynomial| 6)) (|RationalFunctionSign| 6)
              (10 . |sign|) (|SparseMultivariatePolynomial| 6 (|Kernel| $))
              (15 . |numer|) (20 . |denom|) (|List| 12) (25 . |variables|)
              (30 . |coerce|) (|BasicOperator|) (35 . |name|) (|List| 28)
              (40 . |operators|) (|Mapping| 12 28) (|ListFunctions2| 28 12)
              (45 . |map|) (51 . |member?|) (|Float|) (57 . |convert|)
              (|Interval| 36) (62 . |interval|) (|Expression| 38)
              (|Mapping| 38 6) (|FunctionSpaceFunctions2| 6 7 38 40)
              (67 . |map|) (|Union| 38 '"failed") (73 . |retractIfCan|)
              (78 . |negative?|) (83 . |One|) (87 . |One|) (91 . |positive?|)
              (96 . |zero?|) |SIGNEF;sign;FU;3| (|SingleInteger|)
              (101 . |whatInfinity|) (106 . |Zero|) (110 . |Zero|)
              (114 . |retract|) (|OrderedCompletion| 19) (119 . |coerce|)
              (124 . |plusInfinity|) (|Integer|) (128 . *) (134 . ~=)
              (|NonNegativeInteger|) (140 . >) (146 . |sign|) (153 . |coerce|)
              (158 . |coerce|) (|Equation| 13) (163 . |equation|)
              (|Union| 13 '"failed")
              (|Record| (|:| |leftHandLimit| 70) (|:| |rightHandLimit| 70))
              (|Union| 13 71 '"failed") (|PowerSeriesLimitPackage| 6 7)
              (169 . |limit|) (175 . =) (181 . |differentiate|) (187 . |sign|)
              (|Equation| 7) (195 . |equation|) (201 . |limit|)
              (|ToolsForSign| 6) (208 . |direction|) (|Union| 6 '"failed")
              (|SparseMultivariatePolynomial| 6 101) (213 . |retractIfCan|)
              (218 . |sign|) (|Factored| $) (223 . |squareFree|)
              (|Factored| 84) (228 . |unit|) (233 . |retract|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 92) (|:| |fctr| 84) (|:| |xpnt| 60))
              (|List| 93) (238 . |factorList|) (|List| $) (243 . |monomials|)
              (248 . |leadingCoefficient|) (|List| 101) (253 . |variables|)
              (|Kernel| 7) (258 . |degree|) (264 . |operator|) (269 . |is?|)
              (|List| 7) (275 . |argument|) (280 . |second|) (285 . |retract|)
              (290 . |even?|) (295 . -))
           '#(|sign| 301) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 110
                                                 '(1 9 8 7 10 1 7 17 0 18 1 20
                                                   11 19 21 1 7 22 0 23 1 7 22
                                                   0 24 1 7 25 0 26 1 12 0 15
                                                   27 1 28 12 0 29 1 7 30 0 31
                                                   2 33 25 32 30 34 2 25 8 12 0
                                                   35 1 6 36 0 37 1 38 0 36 39
                                                   2 42 40 41 7 43 1 40 44 0 45
                                                   1 38 8 0 46 0 6 0 47 0 7 0
                                                   48 1 38 8 0 49 1 38 8 0 50 1
                                                   13 52 0 53 0 6 0 54 0 7 0 55
                                                   1 13 7 0 56 1 57 0 19 58 0
                                                   57 0 59 2 57 0 60 0 61 2 60
                                                   8 0 0 62 2 63 8 0 0 64 3 20
                                                   11 19 12 57 65 1 7 0 12 66 1
                                                   13 0 7 67 2 68 0 13 13 69 2
                                                   73 72 7 68 74 2 7 8 0 0 75 2
                                                   7 0 0 12 76 4 20 11 19 12 19
                                                   15 77 2 78 0 7 7 79 3 73 70
                                                   7 78 15 80 1 81 60 15 82 1
                                                   84 83 0 85 1 81 11 6 86 1 84
                                                   87 0 88 1 89 84 0 90 1 84 6
                                                   0 91 1 89 94 0 95 1 84 96 0
                                                   97 1 84 6 0 98 1 84 99 0 100
                                                   2 84 63 0 101 102 1 101 28 0
                                                   103 2 28 8 0 12 104 1 101
                                                   105 0 106 1 105 7 0 107 1 7
                                                   60 0 108 1 60 8 0 109 2 7 0
                                                   0 0 110 1 0 11 7 51 4 0 11 7
                                                   12 7 15 16 3 0 11 7 12 13
                                                   14)))))
           '|lookupComplete|)) 
