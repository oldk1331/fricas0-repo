
(PUT '|CHAR;=;2%B;1| '|SPADreplace| '|eql_SI|) 

(SDEFUN |CHAR;=;2%B;1| ((|a| (%)) (|b| (%)) (% (|Boolean|))) (|eql_SI| |a| |b|)) 

(PUT '|CHAR;<;2%B;2| '|SPADreplace| '|less_SI|) 

(SDEFUN |CHAR;<;2%B;2| ((|a| (%)) (|b| (%)) (% (|Boolean|)))
        (|less_SI| |a| |b|)) 

(PUT '|CHAR;size;Nni;3| '|SPADreplace| '(XLAM NIL 1114112)) 

(SDEFUN |CHAR;size;Nni;3| ((% (|NonNegativeInteger|))) 1114112) 

(SDEFUN |CHAR;index;Pi%;4| ((|n| (|PositiveInteger|)) (% (%)))
        (SPADCALL (- |n| 1) (QREFELT % 13))) 

(SDEFUN |CHAR;lookup;%Pi;5| ((|c| (%)) (% (|PositiveInteger|)))
        (SPROG ((#1=#:G266 NIL))
               (PROG1 (LETT #1# (+ 1 (SPADCALL |c| (QREFELT % 16))))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                   #1#)))) 

(SDEFUN |CHAR;char;I%;6| ((|n| (|Integer|)) (% (%)))
        (SPADCALL |n| (QREFELT % 18))) 

(PUT '|CHAR;ord;%I;7| '|SPADreplace| '(XLAM (|c|) |c|)) 

(SDEFUN |CHAR;ord;%I;7| ((|c| (%)) (% (|Integer|))) |c|) 

(SDEFUN |CHAR;random;%;8| ((% (%))) (SPADCALL (RANDOM 128) (QREFELT % 13))) 

(SDEFUN |CHAR;space;%;9| ((% (%))) (SPADCALL 32 (QREFELT % 13))) 

(SDEFUN |CHAR;quote;%;10| ((% (%))) (SPADCALL 34 (QREFELT % 13))) 

(SDEFUN |CHAR;underscore;%;11| ((% (%))) (SPADCALL 95 (QREFELT % 13))) 

(SDEFUN |CHAR;newline;%;12| ((% (%))) (SPADCALL 10 (QREFELT % 13))) 

(SDEFUN |CHAR;coerce;%Of;13| ((|c| (%)) (% (|OutputForm|)))
        (NUM2USTR (SPADCALL |c| (QREFELT % 16)))) 

(SDEFUN |CHAR;digit?;%B;14| ((|c| (%)) (% (|Boolean|)))
        (SPADCALL |c| (|spadConstant| % 27) (QREFELT % 29))) 

(SDEFUN |CHAR;hexDigit?;%B;15| ((|c| (%)) (% (|Boolean|)))
        (SPADCALL |c| (|spadConstant| % 31) (QREFELT % 29))) 

(SDEFUN |CHAR;upperCase?;%B;16| ((|c| (%)) (% (|Boolean|)))
        (SPADCALL |c| (|spadConstant| % 33) (QREFELT % 29))) 

(SDEFUN |CHAR;lowerCase?;%B;17| ((|c| (%)) (% (|Boolean|)))
        (SPADCALL |c| (|spadConstant| % 35) (QREFELT % 29))) 

(SDEFUN |CHAR;alphabetic?;%B;18| ((|c| (%)) (% (|Boolean|)))
        (SPADCALL |c| (|spadConstant| % 37) (QREFELT % 29))) 

(SDEFUN |CHAR;alphanumeric?;%B;19| ((|c| (%)) (% (|Boolean|)))
        (SPADCALL |c| (|spadConstant| % 39) (QREFELT % 29))) 

(PUT '|CHAR;char;S%;20| '|SPADreplace| '|STR_to_CHAR|) 

(SDEFUN |CHAR;char;S%;20| ((|s| (|String|)) (% (%))) (|STR_to_CHAR| |s|)) 

(SDEFUN |CHAR;upperCase;2%;21| ((|c| (%)) (% (%)))
        (STR_ELT (PNAME (UPCASE (NUM2CHAR (SPADCALL |c| (QREFELT % 16))))) 0)) 

(SDEFUN |CHAR;lowerCase;2%;22| ((|c| (%)) (% (%)))
        (STR_ELT (PNAME (DOWNCASE (NUM2CHAR (SPADCALL |c| (QREFELT % 16))))) 0)) 

(PUT '|CHAR;hashUpdate!;Hs%Hs;23| '|SPADreplace| 'HASHSTATEUPDATE) 

(SDEFUN |CHAR;hashUpdate!;Hs%Hs;23|
        ((|hs| (|HashState|)) (|c| (%)) (% (|HashState|)))
        (HASHSTATEUPDATE |hs| |c|)) 

(DECLAIM (NOTINLINE |Character;|)) 

(DEFUN |Character| ()
  (SPROG NIL
         (PROG (#1=#:G287)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Character|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Character|
                             (LIST (CONS NIL (CONS 1 (|Character;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|Character|)))))))))) 

(DEFUN |Character;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Character|))
          (LETT % (GETREFV 50))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Character| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (|SingleInteger|))
          %))) 

(MAKEPROP '|Character| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|) |CHAR;=;2%B;1|
              |CHAR;<;2%B;2| (|NonNegativeInteger|) |CHAR;size;Nni;3|
              (|Integer|) |CHAR;char;I%;6| (|PositiveInteger|)
              |CHAR;index;Pi%;4| |CHAR;ord;%I;7| |CHAR;lookup;%Pi;5|
              (0 . |coerce|) |CHAR;random;%;8| |CHAR;space;%;9|
              |CHAR;quote;%;10| |CHAR;underscore;%;11| |CHAR;newline;%;12|
              (|OutputForm|) |CHAR;coerce;%Of;13| (|CharacterClass|)
              (5 . |digit|) (|Character|) (9 . |member?|) |CHAR;digit?;%B;14|
              (15 . |hexDigit|) |CHAR;hexDigit?;%B;15| (19 . |upperCase|)
              |CHAR;upperCase?;%B;16| (23 . |lowerCase|)
              |CHAR;lowerCase?;%B;17| (27 . |alphabetic|)
              |CHAR;alphabetic?;%B;18| (31 . |alphanumeric|)
              |CHAR;alphanumeric?;%B;19| (|String|) |CHAR;char;S%;20|
              |CHAR;upperCase;2%;21| |CHAR;lowerCase;2%;22| (|HashState|)
              |CHAR;hashUpdate!;Hs%Hs;23| (|List| %) (|SingleInteger|)
              (|InputForm|))
           '#(~= 35 |upperCase?| 41 |upperCase| 46 |underscore| 51 |space| 55
              |smaller?| 59 |size| 65 |random| 69 |quote| 73 |ord| 77 |newline|
              82 |min| 86 |max| 92 |lowerCase?| 98 |lowerCase| 103 |lookup| 108
              |latex| 113 |index| 118 |hexDigit?| 123 |hashUpdate!| 128 |hash|
              134 |enumerate| 139 |digit?| 143 |convert| 148 |coerce| 153
              |char| 158 |alphanumeric?| 168 |alphabetic?| 173 >= 178 > 184 =
              190 <= 196 < 202)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL |Finite&| |OrderedSet&| NIL |SetCategory&| |Hashable&|
                     NIL |PartialOrder&| |BasicType&| NIL)
                  (CONS
                   '#((|OrderedFinite|) (|Finite|) (|OrderedSet|)
                      (|Comparable|) (|SetCategory|) (|Hashable|)
                      (|CoercibleTo| 24) (|PartialOrder|) (|BasicType|)
                      (|ConvertibleTo| 49))
                   (|makeByteWordVec2| 49
                                       '(1 6 0 12 18 0 26 0 27 2 26 7 28 0 29 0
                                         26 0 31 0 26 0 33 0 26 0 35 0 26 0 37
                                         0 26 0 39 2 0 7 0 0 1 1 0 7 0 34 1 0 0
                                         0 43 0 0 0 22 0 0 0 20 2 0 7 0 0 1 0 0
                                         10 11 0 0 0 19 0 0 0 21 1 0 12 0 16 0
                                         0 0 23 2 0 0 0 0 1 2 0 0 0 0 1 1 0 7 0
                                         36 1 0 0 0 44 1 0 14 0 17 1 0 41 0 1 1
                                         0 0 14 15 1 0 7 0 32 2 0 45 45 0 46 1
                                         0 48 0 1 0 0 47 1 1 0 7 0 30 1 0 49 0
                                         1 1 0 24 0 25 1 0 0 41 42 1 0 0 12 13
                                         1 0 7 0 40 1 0 7 0 38 2 0 7 0 0 1 2 0
                                         7 0 0 1 2 0 7 0 0 8 2 0 7 0 0 1 2 0 7
                                         0 0 9)))))
           '|lookupComplete|)) 
