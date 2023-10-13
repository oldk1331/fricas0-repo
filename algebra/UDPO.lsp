
(/VERSIONCHECK 2) 

(DEFUN |UDPO;userOrdered?;B;1| ($)
  (COND
   ((NULL (SPADCALL (QREFELT $ 10) (QREFELT $ 12)))
    (COND ((NULL (SPADCALL (QREFELT $ 11) (QREFELT $ 12))) 'NIL) (#1='T 'T)))
   (#1# 'T))) 

(DEFUN |UDPO;getOrder;R;2| ($)
  (CONS (SPADCALL (QREFELT $ 10) (QREFELT $ 12))
        (SPADCALL (QREFELT $ 11) (QREFELT $ 12)))) 

(DEFUN |UDPO;setOrder;LV;3| (|l| $) (SPADCALL NIL |l| (QREFELT $ 18))) 

(DEFUN |UDPO;setOrder;2LV;4| (|l| |h| $)
  (SEQ (SPADCALL (QREFELT $ 10) (SPADCALL |l| (QREFELT $ 20)) (QREFELT $ 21))
       (SPADCALL (QREFELT $ 11) (SPADCALL |h| (QREFELT $ 20)) (QREFELT $ 21))
       (EXIT (SPADCALL (QREFELT $ 22))))) 

(DEFUN |UDPO;less?;2SMB;5| (|a| |b| |f| $)
  (PROG (|u|)
    (RETURN
     (SEQ (LETT |u| (SPADCALL |a| |b| (QREFELT $ 24)) |UDPO;less?;2SMB;5|)
          (EXIT
           (COND ((QEQCAR |u| 1) (SPADCALL |a| |b| |f|)) ('T (QCDR |u|)))))))) 

(DEFUN |UDPO;largest;LMS;6| (|x| |f| $)
  (PROG (|a|)
    (RETURN
     (SEQ
      (COND ((NULL |x|) (|error| "largest: empty list"))
            ((NULL (CDR |x|)) (|SPADfirst| |x|))
            (#1='T
             (SEQ
              (LETT |a| (SPADCALL (CDR |x|) |f| (QREFELT $ 27))
                    |UDPO;largest;LMS;6|)
              (EXIT
               (COND ((SPADCALL (|SPADfirst| |x|) |a| |f| (QREFELT $ 26)) |a|)
                     (#1# (|SPADfirst| |x|))))))))))) 

(DEFUN |UDPO;less?;2SU;7| (|a| |b| $)
  (PROG (|bb| #1=#:G161 |aa| #2=#:G163 |x| #3=#:G162)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |x| NIL . #4=(|UDPO;less?;2SU;7|))
             (LETT #3# (SPADCALL (QREFELT $ 10) (QREFELT $ 12)) . #4#) G190
             (COND
              ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#) . #4#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((SPADCALL |x| |a| (QREFELT $ 28))
                 (PROGN
                  (LETT #1# (CONS 0 (SPADCALL |a| |b| (QREFELT $ 29))) . #4#)
                  (GO #1#)))
                ((SPADCALL |x| |b| (QREFELT $ 28))
                 (PROGN (LETT #1# (CONS 0 'NIL) . #4#) (GO #1#))))))
             (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
        (LETT |aa| (LETT |bb| 'NIL . #4#) . #4#)
        (SEQ (LETT |x| NIL . #4#)
             (LETT #2# (SPADCALL (QREFELT $ 11) (QREFELT $ 12)) . #4#) G190
             (COND
              ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#) . #4#) NIL))
               (GO G191)))
             (SEQ
              (COND
               ((SPADCALL |x| |a| (QREFELT $ 28))
                (COND (|bb| (PROGN (LETT #1# (CONS 0 'NIL) . #4#) (GO #1#)))
                      ('T (LETT |aa| 'T . #4#)))))
              (EXIT
               (COND
                ((SPADCALL |x| |b| (QREFELT $ 28))
                 (COND
                  (|aa|
                   (PROGN
                    (LETT #1# (CONS 0 (SPADCALL |a| |b| (QREFELT $ 29))) . #4#)
                    (GO #1#)))
                  ('T (LETT |bb| 'T . #4#)))))))
             (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
        (EXIT
         (COND (|aa| (CONS 0 'NIL)) (|bb| (CONS 0 'T))
               ('T (CONS 1 "failed"))))))
      #1# (EXIT #1#))))) 

(DEFUN |UDPO;more?;2SB;8| (|a| |b| $)
  (COND ((SPADCALL |a| |b| (ELT $ 30) (QREFELT $ 26)) 'NIL) ('T 'T))) 

(DEFUN |UDPO;largest;LS;9| (|x| $) (SPADCALL |x| (ELT $ 30) (QREFELT $ 27))) 

(DEFUN |UserDefinedPartialOrdering| (#1=#:G167)
  (PROG ()
    (RETURN
     (PROG (#2=#:G168)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|UserDefinedPartialOrdering|)
                                           '|domainEqualList|)
                . #3=(|UserDefinedPartialOrdering|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|UserDefinedPartialOrdering;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|UserDefinedPartialOrdering|))))))))))) 

(DEFUN |UserDefinedPartialOrdering;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|UserDefinedPartialOrdering|))
      (LETT |dv$| (LIST '|UserDefinedPartialOrdering| DV$1) . #1#)
      (LETT $ (GETREFV 33) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| |#1|
                                                         '(|OrderedSet|))))
                      . #1#))
      (|haddProp| |$ConstructorCache| '|UserDefinedPartialOrdering| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 10 (SPADCALL NIL (QREFELT $ 9)))
      (QSETREFV $ 11 (SPADCALL NIL (QREFELT $ 9)))
      (COND
       ((|testBitVector| |pv$| 1)
        (PROGN
         (QSETREFV $ 31 (CONS (|dispatchFunction| |UDPO;more?;2SB;8|) $))
         (QSETREFV $ 32 (CONS (|dispatchFunction| |UDPO;largest;LS;9|) $)))))
      $)))) 

(MAKEPROP '|UserDefinedPartialOrdering| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|List| 6) (|Reference| 7)
              (0 . |ref|) '|llow| '|lhigh| (5 . |deref|) (|Boolean|)
              |UDPO;userOrdered?;B;1| (|Record| (|:| |low| 7) (|:| |high| 7))
              |UDPO;getOrder;R;2| (|Void|) |UDPO;setOrder;2LV;4|
              |UDPO;setOrder;LV;3| (10 . |removeDuplicates|) (15 . |setref|)
              (21 . |void|) (|Union| 13 '"failed") |UDPO;less?;2SU;7|
              (|Mapping| 13 6 6) |UDPO;less?;2SMB;5| |UDPO;largest;LMS;6|
              (25 . =) (31 . ~=) (37 . <) (43 . |more?|) (49 . |largest|))
           '#(|userOrdered?| 54 |setOrder| 58 |more?| 69 |less?| 75 |largest|
              88 |getOrder| 99)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 32
                                                 '(1 8 0 7 9 1 8 7 0 12 1 7 0 0
                                                   20 2 8 7 0 7 21 0 17 0 22 2
                                                   6 13 0 0 28 2 6 13 0 0 29 2
                                                   6 13 0 0 30 2 0 13 6 6 31 1
                                                   0 6 7 32 0 0 13 14 2 0 17 7
                                                   7 18 1 0 17 7 19 2 1 13 6 6
                                                   31 2 0 23 6 6 24 3 0 13 6 6
                                                   25 26 1 1 6 7 32 2 0 6 7 25
                                                   27 0 0 15 16)))))
           '|lookupComplete|)) 
