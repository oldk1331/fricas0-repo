
(SDEFUN |EAB;=;2$B;1| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 8))) 

(SDEFUN |EAB;<;2$B;2| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((NULL |x|) (NULL (NULL |y|))) ((NULL |y|) NIL)
              ((EQL (|SPADfirst| |x|) (|SPADfirst| |y|))
               (SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 10)))
              ('T
               (SPADCALL (|SPADfirst| |x|) (|SPADfirst| |y|) (QREFELT $ 12))))) 

(SDEFUN |EAB;coerce;L$;3| ((|li| |List| (|Integer|)) ($ $))
        (SPROG ((#1=#:G122 NIL) (|x| NIL))
               (SEQ
                (SEQ (LETT |x| NIL) (LETT #1# |li|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |x| 1 (QREFELT $ 13))
                         (COND
                          ((SPADCALL |x| 0 (QREFELT $ 13))
                           (|error| "coerce: values can only be 0 and 1")))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |li|)))) 

(SDEFUN |EAB;degree;$Nni;4| ((|x| $) ($ |NonNegativeInteger|))
        (SPROG
         ((#1=#:G129 NIL) (#2=#:G127 NIL) (#3=#:G126 #4=(|Integer|))
          (#5=#:G128 #4#) (#6=#:G131 NIL) (#7=#:G104 NIL))
         (SEQ
          (PROG1
              (LETT #1#
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT #7# NIL) (LETT #6# |x|) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT #7# (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #5# #7#)
                             (COND (#2# (LETT #3# (+ #3# #5#)))
                                   ('T
                                    (PROGN (LETT #3# #5#) (LETT #2# 'T)))))))
                          (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                     (COND (#2# #3#) ('T 0))))
            (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|) '(|Integer|)
                              #1#))))) 

(SDEFUN |EAB;exponents;$L;5| ((|x| $) ($ |List| (|Integer|)))
        (SPADCALL |x| (QREFELT $ 18))) 

(SDEFUN |EAB;Nul;Nni$;6| ((|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G136 NIL) (|i| NIL) (#2=#:G135 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS 0 #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |EAB;coerce;$Of;7| ((|x| $) ($ |OutputForm|))
        (SPADCALL |x| (QREFELT $ 22))) 

(DECLAIM (NOTINLINE |ExtAlgBasis;|)) 

(DEFUN |ExtAlgBasis| ()
  (SPROG NIL
         (PROG (#1=#:G139)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ExtAlgBasis|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ExtAlgBasis|
                             (LIST (CONS NIL (CONS 1 (|ExtAlgBasis;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|ExtAlgBasis|)))))))))) 

(DEFUN |ExtAlgBasis;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ExtAlgBasis|))
          (LETT $ (GETREFV 27))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ExtAlgBasis| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|List| (|Integer|)))
          $))) 

(MAKEPROP '|ExtAlgBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|) (0 . =) |EAB;=;2$B;1|
              |EAB;<;2$B;2| (|Integer|) (6 . >) (12 . ~=) (|List| 11)
              |EAB;coerce;L$;3| (|NonNegativeInteger|) |EAB;degree;$Nni;4|
              (18 . |copy|) |EAB;exponents;$L;5| |EAB;Nul;Nni$;6|
              (|OutputForm|) (23 . |coerce|) |EAB;coerce;$Of;7| (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 28 |smaller?| 34 |min| 40 |max| 46 |latex| 52 |hashUpdate!| 57
              |hash| 63 |exponents| 68 |degree| 73 |coerce| 78 |Nul| 88 >= 93 >
              99 = 105 <= 111 < 117)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL |SetCategory&| |BasicType&|
                     |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|) (|SetCategory|)
                      (|BasicType|) (|PartialOrder|) (|CoercibleTo| 21))
                   (|makeByteWordVec2| 26
                                       '(2 6 7 0 0 8 2 11 7 0 0 12 2 11 7 0 0
                                         13 1 14 0 0 18 1 14 21 0 22 2 0 7 0 0
                                         1 2 0 7 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                         1 0 24 0 1 2 0 26 26 0 1 1 0 25 0 1 1
                                         0 14 0 19 1 0 16 0 17 1 0 0 14 15 1 0
                                         21 0 23 1 0 0 16 20 2 0 7 0 0 1 2 0 7
                                         0 0 1 2 0 7 0 0 9 2 0 7 0 0 1 2 0 7 0
                                         0 10)))))
           '|lookupComplete|)) 

(MAKEPROP '|ExtAlgBasis| 'NILADIC T) 
