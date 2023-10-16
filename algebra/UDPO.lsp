
(SDEFUN |UDPO;userOrdered?;B;1| (($ |Boolean|))
        (COND
         ((NULL (SPADCALL (QREFELT $ 10) (QREFELT $ 12)))
          (NULL (NULL (SPADCALL (QREFELT $ 11) (QREFELT $ 12)))))
         ('T 'T))) 

(SDEFUN |UDPO;getOrder;R;2|
        (($ |Record| (|:| |low| (|List| S)) (|:| |high| (|List| S))))
        (CONS (SPADCALL (QREFELT $ 10) (QREFELT $ 12))
              (SPADCALL (QREFELT $ 11) (QREFELT $ 12)))) 

(SDEFUN |UDPO;setOrder;LV;3| ((|l| |List| S) ($ |Void|))
        (SPADCALL NIL |l| (QREFELT $ 18))) 

(SDEFUN |UDPO;setOrder;2LV;4| ((|l| |List| S) (|h| |List| S) ($ |Void|))
        (SEQ
         (SPADCALL (QREFELT $ 10) (SPADCALL |l| (QREFELT $ 20)) (QREFELT $ 21))
         (SPADCALL (QREFELT $ 11) (SPADCALL |h| (QREFELT $ 20)) (QREFELT $ 21))
         (EXIT (SPADCALL (QREFELT $ 22))))) 

(SDEFUN |UDPO;less?;2SMB;5|
        ((|a| S) (|b| S) (|f| |Mapping| (|Boolean|) S S) ($ |Boolean|))
        (SPROG ((|u| (|Union| (|Boolean|) "failed")))
               (SEQ (LETT |u| (SPADCALL |a| |b| (QREFELT $ 24)))
                    (EXIT
                     (COND ((QEQCAR |u| 1) (SPADCALL |a| |b| |f|))
                           ('T (QCDR |u|))))))) 

(SDEFUN |UDPO;largest;LMS;6|
        ((|x| |List| S) (|f| |Mapping| (|Boolean|) S S) ($ S))
        (SPROG ((|a| (S)))
               (SEQ
                (COND ((NULL |x|) (|error| "largest: empty list"))
                      ((NULL (CDR |x|)) (|SPADfirst| |x|))
                      (#1='T
                       (SEQ (LETT |a| (SPADCALL (CDR |x|) |f| (QREFELT $ 27)))
                            (EXIT
                             (COND
                              ((SPADCALL (|SPADfirst| |x|) |a| |f|
                                         (QREFELT $ 26))
                               |a|)
                              (#1# (|SPADfirst| |x|)))))))))) 

(SDEFUN |UDPO;less?;2SU;7| ((|a| S) (|b| S) ($ |Union| (|Boolean|) "failed"))
        (SPROG
         ((|bb| #1=(|Boolean|)) (#2=#:G141 NIL) (|aa| #1#) (#3=#:G143 NIL)
          (|x| NIL) (#4=#:G142 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |x| NIL)
                 (LETT #4# (SPADCALL (QREFELT $ 10) (QREFELT $ 12))) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |x| |a| (QREFELT $ 28))
                     (PROGN
                      (LETT #2# (CONS 0 (SPADCALL |a| |b| (QREFELT $ 29))))
                      (GO #5=#:G140)))
                    ((SPADCALL |x| |b| (QREFELT $ 28))
                     (PROGN (LETT #2# (CONS 0 NIL)) (GO #5#))))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
            (LETT |aa| (LETT |bb| 'NIL))
            (SEQ (LETT |x| NIL)
                 (LETT #3# (SPADCALL (QREFELT $ 11) (QREFELT $ 12))) G190
                 (COND
                  ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL)) (GO G191)))
                 (SEQ
                  (COND
                   ((SPADCALL |x| |a| (QREFELT $ 28))
                    (COND (|bb| (PROGN (LETT #2# (CONS 0 NIL)) (GO #5#)))
                          ('T (LETT |aa| 'T)))))
                  (EXIT
                   (COND
                    ((SPADCALL |x| |b| (QREFELT $ 28))
                     (COND
                      (|aa|
                       (PROGN
                        (LETT #2# (CONS 0 (SPADCALL |a| |b| (QREFELT $ 29))))
                        (GO #5#)))
                      ('T (LETT |bb| 'T)))))))
                 (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND (|aa| (CONS 0 NIL)) (|bb| (CONS 0 'T))
                   ('T (CONS 1 "failed"))))))
          #5# (EXIT #2#)))) 

(SDEFUN |UDPO;more?;2SB;8| ((|a| S) (|b| S) ($ |Boolean|))
        (NULL (SPADCALL |a| |b| (ELT $ 30) (QREFELT $ 26)))) 

(SDEFUN |UDPO;largest;LS;9| ((|x| |List| S) ($ S))
        (SPADCALL |x| (ELT $ 30) (QREFELT $ 27))) 

(DECLAIM (NOTINLINE |UserDefinedPartialOrdering;|)) 

(DEFUN |UserDefinedPartialOrdering| (#1=#:G147)
  (SPROG NIL
         (PROG (#2=#:G148)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|UserDefinedPartialOrdering|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|UserDefinedPartialOrdering;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UserDefinedPartialOrdering|)))))))))) 

(DEFUN |UserDefinedPartialOrdering;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|UserDefinedPartialOrdering| DV$1))
          (LETT $ (GETREFV 33))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|OrderedSet|))))))
          (|haddProp| |$ConstructorCache| '|UserDefinedPartialOrdering|
                      (LIST DV$1) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 10 (SPADCALL NIL (QREFELT $ 9)))
          (QSETREFV $ 11 (SPADCALL NIL (QREFELT $ 9)))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 31 (CONS (|dispatchFunction| |UDPO;more?;2SB;8|) $))
             (QSETREFV $ 32
                       (CONS (|dispatchFunction| |UDPO;largest;LS;9|) $)))))
          $))) 

(MAKEPROP '|UserDefinedPartialOrdering| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|List| 6) (|Reference| 7)
              (0 . |ref|) '|llow| '|lhigh| (5 . |deref|) (|Boolean|)
              |UDPO;userOrdered?;B;1| (|Record| (|:| |low| 7) (|:| |high| 7))
              |UDPO;getOrder;R;2| (|Void|) |UDPO;setOrder;2LV;4|
              |UDPO;setOrder;LV;3| (10 . |removeDuplicates|) (15 . |setref|)
              (21 . |void|) (|Union| 13 '#1="failed") |UDPO;less?;2SU;7|
              (|Mapping| 13 6 6) |UDPO;less?;2SMB;5| |UDPO;largest;LMS;6|
              (25 . =) (31 . ~=) (37 . <) (43 . |more?|) (49 . |largest|))
           '#(|userOrdered?| 54 |setOrder| 58 |more?| 69 |less?| 75 |largest|
              88 |getOrder| 99)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|setOrder| ((|Void|) (|List| |#1|))) T)
                                   '((|setOrder|
                                      ((|Void|) (|List| |#1|) (|List| |#1|)))
                                     T)
                                   '((|getOrder|
                                      ((|Record| (|:| |low| (|List| |#1|))
                                                 (|:| |high| (|List| |#1|)))))
                                     T)
                                   '((|less?|
                                      ((|Union| (|Boolean|) #1#) |#1| |#1|))
                                     T)
                                   '((|less?|
                                      ((|Boolean|) |#1| |#1|
                                       (|Mapping| (|Boolean|) |#1| |#1|)))
                                     T)
                                   '((|largest|
                                      (|#1| (|List| |#1|)
                                       (|Mapping| (|Boolean|) |#1| |#1|)))
                                     T)
                                   '((|userOrdered?| ((|Boolean|))) T)
                                   '((|largest| (|#1| (|List| |#1|)))
                                     (|has| 6 (|OrderedSet|)))
                                   '((|more?| ((|Boolean|) |#1| |#1|))
                                     (|has| 6 (|OrderedSet|))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 32
                                            '(1 8 0 7 9 1 8 7 0 12 1 7 0 0 20 2
                                              8 7 0 7 21 0 17 0 22 2 6 13 0 0
                                              28 2 6 13 0 0 29 2 6 13 0 0 30 2
                                              0 13 6 6 31 1 0 6 7 32 0 0 13 14
                                              2 0 17 7 7 18 1 0 17 7 19 2 1 13
                                              6 6 31 2 0 23 6 6 24 3 0 13 6 6
                                              25 26 1 1 6 7 32 2 0 6 7 25 27 0
                                              0 15 16)))))
           '|lookupComplete|)) 
