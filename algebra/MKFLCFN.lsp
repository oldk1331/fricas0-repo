
(DEFUN |MKFLCFN;streq?| (|s| |st| $)
  (SPADCALL |s| (SPADCALL (SPADCALL |st| (QREFELT $ 14)) (QREFELT $ 9))
            (QREFELT $ 16))) 

(DEFUN |MKFLCFN;gencode| (|s| |l| $)
  (SPADCALL (CONS (SPADCALL (SPADCALL |s| (QREFELT $ 14)) (QREFELT $ 9)) |l|)
            (QREFELT $ 11))) 

(DEFUN |MKFLCFN;streqlist?| (|s| |l| $)
  (SPADCALL (SPADCALL (SPADCALL |s| (QREFELT $ 17)) (QREFELT $ 18)) |l|
            (QREFELT $ 20))) 

(DEFUN |MKFLCFN;mkPretend| (|form| $)
  (SPADCALL (LIST (SPADCALL '|pretend| (QREFELT $ 9)) |form| (QREFELT $ 12))
            (QREFELT $ 11))) 

(DEFUN |MKFLCFN;mkCTOR| (|form| $)
  (SPADCALL (LIST (SPADCALL '|c_to_rf| (QREFELT $ 9)) |form|) (QREFELT $ 11))) 

(DEFUN |MKFLCFN;mkLispCall| (|name| $)
  (SPADCALL
   (LIST (SPADCALL '|$elt| (QREFELT $ 9)) (SPADCALL '|Lisp| (QREFELT $ 9))
         |name|)
   (QREFELT $ 11))) 

(DEFUN |MKFLCFN;mkDefun| (|s| |lv| $)
  (PROG (|fun| |name|)
    (RETURN
     (SEQ
      (LETT |name| (SPADCALL (SPADCALL (QREFELT $ 21)) (QREFELT $ 9))
            . #1=(|MKFLCFN;mkDefun|))
      (LETT |fun|
            (SPADCALL
             (LIST (SPADCALL 'DEFUN (QREFELT $ 9)) |name|
                   (SPADCALL |lv| (QREFELT $ 11))
                   (|MKFLCFN;gencode| "DECLARE"
                    (LIST (|MKFLCFN;gencode| "DOUBLE-FLOAT" |lv| $)) $)
                   (|MKFLCFN;mkCTOR| |s| $))
             (QREFELT $ 11))
            . #1#)
      (EVAL |fun|) (COND (|$compileDontDefineFunctions| (COMPILE |name|)))
      (EXIT |name|))))) 

(DEFUN |MKFLCFN;makeFloatFunction;S2SM;8| (|f| |x| |y| $)
  (PROG (|spadform| |spadname| |t| |name| |iy| |ix| |u|)
    (RETURN
     (SEQ
      (LETT |u| (|MKFLCFN;mkLisp| (SPADCALL |f| (QREFELT $ 22)) $)
            . #1=(|MKFLCFN;makeFloatFunction;S2SM;8|))
      (EXIT
       (COND ((QEQCAR |u| 1) (SPADCALL |f| |x| |y| (QREFELT $ 25)))
             ('T
              (SEQ
               (LETT |name|
                     (|MKFLCFN;mkDefun| (QCDR |u|)
                      (LIST (LETT |ix| (SPADCALL |x| (QREFELT $ 9)) . #1#)
                            (LETT |iy| (SPADCALL |y| (QREFELT $ 9)) . #1#))
                      $)
                     . #1#)
               (LETT |t| (LIST (QREFELT $ 12) (QREFELT $ 12)) . #1#)
               (LETT |spadname|
                     (SPADCALL
                      (|devaluate|
                       (|Mapping| (|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                      (QREFELT $ 26))
                     . #1#)
               (LETT |spadform|
                     (|MKFLCFN;mkPretend|
                      (SPADCALL
                       (LIST (|MKFLCFN;mkLispCall| |name| $) |ix| |iy|)
                       (QREFELT $ 11))
                      $)
                     . #1#)
               (SPADCALL
                (SPADCALL |spadform| (LIST |x| |y|) |spadname| (QREFELT $ 28))
                (QREFELT $ 30))
               (EXIT
                (SPADCALL (SPADCALL |spadname| |t| (QREFELT $ 31))
                          (QREFELT $ 32))))))))))) 

(DEFUN |MKFLCFN;makeFloatFunction;SSM;9| (|f| |var| $)
  (PROG (|spadform| |spadname| |t| |name| |ivar| |u|)
    (RETURN
     (SEQ
      (LETT |u| (|MKFLCFN;mkLisp| (SPADCALL |f| (QREFELT $ 22)) $)
            . #1=(|MKFLCFN;makeFloatFunction;SSM;9|))
      (EXIT
       (COND ((QEQCAR |u| 1) (SPADCALL |f| |var| (QREFELT $ 36)))
             ('T
              (SEQ
               (LETT |name|
                     (|MKFLCFN;mkDefun| (QCDR |u|)
                      (LIST (LETT |ivar| (SPADCALL |var| (QREFELT $ 9)) . #1#))
                      $)
                     . #1#)
               (LETT |t| (LIST (QREFELT $ 12)) . #1#)
               (LETT |spadname|
                     (SPADCALL
                      (|devaluate| (|Mapping| (|DoubleFloat|) (|DoubleFloat|)))
                      (QREFELT $ 26))
                     . #1#)
               (LETT |spadform|
                     (|MKFLCFN;mkPretend|
                      (SPADCALL (LIST (|MKFLCFN;mkLispCall| |name| $) |ivar|)
                                (QREFELT $ 11))
                      $)
                     . #1#)
               (SPADCALL
                (SPADCALL |spadform| (LIST |var|) |spadname| (QREFELT $ 28))
                (QREFELT $ 30))
               (EXIT
                (SPADCALL (SPADCALL |spadname| |t| (QREFELT $ 31))
                          (QREFELT $ 37))))))))))) 

(DEFUN |MKFLCFN;mkLispList| (|l| $)
  (PROG (|ans| #1=#:G147 |u| #2=#:G148 |s|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ (LETT |ans| NIL . #3=(|MKFLCFN;mkLispList|))
            (SEQ (LETT |s| NIL . #3#) (LETT #2# |l| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |s| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ (LETT |u| (|MKFLCFN;mkLisp| |s| $) . #3#)
                      (EXIT
                       (COND
                        ((QEQCAR |u| 1)
                         (PROGN (LETT #1# (CONS 1 "failed") . #3#) (GO #1#)))
                        ('T (LETT |ans| (CONS (QCDR |u|) |ans|) . #3#)))))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 (NREVERSE |ans|)))))
      #1# (EXIT #1#))))) 

(DEFUN |MKFLCFN;mkLisp| (|s| $)
  (PROG (|b| |e| |a| |ll| |u| |op| |l|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |s| (QREFELT $ 39)) (CONS 0 |s|))
            (#1='T
             (SEQ
              (LETT |op|
                    (|SPADfirst|
                     (LETT |l| (SPADCALL |s| (QREFELT $ 40))
                           . #2=(|MKFLCFN;mkLisp|)))
                    . #2#)
              (LETT |u| (|MKFLCFN;mkLispList| (CDR |l|) $) . #2#)
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                     (#1#
                      (SEQ (LETT |ll| (QCDR |u|) . #2#)
                           (EXIT
                            (COND
                             ((|MKFLCFN;streqlist?| |op| (LIST "+" "*" "/" "-")
                               $)
                              (CONS 0
                                    (SPADCALL (CONS |op| |ll|)
                                              (QREFELT $ 11))))
                             ((|MKFLCFN;streq?| |op| "^" $)
                              (CONS 0 (|MKFLCFN;gencode| "EXPT" |ll| $)))
                             ((|MKFLCFN;streqlist?| |op|
                               (LIST "exp" "sin" "cos" "tan" "atan" "log"
                                     "sinh" "cosh" "tanh" "asinh" "acosh"
                                     "atanh" "sqrt")
                               $)
                              (CONS 0
                                    (|MKFLCFN;gencode|
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |op| (QREFELT $ 17))
                                                (QREFELT $ 18))
                                      (QREFELT $ 41))
                                     |ll| $)))
                             ((|MKFLCFN;streq?| |op| "nthRoot" $)
                              (COND
                               ((SPADCALL (SPADCALL |ll| (QREFELT $ 43))
                                          (SPADCALL 2 (QREFELT $ 45))
                                          (QREFELT $ 16))
                                (CONS 0
                                      (|MKFLCFN;gencode| "SQRT"
                                       (LIST (|SPADfirst| |ll|)) $)))
                               (#1#
                                (CONS 0
                                      (|MKFLCFN;gencode| "EXPT"
                                       (CONS (|SPADfirst| |ll|)
                                             (LIST
                                              (SPADCALL (|spadConstant| $ 46)
                                                        (SPADCALL |ll|
                                                                  (QREFELT $
                                                                           43))
                                                        (QREFELT $ 47))))
                                       $)))))
                             ((|MKFLCFN;streq?| |op| "float" $)
                              (SEQ
                               (LETT |a| (SPADCALL |ll| 1 (QREFELT $ 48))
                                     . #2#)
                               (LETT |e| (SPADCALL |ll| 2 (QREFELT $ 48))
                                     . #2#)
                               (LETT |b|
                                     (FLOAT (SPADCALL |ll| 3 (QREFELT $ 48))
                                            MOST-POSITIVE-DOUBLE-FLOAT)
                                     . #2#)
                               (EXIT (CONS 0 (* |a| (EXPT |b| |e|))))))
                             (#1# (CONS 1 "failed"))))))))))))))) 

(DECLAIM (NOTINLINE |MakeFloatCompiledFunction;|)) 

(DEFUN |MakeFloatCompiledFunction| (#1=#:G165)
  (PROG ()
    (RETURN
     (PROG (#2=#:G166)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                           (HGET |$ConstructorCache|
                                                 '|MakeFloatCompiledFunction|)
                                           '|domainEqualList|)
                . #3=(|MakeFloatCompiledFunction|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (|MakeFloatCompiledFunction;| #1#) (LETT #2# T . #3#))
            (COND
             ((NOT #2#)
              (HREM |$ConstructorCache| '|MakeFloatCompiledFunction|))))))))))) 

(DEFUN |MakeFloatCompiledFunction;| (|#1|)
  (PROG (|pv$| $ |dv$| DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|MakeFloatCompiledFunction|))
      (LETT |dv$| (LIST '|MakeFloatCompiledFunction| DV$1) . #1#)
      (LETT $ (GETREFV 49) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MakeFloatCompiledFunction| (LIST DV$1)
                  (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 12
                (SPADCALL (LIST (SPADCALL '|DoubleFloat| (QREFELT $ 9)))
                          (QREFELT $ 11)))
      $)))) 

(MAKEPROP '|MakeFloatCompiledFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|) (|InputForm|)
              (0 . |convert|) (|List| $) (5 . |convert|) '|lsf| (|String|)
              (10 . |coerce|) (|Boolean|) (15 . =) (21 . |symbol|)
              (26 . |string|) (|List| 13) (31 . |member?|) (37 . |new|)
              (41 . |convert|)
              (|Mapping| (|DoubleFloat|) (|DoubleFloat|) (|DoubleFloat|))
              (|MakeBinaryCompiledFunction| 6 (|DoubleFloat|) (|DoubleFloat|)
                                            (|DoubleFloat|))
              (46 . |compiledFunction|) (53 . |declare|) (|List| 7)
              (58 . |function|) (|Any|) (65 . |interpret|) (70 . |compile|)
              (76 . |binaryFunction|) |MKFLCFN;makeFloatFunction;S2SM;8|
              (|Mapping| (|DoubleFloat|) (|DoubleFloat|))
              (|MakeUnaryCompiledFunction| 6 (|DoubleFloat|) (|DoubleFloat|))
              (81 . |compiledFunction|) (87 . |unaryFunction|)
              |MKFLCFN;makeFloatFunction;SSM;9| (92 . |atom?|)
              (97 . |destruct|) (102 . |upperCase|) (|List| 8) (107 . |second|)
              (|Integer|) (112 . |convert|) (117 . |One|) (121 . /)
              (127 . |elt|))
           '#(|makeFloatFunction| 133) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 48
                                                 '(1 8 0 7 9 1 8 0 10 11 1 7 0
                                                   13 14 2 8 15 0 0 16 1 8 7 0
                                                   17 1 7 13 0 18 2 19 15 13 0
                                                   20 0 7 0 21 1 6 8 0 22 3 24
                                                   23 6 7 7 25 1 8 7 10 26 3 8
                                                   0 0 27 7 28 1 8 29 0 30 2 8
                                                   7 7 10 31 1 24 23 7 32 2 35
                                                   34 6 7 36 1 35 34 7 37 1 8
                                                   15 0 39 1 8 10 0 40 1 13 0 0
                                                   41 1 42 8 0 43 1 8 0 44 45 0
                                                   8 0 46 2 8 0 0 0 47 2 42 8 0
                                                   44 48 3 0 23 6 7 7 33 2 0 34
                                                   6 7 38)))))
           '|lookupComplete|)) 
