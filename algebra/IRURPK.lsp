
(/VERSIONCHECK 2) 

(DEFUN |IRURPK;checkRur;TSLB;1| (|ts| |lts| $)
  (PROG (#1=#:G136 #2=#:G139 |rems| #3=#:G142 |p| #4=#:G141 |dlts| #5=#:G140
         |us| |lp| |dts| |z| |f0| #6=#:G129)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (LETT |f0|
              (PROG2
                  (LETT #6# (SPADCALL |ts| (QREFELT $ 12))
                        . #7=(|IRURPK;checkRur;TSLB;1|))
                  (QCDR #6#)
                (|check_union| (QEQCAR #6# 0) (QREFELT $ 9) #6#))
              . #7#)
        (LETT |z| (SPADCALL |f0| (QREFELT $ 13)) . #7#)
        (LETT |ts| (SPADCALL |ts| |z| (QREFELT $ 14)) . #7#)
        (LETT |dts| (SPADCALL |ts| (QREFELT $ 16)) . #7#)
        (LETT |lp| (SPADCALL |ts| (QREFELT $ 18)) . #7#) (LETT |dlts| 0 . #7#)
        (SEQ (LETT |us| NIL . #7#) (LETT #5# |lts| . #7#) G190
             (COND
              ((OR (ATOM #5#) (PROGN (LETT |us| (CAR #5#) . #7#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (SEQ
                (LETT |dlts| (+ |dlts| (SPADCALL |us| (QREFELT $ 16))) . #7#)
                (LETT |rems|
                      (PROGN
                       (LETT #4# NIL . #7#)
                       (SEQ (LETT |p| NIL . #7#) (LETT #3# |lp| . #7#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |p| (CAR #3#) . #7#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #4#
                                    (CONS (SPADCALL |p| |us| (QREFELT $ 19))
                                          #4#)
                                    . #7#)))
                            (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                            (EXIT (NREVERSE #4#))))
                      . #7#)
                (EXIT
                 (COND
                  ((NULL (SPADCALL (ELT $ 21) |rems| (QREFELT $ 23)))
                   (PROGN
                    (LETT #1#
                          (SEQ
                           (SPADCALL (SPADCALL |us| (QREFELT $ 25))
                                     (QREFELT $ 28))
                           (EXIT (PROGN (LETT #2# 'NIL . #7#) (GO #2#))))
                          . #7#)
                    (GO #1#)))))))
              #1# (EXIT #1#))
             (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
        (EXIT (EQL |dts| |dlts|))))
      #2# (EXIT #2#))))) 

(DEFUN |IRURPK;convert| (|p| |sqfr?| $)
  (PROG (|newts|)
    (RETURN
     (SEQ (LETT |newts| (SPADCALL (QREFELT $ 31)) . #1=(|IRURPK;convert|))
          (EXIT
           (COND (|sqfr?| (SPADCALL |p| |newts| (QREFELT $ 32)))
                 ('T
                  (SEQ (LETT |p| (SPADCALL |p| (QREFELT $ 33)) . #1#)
                       (EXIT (SPADCALL |p| |newts| (QREFELT $ 32))))))))))) 

(DEFUN |IRURPK;prepareRur| (|ts| $)
  (PROG (|toSave| |newf0| #1=#:G159 |ff1| |newf1| |x1| |lp| |f1| |z| |f0|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |ts| (QREFELT $ 34)))
        (|error| "rur$IRURPK: #1 is not zero-dimensional"))
       ('T
        (SEQ
         (LETT |lp| (SPADCALL |ts| (QREFELT $ 18)) . #2=(|IRURPK;prepareRur|))
         (LETT |lp| (SPADCALL (ELT $ 35) |lp| (QREFELT $ 37)) . #2#)
         (EXIT
          (COND ((NULL |lp|) (|error| "rur$IRURPK: #1 is empty"))
                (#3='T
                 (SEQ (LETT |f0| (|SPADfirst| |lp|) . #2#)
                      (LETT |lp| (CDR |lp|) . #2#)
                      (COND
                       ((SPADCALL (SPADCALL |f0| (QREFELT $ 38))
                                  (|spadConstant| $ 39) (QREFELT $ 40))
                        (COND
                         ((EQL (SPADCALL |f0| (QREFELT $ 41)) 1)
                          (COND
                           ((NULL
                             (SPADCALL (SPADCALL |f0| (QREFELT $ 43))
                                       (QREFELT $ 21)))
                            (EXIT
                             (|error|
                              #4="rur$IRURPK: #1 has no generating root.")))))
                         (#3# (EXIT (|error| #4#)))))
                       (#3# (EXIT (|error| #4#))))
                      (EXIT
                       (COND
                        ((NULL |lp|)
                         (|error|
                          "rur$IRURPK: #1 has a generating root but no indeterminates"))
                        (#3#
                         (SEQ (LETT |z| (SPADCALL |f0| (QREFELT $ 13)) . #2#)
                              (LETT |f1| (|SPADfirst| |lp|) . #2#)
                              (LETT |lp| (CDR |lp|) . #2#)
                              (LETT |x1| (SPADCALL |f1| (QREFELT $ 13)) . #2#)
                              (LETT |newf1|
                                    (SPADCALL (SPADCALL |x1| (QREFELT $ 44))
                                              (SPADCALL |z| (QREFELT $ 44))
                                              (QREFELT $ 45))
                                    . #2#)
                              (LETT |toSave| NIL . #2#)
                              (SEQ (LETT |ff1| NIL . #2#)
                                   (LETT #1#
                                         (SPADCALL (LIST |f1|) (QREFELT $ 47))
                                         . #2#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |ff1| (CAR #1#) . #2#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |newf0|
                                          (SPADCALL |ff1|
                                                    (SPADCALL |f1|
                                                              (QREFELT $ 13))
                                                    |f0| (QREFELT $ 48))
                                          . #2#)
                                    (LETT |ts|
                                          (SPADCALL |newf1|
                                                    (|IRURPK;convert| |newf0|
                                                     'T $)
                                                    (QREFELT $ 32))
                                          . #2#)
                                    (EXIT
                                     (LETT |toSave|
                                           (CONS (CONS |lp| |ts|) |toSave|)
                                           . #2#)))
                                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT |toSave|)))))))))))))))) 

(DEFUN |IRURPK;makeMonic| (|z| |c| |r| |ts| |s| |univ?| $)
  (PROG (|newts| |p| #1=#:G167 |lp|)
    (RETURN
     (SEQ (LETT |lp| (SPADCALL |ts| (QREFELT $ 18)) . #2=(|IRURPK;makeMonic|))
          (LETT |lp| (SPADCALL (ELT $ 35) |lp| (QREFELT $ 37)) . #2#)
          (LETT |newts| (|IRURPK;convert| |r| 'T $) . #2#)
          (LETT |s| (QVELT (SPADCALL |s| |newts| (QREFELT $ 50)) 1) . #2#)
          (COND
           (|univ?| (LETT |s| (SPADCALL |s| |newts| (QREFELT $ 52)) . #2#)))
          (SEQ (LETT |p| NIL . #2#) (LETT #1# |lp| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (LETT |p|
                      (SPADCALL (SPADCALL |p| |z| |c| (QREFELT $ 48)) |s|
                                (QREFELT $ 53))
                      . #2#)
                (LETT |p| (QVELT (SPADCALL |p| |newts| (QREFELT $ 50)) 1)
                      . #2#)
                (EXIT
                 (LETT |newts| (SPADCALL |p| |newts| (QREFELT $ 32)) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |s| |newts| (QREFELT $ 32))))))) 

(DEFUN |IRURPK;next| (|lambda| $)
  (COND
   ((< |lambda| 0) (LETT |lambda| (+ (- |lambda|) 1) . #1=(|IRURPK;next|)))
   ('T (LETT |lambda| (- |lambda|) . #1#)))) 

(DEFUN |IRURPK;makeLinearAndMonic| (|p| |xi| |ts| |univ?| |check?| |info?| $)
  (PROG (|toSee| |toSave| #1=#:G195 |fr| |r| |h| |s| |prs| |q| |f| |c| |lambda|
         |f0| |#G35| |#G34| |#G33| |wip| |z| #2=#:G170)
    (RETURN
     (SEQ
      (LETT |f0|
            (PROG2
                (LETT #2# (SPADCALL |ts| (QREFELT $ 12))
                      . #3=(|IRURPK;makeLinearAndMonic|))
                (QCDR #2#)
              (|check_union| (QEQCAR #2# 0) (QREFELT $ 9) #2#))
            . #3#)
      (LETT |z| (SPADCALL |f0| (QREFELT $ 13)) . #3#) (LETT |lambda| 1 . #3#)
      (LETT |ts| (SPADCALL |ts| |z| (QREFELT $ 14)) . #3#)
      (LETT |toSee| (LIST (VECTOR |f0| |lambda| |ts|)) . #3#)
      (LETT |toSave| NIL . #3#)
      (SEQ G190 (COND ((NULL (COND ((NULL |toSee|) 'NIL) ('T 'T))) (GO G191)))
           (SEQ (LETT |wip| (|SPADfirst| |toSee|) . #3#)
                (LETT |toSee| (CDR |toSee|) . #3#)
                (PROGN
                 (LETT |#G33| (QVELT |wip| 0) . #3#)
                 (LETT |#G34| (QVELT |wip| 1) . #3#)
                 (LETT |#G35| (QVELT |wip| 2) . #3#)
                 (LETT |f0| |#G33| . #3#)
                 (LETT |lambda| |#G34| . #3#)
                 (LETT |ts| |#G35| . #3#))
                (COND
                 (|check?|
                  (COND
                   ((SPADCALL |f0| (QREFELT $ 56))
                    (COND
                     ((SPADCALL (SPADCALL |f0| (QREFELT $ 13)) |z|
                                (QREFELT $ 57))
                      (SEQ (SPADCALL #4="Bad f0: " (QREFELT $ 59))
                           (EXIT
                            (SPADCALL (SPADCALL |f0| (QREFELT $ 60))
                                      (QREFELT $ 28)))))))
                   ('T
                    (SEQ (SPADCALL #4# (QREFELT $ 59))
                         (EXIT
                          (SPADCALL (SPADCALL |f0| (QREFELT $ 60))
                                    (QREFELT $ 28))))))))
                (LETT |c|
                      (SPADCALL
                       (SPADCALL |lambda| (SPADCALL |xi| (QREFELT $ 44))
                                 (QREFELT $ 62))
                       (SPADCALL |z| (QREFELT $ 44)) (QREFELT $ 63))
                      . #3#)
                (LETT |f| (SPADCALL |f0| |z| |c| (QREFELT $ 48)) . #3#)
                (LETT |q| (SPADCALL |p| |z| |c| (QREFELT $ 48)) . #3#)
                (LETT |prs| (SPADCALL |q| |f| (QREFELT $ 65)) . #3#)
                (LETT |r| (|SPADfirst| |prs|) . #3#)
                (LETT |prs| (CDR |prs|) . #3#)
                (COND
                 (|check?|
                  (COND
                   ((ZEROP (SPADCALL |r| |xi| (QREFELT $ 66)))
                    (COND
                     ((NULL |prs|)
                      (EXIT
                       (|error| #5="rur$IRURPK: should never happen !")))))
                   ('T (EXIT (|error| #5#))))))
                (LETT |s| (|SPADfirst| |prs|) . #3#)
                (LETT |prs| (CDR |prs|) . #3#)
                (COND
                 (|check?|
                  (COND
                   ((ZEROP (SPADCALL |s| |xi| (QREFELT $ 66)))
                    (COND
                     ((NULL |prs|)
                      (EXIT
                       (|error| "rur$IRURPK: should never happen !!"))))))))
                (COND
                 ((ZEROP (SPADCALL |s| |xi| (QREFELT $ 66)))
                  (LETT |s| (|SPADfirst| |prs|) . #3#)))
                (COND
                 ((NULL (EQL (SPADCALL |s| |xi| (QREFELT $ 66)) 1))
                  (EXIT
                   (LETT |toSee|
                         (CONS (VECTOR |f0| (|IRURPK;next| |lambda| $) |ts|)
                               |toSee|)
                         . #3#))))
                (LETT |h| (SPADCALL |s| (QREFELT $ 38)) . #3#)
                (LETT |r| (SPADCALL |r| (QREFELT $ 33)) . #3#)
                (COND
                 ((OR (SPADCALL |h| (QREFELT $ 67))
                      (SPADCALL (SPADCALL |h| |r| (QREFELT $ 68))
                                (QREFELT $ 67)))
                  (EXIT
                   (SEQ (LETT |fr| NIL . #3#)
                        (LETT #1# (SPADCALL (LIST |r|) (QREFELT $ 47)) . #3#)
                        G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |fr| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND ((SPADCALL |fr| (QREFELT $ 67)) "iterate")
                                ('T
                                 (LETT |toSave|
                                       (CONS
                                        (|IRURPK;makeMonic| |z| |c| |fr| |ts|
                                         |s| |univ?| $)
                                        |toSave|)
                                       . #3#)))))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT NIL)))))
                (COND
                 (|info?|
                  (SEQ (SPADCALL "Unlucky lambda" (QREFELT $ 59))
                       (SPADCALL (SPADCALL |h| (QREFELT $ 60)) (QREFELT $ 28))
                       (EXIT
                        (SPADCALL (SPADCALL |r| (QREFELT $ 60))
                                  (QREFELT $ 28))))))
                (EXIT
                 (LETT |toSee|
                       (CONS (VECTOR |f0| (|IRURPK;next| |lambda| $) |ts|)
                             |toSee|)
                       . #3#)))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |toSave|))))) 

(DEFUN |IRURPK;rur;TSBL;7| (|ts| |univ?| $)
  (PROG (|toSee| |wip| #1=#:G210 |lts| |p| |xi| |lp| |toSave|)
    (RETURN
     (SEQ
      (LETT |toSee| (|IRURPK;prepareRur| |ts| $) . #2=(|IRURPK;rur;TSBL;7|))
      (LETT |toSave| NIL . #2#)
      (SEQ G190 (COND ((NULL (COND ((NULL |toSee|) 'NIL) ('T 'T))) (GO G191)))
           (SEQ (LETT |wip| (|SPADfirst| |toSee|) . #2#)
                (LETT |toSee| (CDR |toSee|) . #2#)
                (LETT |ts| (QCDR |wip|) . #2#) (LETT |lp| (QCAR |wip|) . #2#)
                (EXIT
                 (COND ((NULL |lp|) (LETT |toSave| (CONS |ts| |toSave|) . #2#))
                       ('T
                        (SEQ (LETT |p| (|SPADfirst| |lp|) . #2#)
                             (LETT |lp| (CDR |lp|) . #2#)
                             (LETT |xi| (SPADCALL |p| (QREFELT $ 13)) . #2#)
                             (LETT |p|
                                   (QVELT (SPADCALL |p| |ts| (QREFELT $ 50)) 1)
                                   . #2#)
                             (COND
                              ((NULL |univ?|)
                               (LETT |p|
                                     (SPADCALL
                                      (SPADCALL |p| |ts| (QREFELT $ 69))
                                      (QREFELT $ 70))
                                     . #2#)))
                             (COND
                              ((OR (SPADCALL |p| (QREFELT $ 67))
                                   (SPADCALL (SPADCALL |p| (QREFELT $ 13)) |xi|
                                             (QREFELT $ 71)))
                               (EXIT
                                (|error| "rur$IRUROK: should never happen"))))
                             (COND
                              ((EQL (SPADCALL |p| (QREFELT $ 41)) 1)
                               (COND
                                ((SPADCALL (SPADCALL |p| (QREFELT $ 38))
                                           (QREFELT $ 67))
                                 (EXIT
                                  (SEQ
                                   (LETT |ts|
                                         (SPADCALL |p| |ts| (QREFELT $ 32))
                                         . #2#)
                                   (LETT |wip| (CONS |lp| |ts|) . #2#)
                                   (EXIT
                                    (LETT |toSee| (CONS |wip| |toSee|)
                                          . #2#))))))))
                             (LETT |lts|
                                   (|IRURPK;makeLinearAndMonic| |p| |xi| |ts|
                                    |univ?| 'NIL 'NIL $)
                                   . #2#)
                             (EXIT
                              (SEQ (LETT |ts| NIL . #2#) (LETT #1# |lts| . #2#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |ts| (CAR #1#) . #2#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ (LETT |wip| (CONS |lp| |ts|) . #2#)
                                        (EXIT
                                         (LETT |toSee| (CONS |wip| |toSee|)
                                               . #2#)))
                                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                                   (EXIT NIL))))))))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT |toSave|))))) 

(DECLAIM (NOTINLINE |InternalRationalUnivariateRepresentationPackage;|)) 

(DEFUN |InternalRationalUnivariateRepresentationPackage| (&REST #1=#:G211)
  (PROG ()
    (RETURN
     (PROG (#2=#:G212)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|InternalRationalUnivariateRepresentationPackage|)
                                           '|domainEqualList|)
                . #3=(|InternalRationalUnivariateRepresentationPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (APPLY
                   (|function|
                    |InternalRationalUnivariateRepresentationPackage;|)
                   #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache|
                    '|InternalRationalUnivariateRepresentationPackage|))))))))))) 

(DEFUN |InternalRationalUnivariateRepresentationPackage;|
       (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|)
            . #1=(|InternalRationalUnivariateRepresentationPackage|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$|
            (LIST '|InternalRationalUnivariateRepresentationPackage| DV$1 DV$2
                  DV$3 DV$4 DV$5)
            . #1#)
      (LETT $ (GETREFV 73) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache|
                  '|InternalRationalUnivariateRepresentationPackage|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|InternalRationalUnivariateRepresentationPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|Union| 9 '"failed") (0 . |last|) (5 . |mvar|)
              (10 . |collectUpper|) (|NonNegativeInteger|) (16 . |degree|)
              (|List| 9) (21 . |parts|) (26 . |removeZero|) (|Boolean|)
              (32 . |zero?|) (|Mapping| 20 9) (37 . |every?|) (|OutputForm|)
              (43 . |coerce|) (|Void|) (|OutputPackage|) (48 . |output|)
              (|List| 10) |IRURPK;checkRur;TSLB;1| (53 . |empty|)
              (57 . |internalAugment|) (63 . |squareFreePart|)
              (68 . |purelyAlgebraic?|) (73 . |infRittWu?|) (|Mapping| 20 9 9)
              (79 . |sort|) (85 . |init|) (90 . |One|) (94 . =) (100 . |mdeg|)
              (105 . |One|) (109 . |tail|) (114 . |coerce|) (119 . -)
              (|PolynomialSetUtilitiesPackage| 6 7 8 9)
              (125 . |irreducibleFactors|) (130 . |eval|)
              (|Record| (|:| |rnum| 6) (|:| |polnum| 9) (|:| |den| 6))
              (137 . |remainder|) (|NormalizationPackage| 6 7 8 9 10)
              (143 . |normalizedAssociate|) (149 . |lazyPrem|) (155 . |Zero|)
              (159 . |Zero|) (163 . |univariate?|) (168 . ~=) (|String|)
              (174 . |output|) (179 . |coerce|) (|Integer|) (184 . *) (190 . +)
              (|List| $) (196 . |subResultantChain|) (202 . |degree|)
              (208 . |ground?|) (213 . |gcd|) (219 . |stronglyReduce|)
              (225 . |primitivePart|) (230 . <) |IRURPK;rur;TSBL;7|)
           '#(|rur| 236 |checkRur| 242) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 72
                                                 '(1 10 11 0 12 1 9 8 0 13 2 10
                                                   0 0 8 14 1 10 15 0 16 1 10
                                                   17 0 18 2 10 9 9 0 19 1 9 20
                                                   0 21 2 17 20 22 0 23 1 10 24
                                                   0 25 1 27 26 24 28 0 10 0 31
                                                   2 10 0 9 0 32 1 9 0 0 33 1
                                                   10 20 0 34 2 9 20 0 0 35 2
                                                   17 0 36 0 37 1 9 0 0 38 0 9
                                                   0 39 2 9 20 0 0 40 1 9 15 0
                                                   41 0 6 0 42 1 9 0 0 43 1 9 0
                                                   8 44 2 9 0 0 0 45 1 46 17 17
                                                   47 3 9 0 0 8 0 48 2 10 49 9
                                                   0 50 2 51 9 9 10 52 2 9 0 0
                                                   0 53 0 6 0 54 0 7 0 55 1 46
                                                   20 9 56 2 8 20 0 0 57 1 27
                                                   26 58 59 1 9 24 0 60 2 9 0
                                                   61 0 62 2 9 0 0 0 63 2 9 64
                                                   0 0 65 2 9 15 0 8 66 1 9 20
                                                   0 67 2 9 0 0 0 68 2 10 9 9 0
                                                   69 1 9 0 0 70 2 8 20 0 0 71
                                                   2 0 29 10 20 72 2 0 20 10 29
                                                   30)))))
           '|lookupComplete|)) 
