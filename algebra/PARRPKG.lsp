
(/VERSIONCHECK 2) 

(DEFUN |PARRPKG;nextMotzkinRow| (|vv| |aa| |bb| |cc| $)
  (PROG (|vvnew| |vva| |vi| |vvc| |vvb|)
    (RETURN
     (SEQ (LETT |vvnew| NIL . #1=(|PARRPKG;nextMotzkinRow|))
          (LETT |vva| (CONS (|spadConstant| $ 7) |vv|) . #1#)
          (LETT |aa| (SPADCALL (|spadConstant| $ 7) |aa| (QREFELT $ 9)) . #1#)
          (LETT |vvb| |vv| . #1#) (LETT |vvc| (CDR |vv|) . #1#)
          (SEQ G190
               (COND ((NULL (COND ((NULL |vvc|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ
                (LETT |vi|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (|SPADfirst| |vva|)
                                  (SPADCALL |aa| (QREFELT $ 10))
                                  (QREFELT $ 11))
                        (SPADCALL (|SPADfirst| |vvb|)
                                  (SPADCALL |bb| (QREFELT $ 10))
                                  (QREFELT $ 11))
                        (QREFELT $ 12))
                       (SPADCALL (|SPADfirst| |vvc|)
                                 (SPADCALL |cc| (QREFELT $ 10)) (QREFELT $ 11))
                       (QREFELT $ 12))
                      . #1#)
                (LETT |vvnew| (CONS |vi| |vvnew|) . #1#)
                (LETT |vva| (CDR |vva|) . #1#) (LETT |vvb| (CDR |vvb|) . #1#)
                (LETT |vvc| (CDR |vvc|) . #1#)
                (LETT |aa| (SPADCALL |aa| (QREFELT $ 13)) . #1#)
                (LETT |bb| (SPADCALL |bb| (QREFELT $ 13)) . #1#)
                (EXIT (LETT |cc| (SPADCALL |cc| (QREFELT $ 13)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |vi|
                (SPADCALL
                 (SPADCALL (|SPADfirst| |vva|) (SPADCALL |aa| (QREFELT $ 10))
                           (QREFELT $ 11))
                 (SPADCALL (|SPADfirst| |vvb|) (SPADCALL |bb| (QREFELT $ 10))
                           (QREFELT $ 11))
                 (QREFELT $ 12))
                . #1#)
          (LETT |vvnew| (CONS |vi| |vvnew|) . #1#)
          (LETT |vva| (CDR |vva|) . #1#)
          (LETT |aa| (SPADCALL |aa| (QREFELT $ 13)) . #1#)
          (LETT |vvnew|
                (CONS
                 (SPADCALL (|SPADfirst| |vva|) (SPADCALL |aa| (QREFELT $ 10))
                           (QREFELT $ 11))
                 |vvnew|)
                . #1#)
          (EXIT (LETT |vvnew| (NREVERSE |vvnew|) . #1#)))))) 

(DEFUN |PARRPKG;nextJacobiRow| (|vv| |bb| |cc| $)
  (PROG (|vvnew| |vva| |vi| |vvc| |vvb|)
    (RETURN
     (SEQ (LETT |vvnew| NIL . #1=(|PARRPKG;nextJacobiRow|))
          (LETT |vva| (CONS (|spadConstant| $ 7) |vv|) . #1#)
          (LETT |vvb| |vv| . #1#) (LETT |vvc| (CDR |vv|) . #1#)
          (SEQ G190
               (COND ((NULL (COND ((NULL |vvc|) 'NIL) ('T 'T))) (GO G191)))
               (SEQ
                (LETT |vi|
                      (SPADCALL
                       (SPADCALL (|SPADfirst| |vva|)
                                 (SPADCALL (|SPADfirst| |vvb|)
                                           (SPADCALL |bb| (QREFELT $ 10))
                                           (QREFELT $ 11))
                                 (QREFELT $ 12))
                       (SPADCALL (|SPADfirst| |vvc|)
                                 (SPADCALL |cc| (QREFELT $ 10)) (QREFELT $ 11))
                       (QREFELT $ 12))
                      . #1#)
                (LETT |vvnew| (CONS |vi| |vvnew|) . #1#)
                (LETT |vva| (CDR |vva|) . #1#) (LETT |vvb| (CDR |vvb|) . #1#)
                (LETT |vvc| (CDR |vvc|) . #1#)
                (LETT |bb| (SPADCALL |bb| (QREFELT $ 13)) . #1#)
                (EXIT (LETT |cc| (SPADCALL |cc| (QREFELT $ 13)) . #1#)))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |vi|
                (SPADCALL (|SPADfirst| |vva|)
                          (SPADCALL (|SPADfirst| |vvb|)
                                    (SPADCALL |bb| (QREFELT $ 10))
                                    (QREFELT $ 11))
                          (QREFELT $ 12))
                . #1#)
          (LETT |vvnew| (CONS |vi| |vvnew|) . #1#)
          (LETT |vva| (CDR |vva|) . #1#)
          (LETT |vvnew| (CONS (|SPADfirst| |vva|) |vvnew|) . #1#)
          (EXIT (LETT |vvnew| (NREVERSE |vvnew|) . #1#)))))) 

(DEFUN |PARRPKG;motzkinPathArray;3SS;3| (|aa| |bb| |cc| $)
  (PROG (|start|)
    (RETURN
     (SEQ
      (LETT |start| (LIST (|spadConstant| $ 14))
            |PARRPKG;motzkinPathArray;3SS;3|)
      (EXIT
       (SPADCALL
        (CONS #'|PARRPKG;motzkinPathArray;3SS;3!0| (VECTOR $ |cc| |bb| |aa|))
        |start| (QREFELT $ 18))))))) 

(DEFUN |PARRPKG;motzkinPathArray;3SS;3!0| (|vv| $$)
  (PROG (|aa| |bb| |cc| $)
    (LETT |aa| (QREFELT $$ 3) . #1=(|PARRPKG;motzkinPathArray;3SS;3|))
    (LETT |bb| (QREFELT $$ 2) . #1#)
    (LETT |cc| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|PARRPKG;nextMotzkinRow| |vv| |aa| |bb| |cc| $))))) 

(DEFUN |PARRPKG;jacobiPathArray;2SS;4| (|bb| |cc| $)
  (PROG (|start|)
    (RETURN
     (SEQ
      (LETT |start| (LIST (|spadConstant| $ 14))
            |PARRPKG;jacobiPathArray;2SS;4|)
      (EXIT
       (SPADCALL
        (CONS #'|PARRPKG;jacobiPathArray;2SS;4!0| (VECTOR $ |cc| |bb|)) |start|
        (QREFELT $ 18))))))) 

(DEFUN |PARRPKG;jacobiPathArray;2SS;4!0| (|vv| $$)
  (PROG (|bb| |cc| $)
    (LETT |bb| (QREFELT $$ 2) . #1=(|PARRPKG;jacobiPathArray;2SS;4|))
    (LETT |cc| (QREFELT $$ 1) . #1#)
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|PARRPKG;nextJacobiRow| |vv| |bb| |cc| $))))) 

(DEFUN |PARRPKG;bottom;SS;5| (|x| $) (SPADCALL (ELT $ 21) |x| (QREFELT $ 24))) 

(DECLAIM (NOTINLINE |PathArrayPackage;|)) 

(DEFUN |PathArrayPackage| (#1=#:G147)
  (PROG ()
    (RETURN
     (PROG (#2=#:G148)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|PathArrayPackage|)
                                           '|domainEqualList|)
                . #3=(|PathArrayPackage|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT (PROG1 (|PathArrayPackage;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|PathArrayPackage|))))))))))) 

(DEFUN |PathArrayPackage;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|PathArrayPackage|))
      (LETT |dv$| (LIST '|PathArrayPackage| DV$1) . #1#)
      (LETT $ (GETREFV 26) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|PathArrayPackage| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|PathArrayPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|) (|Stream| 6)
              (4 . |cons|) (10 . |first|) (15 . *) (21 . +) (27 . |rest|)
              (32 . |One|) (|Mapping| 16 16) (|List| 6) (|Stream| 16)
              (36 . |stream|) |PARRPKG;motzkinPathArray;3SS;3|
              |PARRPKG;jacobiPathArray;2SS;4| (42 . |first|) (|Mapping| 6 16)
              (|StreamFunctions2| 16 6) (47 . |map|) |PARRPKG;bottom;SS;5|)
           '#(|motzkinPathArray| 53 |jacobiPathArray| 60 |bottom| 66) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 25
                                                 '(0 6 0 7 2 8 0 6 0 9 1 8 6 0
                                                   10 2 6 0 0 0 11 2 6 0 0 0 12
                                                   1 8 0 0 13 0 6 0 14 2 17 0
                                                   15 16 18 1 16 6 0 21 2 23 8
                                                   22 17 24 3 0 17 8 8 8 19 2 0
                                                   17 8 8 20 1 0 8 17 25)))))
           '|lookupComplete|)) 
