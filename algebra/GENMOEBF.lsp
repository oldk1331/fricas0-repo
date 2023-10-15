
(PUT '|GENMOEBF;rep| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |GENMOEBF;rep| ((|x| $) ($ |Rep|)) |x|) 

(PUT '|GENMOEBF;per| '|SPADreplace| '(XLAM (|r|) |r|)) 

(SDEFUN |GENMOEBF;per| ((|r| |Rep|) ($ $)) |r|) 

(SDEFUN |GENMOEBF;members;$L;3| ((|mf| $) ($ |List| P))
        (QVELT (|GENMOEBF;rep| |mf| $) 2)) 

(SDEFUN |GENMOEBF;generalizedMoebiusFunction;LM$;4|
        ((|xx| |List| P) (|z| |Mapping| R P P) ($ $))
        (SPROG
         ((#1=#:G122 NIL) (|mf| (|Union| (|Matrix| R) "failed"))
          (|zf| (|Matrix| R)) (#2=#:G126 NIL) (|x| NIL) (#3=#:G125 NIL)
          (#4=#:G124 NIL) (|y| NIL) (#5=#:G123 NIL) (|xxo| (|List| P)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |xxo|
                  (SPADCALL (SPADCALL (ELT $ 12) |xx| (QREFELT $ 15))
                            (QREFELT $ 16))
                  . #6=(|GENMOEBF;generalizedMoebiusFunction;LM$;4|))
            (LETT |zf|
                  (SPADCALL
                   (PROGN
                    (LETT #5# NIL . #6#)
                    (SEQ (LETT |y| NIL . #6#) (LETT #4# |xxo| . #6#) G190
                         (COND
                          ((OR (ATOM #4#)
                               (PROGN (LETT |y| (CAR #4#) . #6#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #5#
                                 (CONS
                                  (PROGN
                                   (LETT #3# NIL . #6#)
                                   (SEQ (LETT |x| NIL . #6#)
                                        (LETT #2# |xxo| . #6#) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN
                                               (LETT |x| (CAR #2#) . #6#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #3#
                                                (CONS
                                                 (COND
                                                  ((SPADCALL |y| |x|
                                                             (QREFELT $ 12))
                                                   (SPADCALL |x| |y| |z|))
                                                  ('T (|spadConstant| $ 17)))
                                                 #3#)
                                                . #6#)))
                                        (LETT #2# (CDR #2#) . #6#) (GO G190)
                                        G191 (EXIT (NREVERSE #3#))))
                                  #5#)
                                 . #6#)))
                         (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                         (EXIT (NREVERSE #5#))))
                   (QREFELT $ 20))
                  . #6#)
            (LETT |mf| (SPADCALL |zf| (QREFELT $ 22)) . #6#)
            (EXIT
             (COND ((QEQCAR |mf| 1) (|error| "zeta not invertible"))
                   ('T
                    (PROGN
                     (LETT #1#
                           (|GENMOEBF;per| (VECTOR |zf| (QCDR |mf|) |xxo|) $)
                           . #6#)
                     (GO #7=#:G121)))))))
          #7# (EXIT #1#)))) 

(SDEFUN |GENMOEBF;canonicalZeta| ((|pi| P) (|si| P) ($ R))
        (SPROG ((#1=#:G129 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |pi| |si| (QREFELT $ 12))
                    (PROGN
                     (LETT #1# (|spadConstant| $ 25) |GENMOEBF;canonicalZeta|)
                     (GO #2=#:G128))))
                  (EXIT (|spadConstant| $ 17))))
                #2# (EXIT #1#)))) 

(SDEFUN |GENMOEBF;apply;$2PR;6| ((|mf| $) (|x| P) (|y| P) ($ R))
        (SPROG
         ((#1=#:G135 NIL) (|ky| #2=(|Integer|)) (|kx| #2#)
          (|mfn| (|Matrix| R)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mfn| (QVELT (|GENMOEBF;rep| |mf| $) 1)
                  . #3=(|GENMOEBF;apply;$2PR;6|))
            (LETT |kx|
                  (SPADCALL |x| (SPADCALL |mf| (QREFELT $ 10)) (QREFELT $ 27))
                  . #3#)
            (LETT |ky|
                  (SPADCALL |y| (SPADCALL |mf| (QREFELT $ 10)) (QREFELT $ 27))
                  . #3#)
            (COND
             ((OR (ZEROP |kx|) (ZEROP |ky|)) (EXIT (|error| "not members"))))
            (EXIT
             (PROGN
              (LETT #1# (SPADCALL |mfn| |ky| |kx| (QREFELT $ 28)) . #3#)
              (GO #4=#:G134)))))
          #4# (EXIT #1#)))) 

(SDEFUN |GENMOEBF;moebiusMatrix;$M;7| ((|mf| $) ($ |Matrix| R))
        (QVELT (|GENMOEBF;rep| |mf| $) 1)) 

(SDEFUN |GENMOEBF;zetaMatrix| ((|mf| $) ($ |Matrix| R))
        (QVELT (|GENMOEBF;rep| |mf| $) 0)) 

(PUT '|GENMOEBF;coerce| '|SPADreplace| '(XLAM (|mf|) "m")) 

(SDEFUN |GENMOEBF;coerce| ((|mf| $) ($ |OutputForm|)) "m") 

(DECLAIM (NOTINLINE |GeneralizedFiniteMoebiusFunction;|)) 

(DEFUN |GeneralizedFiniteMoebiusFunction| (&REST #1=#:G141)
  (SPROG NIL
         (PROG (#2=#:G142)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GeneralizedFiniteMoebiusFunction|)
                                               '|domainEqualList|)
                    . #3=(|GeneralizedFiniteMoebiusFunction|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GeneralizedFiniteMoebiusFunction;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GeneralizedFiniteMoebiusFunction|)))))))))) 

(DEFUN |GeneralizedFiniteMoebiusFunction;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|GeneralizedFiniteMoebiusFunction|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|GeneralizedFiniteMoebiusFunction| DV$1 DV$2)
                . #1#)
          (LETT $ (GETREFV 31) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|GeneralizedFiniteMoebiusFunction|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|Record| (|:| |zmatrix| (|Matrix| |#2|))
                              (|:| |mmatrix| (|Matrix| |#2|))
                              (|:| |indices| (|List| |#1|))))
          $))) 

(MAKEPROP '|GeneralizedFiniteMoebiusFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|List| 6) |GENMOEBF;members;$L;3| (|Boolean|) (0 . <=)
              (|Mapping| 11 6 6) (|ListPackage| 6) (6 . |topologicalSort|)
              (12 . |removeDuplicates|) (17 . |Zero|) (|List| (|List| 7))
              (|Matrix| 7) (21 . |matrix|) (|Union| $ '"failed")
              (26 . |inverse|) (|Mapping| 7 6 6)
              |GENMOEBF;generalizedMoebiusFunction;LM$;4| (31 . |One|)
              (|Integer|) (35 . |position|) (41 . |elt|)
              |GENMOEBF;apply;$2PR;6| |GENMOEBF;moebiusMatrix;$M;7|)
           '#(|moebiusMatrix| 48 |members| 53 |generalizedMoebiusFunction| 58
              |canonicalMoebiusFunction| 64 |apply| 69)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 30
                                                 '(2 6 11 0 0 12 2 14 9 13 9 15
                                                   1 9 0 0 16 0 7 0 17 1 19 0
                                                   18 20 1 19 21 0 22 0 7 0 25
                                                   2 9 26 6 0 27 3 19 7 0 26 26
                                                   28 1 0 19 0 30 1 0 9 0 10 2
                                                   0 0 9 23 24 1 0 0 9 1 3 0 7
                                                   0 6 6 29)))))
           '|lookupComplete|)) 
