
(SDEFUN |OMEXPR;outputOMArith1|
        ((|dev| |OpenMathDevice|) (|sym| |String|)
         (|args| |List| (|Expression| R)) ($ |Void|))
        (SPROG ((#1=#:G125 NIL) (|arg| NIL))
               (SEQ (SPADCALL |dev| (QREFELT $ 16))
                    (SPADCALL |dev| "arith1" |sym| (QREFELT $ 18))
                    (SEQ (LETT |arg| NIL . #2=(|OMEXPR;outputOMArith1|))
                         (LETT #1# |args| . #2#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |arg| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT (SPADCALL |dev| |arg| 'NIL (QREFELT $ 21))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |dev| (QREFELT $ 22)))))) 

(SDEFUN |OMEXPR;outputOMLambda|
        ((|dev| |OpenMathDevice|) (|ex| |Expression| R) (|var| |Expression| R)
         ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 23))
             (SPADCALL |dev| "fns1" "lambda" (QREFELT $ 18))
             (SPADCALL |dev| (QREFELT $ 24))
             (SPADCALL |dev| |var| 'NIL (QREFELT $ 21))
             (SPADCALL |dev| (QREFELT $ 25))
             (SPADCALL |dev| |ex| 'NIL (QREFELT $ 21))
             (EXIT (SPADCALL |dev| (QREFELT $ 26))))) 

(SDEFUN |OMEXPR;outputOMInterval|
        ((|dev| |OpenMathDevice|) (|lo| |Expression| R) (|hi| |Expression| R)
         ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 16))
             (SPADCALL |dev| "interval1" "interval" (QREFELT $ 18))
             (SPADCALL |dev| |lo| 'NIL (QREFELT $ 21))
             (SPADCALL |dev| |hi| 'NIL (QREFELT $ 21))
             (EXIT (SPADCALL |dev| (QREFELT $ 22))))) 

(SDEFUN |OMEXPR;outputOMIntInterval|
        ((|dev| |OpenMathDevice|) (|lo| |Expression| R) (|hi| |Expression| R)
         ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 16))
             (SPADCALL |dev| "interval1" "integer_interval" (QREFELT $ 18))
             (SPADCALL |dev| |lo| 'NIL (QREFELT $ 21))
             (SPADCALL |dev| |hi| 'NIL (QREFELT $ 21))
             (EXIT (SPADCALL |dev| (QREFELT $ 22))))) 

(SDEFUN |OMEXPR;outputOMBinomial|
        ((|dev| |OpenMathDevice|) (|args| |List| (|Expression| R)) ($ |Void|))
        (SPROG ((#1=#:G136 NIL) (|arg| NIL))
               (SEQ
                (COND
                 ((NULL (EQL (LENGTH |args|) 2))
                  (|error| "Wrong number of arguments to binomial"))
                 ('T
                  (SEQ (SPADCALL |dev| (QREFELT $ 16))
                       (SPADCALL |dev| "combinat1" "binomial" (QREFELT $ 18))
                       (SEQ (LETT |arg| NIL . #2=(|OMEXPR;outputOMBinomial|))
                            (LETT #1# |args| . #2#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |arg| (CAR #1#) . #2#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT (SPADCALL |dev| |arg| 'NIL (QREFELT $ 21))))
                            (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT (SPADCALL |dev| (QREFELT $ 22))))))))) 

(SDEFUN |OMEXPR;outputOMPower|
        ((|dev| |OpenMathDevice|) (|args| |List| (|Expression| R)) ($ |Void|))
        (COND
         ((NULL (EQL (LENGTH |args|) 2))
          (|error| "Wrong number of arguments to power"))
         ('T (|OMEXPR;outputOMArith1| |dev| "power" |args| $)))) 

(SDEFUN |OMEXPR;outputOMDefsum|
        ((|dev| |OpenMathDevice|) (|args| |List| (|Expression| R)) ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL (LENGTH |args|) 5 (QREFELT $ 28))
           (|error| "Unexpected number of arguments to a defsum"))
          ('T
           (SEQ (SPADCALL |dev| (QREFELT $ 16))
                (SPADCALL |dev| "arith1" "sum" (QREFELT $ 18))
                (|OMEXPR;outputOMIntInterval| |dev|
                 (SPADCALL |args| 4 (QREFELT $ 31))
                 (SPADCALL |args| 5 (QREFELT $ 31)) $)
                (|OMEXPR;outputOMLambda| |dev|
                 (SPADCALL (SPADCALL |args| 1 (QREFELT $ 31))
                           (SPADCALL |args| 2 (QREFELT $ 31))
                           (SPADCALL |args| 3 (QREFELT $ 31)) (QREFELT $ 34))
                 (SPADCALL |args| 3 (QREFELT $ 31)) $)
                (EXIT (SPADCALL |dev| (QREFELT $ 22)))))))) 

(SDEFUN |OMEXPR;outputOMDefprod|
        ((|dev| |OpenMathDevice|) (|args| |List| (|Expression| R)) ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL (LENGTH |args|) 5 (QREFELT $ 28))
           (|error| "Unexpected number of arguments to a defprod"))
          ('T
           (SEQ (SPADCALL |dev| (QREFELT $ 16))
                (SPADCALL |dev| "arith1" "product" (QREFELT $ 18))
                (|OMEXPR;outputOMIntInterval| |dev|
                 (SPADCALL |args| 4 (QREFELT $ 31))
                 (SPADCALL |args| 5 (QREFELT $ 31)) $)
                (|OMEXPR;outputOMLambda| |dev|
                 (SPADCALL (SPADCALL |args| 1 (QREFELT $ 31))
                           (SPADCALL |args| 2 (QREFELT $ 31))
                           (SPADCALL |args| 3 (QREFELT $ 31)) (QREFELT $ 34))
                 (SPADCALL |args| 3 (QREFELT $ 31)) $)
                (EXIT (SPADCALL |dev| (QREFELT $ 22)))))))) 

(SDEFUN |OMEXPR;outputOMDefint|
        ((|dev| |OpenMathDevice|) (|args| |List| (|Expression| R)) ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL (LENGTH |args|) 5 (QREFELT $ 28))
           (|error| "Unexpected number of arguments to a defint"))
          ('T
           (SEQ (SPADCALL |dev| (QREFELT $ 16))
                (SPADCALL |dev| "calculus1" "defint" (QREFELT $ 18))
                (|OMEXPR;outputOMInterval| |dev|
                 (SPADCALL |args| 4 (QREFELT $ 31))
                 (SPADCALL |args| 5 (QREFELT $ 31)) $)
                (|OMEXPR;outputOMLambda| |dev|
                 (SPADCALL (SPADCALL |args| 1 (QREFELT $ 31))
                           (SPADCALL |args| 2 (QREFELT $ 31))
                           (SPADCALL |args| 3 (QREFELT $ 31)) (QREFELT $ 34))
                 (SPADCALL |args| 3 (QREFELT $ 31)) $)
                (EXIT (SPADCALL |dev| (QREFELT $ 22)))))))) 

(SDEFUN |OMEXPR;outputOMInt|
        ((|dev| |OpenMathDevice|) (|args| |List| (|Expression| R)) ($ |Void|))
        (SEQ
         (COND
          ((SPADCALL (LENGTH |args|) 3 (QREFELT $ 28))
           (|error| "Unexpected number of arguments to a defint"))
          ('T
           (SEQ (SPADCALL |dev| (QREFELT $ 16))
                (SPADCALL |dev| "calculus1" "int" (QREFELT $ 18))
                (|OMEXPR;outputOMLambda| |dev|
                 (SPADCALL (SPADCALL |args| 1 (QREFELT $ 31))
                           (SPADCALL |args| 2 (QREFELT $ 31))
                           (SPADCALL |args| 3 (QREFELT $ 31)) (QREFELT $ 34))
                 (SPADCALL |args| 3 (QREFELT $ 31)) $)
                (EXIT (SPADCALL |dev| (QREFELT $ 22)))))))) 

(SDEFUN |OMEXPR;outputOMFunction|
        ((|dev| |OpenMathDevice|) (|op| |Symbol|)
         (|args| |List| (|Expression| R)) ($ |Void|))
        (SPROG
         ((#1=#:G167 NIL) (|arg| NIL)
          (|omOp|
           (|Union| (|Record| (|:| |cd| (|String|)) (|:| |name| (|String|)))
                    "failed"))
          (|nargs| (|NonNegativeInteger|)))
         (SEQ (LETT |nargs| (LENGTH |args|) . #2=(|OMEXPR;outputOMFunction|))
              (EXIT
               (COND
                ((ZEROP |nargs|)
                 (SEQ
                  (LETT |omOp| (SPADCALL |op| (QREFELT $ 12) (QREFELT $ 37))
                        . #2#)
                  (EXIT
                   (COND
                    ((QEQCAR |omOp| 1)
                     (|error|
                      (|concat|
                       (|construct|
                        "No OpenMath definition for nullary function "
                        (|coerce| |op|)))))
                    (#3='T
                     (SPADCALL |dev| (QCAR (QCDR |omOp|)) (QCDR (QCDR |omOp|))
                               (QREFELT $ 18)))))))
                ((EQL |nargs| 1)
                 (SEQ
                  (LETT |omOp| (SPADCALL |op| (QREFELT $ 13) (QREFELT $ 37))
                        . #2#)
                  (EXIT
                   (COND
                    ((QEQCAR |omOp| 1)
                     (|error|
                      (|concat|
                       (|construct|
                        "No OpenMath definition for unary function "
                        (|coerce| |op|)))))
                    (#3#
                     (SEQ (SPADCALL |dev| (QREFELT $ 16))
                          (SPADCALL |dev| (QCAR (QCDR |omOp|))
                                    (QCDR (QCDR |omOp|)) (QREFELT $ 18))
                          (SEQ (LETT |arg| NIL . #2#) (LETT #1# |args| . #2#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |arg| (CAR #1#) . #2#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (SPADCALL |dev| |arg| 'NIL (QREFELT $ 21))))
                               (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (SPADCALL |dev| (QREFELT $ 22)))))))))
                (#3#
                 (COND
                  ((EQUAL |op| '|%defint|)
                   (|OMEXPR;outputOMDefint| |dev| |args| $))
                  ((EQUAL |op| '|integral|)
                   (|OMEXPR;outputOMInt| |dev| |args| $))
                  ((EQUAL |op| '|%defsum|)
                   (|OMEXPR;outputOMDefsum| |dev| |args| $))
                  ((EQUAL |op| '|%defprod|)
                   (|OMEXPR;outputOMDefprod| |dev| |args| $))
                  ((EQUAL |op| '|%power|)
                   (|OMEXPR;outputOMPower| |dev| |args| $))
                  ((EQUAL |op| '|binomial|)
                   (|OMEXPR;outputOMBinomial| |dev| |args| $))
                  (#3#
                   (|error|
                    (SPADCALL
                     (SPADCALL
                      (LIST "No OpenMath definition for function "
                            (SPADCALL |op| (QREFELT $ 39)))
                      (QREFELT $ 41))
                     (QREFELT $ 43))))))))))) 

(SDEFUN |OMEXPR;outputOMExpr|
        ((|dev| |OpenMathDevice|) (|ex| |Expression| R) ($ |Void|))
        (SPROG
         ((|k| (|Kernel| (|Expression| R))) (#1=#:G191 NIL)
          (|z|
           (|Union|
            (|Record| (|:| |val| (|Expression| R))
                      (|:| |exponent| (|Integer|)))
            "failed"))
          (|s| (|Union| (|Symbol|) "failed"))
          (|x|
           (|Union|
            (|Record| (|:| |var| (|Kernel| (|Expression| R)))
                      (|:| |exponent| (|Integer|)))
            "failed"))
          (|w| (|Union| (|List| (|Expression| R)) "failed"))
          (|v| (|Union| (|Symbol|) "failed")))
         (SEQ
          (COND
           ((SPADCALL |ex| (QREFELT $ 44))
            (SPADCALL |dev| (SPADCALL |ex| (QREFELT $ 45)) 'NIL
                      (QREFELT $ 46)))
           ('T
            (SEQ
             (EXIT
              (SEQ
               (SEQ
                (LETT |v| (SPADCALL |ex| (QREFELT $ 48))
                      . #2=(|OMEXPR;outputOMExpr|))
                (EXIT
                 (COND
                  ((NULL (QEQCAR |v| 1))
                   (PROGN
                    (LETT #1# (SPADCALL |dev| (QCDR |v|) (QREFELT $ 49)) . #2#)
                    (GO #1#))))))
               (SEQ (LETT |w| (SPADCALL |ex| (QREFELT $ 51)) . #2#)
                    (EXIT
                     (COND
                      ((NULL (QEQCAR |w| 1))
                       (PROGN
                        (LETT #1#
                              (|OMEXPR;outputOMArith1| |dev| "plus" (QCDR |w|)
                               $)
                              . #2#)
                        (GO #1#))))))
               (SEQ (LETT |w| (SPADCALL |ex| (QREFELT $ 52)) . #2#)
                    (EXIT
                     (COND
                      ((NULL (QEQCAR |w| 1))
                       (PROGN
                        (LETT #1#
                              (|OMEXPR;outputOMArith1| |dev| "times" (QCDR |w|)
                               $)
                              . #2#)
                        (GO #1#))))))
               (SEQ (LETT |x| (SPADCALL |ex| (QREFELT $ 55)) . #2#)
                    (EXIT
                     (COND
                      ((NULL (QEQCAR |x| 1))
                       (COND
                        ((NULL (EQL (QCDR (QCDR |x|)) 1))
                         (PROGN
                          (LETT #1#
                                (SEQ
                                 (LETT |s|
                                       (SPADCALL (QCAR (QCDR |x|))
                                                 (QREFELT $ 57))
                                       . #2#)
                                 (EXIT
                                  (COND
                                   ((NULL (QEQCAR |s| 1))
                                    (PROGN
                                     (LETT #1#
                                           (SEQ (SPADCALL |dev| (QREFELT $ 16))
                                                (SPADCALL |dev| "arith1"
                                                          "power"
                                                          (QREFELT $ 18))
                                                (SPADCALL |dev| (QCDR |s|)
                                                          (QREFELT $ 49))
                                                (SPADCALL |dev|
                                                          (QCDR (QCDR |x|))
                                                          (QREFELT $ 58))
                                                (EXIT
                                                 (SPADCALL |dev|
                                                           (QREFELT $ 22))))
                                           . #2#)
                                     (GO #1#))))))
                                . #2#)
                          (GO #1#))))))))
               (SEQ (LETT |z| (SPADCALL |ex| (QREFELT $ 61)) . #2#)
                    (EXIT
                     (COND
                      ((NULL (QEQCAR |z| 1))
                       (COND
                        ((NULL (EQL (QCDR (QCDR |z|)) 1))
                         (PROGN
                          (LETT #1#
                                (|OMEXPR;outputOMPower| |dev|
                                 (LIST (QCAR (QCDR |z|))
                                       (SPADCALL (QCDR (QCDR |z|))
                                                 (QREFELT $ 62)))
                                 $)
                                . #2#)
                          (GO #1#))))))))
               (LETT |k| (|SPADfirst| (SPADCALL |ex| (QREFELT $ 64))) . #2#)
               (EXIT
                (|OMEXPR;outputOMFunction| |dev|
                 (SPADCALL (SPADCALL |k| (QREFELT $ 66)) (QREFELT $ 67))
                 (SPADCALL |k| (QREFELT $ 68)) $))))
             #1# (EXIT #1#))))))) 

(SDEFUN |OMEXPR;OMwrite;ES;13| ((|ex| |Expression| R) ($ |String|))
        (SPROG ((|s| (|String|)) (|dev| (|OpenMathDevice|)) (|sp| NIL))
               (SEQ (LETT |s| "" . #1=(|OMEXPR;OMwrite;ES;13|))
                    (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
                    (LETT |dev|
                          (SPADCALL |sp| (SPADCALL (QREFELT $ 70))
                                    (QREFELT $ 71))
                          . #1#)
                    (SPADCALL |dev| (QREFELT $ 72))
                    (|OMEXPR;outputOMExpr| |dev| |ex| $)
                    (SPADCALL |dev| (QREFELT $ 73))
                    (SPADCALL |dev| (QREFELT $ 74))
                    (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|)))) 

(SDEFUN |OMEXPR;OMwrite;EBS;14|
        ((|ex| |Expression| R) (|wholeObj| |Boolean|) ($ |String|))
        (SPROG ((|s| (|String|)) (|dev| (|OpenMathDevice|)) (|sp| NIL))
               (SEQ (LETT |s| "" . #1=(|OMEXPR;OMwrite;EBS;14|))
                    (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
                    (LETT |dev|
                          (SPADCALL |sp| (SPADCALL (QREFELT $ 70))
                                    (QREFELT $ 71))
                          . #1#)
                    (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 72))))
                    (|OMEXPR;outputOMExpr| |dev| |ex| $)
                    (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 73))))
                    (SPADCALL |dev| (QREFELT $ 74))
                    (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|)))) 

(SDEFUN |OMEXPR;OMwrite;OmdEV;15|
        ((|dev| |OpenMathDevice|) (|ex| |Expression| R) ($ |Void|))
        (SEQ (SPADCALL |dev| (QREFELT $ 72))
             (|OMEXPR;outputOMExpr| |dev| |ex| $)
             (EXIT (SPADCALL |dev| (QREFELT $ 73))))) 

(SDEFUN |OMEXPR;OMwrite;OmdEBV;16|
        ((|dev| |OpenMathDevice|) (|ex| |Expression| R) (|wholeObj| |Boolean|)
         ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 72))))
             (|OMEXPR;outputOMExpr| |dev| |ex| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 73))))))) 

(DECLAIM (NOTINLINE |ExpressionToOpenMath;|)) 

(DEFUN |ExpressionToOpenMath| (#1=#:G202)
  (SPROG NIL
         (PROG (#2=#:G203)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ExpressionToOpenMath|)
                                               '|domainEqualList|)
                    . #3=(|ExpressionToOpenMath|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|ExpressionToOpenMath;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ExpressionToOpenMath|)))))))))) 

(DEFUN |ExpressionToOpenMath;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ExpressionToOpenMath|))
          (LETT |dv$| (LIST '|ExpressionToOpenMath| DV$1) . #1#)
          (LETT $ (GETREFV 78) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ExpressionToOpenMath| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 12
                    (SPADCALL (LIST (CONS '|pi| (CONS "nums1" "pi")))
                              (QREFELT $ 11)))
          (QSETREFV $ 13
                    (SPADCALL
                     (LIST (CONS '|exp| (CONS #2="transc1" "exp"))
                           (CONS '|log| (CONS #2# "ln"))
                           (CONS '|sin| (CONS #2# "sin"))
                           (CONS '|cos| (CONS #2# "cos"))
                           (CONS '|tan| (CONS #2# "tan"))
                           (CONS '|cot| (CONS #2# "cot"))
                           (CONS '|sec| (CONS #2# "sec"))
                           (CONS '|csc| (CONS #2# "csc"))
                           (CONS '|asin| (CONS #2# "arcsin"))
                           (CONS '|acos| (CONS #2# "arccos"))
                           (CONS '|atan| (CONS #2# "arctan"))
                           (CONS '|acot| (CONS #2# "arccot"))
                           (CONS '|asec| (CONS #2# "arcsec"))
                           (CONS '|acsc| (CONS #2# "arccsc"))
                           (CONS '|sinh| (CONS #2# "sinh"))
                           (CONS '|cosh| (CONS #2# "cosh"))
                           (CONS '|tanh| (CONS #2# "tanh"))
                           (CONS '|coth| (CONS #2# "coth"))
                           (CONS '|sech| (CONS #2# "sech"))
                           (CONS '|csch| (CONS #2# "csch"))
                           (CONS '|asinh| (CONS #2# "arcsinh"))
                           (CONS '|acosh| (CONS #2# "arccosh"))
                           (CONS '|atanh| (CONS #2# "arctanh"))
                           (CONS '|acoth| (CONS #2# "arccoth"))
                           (CONS '|asech| (CONS #2# "arcsech"))
                           (CONS '|acsch| (CONS #2# "arccsch"))
                           (CONS '|factorial| (CONS "integer1" "factorial"))
                           (CONS '|abs| (CONS "arith1" "abs")))
                     (QREFELT $ 11)))
          $))) 

(MAKEPROP '|ExpressionToOpenMath| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|Record| (|:| |cd| 17) (|:| |name| 17))
              (|Record| (|:| |key| 36) (|:| |entry| 7)) (|List| 8)
              (|AssociationList| 36 7) (0 . |construct|)
              '|nullaryFunctionAList| '|unaryFunctionAList| (|Void|)
              (|OpenMathDevice|) (5 . |OMputApp|) (|String|)
              (10 . |OMputSymbol|) (|Expression| 6) (|Boolean|)
              |OMEXPR;OMwrite;OmdEBV;16| (17 . |OMputEndApp|)
              (22 . |OMputBind|) (27 . |OMputBVar|) (32 . |OMputEndBVar|)
              (37 . |OMputEndBind|) (|NonNegativeInteger|) (42 . ~=)
              (|Integer|) (|List| 19) (48 . |elt|) (54 . |One|) (58 . |One|)
              (62 . |eval|) (|Union| 7 '"failed") (|Symbol|) (69 . |search|)
              (75 . |coerce|) (80 . |string|) (|List| $) (85 . |concat|)
              (|OutputForm|) (90 . |coerce|) (95 . |ground?|) (100 . |ground|)
              (105 . |OMwrite|) (|Union| 36 '"failed") (112 . |retractIfCan|)
              (117 . |OMputVariable|) (|Union| 40 '"failed") (123 . |isPlus|)
              (128 . |isTimes|)
              (|Record| (|:| |var| (|Kernel| $)) (|:| |exponent| 29))
              (|Union| 53 '"failed") (133 . |isExpt|) (|Kernel| 19)
              (138 . |symbolIfCan|) (143 . |OMputInteger|)
              (|Record| (|:| |val| $) (|:| |exponent| 29))
              (|Union| 59 '"failed") (149 . |isPower|) (154 . |coerce|)
              (|List| (|Kernel| $)) (159 . |kernels|) (|BasicOperator|)
              (164 . |operator|) (169 . |name|) (174 . |argument|)
              (|OpenMathEncoding|) (179 . |OMencodingXML|)
              (183 . |OMopenString|) (189 . |OMputObject|)
              (194 . |OMputEndObject|) (199 . |OMclose|) |OMEXPR;OMwrite;ES;13|
              |OMEXPR;OMwrite;EBS;14| |OMEXPR;OMwrite;OmdEV;15|)
           '#(|OMwrite| 204) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 77
                                                 '(1 10 0 9 11 1 15 14 0 16 3
                                                   15 14 0 17 17 18 1 15 14 0
                                                   22 1 15 14 0 23 1 15 14 0 24
                                                   1 15 14 0 25 1 15 14 0 26 2
                                                   27 20 0 0 28 2 30 19 0 29 31
                                                   0 6 0 32 0 19 0 33 3 19 0 0
                                                   0 0 34 2 10 35 36 0 37 1 19
                                                   0 36 38 1 36 17 0 39 1 17 0
                                                   40 41 1 17 42 0 43 1 19 20 0
                                                   44 1 19 6 0 45 3 6 14 15 0
                                                   20 46 1 19 47 0 48 2 15 14 0
                                                   36 49 1 19 50 0 51 1 19 50 0
                                                   52 1 19 54 0 55 1 56 47 0 57
                                                   2 15 14 0 29 58 1 19 60 0 61
                                                   1 19 0 29 62 1 19 63 0 64 1
                                                   56 65 0 66 1 65 36 0 67 1 56
                                                   30 0 68 0 69 0 70 2 15 0 17
                                                   69 71 1 15 14 0 72 1 15 14 0
                                                   73 1 15 14 0 74 2 0 17 19 20
                                                   76 1 0 17 19 75 3 0 14 15 19
                                                   20 21 2 0 14 15 19 77)))))
           '|lookupComplete|)) 
