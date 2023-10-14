
(/VERSIONCHECK 2) 

(PUT '|U16VEC;#;$Nni;1| '|SPADreplace| 'QV_LEN_U16) 

(DEFUN |U16VEC;#;$Nni;1| (|x| $) (QV_LEN_U16 |x|)) 

(PUT '|U16VEC;minIndex;$I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(DEFUN |U16VEC;minIndex;$I;2| (|x| $) 0) 

(PUT '|U16VEC;empty;$;3| '|SPADreplace| '(XLAM NIL (GETREFV_U16 0 0))) 

(DEFUN |U16VEC;empty;$;3| ($) (GETREFV_U16 0 0)) 

(PUT '|U16VEC;new;NniI$;4| '|SPADreplace| 'GETREFV_U16) 

(DEFUN |U16VEC;new;NniI$;4| (|n| |x| $) (GETREFV_U16 |n| |x|)) 

(PUT '|U16VEC;qelt;$2I;5| '|SPADreplace| 'ELT_U16) 

(DEFUN |U16VEC;qelt;$2I;5| (|x| |i| $) (ELT_U16 |x| |i|)) 

(PUT '|U16VEC;elt;$2I;6| '|SPADreplace| 'ELT_U16) 

(DEFUN |U16VEC;elt;$2I;6| (|x| |i| $) (ELT_U16 |x| |i|)) 

(PUT '|U16VEC;qsetelt!;$3I;7| '|SPADreplace| 'SETELT_U16) 

(DEFUN |U16VEC;qsetelt!;$3I;7| (|x| |i| |s| $) (SETELT_U16 |x| |i| |s|)) 

(PUT '|U16VEC;setelt;$3I;8| '|SPADreplace| 'SETELT_U16) 

(DEFUN |U16VEC;setelt;$3I;8| (|x| |i| |s| $) (SETELT_U16 |x| |i| |s|)) 

(DEFUN |U16VEC;fill!;$I$;9| (|x| |s| $)
  (PROG (#1=#:G2275 |i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| 0 . #2=(|U16VEC;fill!;$I$;9|))
           (LETT #1# (|sub_SI| (QV_LEN_U16 |x|) 1) . #2#) G190
           (COND ((|greater_SI| |i| #1#) (GO G191)))
           (SEQ (EXIT (SETELT_U16 |x| |i| |s|)))
           (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |x|))))) 

(DECLAIM (NOTINLINE |U16Vector;|)) 

(DEFUN |U16Vector| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G2289)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|U16Vector|) . #2=(|U16Vector|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|U16Vector|
                         (LIST (CONS NIL (CONS 1 (|U16Vector;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|U16Vector|))))))))))) 

(DEFUN |U16Vector;| ()
  (PROG (|dv$| $ #1=#:G2285 #2=#:G2286 #3=#:G2284 #4=#:G2283 |pv$| #5=#:G2287)
    (RETURN
     (PROGN
      (LETT |dv$| '(|U16Vector|) . #6=(|U16Vector|))
      (LETT $ (GETREFV 34) . #6#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3
                (LETT |pv$|
                      (|buildPredVector| 0 0
                                         (LIST
                                          (|HasCategory| (|Integer|)
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|OrderedSet|))
                                          (LETT #1#
                                                (|HasCategory| (|Integer|)
                                                               '(|SetCategory|))
                                                . #6#)
                                          (OR
                                           (|HasCategory| (|Integer|)
                                                          '(|OrderedSet|))
                                           #1#)
                                          (LETT #2#
                                                (AND
                                                 (|HasCategory| (|Integer|)
                                                                '(|Evalable|
                                                                  (|Integer|)))
                                                 (|HasCategory| (|Integer|)
                                                                '(|SetCategory|)))
                                                . #6#)
                                          (OR
                                           (AND
                                            (|HasCategory| (|Integer|)
                                                           '(|Evalable|
                                                             (|Integer|)))
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|)))
                                           #2#)
                                          (LETT #3#
                                                (|HasCategory| (|Integer|)
                                                               '(|BasicType|))
                                                . #6#)
                                          (OR #3#
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedSet|))
                                              #1#)
                                          (LETT #4#
                                                (|HasCategory| (|Integer|)
                                                               '(|CoercibleTo|
                                                                 (|OutputForm|)))
                                                . #6#)
                                          (OR #4# #2#)))
                      . #6#))
      (|haddProp| |$ConstructorCache| '|U16Vector| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (AND (LETT #5# (|HasCategory| $ '(|finiteAggregate|)) . #6#)
           (|augmentPredVector| $ 1024))
      (AND #5# #1# (|augmentPredVector| $ 2048))
      (AND #5# #3# (|augmentPredVector| $ 4096))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|augmentPredVector| $ 8192))
      (AND (|HasCategory| $ '(|shallowlyMutable|))
           (|HasCategory| (|Integer|) '(|OrderedSet|))
           (|augmentPredVector| $ 16384))
      (AND (OR (AND #5# #3#) #1#) (|augmentPredVector| $ 32768))
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|U16Vector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|) |U16VEC;#;$Nni;1|
              (|Integer|) |U16VEC;minIndex;$I;2| |U16VEC;empty;$;3|
              |U16VEC;new;NniI$;4| |U16VEC;qelt;$2I;5| |U16VEC;elt;$2I;6|
              |U16VEC;qsetelt!;$3I;7| |U16VEC;setelt;$3I;8|
              |U16VEC;fill!;$I$;9| (|List| 8) (|Equation| 8) (|List| 18)
              (|Mapping| 8 8 8) (|Boolean|) (|OutputForm|) (|InputForm|)
              (|HashState|) (|SingleInteger|) (|String|) (|Mapping| 21 8)
              (|Mapping| 21 8 8) (|UniversalSegment| 8) (|Void|)
              (|Mapping| 8 8) (|List| $) (|Union| 8 '"failed"))
           '#(~= 0 |swap!| 6 |sorted?| 13 |sort!| 24 |sort| 35 |smaller?| 46
              |size?| 52 |setelt| 58 |select| 72 |sample| 78 |reverse!| 82
              |reverse| 87 |removeDuplicates| 92 |remove| 97 |reduce| 109
              |qsetelt!| 130 |qelt| 137 |position| 143 |parts| 162 |new| 167
              |more?| 173 |minIndex| 179 |min| 184 |merge| 190 |members| 203
              |member?| 208 |maxIndex| 214 |max| 219 |map!| 225 |map| 231
              |less?| 244 |latex| 250 |insert| 255 |indices| 269 |index?| 274
              |hashUpdate!| 280 |hash| 286 |first| 291 |find| 296 |fill!| 302
              |every?| 308 |eval| 314 |eq?| 340 |entry?| 346 |entries| 352
              |empty?| 357 |empty| 362 |elt| 366 |delete| 385 |count| 397
              |copyInto!| 409 |copy| 416 |convert| 421 |construct| 426 |concat|
              431 |coerce| 454 |any?| 459 >= 465 > 471 = 477 <= 483 < 489 |#|
              495)
           'NIL
           (CONS
            (|makeByteWordVec2| 10
                                '(0 0 0 0 0 2 0 2 0 0 6 4 0 0 0 0 6 1 8 10 2))
            (CONS
             '#(|OneDimensionalArrayAggregate&| |FiniteLinearAggregate&|
                |LinearAggregate&| |IndexedAggregate&| |Collection&|
                |OrderedSet&| |HomogeneousAggregate&| NIL |Aggregate&|
                |EltableAggregate&| |Evalable&| |SetCategory&| NIL NIL NIL NIL
                |InnerEvalable&| NIL |BasicType&| NIL |PartialOrder&|)
             (CONS
              '#((|OneDimensionalArrayAggregate| 8) (|FiniteLinearAggregate| 8)
                 (|LinearAggregate| 8) (|IndexedAggregate| 8 8)
                 (|Collection| 8) (|OrderedSet|) (|HomogeneousAggregate| 8)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 8 8)
                 (|Evalable| 8) (|SetCategory|) (|shallowlyMutable|)
                 (|finiteAggregate|) (|Type|) (|Eltable| 8 8)
                 (|InnerEvalable| 8 8) (|ConvertibleTo| 23) (|BasicType|)
                 (|CoercibleTo| 22) (|PartialOrder|))
              (|makeByteWordVec2| 33
                                  '(2 16 21 0 0 1 3 14 30 0 8 8 1 1 2 21 0 1 2
                                    0 21 28 0 1 1 15 0 0 1 2 14 0 28 0 1 1 2 0
                                    0 1 2 0 0 28 0 1 2 2 21 0 0 1 2 0 21 0 6 1
                                    3 14 8 0 29 8 1 3 14 8 0 8 8 15 2 11 0 27 0
                                    1 0 0 0 1 1 14 0 0 1 1 0 0 0 1 1 13 0 0 1 2
                                    13 0 8 0 1 2 11 0 27 0 1 4 13 8 20 0 8 8 1
                                    2 11 8 20 0 1 3 11 8 20 0 8 1 3 14 8 0 8 8
                                    14 2 0 8 0 8 12 3 7 8 8 0 8 1 2 7 8 8 0 1 2
                                    0 8 27 0 1 1 11 17 0 1 2 0 0 6 8 11 2 0 21
                                    0 6 1 1 2 8 0 9 2 2 0 0 0 1 2 2 0 0 0 1 3 0
                                    0 28 0 0 1 1 11 17 0 1 2 13 21 8 0 1 1 2 8
                                    0 1 2 2 0 0 0 1 2 14 0 31 0 1 3 0 0 20 0 0
                                    1 2 0 0 31 0 1 2 0 21 0 6 1 1 3 26 0 1 3 0
                                    0 0 0 8 1 3 0 0 8 0 8 1 1 0 17 0 1 2 0 21 8
                                    0 1 2 3 24 24 0 1 1 3 25 0 1 1 2 8 0 1 2 0
                                    33 27 0 1 2 14 0 0 8 16 2 11 21 27 0 1 3 5
                                    0 0 8 8 1 3 5 0 0 17 17 1 2 5 0 0 18 1 2 5
                                    0 0 19 1 2 0 21 0 0 1 2 12 21 8 0 1 1 0 17
                                    0 1 1 0 21 0 1 0 0 0 10 2 0 0 0 29 1 3 0 8
                                    0 8 8 1 2 0 8 0 8 13 2 0 0 0 29 1 2 0 0 0 8
                                    1 2 13 6 8 0 1 2 11 6 27 0 1 3 14 0 0 0 8 1
                                    1 0 0 0 1 1 1 23 0 1 1 0 0 17 1 2 0 0 0 0 1
                                    1 0 0 32 1 2 0 0 8 0 1 2 0 0 0 8 1 1 9 22 0
                                    1 2 11 21 27 0 1 2 2 21 0 0 1 2 2 21 0 0 1
                                    2 16 21 0 0 1 2 2 21 0 0 1 2 2 21 0 0 1 1
                                    11 6 0 7)))))
           '|lookupComplete|)) 

(MAKEPROP '|U16Vector| 'NILADIC T) 
