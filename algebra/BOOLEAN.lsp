
(PUT '|BOOLEAN;test;2$;1| '|SPADreplace| '(XLAM (|a|) |a|)) 

(DEFUN |BOOLEAN;test;2$;1| (|a| $) |a|) 

(DEFUN |BOOLEAN;nt| (|b| $) (COND (|b| 'NIL) ('T 'T))) 

(PUT '|BOOLEAN;true;$;3| '|SPADreplace| '(XLAM NIL 'T)) 

(DEFUN |BOOLEAN;true;$;3| ($) 'T) 

(PUT '|BOOLEAN;false;$;4| '|SPADreplace| '(XLAM NIL NIL)) 

(DEFUN |BOOLEAN;false;$;4| ($) NIL) 

(PUT '|BOOLEAN;not;2$;5| '|SPADreplace| 'NOT) 

(DEFUN |BOOLEAN;not;2$;5| (|b| $) (NOT |b|)) 

(PUT '|BOOLEAN;~;2$;6| '|SPADreplace| 'NOT) 

(DEFUN |BOOLEAN;~;2$;6| (|b| $) (NOT |b|)) 

(PUT '|BOOLEAN;and;3$;7| '|SPADreplace| 'AND) 

(DEFUN |BOOLEAN;and;3$;7| (|a| |b| $) (AND |a| |b|)) 

(PUT '|BOOLEAN;/\\;3$;8| '|SPADreplace| 'AND) 

(DEFUN |BOOLEAN;/\\;3$;8| (|a| |b| $) (AND |a| |b|)) 

(PUT '|BOOLEAN;or;3$;9| '|SPADreplace| 'OR) 

(DEFUN |BOOLEAN;or;3$;9| (|a| |b| $) (OR |a| |b|)) 

(PUT '|BOOLEAN;\\/;3$;10| '|SPADreplace| 'OR) 

(DEFUN |BOOLEAN;\\/;3$;10| (|a| |b| $) (OR |a| |b|)) 

(DEFUN |BOOLEAN;xor;3$;11| (|a| |b| $)
  (COND (|a| (|BOOLEAN;nt| |b| $)) ('T |b|))) 

(DEFUN |BOOLEAN;nor;3$;12| (|a| |b| $)
  (COND (|a| 'NIL) ('T (|BOOLEAN;nt| |b| $)))) 

(DEFUN |BOOLEAN;nand;3$;13| (|a| |b| $)
  (COND (|a| (|BOOLEAN;nt| |b| $)) ('T 'T))) 

(PUT '|BOOLEAN;=;3$;14| '|SPADreplace| '|BooleanEquality|) 

(DEFUN |BOOLEAN;=;3$;14| (|a| |b| $) (|BooleanEquality| |a| |b|)) 

(DEFUN |BOOLEAN;implies;3$;15| (|a| |b| $) (COND (|a| |b|) ('T 'T))) 

(DEFUN |BOOLEAN;<;3$;16| (|a| |b| $)
  (COND (|b| (COND (|a| 'NIL) (#1='T 'T))) (#1# 'NIL))) 

(PUT '|BOOLEAN;size;Nni;17| '|SPADreplace| '(XLAM NIL 2)) 

(DEFUN |BOOLEAN;size;Nni;17| ($) 2) 

(DEFUN |BOOLEAN;index;Pi$;18| (|i| $)
  (COND ((SPADCALL |i| (QREFELT $ 25)) 'NIL) ('T 'T))) 

(DEFUN |BOOLEAN;lookup;$Pi;19| (|a| $) (COND (|a| 1) ('T 2))) 

(DEFUN |BOOLEAN;random;$;20| ($)
  (COND ((SPADCALL (RANDOM 2) (QREFELT $ 25)) 'NIL) ('T 'T))) 

(DEFUN |BOOLEAN;convert;$If;21| (|x| $)
  (COND (|x| (SPADCALL '|true| (QREFELT $ 32)))
        ('T (SPADCALL '|false| (QREFELT $ 32))))) 

(DEFUN |BOOLEAN;coerce;$Of;22| (|x| $)
  (COND (|x| (SPADCALL "true" (QREFELT $ 36)))
        ('T (SPADCALL "false" (QREFELT $ 36))))) 

(DECLAIM (NOTINLINE |Boolean;|)) 

(DEFUN |Boolean| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G345)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|Boolean|) . #2=(|Boolean|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|Boolean|
                         (LIST (CONS NIL (CONS 1 (|Boolean;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|Boolean|))))))))))) 

(DEFUN |Boolean;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|Boolean|) . #1=(|Boolean|))
      (LETT $ (GETREFV 41) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Boolean| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|Boolean| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Boolean|) |BOOLEAN;test;2$;1|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |BOOLEAN;true;$;3|) $))
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |BOOLEAN;false;$;4|) $))
              |BOOLEAN;not;2$;5| |BOOLEAN;~;2$;6| |BOOLEAN;and;3$;7|
              |BOOLEAN;/\\;3$;8| |BOOLEAN;or;3$;9| |BOOLEAN;\\/;3$;10|
              |BOOLEAN;xor;3$;11| |BOOLEAN;nor;3$;12| |BOOLEAN;nand;3$;13|
              |BOOLEAN;=;3$;14| |BOOLEAN;implies;3$;15| |BOOLEAN;<;3$;16|
              (|NonNegativeInteger|) |BOOLEAN;size;Nni;17| (|Integer|)
              (0 . |even?|) (|PositiveInteger|) |BOOLEAN;index;Pi$;18|
              |BOOLEAN;lookup;$Pi;19| |BOOLEAN;random;$;20| (|Symbol|)
              (|InputForm|) (5 . |convert|) |BOOLEAN;convert;$If;21| (|String|)
              (|OutputForm|) (10 . |message|) |BOOLEAN;coerce;$Of;22|
              (|List| $) (|HashState|) (|SingleInteger|))
           '#(~= 15 ~ 21 |xor| 26 |true| 32 |test| 36 |smaller?| 41 |size| 47
              |random| 51 |or| 55 |not| 61 |nor| 66 |nand| 72 |min| 78 |max| 84
              |lookup| 90 |latex| 95 |index| 100 |implies| 105 |hashUpdate!|
              111 |hash| 117 |false| 122 |enumerate| 126 |convert| 130 |coerce|
              135 |and| 140 |\\/| 146 >= 152 > 158 = 164 <= 170 < 176 |/\\|
              182)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL |Finite&| |Logic&| |SetCategory&| NIL
                     |BasicType&| |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|) (|Finite|) (|Logic|)
                      (|SetCategory|) (|ConvertibleTo| 31) (|BasicType|)
                      (|PartialOrder|) (|CoercibleTo| 35))
                   (|makeByteWordVec2| 40
                                       '(1 24 6 0 25 1 31 0 30 32 1 35 0 34 36
                                         2 0 6 0 0 1 1 0 0 0 11 2 0 0 0 0 16 0
                                         0 0 8 1 0 6 0 7 2 0 6 0 0 1 0 0 22 23
                                         0 0 0 29 2 0 0 0 0 14 1 0 0 0 10 2 0 0
                                         0 0 17 2 0 0 0 0 18 2 0 0 0 0 1 2 0 0
                                         0 0 1 1 0 26 0 28 1 0 34 0 1 1 0 0 26
                                         27 2 0 0 0 0 20 2 0 39 39 0 1 1 0 40 0
                                         1 0 0 0 9 0 0 38 1 1 0 31 0 33 1 0 35
                                         0 37 2 0 0 0 0 12 2 0 0 0 0 15 2 0 6 0
                                         0 1 2 0 6 0 0 1 2 0 6 0 0 19 2 0 6 0 0
                                         1 2 0 6 0 0 21 2 0 0 0 0 13)))))
           '|lookupComplete|)) 

(MAKEPROP '|Boolean| 'NILADIC T) 
