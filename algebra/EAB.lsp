
(/VERSIONCHECK 2) 

(DEFUN |EAB;=;2$B;1| (|x| |y| $) (SPADCALL |x| |y| (QREFELT $ 8))) 

(DEFUN |EAB;<;2$B;2| (|x| |y| $)
  (COND ((NULL |x|) (COND ((NULL |y|) 'NIL) (#1='T 'T))) ((NULL |y|) 'NIL)
        (#1#
         (COND
          ((EQL (|SPADfirst| |x|) (|SPADfirst| |y|))
           (SPADCALL (CDR |x|) (CDR |y|) (QREFELT $ 10)))
          (#1#
           (SPADCALL (|SPADfirst| |x|) (|SPADfirst| |y|) (QREFELT $ 12))))))) 

(DEFUN |EAB;coerce;L$;3| (|li| $)
  (PROG (#1=#:G139 |x|)
    (RETURN
     (SEQ
      (SEQ (LETT |x| NIL . #2=(|EAB;coerce;L$;3|)) (LETT #1# |li| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (COND
              ((SPADCALL |x| 1 (QREFELT $ 13))
               (COND
                ((SPADCALL |x| 0 (QREFELT $ 13))
                 (|error| "coerce: values can only be 0 and 1")))))))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |li|))))) 

(DEFUN |EAB;degree;$Nni;4| (|x| $)
  (PROG (#1=#:G146 #2=#:G144 #3=#:G143 #4=#:G145 #5=#:G148 #6=#:G127)
    (RETURN
     (SEQ
      (PROG1
          (LETT #1#
                (PROGN
                 (LETT #2# NIL . #7=(|EAB;degree;$Nni;4|))
                 (SEQ (LETT #6# NIL . #7#) (LETT #5# |x| . #7#) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT #6# (CAR #5#) . #7#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# #6# . #7#)
                         (COND (#2# (LETT #3# (+ #3# #4#) . #7#))
                               ('T
                                (PROGN
                                 (LETT #3# #4# . #7#)
                                 (LETT #2# 'T . #7#)))))))
                      (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL))
                 (COND (#2# #3#) ('T 0)))
                . #7#)
        (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#)))))) 

(DEFUN |EAB;exponents;$L;5| (|x| $) (SPADCALL |x| (QREFELT $ 18))) 

(DEFUN |EAB;Nul;Nni$;6| (|n| $)
  (PROG (|i| #1=#:G152)
    (RETURN
     (SEQ
      (PROGN
       (LETT #1# NIL . #2=(|EAB;Nul;Nni$;6|))
       (SEQ (LETT |i| 1 . #2#) G190 (COND ((|greater_SI| |i| |n|) (GO G191)))
            (SEQ (EXIT (LETT #1# (CONS 0 #1#) . #2#)))
            (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
            (EXIT (NREVERSE #1#)))))))) 

(DEFUN |EAB;coerce;$Of;7| (|x| $) (SPADCALL |x| (QREFELT $ 22))) 

(DECLAIM (NOTINLINE |ExtAlgBasis;|)) 

(DEFUN |ExtAlgBasis| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G155)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|ExtAlgBasis|)
                . #2=(|ExtAlgBasis|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|ExtAlgBasis|
                         (LIST (CONS NIL (CONS 1 (|ExtAlgBasis;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|ExtAlgBasis|))))))))))) 

(DEFUN |ExtAlgBasis;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|ExtAlgBasis|) . #1=(|ExtAlgBasis|))
      (LETT $ (GETREFV 27) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ExtAlgBasis| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 (|List| (|Integer|)))
      $)))) 

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
