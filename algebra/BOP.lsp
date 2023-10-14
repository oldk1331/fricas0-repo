
(/VERSIONCHECK 2) 

(DEFUN |BOP;is?;$SB;1| (|op| |s| $) (EQUAL (SPADCALL |op| (QREFELT $ 13)) |s|)) 

(PUT '|BOP;name;$S;2| '|SPADreplace| '(XLAM (|op|) (QVELT |op| 0))) 

(DEFUN |BOP;name;$S;2| (|op| $) (QVELT |op| 0)) 

(PUT '|BOP;properties;$Al;3| '|SPADreplace| '(XLAM (|op|) (QVELT |op| 2))) 

(DEFUN |BOP;properties;$Al;3| (|op| $) (QVELT |op| 2)) 

(DEFUN |BOP;setProperties;$Al$;4| (|op| |l| $)
  (SEQ (QSETVELT |op| 2 |l|) (EXIT |op|))) 

(DEFUN |BOP;operator;S$;5| (|s| $)
  (|BOP;oper| |s| -1 (SPADCALL (QREFELT $ 19)) $)) 

(DEFUN |BOP;operator;SNni$;6| (|s| |n| $)
  (|BOP;oper| |s| (SPADCALL |n| (QREFELT $ 23)) (SPADCALL (QREFELT $ 19)) $)) 

(DEFUN |BOP;property;$SU;7| (|op| |name| $)
  (SPADCALL |name| (QVELT |op| 2) (QREFELT $ 27))) 

(DEFUN |BOP;assert;$S$;8| (|op| |s| $) (SPADCALL |op| |s| NIL (QREFELT $ 30))) 

(DEFUN |BOP;has?;$SB;9| (|op| |name| $)
  (SPADCALL |name| (QVELT |op| 2) (QREFELT $ 32))) 

(PUT '|BOP;oper| '|SPADreplace| 'VECTOR) 

(DEFUN |BOP;oper| (|se| |n| |prop| $) (VECTOR |se| |n| |prop|)) 

(DEFUN |BOP;weight;$Nni$;11| (|op| |n| $)
  (SPADCALL |op| (QREFELT $ 9) |n| (QREFELT $ 30))) 

(DEFUN |BOP;nullary?;$B;12| (|op| $) (|zero?_SI| (QVELT |op| 1))) 

(DEFUN |BOP;unary?;$B;13| (|op| $) (|eql_SI| (QVELT |op| 1) 1)) 

(DEFUN |BOP;nary?;$B;14| (|op| $) (|negative?_SI| (QVELT |op| 1))) 

(DEFUN |BOP;equality;$M$;15| (|op| |func| $)
  (SPADCALL |op| (QREFELT $ 8) |func| (QREFELT $ 30))) 

(DEFUN |BOP;comparison;$M$;16| (|op| |func| $)
  (SPADCALL |op| (QREFELT $ 7) |func| (QREFELT $ 30))) 

(DEFUN |BOP;display;$M$;17| (|op| |f| $)
  (PROG ()
    (RETURN
     (SPADCALL |op| (CONS #'|BOP;display;$M$;17!0| (VECTOR |f| $))
               (QREFELT $ 45))))) 

(DEFUN |BOP;display;$M$;17!0| (|l1| $$)
  (PROG ($ |f|)
    (LETT $ (QREFELT $$ 1) . #1=(|BOP;display;$M$;17|))
    (LETT |f| (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (SPADCALL (SPADCALL |l1| (QREFELT $ 43)) |f|))))) 

(DEFUN |BOP;deleteProperty!;$S$;18| (|op| |name| $)
  (SEQ (SPADCALL |name| (SPADCALL |op| (QREFELT $ 17)) (QREFELT $ 48))
       (EXIT |op|))) 

(DEFUN |BOP;setProperty;$SN$;19| (|op| |name| |valu| $)
  (SEQ (SPADCALL (QVELT |op| 2) |name| |valu| (QREFELT $ 50)) (EXIT |op|))) 

(DEFUN |BOP;coerce;$Of;20| (|op| $)
  (SPADCALL (SPADCALL |op| (QREFELT $ 13)) (QREFELT $ 51))) 

(DEFUN |BOP;input;$M$;21| (|op| |f| $)
  (SPADCALL |op| (QREFELT $ 11) |f| (QREFELT $ 30))) 

(DEFUN |BOP;display;$M$;22| (|op| |f| $)
  (SPADCALL |op| (QREFELT $ 10) |f| (QREFELT $ 30))) 

(DEFUN |BOP;display;$U;23| (|op| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL |op| (QREFELT $ 10) (QREFELT $ 28))
            |BOP;display;$U;23|)
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed")) ('T (CONS 0 (QCDR |u|))))))))) 

(DEFUN |BOP;input;$U;24| (|op| $)
  (PROG (|u|)
    (RETURN
     (SEQ
      (LETT |u| (SPADCALL |op| (QREFELT $ 11) (QREFELT $ 28))
            |BOP;input;$U;24|)
      (EXIT
       (COND ((QEQCAR |u| 1) (CONS 1 "failed")) ('T (CONS 0 (QCDR |u|))))))))) 

(DEFUN |BOP;arity;$U;25| (|op| $)
  (PROG (#1=#:G203 |n|)
    (RETURN
     (COND
      ((MINUSP (LETT |n| (QVELT |op| 1) . #2=(|BOP;arity;$U;25|)))
       (CONS 1 "failed"))
      ('T
       (CONS 0
             (PROG1 (LETT #1# |n| . #2#)
               (|check_subtype| (>= #1# 0) '(|NonNegativeInteger|) #1#)))))))) 

(DEFUN |BOP;copy;2$;26| (|op| $)
  (PROG (#1=#:G213 |r| #2=#:G212)
    (RETURN
     (SEQ
      (|BOP;oper| (SPADCALL |op| (QREFELT $ 13)) (QVELT |op| 1)
       (SPADCALL
        (PROGN
         (LETT #2# NIL . #3=(|BOP;copy;2$;26|))
         (SEQ (LETT |r| NIL . #3#)
              (LETT #1#
                    (SPADCALL (SPADCALL |op| (QREFELT $ 17)) (QREFELT $ 63))
                    . #3#)
              G190
              (COND
               ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#) . #3#) NIL))
                (GO G191)))
              (SEQ
               (EXIT (LETT #2# (CONS (CONS (QCAR |r|) (QCDR |r|)) #2#) . #3#)))
              (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT (NREVERSE #2#))))
        (QREFELT $ 64))
       $))))) 

(DEFUN |BOP;=;2$B;27| (|op1| |op2| $)
  (PROG (|func|)
    (RETURN
     (SEQ
      (COND ((EQ |op1| |op2|) 'T)
            ((OR
              (SPADCALL (SPADCALL |op1| (QREFELT $ 13))
                        (SPADCALL |op2| (QREFELT $ 13)) (QREFELT $ 66))
              (OR (SPADCALL (QVELT |op1| 1) (QVELT |op2| 1) (QREFELT $ 67))
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (SPADCALL |op1| (QREFELT $ 17)) (QREFELT $ 69))
                    (QREFELT $ 71))
                   (SPADCALL
                    (SPADCALL (SPADCALL |op2| (QREFELT $ 17)) (QREFELT $ 69))
                    (QREFELT $ 71))
                   (QREFELT $ 72))))
             'NIL)
            ('T
             (SEQ
              (LETT |func| (SPADCALL |op1| (QREFELT $ 8) (QREFELT $ 28))
                    |BOP;=;2$B;27|)
              (EXIT
               (COND ((QEQCAR |func| 0) (SPADCALL |op1| |op2| (QCDR |func|)))
                     ('T 'T)))))))))) 

(DEFUN |BOP;weight;$Nni;28| (|op| $)
  (PROG (|w|)
    (RETURN
     (SEQ
      (LETT |w| (SPADCALL |op| (QREFELT $ 9) (QREFELT $ 28))
            |BOP;weight;$Nni;28|)
      (EXIT (COND ((QEQCAR |w| 1) 1) ('T (QCDR |w|)))))))) 

(DEFUN |BOP;<;2$B;29| (|op1| |op2| $)
  (PROG (|func| |n2| |d2| |n1| |d1| |k2| |k1| |w2| |w1|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL
         (LETT |w1| (SPADCALL |op1| (QREFELT $ 74)) . #1=(|BOP;<;2$B;29|))
         (LETT |w2| (SPADCALL |op2| (QREFELT $ 74)) . #1#) (QREFELT $ 75))
        (< |w1| |w2|))
       ((SPADCALL (QVELT |op1| 1) (QVELT |op2| 1) (QREFELT $ 76))
        (< (QVELT |op1| 1) (QVELT |op2| 1)))
       ((SPADCALL (SPADCALL |op1| (QREFELT $ 13))
                  (SPADCALL |op2| (QREFELT $ 13)) (QREFELT $ 66))
        (GGREATERP (SPADCALL |op2| (QREFELT $ 13))
                   (SPADCALL |op1| (QREFELT $ 13))))
       (#2='T
        (SEQ
         (LETT |n1|
               (SPADCALL
                (LETT |k1|
                      (SPADCALL
                       (SPADCALL (SPADCALL |op1| (QREFELT $ 17))
                                 (QREFELT $ 69))
                       (QREFELT $ 71))
                      . #1#)
                (QREFELT $ 77))
               . #1#)
         (LETT |n2|
               (SPADCALL
                (LETT |k2|
                      (SPADCALL
                       (SPADCALL (SPADCALL |op2| (QREFELT $ 17))
                                 (QREFELT $ 69))
                       (QREFELT $ 71))
                      . #1#)
                (QREFELT $ 77))
               . #1#)
         (EXIT
          (COND ((SPADCALL |n1| |n2| (QREFELT $ 75)) (< |n1| |n2|))
                ((NULL
                  (ZEROP
                   (LETT |n1|
                         (SPADCALL
                          (LETT |d1| (SPADCALL |k1| |k2| (QREFELT $ 78)) . #1#)
                          (QREFELT $ 77))
                         . #1#)))
                 (COND
                  ((SPADCALL |n1|
                             (LETT |n2|
                                   (SPADCALL
                                    (LETT |d2|
                                          (SPADCALL |k2| |k1| (QREFELT $ 78))
                                          . #1#)
                                    (QREFELT $ 77))
                                   . #1#)
                             (QREFELT $ 75))
                   (< |n1| |n2|))
                  (#2#
                   (GGREATERP (SPADCALL |d2| (QREFELT $ 79))
                              (SPADCALL |d1| (QREFELT $ 79))))))
                ('T
                 (SEQ
                  (LETT |func| (SPADCALL |op1| (QREFELT $ 7) (QREFELT $ 28))
                        . #1#)
                  (EXIT
                   (COND
                    ((QEQCAR |func| 0) (SPADCALL |op1| |op2| (QCDR |func|)))
                    (#2#
                     (SEQ
                      (LETT |func|
                            (SPADCALL |op1| (QREFELT $ 8) (QREFELT $ 28))
                            . #1#)
                      (EXIT
                       (COND
                        ((QEQCAR |func| 0)
                         (COND ((SPADCALL |op1| |op2| (QCDR |func|)) 'NIL)
                               (#2# 'T)))
                        (#2# 'NIL)))))))))))))))))) 

(DECLAIM (NOTINLINE |BasicOperator;|)) 

(DEFUN |BasicOperator| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G250)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|BasicOperator|)
                . #2=(|BasicOperator|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|BasicOperator|
                         (LIST (CONS NIL (CONS 1 (|BasicOperator;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|BasicOperator|))))))))))) 

(DEFUN |BasicOperator;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|BasicOperator|) . #1=(|BasicOperator|))
      (LETT $ (GETREFV 83) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|BasicOperator| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record| (|:| |opname| (|Symbol|))
                          (|:| |narg| (|SingleInteger|))
                          (|:| |props|
                               (|AssociationList| (|Symbol|) (|None|)))))
      (QSETREFV $ 7 '|%less?|)
      (QSETREFV $ 8 '|%equal?|)
      (QSETREFV $ 9 '|%weight|)
      (QSETREFV $ 10 '|%display|)
      (QSETREFV $ 11 '|%input|)
      $)))) 

(MAKEPROP '|BasicOperator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| 'LESS? 'EQUAL? 'WEIGHT 'DISPLAY
              'SEXPR (|Symbol|) |BOP;name;$S;2| (|Boolean|) |BOP;is?;$SB;1|
              (|AssociationList| 12 29) |BOP;properties;$Al;3|
              |BOP;setProperties;$Al$;4| (0 . |table|) |BOP;operator;S$;5|
              (|Integer|) (|SingleInteger|) (4 . |coerce|)
              (|NonNegativeInteger|) |BOP;operator;SNni$;6|
              (|Union| 29 '"failed") (9 . |search|) |BOP;property;$SU;7|
              (|None|) |BOP;setProperty;$SN$;19| |BOP;assert;$S$;8|
              (15 . |key?|) |BOP;has?;$SB;9| |BOP;weight;$Nni$;11|
              |BOP;nullary?;$B;12| |BOP;unary?;$B;13| |BOP;nary?;$B;14|
              (|Mapping| 14 $ $) |BOP;equality;$M$;15| |BOP;comparison;$M$;16|
              (|OutputForm|) (|List| 41) (21 . |first|) (|Mapping| 41 42)
              |BOP;display;$M$;22| (|Mapping| 41 41) |BOP;display;$M$;17|
              (26 . |remove!|) |BOP;deleteProperty!;$S$;18| (32 . |setelt|)
              (39 . |coerce|) |BOP;coerce;$Of;20|
              (|Mapping| (|InputForm|) (|List| (|InputForm|)))
              |BOP;input;$M$;21| (|Union| 44 '"failed") |BOP;display;$U;23|
              (|Union| 53 '"failed") |BOP;input;$U;24| (|Union| 24 '"failed")
              |BOP;arity;$U;25| (|Record| (|:| |key| 12) (|:| |entry| 29))
              (|List| 61) (44 . |entries|) (49 . |table|) |BOP;copy;2$;26|
              (54 . ~=) (60 . ~=) (|List| 12) (66 . |keys|) (|Set| 12)
              (71 . |brace|) (76 . ~=) |BOP;=;2$B;27| |BOP;weight;$Nni;28|
              (82 . ~=) (88 . ~=) (94 . |#|) (99 . |difference|)
              (105 . |inspect|) |BOP;<;2$B;29| (|String|) (|HashState|))
           '#(~= 110 |weight| 116 |unary?| 127 |smaller?| 132 |setProperty| 138
              |setProperties| 145 |property| 151 |properties| 157 |operator|
              162 |nullary?| 173 |nary?| 178 |name| 183 |min| 188 |max| 194
              |latex| 200 |is?| 205 |input| 211 |hashUpdate!| 222 |hash| 228
              |has?| 233 |equality| 239 |display| 245 |deleteProperty!| 262
              |copy| 268 |comparison| 273 |coerce| 279 |assert| 284 |arity| 290
              >= 295 > 301 = 307 <= 313 < 319)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL |SetCategory&| |BasicType&|
                     |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|) (|SetCategory|)
                      (|BasicType|) (|PartialOrder|) (|CoercibleTo| 41))
                   (|makeByteWordVec2| 82
                                       '(0 16 0 19 1 22 0 21 23 2 16 26 12 0 27
                                         2 16 14 12 0 32 1 42 41 0 43 2 16 26
                                         12 0 48 3 16 29 0 12 29 50 1 12 41 0
                                         51 1 16 62 0 63 1 16 0 62 64 2 12 14 0
                                         0 66 2 22 14 0 0 67 1 16 68 0 69 1 70
                                         0 68 71 2 70 14 0 0 72 2 24 14 0 0 75
                                         2 21 14 0 0 76 1 70 24 0 77 2 70 0 0 0
                                         78 1 70 12 0 79 2 0 14 0 0 1 1 0 24 0
                                         74 2 0 0 0 24 34 1 0 14 0 36 2 0 14 0
                                         0 1 3 0 0 0 12 29 30 2 0 0 0 16 18 2 0
                                         26 0 12 28 1 0 16 0 17 2 0 0 12 24 25
                                         1 0 0 12 20 1 0 14 0 35 1 0 14 0 37 1
                                         0 12 0 13 2 0 0 0 0 1 2 0 0 0 0 1 1 0
                                         81 0 1 2 0 14 0 12 15 2 0 0 0 53 54 1
                                         0 57 0 58 2 0 82 82 0 1 1 0 22 0 1 2 0
                                         14 0 12 33 2 0 0 0 38 39 2 0 0 0 44 45
                                         2 0 0 0 46 47 1 0 55 0 56 2 0 0 0 12
                                         49 1 0 0 0 65 2 0 0 0 38 40 1 0 41 0
                                         52 2 0 0 0 12 31 1 0 59 0 60 2 0 14 0
                                         0 1 2 0 14 0 0 1 2 0 14 0 0 73 2 0 14
                                         0 0 1 2 0 14 0 0 80)))))
           '|lookupComplete|)) 

(MAKEPROP '|BasicOperator| 'NILADIC T) 
