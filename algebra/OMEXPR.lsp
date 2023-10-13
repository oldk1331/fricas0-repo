
(/VERSIONCHECK 2) 

(DEFUN |OMEXPR;outputOMArith1| (|dev| |sym| |args| $)
  (PROG (#1=#:G141 |arg|)
    (RETURN
     (SEQ (SPADCALL |dev| (QREFELT $ 18))
          (SPADCALL |dev| "arith1" |sym| (QREFELT $ 20))
          (SEQ (LETT |arg| NIL . #2=(|OMEXPR;outputOMArith1|))
               (LETT #1# |args| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |arg| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |dev| |arg| 'NIL (QREFELT $ 22))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |dev| (QREFELT $ 23))))))) 

(DEFUN |OMEXPR;outputOMLambda| (|dev| |ex| |var| $)
  (SEQ (SPADCALL |dev| (QREFELT $ 24))
       (SPADCALL |dev| "fns1" "lambda" (QREFELT $ 20))
       (SPADCALL |dev| (QREFELT $ 25))
       (SPADCALL |dev| |var| 'NIL (QREFELT $ 22))
       (SPADCALL |dev| (QREFELT $ 26))
       (SPADCALL |dev| |ex| 'NIL (QREFELT $ 22))
       (EXIT (SPADCALL |dev| (QREFELT $ 27))))) 

(DEFUN |OMEXPR;outputOMInterval| (|dev| |lo| |hi| $)
  (SEQ (SPADCALL |dev| (QREFELT $ 18))
       (SPADCALL |dev| "interval1" "interval" (QREFELT $ 20))
       (SPADCALL |dev| |lo| 'NIL (QREFELT $ 22))
       (SPADCALL |dev| |hi| 'NIL (QREFELT $ 22))
       (EXIT (SPADCALL |dev| (QREFELT $ 23))))) 

(DEFUN |OMEXPR;outputOMIntInterval| (|dev| |lo| |hi| $)
  (SEQ (SPADCALL |dev| (QREFELT $ 18))
       (SPADCALL |dev| "interval1" "integer_interval" (QREFELT $ 20))
       (SPADCALL |dev| |lo| 'NIL (QREFELT $ 22))
       (SPADCALL |dev| |hi| 'NIL (QREFELT $ 22))
       (EXIT (SPADCALL |dev| (QREFELT $ 23))))) 

(DEFUN |OMEXPR;outputOMBinomial| (|dev| |args| $)
  (PROG (#1=#:G152 |arg|)
    (RETURN
     (SEQ
      (COND
       ((NULL (EQL (LENGTH |args|) 2))
        (|error| "Wrong number of arguments to binomial"))
       ('T
        (SEQ (SPADCALL |dev| (QREFELT $ 18))
             (SPADCALL |dev| "combinat1" "binomial" (QREFELT $ 20))
             (SEQ (LETT |arg| NIL . #2=(|OMEXPR;outputOMBinomial|))
                  (LETT #1# |args| . #2#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |arg| (CAR #1#) . #2#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (SPADCALL |dev| |arg| 'NIL (QREFELT $ 22))))
                  (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
             (EXIT (SPADCALL |dev| (QREFELT $ 23)))))))))) 

(DEFUN |OMEXPR;outputOMPower| (|dev| |args| $)
  (COND
   ((NULL (EQL (LENGTH |args|) 2))
    (|error| "Wrong number of arguments to power"))
   ('T (|OMEXPR;outputOMArith1| |dev| "power" |args| $)))) 

(DEFUN |OMEXPR;outputOMDefsum| (|dev| |args| $)
  (SEQ
   (COND
    ((SPADCALL (LENGTH |args|) 5 (QREFELT $ 29))
     (|error| "Unexpected number of arguments to a defsum"))
    ('T
     (SEQ (SPADCALL |dev| (QREFELT $ 18))
          (SPADCALL |dev| "arith1" "sum" (QREFELT $ 20))
          (|OMEXPR;outputOMIntInterval| |dev|
           (SPADCALL |args| 4 (QREFELT $ 32))
           (SPADCALL |args| 5 (QREFELT $ 32)) $)
          (|OMEXPR;outputOMLambda| |dev|
           (SPADCALL (SPADCALL |args| 1 (QREFELT $ 32))
                     (SPADCALL |args| 2 (QREFELT $ 32))
                     (SPADCALL |args| 3 (QREFELT $ 32)) (QREFELT $ 35))
           (SPADCALL |args| 3 (QREFELT $ 32)) $)
          (EXIT (SPADCALL |dev| (QREFELT $ 23)))))))) 

(DEFUN |OMEXPR;outputOMDefprod| (|dev| |args| $)
  (SEQ
   (COND
    ((SPADCALL (LENGTH |args|) 5 (QREFELT $ 29))
     (|error| "Unexpected number of arguments to a defprod"))
    ('T
     (SEQ (SPADCALL |dev| (QREFELT $ 18))
          (SPADCALL |dev| "arith1" "product" (QREFELT $ 20))
          (|OMEXPR;outputOMIntInterval| |dev|
           (SPADCALL |args| 4 (QREFELT $ 32))
           (SPADCALL |args| 5 (QREFELT $ 32)) $)
          (|OMEXPR;outputOMLambda| |dev|
           (SPADCALL (SPADCALL |args| 1 (QREFELT $ 32))
                     (SPADCALL |args| 2 (QREFELT $ 32))
                     (SPADCALL |args| 3 (QREFELT $ 32)) (QREFELT $ 35))
           (SPADCALL |args| 3 (QREFELT $ 32)) $)
          (EXIT (SPADCALL |dev| (QREFELT $ 23)))))))) 

(DEFUN |OMEXPR;outputOMDefint| (|dev| |args| $)
  (SEQ
   (COND
    ((SPADCALL (LENGTH |args|) 5 (QREFELT $ 29))
     (|error| "Unexpected number of arguments to a defint"))
    ('T
     (SEQ (SPADCALL |dev| (QREFELT $ 18))
          (SPADCALL |dev| "calculus1" "defint" (QREFELT $ 20))
          (|OMEXPR;outputOMInterval| |dev| (SPADCALL |args| 4 (QREFELT $ 32))
           (SPADCALL |args| 5 (QREFELT $ 32)) $)
          (|OMEXPR;outputOMLambda| |dev|
           (SPADCALL (SPADCALL |args| 1 (QREFELT $ 32))
                     (SPADCALL |args| 2 (QREFELT $ 32))
                     (SPADCALL |args| 3 (QREFELT $ 32)) (QREFELT $ 35))
           (SPADCALL |args| 3 (QREFELT $ 32)) $)
          (EXIT (SPADCALL |dev| (QREFELT $ 23)))))))) 

(DEFUN |OMEXPR;outputOMInt| (|dev| |args| $)
  (SEQ
   (COND
    ((SPADCALL (LENGTH |args|) 3 (QREFELT $ 29))
     (|error| "Unexpected number of arguments to a defint"))
    ('T
     (SEQ (SPADCALL |dev| (QREFELT $ 18))
          (SPADCALL |dev| "calculus1" "int" (QREFELT $ 20))
          (|OMEXPR;outputOMLambda| |dev|
           (SPADCALL (SPADCALL |args| 1 (QREFELT $ 32))
                     (SPADCALL |args| 2 (QREFELT $ 32))
                     (SPADCALL |args| 3 (QREFELT $ 32)) (QREFELT $ 35))
           (SPADCALL |args| 3 (QREFELT $ 32)) $)
          (EXIT (SPADCALL |dev| (QREFELT $ 23)))))))) 

(DEFUN |OMEXPR;outputOMFunction| (|dev| |op| |args| $)
  (PROG (#1=#:G177 |arg| |omOp| |nargs|)
    (RETURN
     (SEQ (LETT |nargs| (LENGTH |args|) . #2=(|OMEXPR;outputOMFunction|))
          (EXIT
           (COND
            ((ZEROP |nargs|)
             (SEQ
              (LETT |omOp| (SPADCALL |op| (QREFELT $ 14) (QREFELT $ 38)) . #2#)
              (EXIT
               (COND
                ((QEQCAR |omOp| 1)
                 (|error|
                  (|concat|
                   (|construct| "No OpenMath definition for nullary function "
                                (|coerce| |op|)))))
                (#3='T
                 (SPADCALL |dev| (QCAR (QCDR |omOp|)) (QCDR (QCDR |omOp|))
                           (QREFELT $ 20)))))))
            ((EQL |nargs| 1)
             (SEQ
              (LETT |omOp| (SPADCALL |op| (QREFELT $ 15) (QREFELT $ 38)) . #2#)
              (EXIT
               (COND
                ((QEQCAR |omOp| 1)
                 (|error|
                  (|concat|
                   (|construct| "No OpenMath definition for unary function "
                                (|coerce| |op|)))))
                (#3#
                 (SEQ (SPADCALL |dev| (QREFELT $ 18))
                      (SPADCALL |dev| (QCAR (QCDR |omOp|)) (QCDR (QCDR |omOp|))
                                (QREFELT $ 20))
                      (SEQ (LETT |arg| NIL . #2#) (LETT #1# |args| . #2#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |arg| (CAR #1#) . #2#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT (SPADCALL |dev| |arg| 'NIL (QREFELT $ 22))))
                           (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (SPADCALL |dev| (QREFELT $ 23)))))))))
            ((EQUAL |op| '|%defint|) (|OMEXPR;outputOMDefint| |dev| |args| $))
            ((EQUAL |op| '|integral|) (|OMEXPR;outputOMInt| |dev| |args| $))
            ((EQUAL |op| '|%defsum|) (|OMEXPR;outputOMDefsum| |dev| |args| $))
            ((EQUAL |op| '|%defprod|)
             (|OMEXPR;outputOMDefprod| |dev| |args| $))
            ((EQUAL |op| '|%power|) (|OMEXPR;outputOMPower| |dev| |args| $))
            ((EQUAL |op| '|binomial|)
             (|OMEXPR;outputOMBinomial| |dev| |args| $))
            (#3#
             (|error|
              (SPADCALL
               (SPADCALL
                (LIST "No OpenMath definition for function "
                      (SPADCALL |op| (QREFELT $ 40)))
                (QREFELT $ 42))
               (QREFELT $ 44)))))))))) 

(DEFUN |OMEXPR;outputOMExpr| (|dev| |ex| $)
  (PROG (|k| #1=#:G201 |z| |s| |x| |w| |v|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |ex| (QREFELT $ 45))
        (SPADCALL |dev| (SPADCALL |ex| (QREFELT $ 46)) 'NIL (QREFELT $ 47)))
       ('T
        (SEQ
         (EXIT
          (SEQ
           (SEQ
            (LETT |v| (SPADCALL |ex| (QREFELT $ 49))
                  . #2=(|OMEXPR;outputOMExpr|))
            (EXIT
             (COND
              ((NULL (QEQCAR |v| 1))
               (PROGN
                (LETT #1# (SPADCALL |dev| (QCDR |v|) (QREFELT $ 50)) . #2#)
                (GO #1#))))))
           (SEQ (LETT |w| (SPADCALL |ex| (QREFELT $ 52)) . #2#)
                (EXIT
                 (COND
                  ((NULL (QEQCAR |w| 1))
                   (PROGN
                    (LETT #1#
                          (|OMEXPR;outputOMArith1| |dev| "plus" (QCDR |w|) $)
                          . #2#)
                    (GO #1#))))))
           (SEQ (LETT |w| (SPADCALL |ex| (QREFELT $ 53)) . #2#)
                (EXIT
                 (COND
                  ((NULL (QEQCAR |w| 1))
                   (PROGN
                    (LETT #1#
                          (|OMEXPR;outputOMArith1| |dev| "times" (QCDR |w|) $)
                          . #2#)
                    (GO #1#))))))
           (SEQ (LETT |x| (SPADCALL |ex| (QREFELT $ 56)) . #2#)
                (EXIT
                 (COND
                  ((NULL (QEQCAR |x| 1))
                   (COND
                    ((NULL (EQL (QCDR (QCDR |x|)) 1))
                     (PROGN
                      (LETT #1#
                            (SEQ
                             (LETT |s|
                                   (SPADCALL (QCAR (QCDR |x|)) (QREFELT $ 58))
                                   . #2#)
                             (EXIT
                              (COND
                               ((NULL (QEQCAR |s| 1))
                                (PROGN
                                 (LETT #1#
                                       (SEQ (SPADCALL |dev| (QREFELT $ 18))
                                            (SPADCALL |dev| "arith1" "power"
                                                      (QREFELT $ 20))
                                            (SPADCALL |dev| (QCDR |s|)
                                                      (QREFELT $ 50))
                                            (SPADCALL |dev| (QCDR (QCDR |x|))
                                                      (QREFELT $ 59))
                                            (EXIT
                                             (SPADCALL |dev| (QREFELT $ 23))))
                                       . #2#)
                                 (GO #1#))))))
                            . #2#)
                      (GO #1#))))))))
           (SEQ (LETT |z| (SPADCALL |ex| (QREFELT $ 62)) . #2#)
                (EXIT
                 (COND
                  ((NULL (QEQCAR |z| 1))
                   (COND
                    ((NULL (EQL (QCDR (QCDR |z|)) 1))
                     (PROGN
                      (LETT #1#
                            (|OMEXPR;outputOMPower| |dev|
                             (LIST (QCAR (QCDR |z|))
                                   (SPADCALL (QCDR (QCDR |z|)) (QREFELT $ 63)))
                             $)
                            . #2#)
                      (GO #1#))))))))
           (LETT |k| (|SPADfirst| (SPADCALL |ex| (QREFELT $ 65))) . #2#)
           (EXIT
            (|OMEXPR;outputOMFunction| |dev|
             (SPADCALL (SPADCALL |k| (QREFELT $ 67)) (QREFELT $ 68))
             (SPADCALL |k| (QREFELT $ 69)) $))))
         #1# (EXIT #1#)))))))) 

(DEFUN |OMEXPR;OMwrite;ES;13| (|ex| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|OMEXPR;OMwrite;ES;13|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 71)) (QREFELT $ 72))
                . #1#)
          (SPADCALL |dev| (QREFELT $ 73)) (|OMEXPR;outputOMExpr| |dev| |ex| $)
          (SPADCALL |dev| (QREFELT $ 74)) (SPADCALL |dev| (QREFELT $ 75))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |OMEXPR;OMwrite;EBS;14| (|ex| |wholeObj| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|OMEXPR;OMwrite;EBS;14|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 71)) (QREFELT $ 72))
                . #1#)
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 73))))
          (|OMEXPR;outputOMExpr| |dev| |ex| $)
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 74))))
          (SPADCALL |dev| (QREFELT $ 75))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |OMEXPR;OMwrite;OmdEV;15| (|dev| |ex| $)
  (SEQ (SPADCALL |dev| (QREFELT $ 73)) (|OMEXPR;outputOMExpr| |dev| |ex| $)
       (EXIT (SPADCALL |dev| (QREFELT $ 74))))) 

(DEFUN |OMEXPR;OMwrite;OmdEBV;16| (|dev| |ex| |wholeObj| $)
  (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 73))))
       (|OMEXPR;outputOMExpr| |dev| |ex| $)
       (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 74))))))) 

(DEFUN |ExpressionToOpenMath| (#1=#:G212)
  (PROG ()
    (RETURN
     (PROG (#2=#:G213)
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
              (HREM |$ConstructorCache| '|ExpressionToOpenMath|))))))))))) 

(DEFUN |ExpressionToOpenMath;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|ExpressionToOpenMath|))
      (LETT |dv$| (LIST '|ExpressionToOpenMath| DV$1) . #1#)
      (LETT $ (GETREFV 79) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ExpressionToOpenMath| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 14
                (SPADCALL (LIST (CONS '|pi| (CONS "nums1" "pi")))
                          (QREFELT $ 13)))
      (QSETREFV $ 15
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
                 (QREFELT $ 13)))
      $)))) 

(MAKEPROP '|ExpressionToOpenMath| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Expression| 6)
              (0 . |pi|) (|Record| (|:| |cd| 19) (|:| |name| 19))
              (|Record| (|:| |key| 37) (|:| |entry| 9)) (|List| 10)
              (|AssociationList| 37 9) (4 . |construct|)
              '|nullaryFunctionAList| '|unaryFunctionAList| (|Void|)
              (|OpenMathDevice|) (9 . |OMputApp|) (|String|)
              (14 . |OMputSymbol|) (|Boolean|) |OMEXPR;OMwrite;OmdEBV;16|
              (21 . |OMputEndApp|) (26 . |OMputBind|) (31 . |OMputBVar|)
              (36 . |OMputEndBVar|) (41 . |OMputEndBind|)
              (|NonNegativeInteger|) (46 . ~=) (|Integer|) (|List| 7)
              (52 . |elt|) (58 . |One|) (62 . |One|) (66 . |eval|)
              (|Union| 9 '"failed") (|Symbol|) (73 . |search|) (79 . |coerce|)
              (84 . |string|) (|List| $) (89 . |concat|) (|OutputForm|)
              (94 . |coerce|) (99 . |ground?|) (104 . |ground|)
              (109 . |OMwrite|) (|Union| 37 '"failed") (116 . |retractIfCan|)
              (121 . |OMputVariable|) (|Union| 41 '"failed") (127 . |isPlus|)
              (132 . |isTimes|)
              (|Record| (|:| |var| (|Kernel| $)) (|:| |exponent| 30))
              (|Union| 54 '"failed") (137 . |isExpt|) (|Kernel| 7)
              (142 . |symbolIfCan|) (147 . |OMputInteger|)
              (|Record| (|:| |val| $) (|:| |exponent| 30))
              (|Union| 60 '"failed") (153 . |isPower|) (158 . |coerce|)
              (|List| (|Kernel| $)) (163 . |kernels|) (|BasicOperator|)
              (168 . |operator|) (173 . |name|) (178 . |argument|)
              (|OpenMathEncoding|) (183 . |OMencodingXML|)
              (187 . |OMopenString|) (193 . |OMputObject|)
              (198 . |OMputEndObject|) (203 . |OMclose|) |OMEXPR;OMwrite;ES;13|
              |OMEXPR;OMwrite;EBS;14| |OMEXPR;OMwrite;OmdEV;15|)
           '#(|OMwrite| 208) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 78
                                                 '(0 7 0 8 1 12 0 11 13 1 17 16
                                                   0 18 3 17 16 0 19 19 20 1 17
                                                   16 0 23 1 17 16 0 24 1 17 16
                                                   0 25 1 17 16 0 26 1 17 16 0
                                                   27 2 28 21 0 0 29 2 31 7 0
                                                   30 32 0 6 0 33 0 7 0 34 3 7
                                                   0 0 0 0 35 2 12 36 37 0 38 1
                                                   7 0 37 39 1 37 19 0 40 1 19
                                                   0 41 42 1 19 43 0 44 1 7 21
                                                   0 45 1 7 6 0 46 3 6 16 17 0
                                                   21 47 1 7 48 0 49 2 17 16 0
                                                   37 50 1 7 51 0 52 1 7 51 0
                                                   53 1 7 55 0 56 1 57 48 0 58
                                                   2 17 16 0 30 59 1 7 61 0 62
                                                   1 7 0 30 63 1 7 64 0 65 1 57
                                                   66 0 67 1 66 37 0 68 1 57 31
                                                   0 69 0 70 0 71 2 17 0 19 70
                                                   72 1 17 16 0 73 1 17 16 0 74
                                                   1 17 16 0 75 2 0 19 7 21 77
                                                   1 0 19 7 76 3 0 16 17 7 21
                                                   22 2 0 16 17 7 78)))))
           '|lookupComplete|)) 
