
(SDEFUN |COMPCODE;genCatHeader|
        ((|shortName| |String|) (|longName| |String|) ($ |List| (|String|)))
        (LIST
         (SPADCALL (LIST ")abbrev category " |shortName| " " |longName|)
                   (QREFELT $ 8))
         ""
         (SPADCALL (LIST |longName| "() : Category == Type with")
                   (QREFELT $ 8))
         "" "")) 

(SDEFUN |COMPCODE;genFuncDeclar|
        ((|content| |ILogic|) (|numb| |NonNegativeInteger|)
         ($ |List| (|String|)))
        (SPROG
         ((|resStr| (|String|)) (|notfst| (|Boolean|)) (#1=#:G120 NIL)
          (|thisTerm| NIL) (|resType| (|ILogic|))
          (|deduct| (|List| (|ILogic|))) (#2=#:G119 NIL)
          (|fac| (|List| (|ILogic|))))
         (SEQ
          (EXIT
           (SEQ (LETT |fac| (SPADCALL |content| (QREFELT $ 10)))
                (COND
                 ((NULL |fac|)
                  (PROGN
                   (LETT #2#
                         (LIST
                          (SPADCALL
                           (LIST "  -- error"
                                 (SPADCALL |content| (QREFELT $ 11)))
                           (QREFELT $ 8))))
                   (GO #3=#:G118))))
                (LETT |deduct| (SPADCALL |fac| (QREFELT $ 12)))
                (COND ((NULL |deduct|) (LETT |deduct| |fac|)))
                (LETT |resType| (|SPADfirst| |deduct|))
                (LETT |resStr|
                      (SPADCALL (LIST "  fn" (STRINGIMAGE |numb|) ":(")
                                (QREFELT $ 8)))
                (LETT |notfst| 'NIL)
                (SEQ (LETT |thisTerm| NIL) (LETT #1# |fac|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |thisTerm| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (COND (|notfst| (LETT |resStr| (STRCONC |resStr| ","))))
                      (LETT |resStr|
                            (STRCONC |resStr|
                                     (SPADCALL |thisTerm| (QREFELT $ 13))))
                      (EXIT (LETT |notfst| 'T)))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (LETT |resStr|
                      (SPADCALL
                       (LIST |resStr| ") -> "
                             (SPADCALL |resType| (QREFELT $ 13)))
                       (QREFELT $ 8)))
                (EXIT (LIST |resStr|))))
          #3# (EXIT #2#)))) 

(PUT '|COMPCODE;genCatFooter| '|SPADreplace| '(XLAM NIL (LIST "" "@"))) 

(SDEFUN |COMPCODE;genCatFooter| (($ |List| (|String|))) (LIST "" "@")) 

(SDEFUN |COMPCODE;genPackageHeader|
        ((|shortName| |String|) (|longName| |String|) (|catName| |String|)
         ($ |List| (|String|)))
        (LIST
         (SPADCALL (LIST ")abbrev package " |shortName| " " |longName|)
                   (QREFELT $ 8))
         ""
         (SPADCALL (LIST |longName| "(): Exports == Implementation where")
                   (QREFELT $ 8))
         "" (SPADCALL (LIST " Exports ==> " |catName| " with") (QREFELT $ 8))
         "" " Implementation ==> add" "")) 

(SDEFUN |COMPCODE;genLambdaTerm|
        ((|n| |Lambda| (|Typed|)) (|boundL| |List| (|String|)) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|ch| (|List| (|Lambda| (|Typed|))))
          (|boundL2| (|List| (|String|))) (|varName| (|String|))
          (#1=#:G134 NIL) (|i| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |s| "")
                (COND
                 ((SPADCALL |n| (QREFELT $ 16))
                  (SEQ (LETT |i| (+ (SPADCALL |n| (QREFELT $ 18)) 1))
                       (COND
                        ((SPADCALL |i| 0 (QREFELT $ 19))
                         (COND
                          ((SPADCALL |i| (LENGTH |boundL|) (QREFELT $ 20))
                           (PROGN
                            (LETT #1# (SPADCALL |boundL| |i| (QREFELT $ 23)))
                            (GO #2=#:G133))))))
                       (EXIT (LETT |s| (STRINGIMAGE (- |i| 1)))))))
                (COND
                 ((SPADCALL |n| (QREFELT $ 24))
                  (LETT |s|
                        (SPADCALL (SPADCALL |n| (QREFELT $ 26))
                                  (QREFELT $ 27)))))
                (COND
                 ((SPADCALL |n| (QREFELT $ 28))
                  (SEQ (LETT |ch| (SPADCALL |n| (QREFELT $ 29)))
                       (EXIT
                        (LETT |s|
                              (SPADCALL
                               (LIST " "
                                     (|COMPCODE;genLambdaTerm|
                                      (|SPADfirst| |ch|) |boundL| $)
                                     "("
                                     (|COMPCODE;genLambdaTerm|
                                      (SPADCALL |ch| (QREFELT $ 31)) |boundL|
                                      $)
                                     ")")
                               (QREFELT $ 8)))))))
                (COND
                 ((SPADCALL |n| (QREFELT $ 32))
                  (SEQ
                   (LETT |varName|
                         (SPADCALL (SPADCALL |n| (QREFELT $ 26))
                                   (QREFELT $ 27)))
                   (SEQ G190
                        (COND
                         ((NULL (SPADCALL |varName| |boundL| (QREFELT $ 33)))
                          (GO G191)))
                        (SEQ (EXIT (LETT |varName| (STRCONC |varName| "'"))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (LETT |boundL2|
                         (SPADCALL |boundL| |varName| (QREFELT $ 34)))
                   (LETT |ch| (SPADCALL |n| (QREFELT $ 29)))
                   (EXIT
                    (LETT |s|
                          (SPADCALL
                           (LIST " " |varName| "+->("
                                 (|COMPCODE;genLambdaTerm| (|SPADfirst| |ch|)
                                  |boundL2| $)
                                 ")")
                           (QREFELT $ 8)))))))
                (EXIT |s|)))
          #2# (EXIT #1#)))) 

(SDEFUN |COMPCODE;genFuncDefn|
        ((|content| |Lambda| (|Typed|)) (|numb| |NonNegativeInteger|)
         ($ |List| (|String|)))
        (SPROG
         ((#1=#:G139 NIL) (|lhst| (|String|)) (|lhsn| (|String|))
          (|lhs| (|String|)) (|var| (|Typed|)) (|sl| (|List| (|String|))))
         (SEQ
          (EXIT
           (SEQ (LETT |sl| (LIST ""))
                (COND
                 ((SPADCALL |content| (QREFELT $ 32))
                  (SEQ (LETT |var| (SPADCALL |content| (QREFELT $ 26)))
                       (LETT |lhs| (SPADCALL |var| (QREFELT $ 35)))
                       (LETT |lhsn| (SPADCALL |var| (QREFELT $ 27)))
                       (LETT |lhst|
                             (SPADCALL (SPADCALL |var| (QREFELT $ 36))
                                       (QREFELT $ 13)))
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (LIST
                                (SPADCALL
                                 (LIST "  fn" (STRINGIMAGE |numb|) "(" |lhs|
                                       "):" |lhst| " == "
                                       (|COMPCODE;genLambdaTerm|
                                        (|SPADfirst|
                                         (SPADCALL |content| (QREFELT $ 29)))
                                        (LIST |lhsn|) $))
                                 (QREFELT $ 8))))
                         (GO #2=#:G138))))))
                (EXIT |sl|)))
          #2# (EXIT #1#)))) 

(PUT '|COMPCODE;genPackageFooter| '|SPADreplace| '(XLAM NIL (LIST "" "@"))) 

(SDEFUN |COMPCODE;genPackageFooter| (($ |List| (|String|))) (LIST "" "@")) 

(SDEFUN |COMPCODE;writeCategory;L3SV;8|
        ((|content| |List| (|ILogic|)) (|filename| |String|)
         (|shortName| |String|) (|longName| |String|) ($ |Void|))
        (SPROG
         ((#1=#:G147 NIL) (|line| NIL) (|lines| (|List| (|String|)))
          (|fnNum| (|NonNegativeInteger|)) (#2=#:G146 NIL) (|thisEq| NIL)
          (|f1| (|TextFile|)))
         (SEQ
          (LETT |f1|
                (SPADCALL (SPADCALL |filename| (QREFELT $ 38)) "output"
                          (QREFELT $ 40)))
          (LETT |lines| (|COMPCODE;genCatHeader| |shortName| |longName| $))
          (LETT |fnNum| 1)
          (SEQ (LETT |thisEq| NIL) (LETT #2# |content|) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |thisEq| (CAR #2#)) NIL))
                 (GO G191)))
               (SEQ
                (LETT |lines|
                      (SPADCALL |lines|
                                (|COMPCODE;genFuncDeclar| |thisEq| |fnNum| $)
                                (QREFELT $ 41)))
                (EXIT (LETT |fnNum| (+ |fnNum| 1))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (LETT |lines|
                (SPADCALL |lines| (|COMPCODE;genCatFooter| $) (QREFELT $ 41)))
          (SEQ (LETT |line| NIL) (LETT #1# |lines|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |line| (CAR #1#)) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |f1| |line| (QREFELT $ 42))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |f1| (QREFELT $ 43)))))) 

(SDEFUN |COMPCODE;writePackage;L4SV;9|
        ((|content| |List| (|Lambda| (|Typed|))) (|filename| |String|)
         (|shortName| |String|) (|longName| |String|) (|catName| |String|)
         ($ |Void|))
        (SPROG
         ((#1=#:G154 NIL) (|line| NIL) (|lines| (|List| (|String|)))
          (|fnNum| (|NonNegativeInteger|)) (#2=#:G153 NIL) (|thisEq| NIL)
          (|f1| (|TextFile|)))
         (SEQ
          (LETT |f1|
                (SPADCALL (SPADCALL |filename| (QREFELT $ 38)) "output"
                          (QREFELT $ 40)))
          (LETT |lines|
                (|COMPCODE;genPackageHeader| |shortName| |longName| |catName|
                 $))
          (LETT |fnNum| 1)
          (SEQ (LETT |thisEq| NIL) (LETT #2# |content|) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |thisEq| (CAR #2#)) NIL))
                 (GO G191)))
               (SEQ
                (LETT |lines|
                      (SPADCALL |lines|
                                (|COMPCODE;genFuncDefn| |thisEq| |fnNum| $)
                                (QREFELT $ 41)))
                (EXIT (LETT |fnNum| (+ |fnNum| 1))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (LETT |lines|
                (SPADCALL |lines| (|COMPCODE;genPackageFooter| $)
                          (QREFELT $ 41)))
          (SEQ (LETT |line| NIL) (LETT #1# |lines|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |line| (CAR #1#)) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |f1| |line| (QREFELT $ 42))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |f1| (QREFELT $ 43)))))) 

(DECLAIM (NOTINLINE |compCode;|)) 

(DEFUN |compCode| ()
  (SPROG NIL
         (PROG (#1=#:G156)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|compCode|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|compCode|
                             (LIST (CONS NIL (CONS 1 (|compCode;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|compCode|)))))))))) 

(DEFUN |compCode;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|compCode|))
          (LETT $ (GETREFV 48))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|compCode| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|compCode| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| $) (|String|) (0 . |concat|)
              (|ILogic|) (5 . |factor|) (10 . |toString|) (15 . |deductions|)
              (20 . |toStringUnwrapped|) (|Boolean|) (|Lambda| 25)
              (25 . |isBoundNode?|) (|NonNegativeInteger|)
              (30 . |getBoundValue|) (35 . >) (41 . <=) (|Integer|) (|List| 7)
              (47 . |elt|) (53 . |isFreeNode?|) (|Typed|) (58 . |getVariable|)
              (63 . |getName|) (68 . |isCompound?|) (73 . |getChildren|)
              (|List| 15) (78 . |second|) (83 . |isLambda?|) (88 . |member?|)
              (94 . |concat|) (100 . |toString|) (105 . |getType|) (|FileName|)
              (110 . |coerce|) (|TextFile|) (115 . |open|) (121 . |concat|)
              (127 . |writeLine!|) (133 . |close!|) (|Void|) (|List| 9)
              |COMPCODE;writeCategory;L3SV;8| |COMPCODE;writePackage;L4SV;9|)
           '#(|writePackage| 138 |writeCategory| 147) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|writeCategory|
                                 ((|Void|) (|List| (|ILogic|)) (|String|)
                                  (|String|) (|String|)))
                                T)
                              '((|writePackage|
                                 ((|Void|) (|List| (|Lambda| (|Typed|)))
                                  (|String|) (|String|) (|String|) (|String|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 47
                                            '(1 7 0 6 8 1 9 6 0 10 1 9 7 0 11 1
                                              9 6 6 12 1 9 7 0 13 1 15 14 0 16
                                              1 15 17 0 18 2 17 14 0 0 19 2 17
                                              14 0 0 20 2 22 7 0 21 23 1 15 14
                                              0 24 1 15 25 0 26 1 25 7 0 27 1
                                              15 14 0 28 1 15 6 0 29 1 30 15 0
                                              31 1 15 14 0 32 2 22 14 7 0 33 2
                                              22 0 0 7 34 1 25 7 0 35 1 25 9 0
                                              36 1 37 0 7 38 2 39 0 37 7 40 2
                                              22 0 0 0 41 2 39 7 0 7 42 1 39 0
                                              0 43 5 0 44 30 7 7 7 7 47 4 0 44
                                              45 7 7 7 46)))))
           '|lookupComplete|)) 

(MAKEPROP '|compCode| 'NILADIC T) 
