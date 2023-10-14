
(/VERSIONCHECK 2) 

(PUT '|CHAR;=;2$B;1| '|SPADreplace| '|eql_SI|) 

(DEFUN |CHAR;=;2$B;1| (|a| |b| $) (|eql_SI| |a| |b|)) 

(PUT '|CHAR;<;2$B;2| '|SPADreplace| '|less_SI|) 

(DEFUN |CHAR;<;2$B;2| (|a| |b| $) (|less_SI| |a| |b|)) 

(PUT '|CHAR;size;Nni;3| '|SPADreplace| '(XLAM NIL 1114112)) 

(DEFUN |CHAR;size;Nni;3| ($) 1114112) 

(DEFUN |CHAR;index;Pi$;4| (|n| $) (SPADCALL (- |n| 1) (QREFELT $ 13))) 

(DEFUN |CHAR;lookup;$Pi;5| (|c| $)
  (PROG (#1=#:G382)
    (RETURN
     (PROG1 (LETT #1# (+ 1 (SPADCALL |c| (QREFELT $ 16))) |CHAR;lookup;$Pi;5|)
       (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#))))) 

(DEFUN |CHAR;char;I$;6| (|n| $) (SPADCALL |n| (QREFELT $ 18))) 

(PUT '|CHAR;ord;$I;7| '|SPADreplace| '(XLAM (|c|) |c|)) 

(DEFUN |CHAR;ord;$I;7| (|c| $) |c|) 

(DEFUN |CHAR;random;$;8| ($) (SPADCALL (RANDOM 128) (QREFELT $ 13))) 

(PUT '|CHAR;space;$;9| '|SPADreplace| '(XLAM NIL (STR_ELT "   " 0))) 

(DEFUN |CHAR;space;$;9| ($) (STR_ELT "   " 0)) 

(PUT '|CHAR;quote;$;10| '|SPADreplace| '(XLAM NIL (STR_ELT "\" " 0))) 

(DEFUN |CHAR;quote;$;10| ($) (STR_ELT "\" " 0)) 

(PUT '|CHAR;escape;$;11| '|SPADreplace| '(XLAM NIL (STR_ELT "_ " 0))) 

(DEFUN |CHAR;escape;$;11| ($) (STR_ELT "_ " 0)) 

(DEFUN |CHAR;newline;$;12| ($) (SPADCALL 10 (QREFELT $ 13))) 

(PUT '|CHAR;coerce;$Of;13| '|SPADreplace| 'NUM2USTR) 

(DEFUN |CHAR;coerce;$Of;13| (|c| $) (NUM2USTR |c|)) 

(DEFUN |CHAR;digit?;$B;14| (|c| $)
  (SPADCALL |c| (|spadConstant| $ 27) (QREFELT $ 29))) 

(DEFUN |CHAR;hexDigit?;$B;15| (|c| $)
  (SPADCALL |c| (|spadConstant| $ 31) (QREFELT $ 29))) 

(DEFUN |CHAR;upperCase?;$B;16| (|c| $)
  (SPADCALL |c| (|spadConstant| $ 33) (QREFELT $ 29))) 

(DEFUN |CHAR;lowerCase?;$B;17| (|c| $)
  (SPADCALL |c| (|spadConstant| $ 35) (QREFELT $ 29))) 

(DEFUN |CHAR;alphabetic?;$B;18| (|c| $)
  (SPADCALL |c| (|spadConstant| $ 37) (QREFELT $ 29))) 

(DEFUN |CHAR;alphanumeric?;$B;19| (|c| $)
  (SPADCALL |c| (|spadConstant| $ 39) (QREFELT $ 29))) 

(DEFUN |CHAR;latex;$S;20| (|c| $)
  (STRCONC "\\mbox{`" (STRCONC (|make_full_CVEC| 1 |c|) "'}"))) 

(PUT '|CHAR;char;S$;21| '|SPADreplace| '|STR_to_CHAR|) 

(DEFUN |CHAR;char;S$;21| (|s| $) (|STR_to_CHAR| |s|)) 

(DEFUN |CHAR;upperCase;2$;22| (|c| $) (QENUM (PNAME (UPCASE (NUM2CHAR |c|))) 0)) 

(DEFUN |CHAR;lowerCase;2$;23| (|c| $)
  (QENUM (PNAME (DOWNCASE (NUM2CHAR |c|))) 0)) 

(PUT '|CHAR;hashUpdate!;Hs$Hs;24| '|SPADreplace| 'FNV-1A) 

(DEFUN |CHAR;hashUpdate!;Hs$Hs;24| (|hs| |c| $) (FNV-1A |hs| |c|)) 

(DEFUN |Character| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G405)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|Character|) . #2=(|Character|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|Character|
                         (LIST (CONS NIL (CONS 1 (|Character;|))))))
                (LETT #1# T . #2#))
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|Character|))))))))))) 

(DEFUN |Character;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|Character|) . #1=(|Character|))
      (LETT $ (GETREFV 51) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|Character| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6 (|SingleInteger|))
      $)))) 

(MAKEPROP '|Character| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|) |CHAR;=;2$B;1|
              |CHAR;<;2$B;2| (|NonNegativeInteger|) |CHAR;size;Nni;3|
              (|Integer|) |CHAR;char;I$;6| (|PositiveInteger|)
              |CHAR;index;Pi$;4| |CHAR;ord;$I;7| |CHAR;lookup;$Pi;5|
              (0 . |coerce|) |CHAR;random;$;8| |CHAR;space;$;9|
              |CHAR;quote;$;10| |CHAR;escape;$;11| |CHAR;newline;$;12|
              (|OutputForm|) |CHAR;coerce;$Of;13| (|CharacterClass|)
              (5 . |digit|) (|Character|) (9 . |member?|) |CHAR;digit?;$B;14|
              (15 . |hexDigit|) |CHAR;hexDigit?;$B;15| (19 . |upperCase|)
              |CHAR;upperCase?;$B;16| (23 . |lowerCase|)
              |CHAR;lowerCase?;$B;17| (27 . |alphabetic|)
              |CHAR;alphabetic?;$B;18| (31 . |alphanumeric|)
              |CHAR;alphanumeric?;$B;19| (|String|) |CHAR;latex;$S;20|
              |CHAR;char;S$;21| |CHAR;upperCase;2$;22| |CHAR;lowerCase;2$;23|
              (|HashState|) |CHAR;hashUpdate!;Hs$Hs;24| (|InputForm|)
              (|List| $) (|SingleInteger|))
           '#(~= 35 |upperCase?| 41 |upperCase| 46 |space| 51 |smaller?| 55
              |size| 61 |random| 65 |quote| 69 |ord| 73 |newline| 78 |min| 82
              |max| 88 |lowerCase?| 94 |lowerCase| 99 |lookup| 104 |latex| 109
              |index| 114 |hexDigit?| 119 |hashUpdate!| 124 |hash| 130 |escape|
              135 |enumerate| 139 |digit?| 143 |convert| 148 |coerce| 153
              |char| 158 |alphanumeric?| 168 |alphabetic?| 173 >= 178 > 184 =
              190 <= 196 < 202)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL |OrderedSet&| NIL |Finite&| |SetCategory&| NIL
                     |BasicType&| |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedFinite|) (|OrderedSet|) (|Comparable|)
                      (|Finite|) (|SetCategory|) (|ConvertibleTo| 48)
                      (|BasicType|) (|PartialOrder|) (|CoercibleTo| 24))
                   (|makeByteWordVec2| 50
                                       '(1 6 0 12 18 0 26 0 27 2 26 7 28 0 29 0
                                         26 0 31 0 26 0 33 0 26 0 35 0 26 0 37
                                         0 26 0 39 2 0 7 0 0 1 1 0 7 0 34 1 0 0
                                         0 44 0 0 0 20 2 0 7 0 0 1 0 0 10 11 0
                                         0 0 19 0 0 0 21 1 0 12 0 16 0 0 0 23 2
                                         0 0 0 0 1 2 0 0 0 0 1 1 0 7 0 36 1 0 0
                                         0 45 1 0 14 0 17 1 0 41 0 42 1 0 0 14
                                         15 1 0 7 0 32 2 0 46 46 0 47 1 0 50 0
                                         1 0 0 0 22 0 0 49 1 1 0 7 0 30 1 0 48
                                         0 1 1 0 24 0 25 1 0 0 12 13 1 0 0 41
                                         43 1 0 7 0 40 1 0 7 0 38 2 0 7 0 0 1 2
                                         0 7 0 0 1 2 0 7 0 0 8 2 0 7 0 0 1 2 0
                                         7 0 0 9)))))
           '|lookupComplete|)) 

(MAKEPROP '|Character| 'NILADIC T) 
