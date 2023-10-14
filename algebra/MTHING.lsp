
(/VERSIONCHECK 2) 

(DEFUN |MTHING;mergeDifference;3L;1| (|x| |y| $)
  (SEQ
   (COND ((OR (NULL |x|) (NULL |y|)) |x|)
         ('T
          (SEQ (|MTHING;mergeDifference1| |x| (|SPADfirst| |y|) (CDR |y|) $)
               (EXIT
                (COND
                 ((SPADCALL (|SPADfirst| |x|) (|SPADfirst| |y|) (QREFELT $ 8))
                  (CDR |x|))
                 ('T |x|)))))))) 

(DEFUN |MTHING;mergeDifference1| (|x| |fy| |ry| $)
  (PROG (#1=#:G137 |frx| |rx|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |rx| |x| . #2=(|MTHING;mergeDifference1|))
            (EXIT
             (SEQ G190
                  (COND ((NULL (COND ((NULL |rx|) 'NIL) ('T 'T))) (GO G191)))
                  (SEQ (LETT |rx| (CDR |rx|) . #2#)
                       (LETT |frx| (|SPADfirst| |rx|) . #2#)
                       (SEQ G190
                            (COND
                             ((NULL (SPADCALL |fy| |frx| (QREFELT $ 11)))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL |ry|)
                                (PROGN (LETT #1# |x| . #2#) (GO #1#)))
                               ('T
                                (SEQ (LETT |fy| (|SPADfirst| |ry|) . #2#)
                                     (EXIT (LETT |ry| (CDR |ry|) . #2#)))))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (COND
                         ((SPADCALL |frx| |fy| (QREFELT $ 8))
                          (SEQ (SPADCALL |x| '|rest| (CDR |rx|) (QREFELT $ 13))
                               (EXIT
                                (COND
                                 ((NULL |ry|)
                                  (PROGN (LETT #1# |x| . #2#) (GO #1#)))
                                 ('T
                                  (SEQ (LETT |fy| (|SPADfirst| |ry|) . #2#)
                                       (EXIT
                                        (LETT |ry| (CDR |ry|) . #2#))))))))
                         ('T (LETT |x| |rx| . #2#)))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DECLAIM (NOTINLINE |MergeThing;|)) 

(DEFUN |MergeThing| (#1=#:G138)
  (PROG ()
    (RETURN
     (PROG (#2=#:G139)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|MergeThing|)
                                           '|domainEqualList|)
                . #3=(|MergeThing|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|MergeThing;| #1#) (LETT #2# T . #3#))
            (COND ((NOT #2#) (HREM |$ConstructorCache| '|MergeThing|))))))))))) 

(DEFUN |MergeThing;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MergeThing|))
      (LETT |dv$| (LIST '|MergeThing| DV$1) . #1#)
      (LETT $ (GETREFV 14) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MergeThing| (LIST DV$1) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MergeThing| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (0 . =)
              (|List| 6) |MTHING;mergeDifference;3L;1| (6 . <) '"rest"
              (12 . |setelt|))
           '#(|mergeDifference| 19) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 13
                                                 '(2 6 7 0 0 8 2 6 7 0 0 11 3 9
                                                   0 0 12 0 13 2 0 9 9 9
                                                   10)))))
           '|lookupComplete|)) 
