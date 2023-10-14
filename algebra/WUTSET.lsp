
(PUT '|WUTSET;rep| '|SPADreplace| '(XLAM (|s|) |s|)) 

(DEFUN |WUTSET;rep| (|s| $) |s|) 

(PUT '|WUTSET;per| '|SPADreplace| '(XLAM (|l|) |l|)) 

(DEFUN |WUTSET;per| (|l| $) |l|) 

(DEFUN |WUTSET;removeAssociates| (|lp| $)
  (PROG (#1=#:G126 |p| #2=#:G125)
    (RETURN
     (SEQ
      (SPADCALL
       (PROGN
        (LETT #2# NIL . #3=(|WUTSET;removeAssociates|))
        (SEQ (LETT |p| NIL . #3#) (LETT #1# |lp| . #3#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
               (GO G191)))
             (SEQ
              (EXIT (LETT #2# (CONS (SPADCALL |p| (QREFELT $ 10)) #2#) . #3#)))
             (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
       (QREFELT $ 12)))))) 

(DEFUN |WUTSET;medialSetWithTrace| (|ps| |redOp?| |redOp| $)
  (PROG (|contradiction| |rs| #1=#:G129 |bs| |rec| |qs|)
    (RETURN
     (SEQ
      (LETT |qs| (SPADCALL |ps| |redOp?| |redOp| (QREFELT $ 16))
            . #2=(|WUTSET;medialSetWithTrace|))
      (LETT |contradiction| (SPADCALL (ELT $ 18) |ps| (QREFELT $ 20)) . #2#)
      (EXIT
       (COND (|contradiction| (CONS 1 "failed"))
             (#3='T
              (SEQ (LETT |rs| |qs| . #2#)
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND ((OR (NULL |rs|) |contradiction|) 'NIL)
                                 ('T 'T)))
                          (GO G191)))
                        (SEQ
                         (LETT |rec| (SPADCALL |rs| |redOp?| (QREFELT $ 23))
                               . #2#)
                         (LETT |contradiction| (QEQCAR |rec| 1) . #2#)
                         (COND
                          ((NULL |contradiction|)
                           (SEQ
                            (LETT |bs|
                                  (QCAR
                                   (PROG2 (LETT #1# |rec| . #2#)
                                       (QCDR #1#)
                                     (|check_union| (QEQCAR #1# 0)
                                                    (|Record| (|:| |bas| $)
                                                              (|:| |top|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             9))))
                                                    #1#)))
                                  . #2#)
                            (LETT |rs|
                                  (QCDR
                                   (PROG2 (LETT #1# |rec| . #2#)
                                       (QCDR #1#)
                                     (|check_union| (QEQCAR #1# 0)
                                                    (|Record| (|:| |bas| $)
                                                              (|:| |top|
                                                                   (|List|
                                                                    (QREFELT $
                                                                             9))))
                                                    #1#)))
                                  . #2#)
                            (LETT |rs| (SPADCALL |rs| |bs| (QREFELT $ 24))
                                  . #2#)
                            (LETT |contradiction|
                                  (COND ((NULL |rs|) 'NIL)
                                        ('T
                                         (SPADCALL (|SPADfirst| |rs|)
                                                   (|spadConstant| $ 25)
                                                   (QREFELT $ 26))))
                                  . #2#)
                            (EXIT
                             (COND
                              ((NULL (NULL |rs|))
                               (COND
                                ((NULL |contradiction|)
                                 (SEQ
                                  (LETT |rs|
                                        (SPADCALL |rs| |bs| |redOp| |redOp?|
                                                  (QREFELT $ 27))
                                        . #2#)
                                  (EXIT
                                   (LETT |contradiction|
                                         (COND ((NULL |rs|) 'NIL)
                                               ('T
                                                (SPADCALL (|SPADfirst| |rs|)
                                                          (|spadConstant| $ 25)
                                                          (QREFELT $ 26))))
                                         . #2#)))))))))))
                         (EXIT
                          (COND
                           ((NULL (NULL |rs|))
                            (COND
                             ((NULL |contradiction|)
                              (SEQ
                               (LETT |rs|
                                     (SPADCALL
                                      (SPADCALL |rs|
                                                (SPADCALL |bs| (QREFELT $ 28))
                                                (QREFELT $ 29))
                                      (QREFELT $ 12))
                                     . #2#)
                               (LETT |rs|
                                     (SPADCALL |rs| |redOp?| |redOp|
                                               (QREFELT $ 16))
                                     . #2#)
                               (EXIT
                                (LETT |contradiction|
                                      (COND ((NULL |rs|) 'NIL)
                                            ('T
                                             (SPADCALL (|SPADfirst| |rs|)
                                                       (|spadConstant| $ 25)
                                                       (QREFELT $ 26))))
                                      . #2#)))))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (COND (|contradiction| (CONS 1 "failed"))
                          (#3# (CONS 0 (CONS |bs| |qs|))))))))))))) 

(DEFUN |WUTSET;medialSet;LMMU;5| (|ps| |redOp?| |redOp| $)
  (PROG (|foo|)
    (RETURN
     (SEQ
      (LETT |foo| (|WUTSET;medialSetWithTrace| |ps| |redOp?| |redOp| $)
            |WUTSET;medialSet;LMMU;5|)
      (EXIT
       (COND ((QEQCAR |foo| 1) (CONS 1 "failed"))
             ('T (CONS 0 (QCAR (QCDR |foo|)))))))))) 

(DEFUN |WUTSET;medialSet;LU;6| (|ps| $)
  (SPADCALL |ps| (ELT $ 32) (ELT $ 33) (QREFELT $ 31))) 

(DEFUN |WUTSET;characteristicSetUsingTrace| (|ps| |redOp?| |redOp| $)
  (PROG (|qs| |contradiction| |rs| #1=#:G129 |ms| |rec|)
    (RETURN
     (SEQ
      (LETT |ps| (|WUTSET;removeAssociates| |ps| $)
            . #2=(|WUTSET;characteristicSetUsingTrace|))
      (LETT |ps| (SPADCALL (ELT $ 35) |ps| (QREFELT $ 36)) . #2#)
      (LETT |contradiction| (SPADCALL (ELT $ 18) |ps| (QREFELT $ 20)) . #2#)
      (EXIT
       (COND (|contradiction| (CONS 1 "failed"))
             (#3='T
              (SEQ (LETT |rs| |ps| . #2#) (LETT |qs| |ps| . #2#)
                   (SEQ G190
                        (COND
                         ((NULL
                           (COND ((OR (NULL |rs|) |contradiction|) 'NIL)
                                 ('T 'T)))
                          (GO G191)))
                        (SEQ
                         (LETT |rec|
                               (|WUTSET;medialSetWithTrace| |qs| |redOp?|
                                |redOp| $)
                               . #2#)
                         (LETT |contradiction| (QEQCAR |rec| 1) . #2#)
                         (EXIT
                          (COND
                           ((NULL |contradiction|)
                            (SEQ
                             (LETT |ms|
                                   (QCAR
                                    (PROG2 (LETT #1# |rec| . #2#)
                                        (QCDR #1#)
                                      (|check_union| (QEQCAR #1# 0)
                                                     (|Record| (|:| |bas| $)
                                                               (|:| |top|
                                                                    (|List|
                                                                     (QREFELT $
                                                                              9))))
                                                     #1#)))
                                   . #2#)
                             (LETT |qs|
                                   (QCDR
                                    (PROG2 (LETT #1# |rec| . #2#)
                                        (QCDR #1#)
                                      (|check_union| (QEQCAR #1# 0)
                                                     (|Record| (|:| |bas| $)
                                                               (|:| |top|
                                                                    (|List|
                                                                     (QREFELT $
                                                                              9))))
                                                     #1#)))
                                   . #2#)
                             (LETT |qs| (SPADCALL |qs| |ms| (QREFELT $ 24))
                                   . #2#)
                             (LETT |contradiction|
                                   (COND ((NULL |qs|) 'NIL)
                                         ('T
                                          (SPADCALL (|SPADfirst| |qs|)
                                                    (|spadConstant| $ 25)
                                                    (QREFELT $ 26))))
                                   . #2#)
                             (COND
                              ((NULL |contradiction|)
                               (SEQ
                                (LETT |rs|
                                      (SPADCALL |qs| |ms| (ELT $ 37) (ELT $ 38)
                                                (QREFELT $ 27))
                                      . #2#)
                                (EXIT
                                 (LETT |contradiction|
                                       (COND ((NULL |rs|) 'NIL)
                                             ('T
                                              (SPADCALL (|SPADfirst| |rs|)
                                                        (|spadConstant| $ 25)
                                                        (QREFELT $ 26))))
                                       . #2#)))))
                             (EXIT
                              (COND
                               ((NULL |contradiction|)
                                (COND
                                 ((NULL (NULL |rs|))
                                  (LETT |qs|
                                        (SPADCALL
                                         (SPADCALL |rs|
                                                   (SPADCALL
                                                    (SPADCALL |ms|
                                                              (QREFELT $ 28))
                                                    |qs| (QREFELT $ 29))
                                                   (QREFELT $ 29))
                                         (QREFELT $ 12))
                                        . #2#)))))))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT
                    (COND (|contradiction| (CONS 1 "failed"))
                          (#3# (CONS 0 |ms|)))))))))))) 

(DEFUN |WUTSET;characteristicSet;LMMU;8| (|ps| |redOp?| |redOp| $)
  (|WUTSET;characteristicSetUsingTrace| |ps| |redOp?| |redOp| $)) 

(DEFUN |WUTSET;characteristicSet;LU;9| (|ps| $)
  (SPADCALL |ps| (ELT $ 32) (ELT $ 33) (QREFELT $ 39))) 

(DEFUN |WUTSET;characteristicSerie;LMML;10| (|ps| |redOp?| |redOp| $)
  (PROG (#1=#:G215 |ln| |newps| |lics| |cs| |charSet?| |esl| |a|)
    (RETURN
     (SEQ
      (LETT |a|
            (SPADCALL (SPADCALL |ps| (SPADCALL (QREFELT $ 41)) (QREFELT $ 43))
                      (QREFELT $ 45))
            . #2=(|WUTSET;characteristicSerie;LMML;10|))
      (SEQ G190
           (COND
            ((NULL (QEQCAR (LETT |esl| (SPADCALL |a| (QREFELT $ 46)) . #2#) 0))
             (GO G191)))
           (SEQ
            (LETT |ps|
                  (SPADCALL
                   (SPADCALL
                    (PROG2 (LETT #1# |esl| . #2#)
                        (QCDR #1#)
                      (|check_union| (QEQCAR #1# 0)
                                     (|SplittingTree| (|List| (QREFELT $ 9)) $)
                                     #1#))
                    (QREFELT $ 47))
                   (QREFELT $ 48))
                  . #2#)
            (LETT |charSet?|
                  (|WUTSET;characteristicSetUsingTrace| |ps| |redOp?| |redOp|
                   $)
                  . #2#)
            (EXIT
             (COND
              ((QEQCAR |charSet?| 0)
               (SEQ (LETT |cs| (QCDR |charSet?|) . #2#)
                    (LETT |lics| (SPADCALL |cs| (QREFELT $ 49)) . #2#)
                    (LETT |lics| (SPADCALL |lics| (QREFELT $ 50)) . #2#)
                    (LETT |lics| (SPADCALL (ELT $ 51) |lics| (QREFELT $ 52))
                          . #2#)
                    (EXIT
                     (COND
                      ((NULL |lics|)
                       (SEQ
                        (SPADCALL
                         (PROG2 (LETT #1# |esl| . #2#)
                             (QCDR #1#)
                           (|check_union| (QEQCAR #1# 0)
                                          (|SplittingTree|
                                           (|List| (QREFELT $ 9)) $)
                                          #1#))
                         (SPADCALL |ps| |cs| 'T (QREFELT $ 53)) (QREFELT $ 54))
                        (EXIT (SPADCALL |a| (QREFELT $ 55)))))
                      ('T
                       (SEQ
                        (LETT |ln| (LIST (SPADCALL NIL |cs| 'T (QREFELT $ 53)))
                              . #2#)
                        (SEQ G190
                             (COND
                              ((NULL (COND ((NULL |lics|) 'NIL) ('T 'T)))
                               (GO G191)))
                             (SEQ
                              (LETT |newps|
                                    (CONS (|SPADfirst| |lics|)
                                          (SPADCALL
                                           (SPADCALL |cs| (QREFELT $ 56)) |ps|
                                           (QREFELT $ 29)))
                                    . #2#)
                              (LETT |lics| (CDR |lics|) . #2#)
                              (LETT |newps| (SPADCALL |newps| (QREFELT $ 12))
                                    . #2#)
                              (LETT |newps|
                                    (SPADCALL (ELT $ 51) |newps|
                                              (QREFELT $ 52))
                                    . #2#)
                              (EXIT
                               (LETT |ln|
                                     (SPADCALL
                                      (SPADCALL |newps|
                                                (SPADCALL (QREFELT $ 41)) 'NIL
                                                (QREFELT $ 53))
                                      |ln| (QREFELT $ 58))
                                     . #2#)))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (SPADCALL
                          (PROG2 (LETT #1# |esl| . #2#)
                              (QCDR #1#)
                            (|check_union| (QEQCAR #1# 0)
                                           (|SplittingTree|
                                            (|List| (QREFELT $ 9)) $)
                                           #1#))
                          |a| |ln| (QREFELT $ 59)))))))))
              ('T
               (SEQ
                (SPADCALL
                 (PROG2 (LETT #1# |esl| . #2#)
                     (QCDR #1#)
                   (|check_union| (QEQCAR #1# 0)
                                  (|SplittingTree| (|List| (QREFELT $ 9)) $)
                                  #1#))
                 (SPADCALL NIL (SPADCALL (QREFELT $ 41)) 'T (QREFELT $ 53))
                 (QREFELT $ 54))
                (EXIT (SPADCALL |a| (QREFELT $ 55))))))))
           NIL (GO G190) G191 (EXIT NIL))
      (EXIT
       (SPADCALL (SPADCALL (QREFELT $ 41)) (SPADCALL |a| (QREFELT $ 61))
                 (QREFELT $ 62))))))) 

(DEFUN |WUTSET;characteristicSerie;LL;11| (|ps| $)
  (SPADCALL |ps| (ELT $ 32) (ELT $ 33) (QREFELT $ 64))) 

(DEFUN |WUTSET;removeSquares| (|ts| $)
  (PROG (|p| |newts| |rsts| #1=#:G180 #2=#:G242)
    (RETURN
     (SEQ
      (COND ((SPADCALL |ts| (QREFELT $ 66)) (CONS 0 |ts|))
            (#3='T
             (SEQ
              (LETT |p|
                    (PROG2
                        (LETT #2# (SPADCALL |ts| (QREFELT $ 68))
                              . #4=(|WUTSET;removeSquares|))
                        (QCDR #2#)
                      (|check_union| (QEQCAR #2# 0) (QREFELT $ 9) #2#))
                    . #4#)
              (LETT |rsts|
                    (|WUTSET;removeSquares|
                     (PROG2 (LETT #1# (SPADCALL |ts| (QREFELT $ 69)) . #4#)
                         (QCDR #1#)
                       (|check_union| (QEQCAR #1# 0) $ #1#))
                     $)
                    . #4#)
              (EXIT
               (COND
                ((QEQCAR |rsts| 0)
                 (SEQ (LETT |newts| (QCDR |rsts|) . #4#)
                      (EXIT
                       (COND
                        ((SPADCALL |newts| (QREFELT $ 66))
                         (SEQ (LETT |p| (SPADCALL |p| (QREFELT $ 70)) . #4#)
                              (EXIT
                               (CONS 0
                                     (|WUTSET;per|
                                      (LIST (SPADCALL |p| (QREFELT $ 71)))
                                      $)))))
                        ((SPADCALL
                          (SPADCALL (SPADCALL |p| (QREFELT $ 72)) |newts|
                                    (QREFELT $ 73))
                          (QREFELT $ 35))
                         (CONS 1 "failed"))
                        (#3#
                         (SEQ
                          (LETT |p|
                                (SPADCALL (SPADCALL |p| |newts| (QREFELT $ 74))
                                          (QREFELT $ 71))
                                . #4#)
                          (EXIT
                           (COND
                            ((OR (SPADCALL |p| (QREFELT $ 18))
                                 (NULL
                                  (SPADCALL (SPADCALL |newts| (QREFELT $ 75))
                                            (SPADCALL |p| (QREFELT $ 76))
                                            (QREFELT $ 77))))
                             (CONS 1 "failed"))
                            ('T
                             (SEQ
                              (LETT |p| (SPADCALL |p| (QREFELT $ 70)) . #4#)
                              (EXIT
                               (CONS 0
                                     (|WUTSET;per|
                                      (CONS (SPADCALL |p| (QREFELT $ 78))
                                            (|WUTSET;rep| |newts| $))
                                      $)))))))))))))
                (#3# (CONS 1 "failed"))))))))))) 

(DEFUN |WUTSET;zeroSetSplit;LL;13| (|lp| $)
  (PROG (|newlts| |iic| |lts| |ts|)
    (RETURN
     (SEQ
      (LETT |lts| (SPADCALL |lp| (ELT $ 32) (ELT $ 33) (QREFELT $ 64))
            . #1=(|WUTSET;zeroSetSplit;LL;13|))
      (LETT |lts| (SPADCALL |lts| (QREFELT $ 79)) . #1#)
      (LETT |newlts| NIL . #1#)
      (SEQ G190
           (COND
            ((NULL (COND ((SPADCALL |lts| (QREFELT $ 80)) 'NIL) ('T 'T)))
             (GO G191)))
           (SEQ (LETT |ts| (SPADCALL |lts| (QREFELT $ 81)) . #1#)
                (LETT |lts| (SPADCALL |lts| (QREFELT $ 82)) . #1#)
                (LETT |iic| (|WUTSET;removeSquares| |ts| $) . #1#)
                (EXIT
                 (COND
                  ((QEQCAR |iic| 0)
                   (LETT |newlts|
                         (SPADCALL (QCDR |iic|) |newlts| (QREFELT $ 83))
                         . #1#)))))
           NIL (GO G190) G191 (EXIT NIL))
      (LETT |newlts| (SPADCALL |newlts| (QREFELT $ 79)) . #1#)
      (EXIT (SPADCALL (ELT $ 84) |newlts| (QREFELT $ 86))))))) 

(DEFUN |WUTSET;zeroSetSplit;LL;14| (|lp| $)
  (PROG (|lts|)
    (RETURN
     (SEQ
      (LETT |lts| (SPADCALL |lp| (ELT $ 32) (ELT $ 33) (QREFELT $ 64))
            |WUTSET;zeroSetSplit;LL;14|)
      (EXIT
       (SPADCALL (ELT $ 84) (SPADCALL |lts| (QREFELT $ 79)) (QREFELT $ 86))))))) 

(DECLAIM (NOTINLINE |WuWenTsunTriangularSet;|)) 

(DEFUN |WuWenTsunTriangularSet| (&REST #1=#:G281)
  (PROG ()
    (RETURN
     (PROG (#2=#:G282)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|WuWenTsunTriangularSet|)
                                           '|domainEqualList|)
                . #3=(|WuWenTsunTriangularSet|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |WuWenTsunTriangularSet;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|WuWenTsunTriangularSet|))))))))))) 

(DEFUN |WuWenTsunTriangularSet;| (|#1| |#2| |#3| |#4|)
  (PROG (#1=#:G280 |pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #2=(|WuWenTsunTriangularSet|))
      (LETT DV$2 (|devaluate| |#2|) . #2#)
      (LETT DV$3 (|devaluate| |#3|) . #2#)
      (LETT DV$4 (|devaluate| |#4|) . #2#)
      (LETT |dv$| (LIST '|WuWenTsunTriangularSet| DV$1 DV$2 DV$3 DV$4) . #2#)
      (LETT $ (GETREFV 105) . #2#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (AND
                                           (|HasCategory| |#4|
                                                          (LIST '|Evalable|
                                                                (|devaluate|
                                                                 |#4|)))
                                           (|HasCategory| |#4|
                                                          '(|SetCategory|)))
                                          (|HasCategory| |#4|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#4| '(|BasicType|))
                                          (|HasCategory| |#1|
                                                         '(|IntegralDomain|))
                                          (|HasCategory| |#3| '(|Finite|))))
                      . #2#))
      (|haddProp| |$ConstructorCache| '|WuWenTsunTriangularSet|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (AND (|HasCategory| $ '(|shallowlyMutable|)) (|augmentPredVector| $ 32))
      (AND (LETT #1# (|HasCategory| $ '(|finiteAggregate|)) . #2#)
           (|augmentPredVector| $ 64))
      (AND (|HasCategory| |#4| '(|BasicType|)) #1# (|augmentPredVector| $ 128))
      (SETF |pv$| (QREFELT $ 3))
      (COND
       ((|HasCategory| |#1| '(|GcdDomain|))
        (PROGN
         (QSETREFV $ 87
                   (CONS (|dispatchFunction| |WUTSET;zeroSetSplit;LL;13|) $))))
       ('T
        (QSETREFV $ 87
                  (CONS (|dispatchFunction| |WUTSET;zeroSetSplit;LL;14|) $))))
      $)))) 

(MAKEPROP '|WuWenTsunTriangularSet| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|GeneralTriangularSet| 6 7 8 9)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (0 . |primPartElseUnitCanonical|) (|List| 9)
              (5 . |removeDuplicates|) (|Mapping| 17 9 9) (|Mapping| 9 9 9)
              (|PolynomialSetUtilitiesPackage| 6 7 8 9)
              (10 . |rewriteIdealWithQuasiMonicGenerators|) (|Boolean|)
              (17 . |ground?|) (|Mapping| 17 9) (22 . |any?|)
              (|Record| (|:| |bas| $) (|:| |top| 11)) (|Union| 21 '#1="failed")
              (28 . |basicSet|) (34 . |rewriteIdealWithRemainder|) (40 . |One|)
              (44 . =) (50 . |rewriteSetWithReduction|) (58 . |members|)
              (63 . |concat|) (|Union| $ '"failed") |WUTSET;medialSet;LMMU;5|
              (69 . |initiallyReduced?|) (75 . |initiallyReduce|)
              |WUTSET;medialSet;LU;6| (81 . |zero?|) (86 . |remove|)
              (92 . |lazyPrem|) (98 . |reduced?|)
              |WUTSET;characteristicSet;LMMU;8| |WUTSET;characteristicSet;LU;9|
              (104 . |empty|) (|SplittingNode| 11 $$) (108 . |construct|)
              (|SplittingTree| 11 $$) (114 . |construct|)
              (119 . |extractSplittingLeaf|) (124 . |value|) (129 . |value|)
              (134 . |initials|) (139 . |removeRedundantFactors|)
              (144 . |infRittWu?|) (150 . |sort|) (156 . |construct|)
              (163 . |setvalue!|) (169 . |updateStatus!|) (174 . |coerce|)
              (|List| 42) (179 . |cons|) (185 . |splitNodeOf!|) (|List| $$)
              (192 . |conditions|) (197 . |remove|) (|List| $)
              |WUTSET;characteristicSerie;LMML;10|
              |WUTSET;characteristicSerie;LL;11| (203 . |empty?|)
              (|Union| 9 '#1#) (208 . |first|) (213 . |rest|)
              (218 . |squareFreePart|) (223 . |primitivePart|) (228 . |init|)
              (233 . |initiallyReduce|) (239 . |removeZero|) (245 . |mvar|)
              (250 . |mvar|) (255 . <) (261 . |unitCanonical|)
              (266 . |removeDuplicates|) (271 . |empty?|) (276 . |first|)
              (281 . |rest|) (286 . |cons|) (292 . |infRittWu?|)
              (|Mapping| 17 $$ $$) (298 . |sort|) (304 . |zeroSetSplit|)
              (|NonNegativeInteger|) (|List| 90) (|Equation| 9) (|Mapping| 9 9)
              (|InputForm|) (|Record| (|:| |num| 9) (|:| |den| 6))
              (|Record| (|:| |rnum| 6) (|:| |polnum| 9) (|:| |den| 6))
              (|List| 8) (|Record| (|:| |close| $) (|:| |open| 11)) (|List| 96)
              (|Mapping| 17 9 11) (|Record| (|:| |close| 11) (|:| |open| 11))
              (|Record| (|:| |under| $) (|:| |floor| $) (|:| |upper| $))
              (|HashState|) (|String|) (|OutputForm|) (|SingleInteger|))
           '#(|zeroSetSplit| 309 |rewriteSetWithReduction| 314
              |rewriteIdealWithRemainder| 322 |rest| 328 |removeZero| 333
              |mvar| 339 |members| 344 |medialSet| 349 |initials| 361
              |initiallyReduce| 366 |infRittWu?| 372 |first| 378 |empty?| 383
              |empty| 388 |coerce| 392 |characteristicSet| 402
              |characteristicSerie| 414 |basicSet| 426)
           'NIL
           (CONS (|makeByteWordVec2| 2 '(0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 2))
                 (CONS
                  '#(|TriangularSetCategory&| |PolynomialSetCategory&|
                     |Collection&| |HomogeneousAggregate&| |SetCategory&|
                     |Aggregate&| |Evalable&| |BasicType&| NIL NIL
                     |RetractableFrom&| NIL NIL NIL |InnerEvalable&| NIL)
                  (CONS
                   '#((|TriangularSetCategory| 6 7 8 9)
                      (|PolynomialSetCategory| 6 7 8 9) (|Collection| 9)
                      (|HomogeneousAggregate| 9) (|SetCategory|) (|Aggregate|)
                      (|Evalable| 9) (|BasicType|) (|shallowlyMutable|)
                      (|finiteAggregate|) (|RetractableFrom| (|List| 9))
                      (|CoercibleTo| (|List| 9)) (|Type|) (|CoercibleTo| 103)
                      (|InnerEvalable| 9 9) (|ConvertibleTo| 92))
                   (|makeByteWordVec2| 87
                                       '(1 9 0 0 10 1 11 0 0 12 3 15 11 11 13
                                         14 16 1 9 17 0 18 2 11 17 19 0 20 2 0
                                         22 11 13 23 2 0 11 11 0 24 0 9 0 25 2
                                         9 17 0 0 26 4 0 11 11 0 14 13 27 1 0
                                         11 0 28 2 11 0 0 0 29 2 9 17 0 0 32 2
                                         9 0 0 0 33 1 9 17 0 35 2 11 0 19 0 36
                                         2 9 0 0 0 37 2 9 17 0 0 38 0 0 0 41 2
                                         42 0 11 2 43 1 44 0 42 45 1 44 30 0 46
                                         1 44 42 0 47 1 42 11 0 48 1 0 11 0 49
                                         1 15 11 11 50 2 9 17 0 0 51 2 11 0 13
                                         0 52 3 42 0 11 2 17 53 2 44 42 0 42 54
                                         1 44 0 0 55 1 0 11 0 56 2 57 0 42 0 58
                                         3 44 0 0 0 57 59 1 44 60 0 61 2 60 0 2
                                         0 62 1 0 17 0 66 1 0 67 0 68 1 0 30 0
                                         69 1 9 0 0 70 1 9 0 0 71 1 9 0 0 72 2
                                         0 9 9 0 73 2 0 9 9 0 74 1 0 8 0 75 1 9
                                         8 0 76 2 8 17 0 0 77 1 9 0 0 78 1 60 0
                                         0 79 1 60 17 0 80 1 60 2 0 81 1 60 0 0
                                         82 2 60 0 2 0 83 2 0 17 0 0 84 2 60 0
                                         85 0 86 1 0 63 11 87 1 0 63 11 87 4 0
                                         11 11 0 14 13 27 2 4 11 11 0 24 1 0 30
                                         0 69 2 0 9 9 0 74 1 0 8 0 75 1 7 11 0
                                         28 3 0 30 11 13 14 31 1 0 30 11 34 1 0
                                         11 0 49 2 0 9 9 0 73 2 0 17 0 0 84 1 0
                                         67 0 68 1 0 17 0 66 0 0 0 41 1 0 11 0
                                         56 1 0 11 0 56 1 0 30 11 40 3 0 30 11
                                         13 14 39 1 0 63 11 65 3 0 63 11 13 14
                                         64 2 0 22 11 13 23)))))
           '|lookupIncomplete|)) 
