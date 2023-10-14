
(/VERSIONCHECK 2) 

(PUT '|MKBCFUNC;func| '|SPADreplace|
     '(XLAM (|name| |x| |y|) (FUNCALL |name| |x| |y| NIL))) 

(DEFUN |MKBCFUNC;func| (|name| |x| |y| $) (FUNCALL |name| |x| |y| NIL)) 

(DEFUN |MKBCFUNC;binaryFunction;SM;2| (|name| $)
  (PROG ()
    (RETURN (CONS #'|MKBCFUNC;binaryFunction;SM;2!0| (VECTOR $ |name|))))) 

(DEFUN |MKBCFUNC;binaryFunction;SM;2!0| (|d1| |d2| $$)
  (PROG (|name| $)
    (LETT |name| (QREFELT $$ 1) . #1=(|MKBCFUNC;binaryFunction;SM;2|))
    (LETT $ (QREFELT $$ 0) . #1#)
    (RETURN (PROGN (|MKBCFUNC;func| |name| |d1| |d2| $))))) 

(DEFUN |MKBCFUNC;compiledFunction;S2SM;3| (|e| |x| |y| $)
  (PROG (|t|)
    (RETURN
     (SEQ
      (LETT |t| (LIST (|devaluate| (QREFELT $ 7)) (|devaluate| (QREFELT $ 8)))
            |MKBCFUNC;compiledFunction;S2SM;3|)
      (EXIT
       (SPADCALL
        (SPADCALL
         (SPADCALL |e|
                   (SPADCALL
                    (|devaluate|
                     (|Mapping| (QREFELT $ 9) (QREFELT $ 7) (QREFELT $ 8)))
                    (QREFELT $ 15))
                   |x| |y| (QREFELT $ 17))
         |t| (QREFELT $ 18))
        (QREFELT $ 12))))))) 

(DECLAIM (NOTINLINE |MakeBinaryCompiledFunction;|)) 

(DEFUN |MakeBinaryCompiledFunction| (&REST #1=#:G112)
  (PROG ()
    (RETURN
     (PROG (#2=#:G113)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|MakeBinaryCompiledFunction|)
                                           '|domainEqualList|)
                . #3=(|MakeBinaryCompiledFunction|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |MakeBinaryCompiledFunction;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|MakeBinaryCompiledFunction|))))))))))) 

(DEFUN |MakeBinaryCompiledFunction;| (|#1| |#2| |#3| |#4|)
  (PROG (|pv$| $ |dv$| DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MakeBinaryCompiledFunction|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT |dv$| (LIST '|MakeBinaryCompiledFunction| DV$1 DV$2 DV$3 DV$4)
            . #1#)
      (LETT $ (GETREFV 20) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MakeBinaryCompiledFunction|
                  (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (SETF |pv$| (QREFELT $ 3))
      $)))) 

(MAKEPROP '|MakeBinaryCompiledFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Mapping| 9 7 8) (|Symbol|)
              |MKBCFUNC;binaryFunction;SM;2| (|List| $) (|InputForm|)
              (0 . |declare|) (|MakeFunction| 6) (5 . |function|)
              (13 . |compile|) |MKBCFUNC;compiledFunction;S2SM;3|)
           '#(|compiledFunction| 19 |binaryFunction| 26) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 19
                                                 '(1 14 11 13 15 4 16 11 6 11
                                                   11 11 17 2 14 11 11 13 18 3
                                                   0 10 6 11 11 19 1 0 10 11
                                                   12)))))
           '|lookupComplete|)) 
