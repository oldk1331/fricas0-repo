
(PUT '|OFTOOL;atom?;OfB;1| '|SPADreplace| 'ATOM) 

(SDEFUN |OFTOOL;atom?;OfB;1| ((|x| |OutputForm|) ($ |Boolean|)) (ATOM |x|)) 

(PUT '|OFTOOL;integer?;OfB;2| '|SPADreplace| 'INTEGERP) 

(SDEFUN |OFTOOL;integer?;OfB;2| ((|x| |OutputForm|) ($ |Boolean|))
        (INTEGERP |x|)) 

(SDEFUN |OFTOOL;integer;OfI;3| ((|x| |OutputForm|) ($ |Integer|))
        (COND ((SPADCALL |x| (QREFELT $ 9)) |x|)
              ('T (|error| "not an integer")))) 

(PUT '|OFTOOL;symbol?;OfB;4| '|SPADreplace| 'SYMBOLP) 

(SDEFUN |OFTOOL;symbol?;OfB;4| ((|x| |OutputForm|) ($ |Boolean|)) (SYMBOLP |x|)) 

(SDEFUN |OFTOOL;symbol;OfS;5| ((|x| |OutputForm|) ($ |Symbol|))
        (COND ((SPADCALL |x| (QREFELT $ 12)) |x|)
              ('T (|error| "not a symbol")))) 

(PUT '|OFTOOL;string?;OfB;6| '|SPADreplace| 'STRINGP) 

(SDEFUN |OFTOOL;string?;OfB;6| ((|x| |OutputForm|) ($ |Boolean|)) (STRINGP |x|)) 

(SDEFUN |OFTOOL;string;OfS;7| ((|x| |OutputForm|) ($ |String|))
        (COND ((SPADCALL |x| (QREFELT $ 15)) |x|)
              ('T (|error| "not a string")))) 

(SDEFUN |OFTOOL;operator;2Of;8| ((|x| |OutputForm|) ($ |OutputForm|))
        (COND ((SPADCALL |x| (QREFELT $ 8)) (|error| "is an atom"))
              ('T (|SPADfirst| |x|)))) 

(SDEFUN |OFTOOL;arguments;OfL;9| ((|x| |OutputForm|) ($ |List| (|OutputForm|)))
        (COND ((SPADCALL |x| (QREFELT $ 8)) (|error| "is an atom"))
              ('T (CDR |x|)))) 

(SDEFUN |OFTOOL;has_op?;OfSB;10|
        ((|expr| |OutputForm|) (|op| |Symbol|) ($ |Boolean|))
        (SPROG ((|e1| (|OutputForm|)))
               (SEQ
                (COND ((SPADCALL |expr| (QREFELT $ 8)) 'NIL)
                      ('T
                       (SEQ
                        (LETT |e1| (|SPADfirst| |expr|)
                              |OFTOOL;has_op?;OfSB;10|)
                        (EXIT (EQ |e1| |op|)))))))) 

(SDEFUN |OFTOOL;is_symbol?;OfSB;11|
        ((|expr| |OutputForm|) (|op| |Symbol|) ($ |Boolean|))
        (COND ((NULL (SPADCALL |expr| (QREFELT $ 12))) 'NIL)
              ('T (EQUAL (SPADCALL |expr| (QREFELT $ 14)) |op|)))) 

(DECLAIM (NOTINLINE |OutputFormTools;|)) 

(DEFUN |OutputFormTools| ()
  (SPROG NIL
         (PROG (#1=#:G132)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|OutputFormTools|)
                    . #2=(|OutputFormTools|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|OutputFormTools|
                             (LIST (CONS NIL (CONS 1 (|OutputFormTools;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|OutputFormTools|)))))))))) 

(DEFUN |OutputFormTools;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|OutputFormTools|) . #1=(|OutputFormTools|))
          (LETT $ (GETREFV 23) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|OutputFormTools| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|OutputFormTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Boolean|) (|OutputForm|)
              |OFTOOL;atom?;OfB;1| |OFTOOL;integer?;OfB;2| (|Integer|)
              |OFTOOL;integer;OfI;3| |OFTOOL;symbol?;OfB;4| (|Symbol|)
              |OFTOOL;symbol;OfS;5| |OFTOOL;string?;OfB;6| (|String|)
              |OFTOOL;string;OfS;7| |OFTOOL;operator;2Of;8| (|List| 7)
              |OFTOOL;arguments;OfL;9| |OFTOOL;has_op?;OfSB;10|
              |OFTOOL;is_symbol?;OfSB;11|)
           '#(|symbol?| 0 |symbol| 5 |string?| 10 |string| 15 |operator| 20
              |is_symbol?| 25 |integer?| 31 |integer| 36 |has_op?| 41 |atom?|
              47 |arguments| 52)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 22
                                                 '(1 0 6 7 12 1 0 13 7 14 1 0 6
                                                   7 15 1 0 16 7 17 1 0 7 7 18
                                                   2 0 6 7 13 22 1 0 6 7 9 1 0
                                                   10 7 11 2 0 6 7 13 21 1 0 6
                                                   7 8 1 0 19 7 20)))))
           '|lookupComplete|)) 

(MAKEPROP '|OutputFormTools| 'NILADIC T) 
