
(/VERSIONCHECK 2) 

(DEFUN |OVAR;convert;$S;1| (|s1| $)
  (SPADCALL (QREFELT $ 6) |s1| (QREFELT $ 12))) 

(DEFUN |OVAR;coerce;$Of;2| (|s1| $)
  (SPADCALL (SPADCALL |s1| (QREFELT $ 13)) (QREFELT $ 15))) 

(DEFUN |OVAR;convert;$If;3| (|s1| $)
  (SPADCALL (SPADCALL |s1| (QREFELT $ 13)) (QREFELT $ 18))) 

(DEFUN |OVAR;convert;$P;4| (|s1| $)
  (SPADCALL (SPADCALL |s1| (QREFELT $ 13)) (QREFELT $ 21))) 

(DEFUN |OVAR;convert;$P;5| (|s1| $)
  (SPADCALL (SPADCALL |s1| (QREFELT $ 13)) (QREFELT $ 24))) 

(PUT '|OVAR;index;Pi$;6| '|SPADreplace| '(XLAM (|i|) |i|)) 

(DEFUN |OVAR;index;Pi$;6| (|i| $) |i|) 

(PUT '|OVAR;lookup;$Pi;7| '|SPADreplace| '(XLAM (|j|) |j|)) 

(DEFUN |OVAR;lookup;$Pi;7| (|j| $) |j|) 

(DEFUN |OVAR;size;Nni;8| ($) (LENGTH (QREFELT $ 6))) 

(DEFUN |OVAR;variable;SU;9| (|exp| $)
  (PROG (#1=#:G145 #2=#:G139 |i| #3=#:G146 |exp2|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (SEQ (LETT |exp2| NIL . #4=(|OVAR;variable;SU;9|))
             (LETT #3# (QREFELT $ 6) . #4#) (LETT |i| 1 . #4#) G190
             (COND
              ((OR (ATOM #3#) (PROGN (LETT |exp2| (CAR #3#) . #4#) NIL))
               (GO G191)))
             (SEQ
              (EXIT
               (COND
                ((EQUAL |exp| |exp2|)
                 (PROGN
                  (LETT #1#
                        (CONS 0
                              (PROG1 (LETT #2# |i| . #4#)
                                (|check_subtype| (> #2# 0) '(|PositiveInteger|)
                                                 #2#)))
                        . #4#)
                  (GO #1#))))))
             (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #3# (CDR #3#) . #4#)) . #4#)
             (GO G190) G191 (EXIT NIL))
        (EXIT (CONS 1 "failed"))))
      #1# (EXIT #1#))))) 

(PUT '|OVAR;<;2$B;10| '|SPADreplace| '(XLAM (|s1| |s2|) (< |s2| |s1|))) 

(DEFUN |OVAR;<;2$B;10| (|s1| |s2| $) (< |s2| |s1|)) 

(PUT '|OVAR;=;2$B;11| '|SPADreplace| 'EQL) 

(DEFUN |OVAR;=;2$B;11| (|s1| |s2| $) (EQL |s1| |s2|)) 

(DEFUN |OVAR;latex;$S;12| (|x| $)
  (SPADCALL (SPADCALL |x| (QREFELT $ 13)) (QREFELT $ 37))) 

(DEFUN |OVAR;hashUpdate!;Hs$Hs;13| (|hs| |s| $)
  (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(DEFUN |OrderedVariableList| (#1=#:G151)
  (PROG ()
    (RETURN
     (PROG (#2=#:G152)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|OrderedVariableList|)
                                           '|domainEqualList|)
                . #3=(|OrderedVariableList|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|OrderedVariableList;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|OrderedVariableList|))))))))))) 

(DEFUN |OrderedVariableList;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|OrderedVariableList|))
      (LETT |dv$| (LIST '|OrderedVariableList| DV$1) . #1#)
      (LETT $ (GETREFV 43) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|OrderedVariableList| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (SETELT $ 6 (SPADCALL |#1| (QREFELT $ 8)))
      (QSETREFV $ 9 (|PositiveInteger|))
      $)))) 

(MAKEPROP '|OrderedVariableList| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|List| 10)
              (0 . |removeDuplicates|) '|Rep| (|Symbol|) (|Integer|)
              (5 . |elt|) |OVAR;convert;$S;1| (|OutputForm|) (11 . |coerce|)
              |OVAR;coerce;$Of;2| (|InputForm|) (16 . |convert|)
              |OVAR;convert;$If;3| (|Pattern| 11) (21 . |convert|)
              |OVAR;convert;$P;4| (|Pattern| (|Float|)) (26 . |convert|)
              |OVAR;convert;$P;5| (|PositiveInteger|) |OVAR;index;Pi$;6|
              |OVAR;lookup;$Pi;7| (|NonNegativeInteger|) |OVAR;size;Nni;8|
              (|Union| $ '"failed") |OVAR;variable;SU;9| (|Boolean|)
              |OVAR;<;2$B;10| |OVAR;=;2$B;11| (|String|) (31 . |latex|)
              |OVAR;latex;$S;12| (|HashState|) |OVAR;hashUpdate!;Hs$Hs;13|
              (|List| $) (|SingleInteger|))
           '#(~= 36 |variable| 42 |smaller?| 47 |size| 53 |random| 57 |min| 61
              |max| 67 |lookup| 73 |latex| 78 |index| 83 |hashUpdate!| 88
              |hash| 94 |enumerate| 99 |convert| 103 |coerce| 123 >= 128 > 134
              = 140 <= 146 < 152)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL |OrderedSet&| NIL |Finite&| |SetCategory&| NIL NIL NIL
                     NIL |BasicType&| |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedFinite|) (|OrderedSet|) (|Comparable|)
                      (|Finite|) (|SetCategory|) (|ConvertibleTo| 20)
                      (|ConvertibleTo| 23) (|ConvertibleTo| 10)
                      (|ConvertibleTo| 17) (|BasicType|) (|PartialOrder|)
                      (|CoercibleTo| 14))
                   (|makeByteWordVec2| 42
                                       '(1 7 0 0 8 2 7 10 0 11 12 1 10 14 0 15
                                         1 10 17 0 18 1 10 20 0 21 1 10 23 0 24
                                         1 10 36 0 37 2 0 33 0 0 1 1 0 31 10 32
                                         2 0 33 0 0 1 0 0 29 30 0 0 0 1 2 0 0 0
                                         0 1 2 0 0 0 0 1 1 0 26 0 28 1 0 36 0
                                         38 1 0 0 26 27 2 0 39 39 0 40 1 0 42 0
                                         1 0 0 41 1 1 0 20 0 22 1 0 23 0 25 1 0
                                         17 0 19 1 0 10 0 13 1 0 14 0 16 2 0 33
                                         0 0 1 2 0 33 0 0 1 2 0 33 0 0 35 2 0
                                         33 0 0 1 2 0 33 0 0 34)))))
           '|lookupComplete|)) 
