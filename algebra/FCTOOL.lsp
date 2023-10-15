
(SDEFUN |FCTOOL;newFortranTempVar;S;1| (($ |Symbol|))
        (SPROG
         ((|def_type| (|Symbol|)) (|new_sym| (|Symbol|))
          (|nr| (|SingleInteger|)))
         (SEQ
          (LETT |nr| (|add_SI| 1 |$exp2FortTempVarIndex|)
                . #1=(|FCTOOL;newFortranTempVar;S;1|))
          (SETF |$exp2FortTempVarIndex| |nr|)
          (LETT |new_sym|
                (SPADCALL (STRCONC "T" (STRINGIMAGE |nr|)) (QREFELT $ 8))
                . #1#)
          (LETT |def_type| |$defaultFortranType| . #1#)
          (SPADCALL |new_sym|
                    (SPADCALL (SPADCALL |def_type| (QREFELT $ 10))
                              (QREFELT $ 12))
                    (QREFELT $ 14))
          (EXIT |new_sym|)))) 

(SDEFUN |FCTOOL;checkType;2S;2| ((|t| |String|) ($ |String|))
        (COND
         ((EQUAL |$fortranPrecision| '|double|)
          (COND ((EQUAL |t| "REAL") "DOUBLE PRECISION")
                ((EQUAL |t| "COMPLEX") "DOUBLE COMPLEX") (#1='T |t|)))
         (#1# |t|))) 

(SDEFUN |FCTOOL;fortranCleanUp| ((|l| |List| (|String|)) ($ |List| (|String|)))
        (SPROG
         ((|oldTok| (|String|)) (|m| (|List| (|String|))) (#1=#:G226 NIL)
          (|e| NIL))
         (SEQ (LETT |oldTok| "" . #2=(|FCTOOL;fortranCleanUp|))
              (LETT |m| NIL . #2#)
              (SEQ (LETT |e| NIL . #2#) (LETT #1# |l| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     ((EQUAL |oldTok| "-")
                      (COND
                       ((NULL (EQUAL |e| "+"))
                        (LETT |m| (CONS |e| |m|) . #2#))))
                     ('T (LETT |m| (CONS |e| |m|) . #2#)))
                    (EXIT (LETT |oldTok| |e| . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |m|)))) 

(SDEFUN |FCTOOL;exp2FortFn|
        ((|op| . #1=(|String|)) (|args| |List| (|OutputForm|))
         (|nargs| |Integer|) ($ |List| (|String|)))
        (SPROG ((|s| (|List| #1#)) (#2=#:G231 NIL) (|arg| NIL))
               (SEQ (LETT |s| (LIST "(" |op|) . #3=(|FCTOOL;exp2FortFn|))
                    (EXIT
                     (COND ((EQL |nargs| 0) (CONS ")" |s|))
                           ('T
                            (SEQ
                             (SEQ (LETT |arg| NIL . #3#)
                                  (LETT #2# |args| . #3#) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN
                                         (LETT |arg| (CAR #2#) . #3#)
                                         NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT |s|
                                          (CONS ","
                                                (APPEND
                                                 (|FCTOOL;exp2Fort2| |arg| 0
                                                  |op| $)
                                                 |s|))
                                          . #3#)))
                                  (LETT #2# (CDR #2#) . #3#) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (CONS ")" (CDR |s|)))))))))) 

(SDEFUN |FCTOOL;exp2Fort2|
        ((|e| |OutputForm|) (|prec| |Integer|) (|oldOp| |String|)
         ($ |List| (|String|)))
        (SPROG
         ((|s| (|List| (|String|))) (#1=#:G250 NIL) (|op1| (|String|))
          (|args1| #2=(|List| (|OutputForm|))) (#3=#:G251 NIL) (|arg| NIL)
          (|nprec| (|Integer|)) (|p| (|Integer|)) (|op| (|String|))
          (|nargs| (|NonNegativeInteger|)) (|args| #2#) (|op0| (|OutputForm|)))
         (SEQ
          (COND ((NULL |e|) NIL)
                ((SPADCALL |e| (QREFELT $ 27)) (LIST (|object2String| |e|)))
                (#4='T
                 (SEQ
                  (LETT |op0| (SPADCALL |e| (QREFELT $ 28))
                        . #5=(|FCTOOL;exp2Fort2|))
                  (LETT |args| (SPADCALL |e| (QREFELT $ 30)) . #5#)
                  (LETT |nargs| (LENGTH |args|) . #5#)
                  (LETT |op| (|object2String| |op0|) . #5#)
                  (COND
                   ((EQL |nargs| 2)
                    (COND
                     ((EQUAL |op| "=")
                      (EXIT
                       (CONS "%l"
                             (APPEND
                              (|FCTOOL;exp2Fort2|
                               (SPADCALL |args| 2 (QREFELT $ 32)) |prec| " " $)
                              (CONS "="
                                    (|FCTOOL;exp2Fort2|
                                     (SPADCALL |args| 1 (QREFELT $ 32)) |prec|
                                     " " $)))))))))
                  (EXIT
                   (COND
                    ((EQL |nargs| 0) (|FCTOOL;exp2FortFn| |op| |args| 0 $))
                    ((EQL |nargs| 1)
                     (SEQ
                      (LETT |p| (SPADCALL |op| (QREFELT $ 17) (QREFELT $ 34))
                            . #5#)
                      (EXIT
                       (COND
                        ((SPADCALL |p| 0 (QREFELT $ 35))
                         (SEQ
                          (LETT |nprec|
                                (SPADCALL (QREFELT $ 18) |p| (QREFELT $ 37))
                                . #5#)
                          (LETT |s|
                                (APPEND
                                 (|FCTOOL;exp2Fort2| (|SPADfirst| |args|)
                                  |nprec| |op| $)
                                 (CONS |op| NIL))
                                . #5#)
                          (COND
                           ((EQUAL |op| "-")
                            (COND
                             ((SPADCALL (|SPADfirst| |args|) (QREFELT $ 27))
                              (EXIT |s|)))))
                          (EXIT
                           (COND
                            ((SPADCALL |nprec| |prec| (QREFELT $ 38))
                             (CONS ")" (APPEND |s| (CONS "(" NIL))))
                            (#4# |s|)))))
                        (#4# (|FCTOOL;exp2FortFn| |op| |args| |nargs| $))))))
                    ((EQUAL |op| "CMPLX")
                     (COND
                      ((SPADCALL |nargs| 2 (QREFELT $ 40))
                       (|error| "Bad number of arguments to CMPLX"))
                      (#4#
                       (CONS ")"
                             (APPEND
                              (|FCTOOL;exp2Fort2|
                               (SPADCALL |args| (QREFELT $ 41)) |prec| |op| $)
                              (CONS ","
                                    (APPEND
                                     (|FCTOOL;exp2Fort2| (|SPADfirst| |args|)
                                      |prec| |op| $)
                                     (CONS "(" NIL))))))))
                    (#4#
                     (COND
                      ((SPADCALL |op| (QREFELT $ 23) (QREFELT $ 42))
                       (SEQ
                        (LETT |p| (SPADCALL |op| (QREFELT $ 19) (QREFELT $ 34))
                              . #5#)
                        (COND
                         ((EQL |p| 0)
                          (SEQ
                           (LETT |p|
                                 (SPADCALL |op| (QREFELT $ 21) (QREFELT $ 34))
                                 . #5#)
                           (EXIT
                            (LETT |nprec|
                                  (SPADCALL (QREFELT $ 22) |p| (QREFELT $ 37))
                                  . #5#))))
                         (#4#
                          (LETT |nprec|
                                (SPADCALL (QREFELT $ 20) |p| (QREFELT $ 37))
                                . #5#)))
                        (LETT |s| NIL . #5#)
                        (SEQ (LETT |arg| NIL . #5#) (LETT #3# |args| . #5#)
                             G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |arg| (CAR #3#) . #5#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ
                                (COND
                                 ((EQUAL |op| "+")
                                  (COND
                                   ((NULL (SPADCALL |arg| (QREFELT $ 27)))
                                    (COND
                                     ((EQL
                                       (LENGTH
                                        (LETT |args1|
                                              (SPADCALL |arg| (QREFELT $ 30))
                                              . #5#))
                                       1)
                                      (SEQ
                                       (LETT |op1|
                                             (|object2String|
                                              (SPADCALL |arg| (QREFELT $ 28)))
                                             . #5#)
                                       (EXIT
                                        (COND
                                         ((EQUAL |op1| "-")
                                          (PROGN
                                           (LETT #1#
                                                 (SEQ
                                                  (COND
                                                   ((NULL |s|)
                                                    (LETT |s| (LIST "junk")
                                                          . #5#)))
                                                  (EXIT
                                                   (LETT |s|
                                                         (CONS |op|
                                                               (APPEND
                                                                (|FCTOOL;exp2Fort2|
                                                                 (|SPADfirst|
                                                                  |args1|)
                                                                 |nprec| |op|
                                                                 $)
                                                                (CONS "-"
                                                                      (CDR
                                                                       |s|))))
                                                         . #5#)))
                                                 . #5#)
                                           (GO #6=#:G242))))))))))))
                                (EXIT
                                 (LETT |s|
                                       (CONS |op|
                                             (APPEND
                                              (|FCTOOL;exp2Fort2| |arg| |nprec|
                                               |op| $)
                                              |s|))
                                       . #5#))))
                              #6# (EXIT #1#))
                             (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                             (EXIT NIL))
                        (LETT |s| (CDR |s|) . #5#)
                        (COND
                         ((EQUAL |op| |oldOp|)
                          (COND
                           ((OR (EQUAL |op| "*") (EQUAL |op| "+"))
                            (EXIT |s|)))))
                        (EXIT
                         (COND
                          ((SPADCALL |nprec| |prec| (QREFELT $ 38))
                           (CONS ")" (APPEND |s| (CONS "(" NIL))))
                          (#4# |s|)))))
                      (#4#
                       (|FCTOOL;exp2FortFn| |op| |args| |nargs| $)))))))))))) 

(SDEFUN |FCTOOL;exp2Fort1| ((|l| |List| (|OutputForm|)) ($ |List| (|String|)))
        (SPROG
         ((|res| (|List| (|String|))) (|l1| (|List| (|String|)))
          (#1=#:G256 NIL) (|e| NIL))
         (SEQ (LETT |res| NIL . #2=(|FCTOOL;exp2Fort1|))
              (SEQ (LETT |e| NIL . #2#) (LETT #1# |l| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |l1| (|FCTOOL;exp2Fort2| |e| 0 "" $) . #2#)
                        (EXIT (LETT |res| (APPEND |l1| |res|) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FCTOOL;tempLen| (($ |Integer|))
        (+ 1 (QCSIZE (STRINGIMAGE |$exp2FortTempVarIndex|)))) 

(SDEFUN |FCTOOL;fortExpSize_f|
        ((|op| |OutputForm|) (|args| |List| (|OutputForm|)) ($ |Integer|))
        (SPROG
         ((#1=#:G259 NIL) (#2=#:G258 #3=(|Integer|)) (#4=#:G260 #3#)
          (#5=#:G262 NIL) (|a| NIL))
         (SEQ
          (+ (+ 1 (LENGTH |args|))
             (PROGN
              (LETT #1# NIL . #6=(|FCTOOL;fortExpSize_f|))
              (SEQ (LETT |a| NIL . #6#) (LETT #5# (CONS |op| |args|) . #6#)
                   G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |a| (CAR #5#) . #6#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (LETT #4# (|FCTOOL;fortExpSize| |a| $) . #6#)
                      (COND (#1# (LETT #2# (+ #2# #4#) . #6#))
                            ('T
                             (PROGN
                              (LETT #2# #4# . #6#)
                              (LETT #1# 'T . #6#)))))))
                   (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
              (COND (#1# #2#) ('T 0))))))) 

(SDEFUN |FCTOOL;same_subtree|
        ((|op| |String|) (|e| |OutputForm|) ($ |Boolean|))
        (SPROG ((|op2| (|String|)))
               (SEQ
                (COND ((SPADCALL |e| (QREFELT $ 27)) NIL)
                      ('T
                       (SEQ
                        (LETT |op2| (STRINGIMAGE (SPADCALL |e| (QREFELT $ 28)))
                              |FCTOOL;same_subtree|)
                        (EXIT (EQUAL |op| |op2|)))))))) 

(SDEFUN |FCTOOL;same_subtree2|
        ((|op| |Symbol|) (|e| |OutputForm|) ($ |Boolean|))
        (SPROG ((|op2| (|OutputForm|)))
               (COND
                ((OR (SPADCALL |e| (QREFELT $ 27))
                     (NULL
                      (SPADCALL
                       (LETT |op2| (SPADCALL |e| (QREFELT $ 28))
                             |FCTOOL;same_subtree2|)
                       (QREFELT $ 43))))
                 NIL)
                ('T (EQUAL |op| (SPADCALL |op2| (QREFELT $ 44))))))) 

(SDEFUN |FCTOOL;fortExpSize| ((|e| |OutputForm|) ($ |Integer|))
        (SPROG
         ((|narys| (|List| (|String|))) (|ops| (|String|))
          (|arg2| #1=(|OutputForm|)) (|arg1| #1#)
          (|args| (|List| (|OutputForm|))) (|op| (|OutputForm|))
          (|s| (|String|)))
         (SEQ
          (COND
           ((SPADCALL |e| (QREFELT $ 27))
            (SEQ (LETT |s| (STRINGIMAGE |e|) . #2=(|FCTOOL;fortExpSize|))
                 (EXIT (QCSIZE |s|))))
           (#3='T
            (SEQ (LETT |op| (SPADCALL |e| (QREFELT $ 28)) . #2#)
                 (LETT |args| (SPADCALL |e| (QREFELT $ 30)) . #2#)
                 (EXIT
                  (COND
                   ((OR (SPADCALL (LENGTH |args|) 2 (QREFELT $ 35))
                        (< (LENGTH |args|) 2))
                    (|FCTOOL;fortExpSize_f| |op| |args| $))
                   ('T
                    (SEQ (LETT |arg1| (SPADCALL |args| 1 (QREFELT $ 32)) . #2#)
                         (LETT |arg2| (SPADCALL |args| 2 (QREFELT $ 32)) . #2#)
                         (LETT |ops| (STRINGIMAGE |op|) . #2#)
                         (EXIT
                          (COND
                           ((EQUAL |ops| "CMPLX")
                            (+ (+ 5 (|FCTOOL;fortExpSize| |arg1| $))
                               (|FCTOOL;fortExpSize| |arg2| $)))
                           (#3#
                            (SEQ (LETT |narys| (LIST "+" "*") . #2#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |ops| |narys| (QREFELT $ 42))
                                    (SEQ
                                     (COND
                                      ((|FCTOOL;same_subtree| |ops| |arg1| $)
                                       (COND
                                        ((NULL
                                          (|FCTOOL;same_subtree| |ops| |arg2|
                                           $))
                                         (EXIT
                                          (|FCTOOL;fortExpSize_f| |op| |args|
                                           $)))))
                                      (#3#
                                       (EXIT
                                        (|FCTOOL;fortExpSize_f| |op| |args|
                                         $))))
                                     (EXIT
                                      (+ (+ 1 (|FCTOOL;fortExpSize| |arg1| $))
                                         (|FCTOOL;fortExpSize| |arg2| $)))))
                                   (#3#
                                    (|FCTOOL;fortExpSize_f| |op| |args|
                                     $)))))))))))))))))) 

(SDEFUN |FCTOOL;mk_assign2|
        ((|name| |OutputForm|) (|val| |OutputForm|) ($ |OutputForm|))
        (SPADCALL (QREFELT $ 46) (LIST |name| |val|) (QREFELT $ 48))) 

(SDEFUN |FCTOOL;mk_assign1|
        ((|name| |Symbol|) (|val| |OutputForm|) ($ |OutputForm|))
        (|FCTOOL;mk_assign2| (SPADCALL |name| (QREFELT $ 45)) |val| $)) 

(SDEFUN |FCTOOL;segment2l|
        ((|op| |OutputForm|) (|args| |List| (|OutputForm|))
         (|topSize| |Integer|) ($ |List| (|OutputForm|)))
        (SPROG
         ((|newVar| #1=(|Symbol|)) (|new_e1| (|OutputForm|))
          (|newE| (|List| (|OutputForm|))) (|exprs| (|List| (|OutputForm|)))
          (|new_var_f| (|OutputForm|)) (|new_var| #1#) (|subSize| (|Integer|))
          (|subE| (|List| (|OutputForm|))) (#2=#:G291 NIL) (|e| NIL)
          (|maxSize| (|Integer|)))
         (SEQ
          (LETT |maxSize|
                (- (- |$maximumFortranExpressionLength| (|FCTOOL;tempLen| $))
                   1)
                . #3=(|FCTOOL;segment2l|))
          (LETT |exprs| NIL . #3#) (LETT |newE| NIL . #3#)
          (LETT |topSize|
                (- |topSize|
                   (|FCTOOL;fortExpSize| (SPADCALL |op| NIL (QREFELT $ 48)) $))
                . #3#)
          (SEQ (LETT |e| NIL . #3#) (LETT #2# |args| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |subSize| (|FCTOOL;fortExpSize| |e| $) . #3#)
                    (EXIT
                     (COND
                      ((SPADCALL |subSize| |maxSize| (QREFELT $ 35))
                       (SEQ
                        (LETT |subE| (|FCTOOL;segment2| |e| |maxSize| $) . #3#)
                        (LETT |exprs| (APPEND (CDR |subE|) |exprs|) . #3#)
                        (LETT |subSize|
                              (|FCTOOL;fortExpSize| (|SPADfirst| |subE|) $)
                              . #3#)
                        (EXIT
                         (COND
                          ((SPADCALL |subSize| |topSize| (QREFELT $ 38))
                           (SEQ
                            (LETT |newE|
                                  (APPEND |newE|
                                          (CONS (|SPADfirst| |subE|) NIL))
                                  . #3#)
                            (EXIT
                             (LETT |topSize| (- |topSize| |subSize|) . #3#))))
                          ('T
                           (SEQ
                            (LETT |new_var| (SPADCALL (QREFELT $ 15)) . #3#)
                            (LETT |new_var_f|
                                  (SPADCALL |new_var| (QREFELT $ 45)) . #3#)
                            (LETT |newE| (APPEND |newE| (CONS |new_var_f| NIL))
                                  . #3#)
                            (LETT |exprs|
                                  (CONS
                                   (|FCTOOL;mk_assign1| |new_var|
                                    (|SPADfirst| |subE|) $)
                                   |exprs|)
                                  . #3#)
                            (EXIT
                             (LETT |topSize|
                                   (- |topSize|
                                      (|FCTOOL;fortExpSize| |new_var_f| $))
                                   . #3#))))))))
                      ('T
                       (SEQ (LETT |newE| (APPEND |newE| (CONS |e| NIL)) . #3#)
                            (EXIT
                             (LETT |topSize| (- |topSize| |subSize|)
                                   . #3#)))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (LETT |new_e1| (SPADCALL |op| |newE| (QREFELT $ 48)) . #3#)
          (EXIT
           (COND
            ((SPADCALL |topSize| 0 (QREFELT $ 35)) (CONS |new_e1| |exprs|))
            ('T
             (SEQ (LETT |newVar| (SPADCALL (QREFELT $ 15)) . #3#)
                  (EXIT
                   (CONS (SPADCALL |newVar| (QREFELT $ 45))
                         (CONS (|FCTOOL;mk_assign1| |newVar| |new_e1| $)
                               |exprs|)))))))))) 

(SDEFUN |FCTOOL;segment2|
        ((|e| |OutputForm|) (|topSize| |Integer|) ($ |List| (|OutputForm|)))
        (COND ((SPADCALL |e| (QREFELT $ 27)) (LIST |e|))
              ('T
               (|FCTOOL;segment2l| (SPADCALL |e| (QREFELT $ 28))
                (SPADCALL |e| (QREFELT $ 30)) |topSize| $)))) 

(SDEFUN |FCTOOL;segment1l|
        ((|op| |OutputForm|) (|args| |List| (|OutputForm|))
         (|maxSize| |Integer|) ($ |List| (|OutputForm|)))
        (SPROG
         ((|safeSize| (|Integer|)) (|new_args| (|List| (|OutputForm|)))
          (|expressions| (|List| (|OutputForm|)))
          (|exprs| (|List| (|OutputForm|))) (|subSize| (|Integer|))
          (#1=#:G300 NIL) (|e| NIL))
         (SEQ (LETT |expressions| NIL . #2=(|FCTOOL;segment1l|))
              (LETT |new_args| NIL . #2#)
              (LETT |safeSize|
                    (-
                     (- |maxSize|
                        (* (LENGTH |args|) (+ (|FCTOOL;tempLen| $) 1)))
                     (|FCTOOL;fortExpSize| (SPADCALL |op| NIL (QREFELT $ 48))
                      $))
                    . #2#)
              (SEQ (LETT |e| NIL . #2#) (LETT #1# |args| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |subSize| (|FCTOOL;fortExpSize| |e| $) . #2#)
                        (EXIT
                         (COND
                          ((SPADCALL |subSize| |safeSize| (QREFELT $ 38))
                           (SEQ
                            (LETT |safeSize| (- |safeSize| |subSize|) . #2#)
                            (EXIT
                             (LETT |new_args|
                                   (APPEND |new_args| (CONS |e| NIL)) . #2#))))
                          ('T
                           (SEQ
                            (LETT |exprs| (|FCTOOL;segment2| |e| |safeSize| $)
                                  . #2#)
                            (LETT |expressions|
                                  (APPEND (CDR |exprs|) |expressions|) . #2#)
                            (LETT |new_args|
                                  (APPEND |new_args|
                                          (CONS (|SPADfirst| |exprs|) NIL))
                                  . #2#)
                            (EXIT
                             (LETT |safeSize|
                                   (- |safeSize|
                                      (|FCTOOL;fortExpSize|
                                       (|SPADfirst| |exprs|) $))
                                   . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT
               (CONS (SPADCALL |op| |new_args| (QREFELT $ 48))
                     |expressions|))))) 

(SDEFUN |FCTOOL;segment1|
        ((|e| |OutputForm|) (|maxSize| |Integer|) ($ |List| (|OutputForm|)))
        (COND ((< (|FCTOOL;fortExpSize| |e| $) |maxSize|) (LIST |e|))
              ((SPADCALL |e| (QREFELT $ 27))
               (|error| "segment1 expecting composite form"))
              ('T
               (|FCTOOL;segment1l| (SPADCALL |e| (QREFELT $ 28))
                (SPADCALL |e| (QREFELT $ 30)) |maxSize| $)))) 

(SDEFUN |FCTOOL;segment|
        ((|l| |List| (|OutputForm|)) ($ |List| (|OutputForm|)))
        (SPROG
         ((|s| (|List| (|OutputForm|))) (|exprs| (|List| (|OutputForm|)))
          (|var| (|OutputForm|)) (|args| (|List| (|OutputForm|)))
          (|e1s| (|Symbol|)) (|e1f| (|OutputForm|)) (#1=#:G314 NIL) (|e| NIL))
         (SEQ
          (COND ((NULL |$fortranSegment|) |l|)
                ('T
                 (SEQ (LETT |s| NIL . #2=(|FCTOOL;segment|))
                      (SEQ (LETT |e| NIL . #2#) (LETT #1# |l| . #2#) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |e| (QREFELT $ 27))
                               (LETT |s| (CONS |e| |s|) . #2#))
                              ('T
                               (SEQ
                                (LETT |e1f| (SPADCALL |e| (QREFELT $ 28))
                                      . #2#)
                                (COND
                                 ((NULL (SPADCALL |e1f| (QREFELT $ 43)))
                                  (EXIT (LETT |s| (CONS |e| |s|) . #2#))))
                                (LETT |e1s| (SPADCALL |e1f| (QREFELT $ 44))
                                      . #2#)
                                (LETT |args| (SPADCALL |e| (QREFELT $ 30))
                                      . #2#)
                                (EXIT
                                 (COND
                                  ((EQUAL |e1s| '=)
                                   (SEQ
                                    (LETT |var|
                                          (SPADCALL |args| 1 (QREFELT $ 32))
                                          . #2#)
                                    (LETT |exprs|
                                          (|FCTOOL;segment1|
                                           (SPADCALL |args| 2 (QREFELT $ 32))
                                           (-
                                            (-
                                             |$maximumFortranExpressionLength|
                                             1)
                                            (|FCTOOL;fortExpSize| |var| $))
                                           $)
                                          . #2#)
                                    (EXIT
                                     (LETT |s|
                                           (CONS
                                            (SPADCALL |e1f|
                                                      (LIST |var|
                                                            (|SPADfirst|
                                                             |exprs|))
                                                      (QREFELT $ 48))
                                            (APPEND (CDR |exprs|) |s|))
                                           . #2#))))
                                  ((EQUAL |e1s| 'RETURN)
                                   (SEQ
                                    (LETT |exprs|
                                          (|FCTOOL;segment1|
                                           (SPADCALL |args| 1 (QREFELT $ 32))
                                           (-
                                            (-
                                             |$maximumFortranExpressionLength|
                                             2)
                                            (|FCTOOL;fortExpSize|
                                             (SPADCALL |args| 1 (QREFELT $ 32))
                                             $))
                                           $)
                                          . #2#)
                                    (EXIT
                                     (LETT |s|
                                           (CONS
                                            (SPADCALL |e1f|
                                                      (LIST
                                                       (|SPADfirst| |exprs|))
                                                      (QREFELT $ 48))
                                            (APPEND (CDR |exprs|) |s|))
                                           . #2#))))
                                  ('T (LETT |s| (CONS |e| |s|) . #2#)))))))))
                           (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT (NREVERSE |s|)))))))) 

(PUT '|FCTOOL;fortError1| '|SPADreplace| '|fortError1|) 

(SDEFUN |FCTOOL;fortError1| ((|e| |OutputForm|) ($ |OutputForm|))
        (|fortError1| |e|)) 

(SDEFUN |FCTOOL;fortError1l|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) ($ |OutputForm|))
        (|FCTOOL;fortError1|
         (SPADCALL (SPADCALL |op| (QREFELT $ 45)) |args| (QREFELT $ 48)) $)) 

(SDEFUN |FCTOOL;push_expr_stack| ((|e| |OutputForm|) ($ |Void|))
        (SETELT $ 49 (CONS |e| (QREFELT $ 49)))) 

(SDEFUN |FCTOOL;pop_expr_stack| (($ |OutputForm|))
        (SPROG ((|res| (|OutputForm|)))
               (SEQ
                (LETT |res| (|SPADfirst| (QREFELT $ 49))
                      |FCTOOL;pop_expr_stack|)
                (SETELT $ 49 (CDR (QREFELT $ 49))) (EXIT |res|)))) 

(SDEFUN |FCTOOL;clear_used_intrinsics;V;23| (($ |Void|)) (SETELT $ 50 NIL)) 

(SDEFUN |FCTOOL;get_used_intrinsics;L;24| (($ |List| (|String|)))
        (SPROG ((#1=#:G324 NIL) (|sy| NIL) (#2=#:G323 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FCTOOL;get_used_intrinsics;L;24|))
                 (SEQ (LETT |sy| NIL . #3#) (LETT #1# (QREFELT $ 50) . #3#)
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |sy| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |sy| (QREFELT $ 53)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FCTOOL;record_intrinsic| ((|sy| |Symbol|) ($ |Void|))
        (COND
         ((NULL (SPADCALL |sy| (QREFELT $ 50) (QREFELT $ 56)))
          (SETELT $ 50 (CONS |sy| (QREFELT $ 50)))))) 

(SDEFUN |FCTOOL;fortranifyIntrinsicFunctionName|
        ((|sy| |Symbol|) (|nargs| |Integer|) ($ |Symbol|))
        (SPROG
         ((#1=#:G338 NIL) (#2=#:G339 NIL) (|r1| NIL)
          (|use_double| (|Boolean|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |use_double|
                  (COND (|$useIntrinsicFunctions| NIL)
                        (#3='T (EQUAL |$fortranPrecision| '|double|)))
                  . #4=(|FCTOOL;fortranifyIntrinsicFunctionName|))
            (COND
             ((EQUAL |sy| '|atan|)
              (COND
               ((EQL |nargs| 2)
                (EXIT
                 (COND
                  (|$useIntrinsicFunctions|
                   (SEQ (|FCTOOL;record_intrinsic| 'ATAN2 $) (EXIT 'ATAN2)))
                  (|use_double| 'DATAN2) (#3# 'ATAN2)))))))
            (SEQ (LETT |r1| NIL . #4#) (LETT #2# (QREFELT $ 57) . #4#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |r1| (CAR #2#) . #4#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((EQUAL (QVELT |r1| 0) |sy|)
                     (COND
                      (|$useIntrinsicFunctions|
                       (SEQ (|FCTOOL;record_intrinsic| (QVELT |r1| 1) $)
                            (EXIT
                             (PROGN
                              (LETT #1# (QVELT |r1| 1) . #4#)
                              (GO #5=#:G337)))))
                      (|use_double|
                       (PROGN (LETT #1# (QVELT |r1| 2) . #4#) (GO #5#)))
                      ('T
                       (PROGN (LETT #1# (QVELT |r1| 1) . #4#) (GO #5#))))))))
                 (LETT #2# (CDR #2#) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT |sy|)))
          #5# (EXIT #1#)))) 

(SDEFUN |FCTOOL;fortranifyFunctionName|
        ((|sy| |Symbol|) (|nargs| |Integer|) ($ |Symbol|))
        (SPROG ((#1=#:G345 NIL) (#2=#:G346 NIL) (|p1| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |p1| NIL . #3=(|FCTOOL;fortranifyFunctionName|))
                       (LETT #2# (QREFELT $ 58) . #3#) G190
                       (COND
                        ((OR (ATOM #2#)
                             (PROGN (LETT |p1| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQUAL (QCAR |p1|) |sy|)
                           (PROGN
                            (LETT #1# (QCDR |p1|) . #3#)
                            (GO #4=#:G344))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (|FCTOOL;fortranifyIntrinsicFunctionName| |sy| |nargs| $))))
                #4# (EXIT #1#)))) 

(SDEFUN |FCTOOL;mkFortFn|
        ((|name| . #1=(|OutputForm|)) (|args| |List| (|OutputForm|))
         (|nargs| |Integer|) ($ |OutputForm|))
        (SPROG ((#2=#:G353 NIL) (|arg| NIL) (#3=#:G352 NIL) (|nn| #1#))
               (SEQ
                (LETT |nn|
                      (COND ((NULL (SPADCALL |name| (QREFELT $ 43))) |name|)
                            ('T
                             (SPADCALL
                              (|FCTOOL;fortranifyFunctionName|
                               (SPADCALL |name| (QREFELT $ 44)) |nargs| $)
                              (QREFELT $ 45))))
                      . #4=(|FCTOOL;mkFortFn|))
                (EXIT
                 (SPADCALL |nn|
                           (PROGN
                            (LETT #3# NIL . #4#)
                            (SEQ (LETT |arg| NIL . #4#) (LETT #2# |args| . #4#)
                                 G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN
                                        (LETT |arg| (CAR #2#) . #4#)
                                        NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #3#
                                         (CONS (|FCTOOL;fortPre1| |arg| $) #3#)
                                         . #4#)))
                                 (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                 (EXIT (NREVERSE #3#))))
                           (QREFELT $ 48)))))) 

(SDEFUN |FCTOOL;mkMat| ((|args| |List| (|OutputForm|)) ($ |OutputForm|))
        (SPROG ((|save_fortInts2Floats| (|Boolean|)))
               (SEQ
                (LETT |save_fortInts2Floats| |$fortInts2Floats| |FCTOOL;mkMat|)
                (EXIT
                 (|finally|
                  (SEQ (SETF |$fortInts2Floats| NIL)
                       (EXIT
                        (|FCTOOL;mkFortFn| (|SPADfirst| |args|) (CDR |args|)
                         (LENGTH (CDR |args|)) $)))
                  (SETF |$fortInts2Floats| |save_fortInts2Floats|)))))) 

(SDEFUN |FCTOOL;fortPreRoot| ((|e| |OutputForm|) ($ |OutputForm|))
        (SPROG ((|save_fortInts2Floats| (|Boolean|)))
               (SEQ
                (LETT |save_fortInts2Floats| |$fortInts2Floats|
                      |FCTOOL;fortPreRoot|)
                (EXIT
                 (|finally|
                  (SEQ (SETF |$fortInts2Floats| 'T)
                       (EXIT (|FCTOOL;fortPre1| |e| $)))
                  (SETF |$fortInts2Floats| |save_fortInts2Floats|)))))) 

(SDEFUN |FCTOOL;exp2FortSpecial|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|nargs| |Integer|)
         ($ |OutputForm|))
        (SPROG
         ((|as1| (|OutputForm|)) (#1=#:G438 NIL) (|c| NIL) (|cx| NIL)
          (|rx_f| (|OutputForm|)) (#2=#:G437 NIL) (|r| NIL) (|rx| NIL)
          (|si| (|Integer|)) (|rows| (|List| (|OutputForm|)))
          (|var| (|OutputForm|)) (#3=#:G436 NIL) (|e| NIL) (|i| NIL)
          (|elts| #4=(|List| (|OutputForm|))) (#5=#:G435 NIL) (|ii| NIL)
          (|i2| #6=(|Integer|)) (|i1| #6#) (|sArgs| #4#)
          (|sOp| #7=(|OutputForm|)) (|op1| #7#) (|old_Ints2Floats| (|Boolean|))
          (|tailPart| (|List| (|String|))) (#8=#:G434 NIL) (|x| NIL)
          (#9=#:G433 NIL) (|n_args| #4#) (|arg| (|OutputForm|)))
         (SEQ
          (COND
           ((EQUAL |op| 'CONCAT)
            (COND
             ((SPADCALL (SPADCALL |args| 1 (QREFELT $ 32)) (QREFELT $ 43))
              (COND
               ((SPADCALL
                 (SPADCALL (SPADCALL |args| 1 (QREFELT $ 32)) (QREFELT $ 44))
                 (LIST '< '> '<= '>= '~ '|and| '|or|) (QREFELT $ 56))
                (EXIT
                 (SEQ
                  (LETT |n_args|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |args| 2 (QREFELT $ 32))
                                    (QREFELT $ 30))
                          1 (QREFELT $ 32))
                         (QREFELT $ 30))
                        . #10=(|FCTOOL;exp2FortSpecial|))
                  (EXIT
                   (|FCTOOL;mkFortFn| (|SPADfirst| |args|) |n_args|
                    (LENGTH |n_args|) $))))))))))
          (COND
           ((EQUAL |op| 'CONCAT)
            (COND
             ((SPADCALL (SPADCALL |args| 2 (QREFELT $ 32)) (QREFELT $ 43))
              (COND
               ((EQUAL
                 (SPADCALL (SPADCALL |args| 2 (QREFELT $ 32)) (QREFELT $ 44))
                 'EQ)
                (EXIT
                 (|FCTOOL;mkFortFn| (SPADCALL |args| 2 (QREFELT $ 32))
                  (LIST (|SPADfirst| |args|)
                        (SPADCALL |args| 3 (QREFELT $ 32)))
                  2 $))))))))
          (EXIT
           (COND
            ((EQUAL |op| 'QUOTE)
             (COND
              ((SPADCALL (LETT |arg| (|SPADfirst| |args|) . #10#)
                         (QREFELT $ 27))
               (STRINGIMAGE |arg|))
              (#11='T
               (SEQ (LETT |n_args| (SPADCALL |arg| (QREFELT $ 30)) . #10#)
                    (LETT |tailPart|
                          (PROGN
                           (LETT #9# NIL . #10#)
                           (SEQ (LETT |x| NIL . #10#)
                                (LETT #8# |n_args| . #10#) G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN (LETT |x| (CAR #8#) . #10#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #9#
                                        (CONS
                                         (STRCONC ","
                                                  (SPADCALL |x|
                                                            (QREFELT $ 59)))
                                         #9#)
                                        . #10#)))
                                (LETT #8# (CDR #8#) . #10#) (GO G190) G191
                                (EXIT (NREVERSE #9#))))
                          . #10#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (CONS "["
                             (CONS
                              (SPADCALL (SPADCALL |arg| (QREFELT $ 28))
                                        (QREFELT $ 59))
                              (APPEND |tailPart| (CONS "]" NIL))))
                       (QREFELT $ 60))
                      (QREFELT $ 61)))))))
            ((EQUAL |op| 'PAREN)
             (SEQ
              (LETT |op1|
                    (SPADCALL (SPADCALL |args| 1 (QREFELT $ 32))
                              (QREFELT $ 28))
                    . #10#)
              (COND
               ((SPADCALL |op1| (QREFELT $ 43))
                (COND
                 ((NULL (EQUAL (SPADCALL |op1| (QREFELT $ 44)) 'CONCATB))
                  (EXIT
                   (|FCTOOL;fortPre1| (SPADCALL |args| 1 (QREFELT $ 32)) $)))))
               (#11#
                (EXIT
                 (|FCTOOL;fortPre1| (SPADCALL |args| 1 (QREFELT $ 32)) $))))
              (EXIT
               (|FCTOOL;mkMat|
                (SPADCALL (SPADCALL |args| 1 (QREFELT $ 32)) (QREFELT $ 30))
                $))))
            ((EQUAL |op| 'SUB)
             (SEQ (LETT |old_Ints2Floats| |$fortInts2Floats| . #10#)
                  (EXIT
                   (|finally|
                    (SEQ (SETF |$fortInts2Floats| NIL)
                         (EXIT
                          (|FCTOOL;mkFortFn| (|SPADfirst| |args|) (CDR |args|)
                           (LENGTH (CDR |args|)) $)))
                    (SETF |$fortInts2Floats| |old_Ints2Floats|)))))
            ((OR (EQUAL |op| 'BRACE) (EQUAL |op| 'BRACKET))
             (SEQ
              (COND
               ((EQL (LENGTH |args|) 2)
                (COND
                 ((NULL
                   (SPADCALL (SPADCALL |args| 2 (QREFELT $ 32))
                             (QREFELT $ 27)))
                  (COND
                   ((SPADCALL
                     (LETT |op1|
                           (SPADCALL (SPADCALL |args| 2 (QREFELT $ 32))
                                     (QREFELT $ 28))
                           . #10#)
                     (QREFELT $ 43))
                    (COND
                     ((EQUAL (SPADCALL |op1| (QREFELT $ 44)) 'AGGLST)
                      (EXIT
                       (SEQ
                        (LETT |var| (SPADCALL |args| 1 (QREFELT $ 32)) . #10#)
                        (LETT |elts|
                              (SPADCALL (SPADCALL |args| 2 (QREFELT $ 32))
                                        (QREFELT $ 30))
                              . #10#)
                        (LETT |si| |$fortranArrayStartingIndex| . #10#)
                        (COND
                         ((EQL (LENGTH |elts|) 1)
                          (COND
                           ((NULL
                             (SPADCALL (SPADCALL |elts| 1 (QREFELT $ 32))
                                       (QREFELT $ 27)))
                            (SEQ
                             (LETT |sOp|
                                   (SPADCALL (SPADCALL |elts| 1 (QREFELT $ 32))
                                             (QREFELT $ 28))
                                   . #10#)
                             (LETT |sArgs|
                                   (SPADCALL (SPADCALL |elts| 1 (QREFELT $ 32))
                                             (QREFELT $ 30))
                                   . #10#)
                             (EXIT
                              (COND
                               ((SPADCALL |sOp| (QREFELT $ 43))
                                (COND
                                 ((EQUAL (SPADCALL |sOp| (QREFELT $ 44))
                                         'SEGMENT)
                                  (COND
                                   ((EQL (LENGTH |sArgs|) 1)
                                    (|FCTOOL;fortError1| (|SPADfirst| |elts|)
                                     $))
                                   (#11#
                                    (SEQ
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL |sArgs| 1 (QREFELT $ 32))
                                        (QREFELT $ 62))
                                       (COND
                                        ((NULL
                                          (SPADCALL
                                           (SPADCALL |sArgs| 2 (QREFELT $ 32))
                                           (QREFELT $ 62)))
                                         (EXIT
                                          (|fortError|
                                           #12="Cannot expand segment: "
                                           (|SPADfirst| |elts|))))))
                                      (#11#
                                       (EXIT
                                        (|fortError| #12#
                                                     (|SPADfirst| |elts|)))))
                                     (LETT |i1|
                                           (SPADCALL
                                            (SPADCALL |sArgs| 1 (QREFELT $ 32))
                                            (QREFELT $ 63))
                                           . #10#)
                                     (LETT |i2|
                                           (SPADCALL
                                            (SPADCALL |sArgs| 2 (QREFELT $ 32))
                                            (QREFELT $ 63))
                                           . #10#)
                                     (EXIT
                                      (COND
                                       ((SPADCALL |i1| |i2| (QREFELT $ 35))
                                        (|FCTOOL;fortError1|
                                         (SPADCALL
                                          "Lower bound of segment exceeds upper bound."
                                          (QREFELT $ 61))
                                         $))
                                       (#11#
                                        (SEQ
                                         (SEQ (LETT |i| |si| . #10#)
                                              (LETT |ii| |i1| . #10#)
                                              (LETT #5# |i2| . #10#) G190
                                              (COND ((> |ii| #5#) (GO G191)))
                                              (SEQ
                                               (LETT |as1|
                                                     (|FCTOOL;mk_assign2|
                                                      (SPADCALL |var|
                                                                (LIST
                                                                 (SPADCALL |i|
                                                                           (QREFELT
                                                                            $
                                                                            64)))
                                                                (QREFELT $ 48))
                                                      (|FCTOOL;fortPre1|
                                                       (SPADCALL |ii|
                                                                 (QREFELT $
                                                                          64))
                                                       $)
                                                      $)
                                                     . #10#)
                                               (EXIT
                                                (|FCTOOL;push_expr_stack| |as1|
                                                 $)))
                                              (LETT |ii|
                                                    (PROG1 (+ |ii| 1)
                                                      (LETT |i| (+ |i| 1)
                                                            . #10#))
                                                    . #10#)
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT
                                          (LETT |elts| NIL
                                                . #10#)))))))))))))))))))
                        (SEQ (LETT |i| |si| . #10#) (LETT |e| NIL . #10#)
                             (LETT #3# |elts| . #10#) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |e| (CAR #3#) . #10#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |as1|
                                    (|FCTOOL;mk_assign2|
                                     (SPADCALL |var|
                                               (LIST
                                                (SPADCALL |i| (QREFELT $ 64)))
                                               (QREFELT $ 48))
                                     (|FCTOOL;fortPre1| |e| $) $)
                                    . #10#)
                              (EXIT (|FCTOOL;push_expr_stack| |as1| $)))
                             (LETT #3#
                                   (PROG1 (CDR #3#)
                                     (LETT |i| (+ |i| 1) . #10#))
                                   . #10#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT (|FCTOOL;pop_expr_stack| $))))))))))))
              (EXIT (|FCTOOL;fortError1l| |op| |args| $))))
            ((OR (EQUAL |op| 'CONCAT) (EQUAL |op| 'CONCATB))
             (COND ((EQL |nargs| 0) NIL)
                   ((EQL |nargs| 1) (|FCTOOL;fortPre1| (|SPADfirst| |args|) $))
                   (#11#
                    (SEQ
                     (COND
                      ((EQL |nargs| 2)
                       (COND
                        ((SPADCALL (SPADCALL |args| 2 (QREFELT $ 32))
                                   (QREFELT $ 43))
                         (COND
                          ((EQUAL
                            (SPADCALL (SPADCALL |args| 2 (QREFELT $ 32))
                                      (QREFELT $ 44))
                            '!)
                           (EXIT
                            (|FCTOOL;mkFortFn| 'FACTORIAL
                             (LIST (|SPADfirst| |args|)) 1 $))))))))
                     (EXIT (|FCTOOL;fortError1l| |op| |args| $))))))
            ('T
             (COND
              ((EQUAL |op| 'MATRIX)
               (SEQ (LETT |var| (SPADCALL |args| 1 (QREFELT $ 32)) . #10#)
                    (LETT |rows| (CDR (CDR |args|)) . #10#)
                    (LETT |si| |$fortranArrayStartingIndex| . #10#)
                    (SEQ (LETT |rx| |si| . #10#) (LETT |r| NIL . #10#)
                         (LETT #2# |rows| . #10#) G190
                         (COND
                          ((OR (ATOM #2#)
                               (PROGN (LETT |r| (CAR #2#) . #10#) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |rx_f| (SPADCALL |rx| (QREFELT $ 64)) . #10#)
                          (EXIT
                           (SEQ (LETT |cx| |si| . #10#) (LETT |c| NIL . #10#)
                                (LETT #1# (SPADCALL |r| (QREFELT $ 30)) . #10#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |c| (CAR #1#) . #10#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |as1|
                                       (|FCTOOL;mk_assign2|
                                        (SPADCALL |var|
                                                  (LIST |rx_f|
                                                        (SPADCALL |cx|
                                                                  (QREFELT $
                                                                           64)))
                                                  (QREFELT $ 48))
                                        (|FCTOOL;fortPre1| |c| $) $)
                                       . #10#)
                                 (EXIT (|FCTOOL;push_expr_stack| |as1| $)))
                                (LETT #1#
                                      (PROG1 (CDR #1#)
                                        (LETT |cx| (+ |cx| 1) . #10#))
                                      . #10#)
                                (GO G190) G191 (EXIT NIL))))
                         (LETT #2#
                               (PROG1 (CDR #2#) (LETT |rx| (+ |rx| 1) . #10#))
                               . #10#)
                         (GO G190) G191 (EXIT NIL))
                    (EXIT (|FCTOOL;pop_expr_stack| $))))
              (#11# (|FCTOOL;fortError1l| |op| |args| $))))))))) 

(SDEFUN |FCTOOL;is_imaginary| ((|x| |OutputForm|) ($ |Boolean|))
        (COND ((NULL (SPADCALL |x| (QREFELT $ 43))) NIL)
              ('T (EQUAL (SPADCALL |x| (QREFELT $ 44)) '|%i|)))) 

(SDEFUN |FCTOOL;fix2FortranFloat| ((|i| |Integer|) ($ |OutputForm|))
        (SPROG ((|ss| (|String|)))
               (SEQ
                (LETT |ss| (STRINGIMAGE |i|) . #1=(|FCTOOL;fix2FortranFloat|))
                (LETT |ss|
                      (STRCONC |ss|
                               (COND
                                ((EQUAL |$fortranPrecision| '|double|) ".0D0")
                                ('T ".0")))
                      . #1#)
                (EXIT (SPADCALL |ss| (QREFELT $ 61)))))) 

(SDEFUN |FCTOOL;checkPrecision1| ((|s| |String|) ($ |String|))
        (SPROG ((|p2| #1=(|Integer|)) (|p1| #1#) (|s2| (|String|)))
               (SEQ
                (COND
                 ((|eql_SI| (SPADCALL |s| 1 (QREFELT $ 68))
                            (|STR_to_CHAR| "\""))
                  |s|)
                 (#2='T
                  (SEQ
                   (LETT |s2|
                         (SPADCALL (|STR_to_CHAR| " ")
                                   (SPADCALL (|STR_to_CHAR| "_") |s|
                                             (QREFELT $ 70))
                                   (QREFELT $ 70))
                         . #3=(|FCTOOL;checkPrecision1|))
                   (LETT |p1|
                         (SPADCALL (|STR_to_CHAR| ".") |s2| (QREFELT $ 71))
                         . #3#)
                   (EXIT
                    (COND ((< |p1| 1) |s|)
                          ((SPADCALL |$fortranPrecision| '|double|
                                     (QREFELT $ 72))
                           |s2|)
                          (#2#
                           (SEQ
                            (LETT |p2|
                                  (SPADCALL (|STR_to_CHAR| "E") |s2|
                                            (QREFELT $ 71))
                                  . #3#)
                            (EXIT
                             (COND
                              ((SPADCALL |p2| 0 (QREFELT $ 35))
                               (SEQ
                                (SPADCALL |s2| |p2|
                                          (SPADCALL "D" 1 (QREFELT $ 68))
                                          (QREFELT $ 73))
                                (EXIT |s2|)))
                              (#2# (STRCONC |s2| "D0")))))))))))))) 

(SDEFUN |FCTOOL;checkPrecision| ((|s| |String|) ($ |OutputForm|))
        (SPADCALL (|FCTOOL;checkPrecision1| |s| $) (QREFELT $ 61))) 

(SDEFUN |FCTOOL;fortPre1| ((|e| |OutputForm|) ($ . #1=(|OutputForm|)))
        (SPROG
         ((|n_args| #2=(|List| (|OutputForm|))) (|arg2| #3=(|OutputForm|))
          (|arg1| #3#) (|im_op| (|OutputForm|)) (|binaryExpr| #1#)
          (#4=#:G496 NIL) (|e1| NIL) (|op| (|OutputForm|)) (|sy| #5=(|Symbol|))
          (#6=#:G495 NIL) (|sr| #5#) (|exponent| #3#) (|rand| #3#) (|args| #2#)
          (|ss| (|String|)) (|ii| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |e| (QREFELT $ 27))
             (COND
              ((SPADCALL |e| (QREFELT $ 62))
               (COND
                (|$fortInts2Floats|
                 (SEQ
                  (LETT |ii| (SPADCALL |e| (QREFELT $ 63))
                        . #7=(|FCTOOL;fortPre1|))
                  (EXIT
                   (COND ((>= |ii| 0) (|FCTOOL;fix2FortranFloat| |ii| $))
                         (#8='T
                          (SPADCALL (SPADCALL '- (QREFELT $ 74))
                                    (LIST
                                     (|FCTOOL;fix2FortranFloat| (- |ii|) $))
                                    (QREFELT $ 48)))))))
                (#8# |e|)))
              ((SPADCALL |e| (QREFELT $ 75))
               (|FCTOOL;checkPrecision| (SPADCALL |e| (QREFELT $ 59)) $))
              ((SPADCALL |e| (QREFELT $ 43))
               (SEQ (LETT |sy| (SPADCALL |e| (QREFELT $ 44)) . #7#)
                    (EXIT
                     (COND
                      ((EQUAL |sy| '|%e|)
                       (|FCTOOL;fortPre1|
                        (SPADCALL (SPADCALL '|exp| (QREFELT $ 45))
                                  (LIST (SPADCALL 1 (QREFELT $ 64)))
                                  (QREFELT $ 48))
                        $))
                      ((EQUAL |sy| '|%i|)
                       (SPADCALL (SPADCALL 'CMPLX (QREFELT $ 45))
                                 (LIST
                                  (|FCTOOL;fortPre1|
                                   (SPADCALL 0 (QREFELT $ 64)) $)
                                  (|FCTOOL;fortPre1|
                                   (SPADCALL 1 (QREFELT $ 64)) $))
                                 (QREFELT $ 48)))
                      (#8#
                       (SEQ (LETT |ss| (SPADCALL |sy| (QREFELT $ 53)) . #7#)
                            (EXIT
                             (COND
                              ((|eql_SI| (SPADCALL |ss| 1 (QREFELT $ 68))
                                         (|STR_to_CHAR| "%"))
                               (SPADCALL
                                (SPADCALL |ss| (SPADCALL 2 (QREFELT $ 77))
                                          (QREFELT $ 78))
                                (QREFELT $ 61)))
                              (#8# |e|)))))))))
              (#8# |e|)))
            (#8#
             (SEQ (LETT |op| (SPADCALL |e| (QREFELT $ 28)) . #7#)
                  (LETT |args| (SPADCALL |e| (QREFELT $ 30)) . #7#)
                  (EXIT
                   (COND
                    ((SPADCALL |op| (QREFELT $ 43))
                     (SEQ (LETT |sy| (SPADCALL |op| (QREFELT $ 44)) . #7#)
                          (EXIT
                           (COND
                            ((EQUAL |sy| '^)
                             (SEQ
                              (LETT |rand| (SPADCALL |args| 1 (QREFELT $ 32))
                                    . #7#)
                              (LETT |exponent|
                                    (SPADCALL |args| 2 (QREFELT $ 32)) . #7#)
                              (COND
                               ((SPADCALL |rand| (QREFELT $ 43))
                                (SEQ
                                 (LETT |sr| (SPADCALL |rand| (QREFELT $ 44))
                                       . #7#)
                                 (EXIT
                                  (COND
                                   ((EQUAL |sr| '|%e|)
                                    (PROGN
                                     (LETT #6#
                                           (|FCTOOL;fortPre1|
                                            (SPADCALL
                                             (SPADCALL '|exp| (QREFELT $ 45))
                                             (LIST |exponent|) (QREFELT $ 48))
                                            $)
                                           . #7#)
                                     (GO #9=#:G494)))
                                   ((SPADCALL |exponent| (QREFELT $ 62))
                                    (COND
                                     ((EQL (SPADCALL |exponent| (QREFELT $ 63))
                                           2)
                                      (PROGN
                                       (LETT #6#
                                             (SPADCALL
                                              (SPADCALL '* (QREFELT $ 45))
                                              (LIST |rand| |rand|)
                                              (QREFELT $ 48))
                                             . #7#)
                                       (GO #9#))))))))))
                              (COND
                               ((SPADCALL |exponent| (QREFELT $ 62))
                                (COND
                                 ((< (ABS (SPADCALL |exponent| (QREFELT $ 63)))
                                     32768)
                                  (EXIT
                                   (SPADCALL (QREFELT $ 66)
                                             (LIST (|FCTOOL;fortPre1| |rand| $)
                                                   |exponent|)
                                             (QREFELT $ 48)))))))
                              (EXIT
                               (SPADCALL (QREFELT $ 66)
                                         (LIST (|FCTOOL;fortPre1| |rand| $)
                                               (|FCTOOL;fortPre1| |exponent|
                                                $))
                                         (QREFELT $ 48)))))
                            ((EQUAL |sy| 'ROOT)
                             (COND
                              ((EQL (LENGTH |args|) 1)
                               (|FCTOOL;fortPreRoot|
                                (SPADCALL (SPADCALL '|sqrt| (QREFELT $ 45))
                                          (LIST (|SPADfirst| |args|))
                                          (QREFELT $ 48))
                                $))
                              (#8#
                               (SPADCALL (QREFELT $ 66)
                                         (LIST
                                          (|FCTOOL;fortPreRoot|
                                           (|SPADfirst| |args|) $)
                                          (SPADCALL
                                           (SPADCALL '/ (QREFELT $ 45))
                                           (LIST (SPADCALL 1 (QREFELT $ 64))
                                                 (|FCTOOL;fortPreRoot|
                                                  (SPADCALL |args| 2
                                                            (QREFELT $ 32))
                                                  $))
                                           (QREFELT $ 48)))
                                         (QREFELT $ 48)))))
                            (#8#
                             (SEQ
                              (COND
                               ((OR (EQUAL |sy| 'OVER) (EQUAL |sy| 'SLASH))
                                (SEQ (LETT |sy| '/ . #7#)
                                     (EXIT
                                      (LETT |op| (SPADCALL |sy| (QREFELT $ 45))
                                            . #7#)))))
                              (EXIT
                               (COND
                                ((SPADCALL |sy| (QREFELT $ 65) (QREFELT $ 56))
                                 (|FCTOOL;exp2FortSpecial| |sy| |args|
                                  (LENGTH |args|) $))
                                (#8#
                                 (SEQ
                                  (COND
                                   ((SPADCALL |sy| (LIST '* '+ '-)
                                              (QREFELT $ 56))
                                    (COND
                                     ((SPADCALL (LENGTH |args|) 2
                                                (QREFELT $ 79))
                                      (EXIT
                                       (SEQ
                                        (LETT |binaryExpr|
                                              (|FCTOOL;fortPre1|
                                               (SPADCALL |op|
                                                         (LIST
                                                          (SPADCALL |args| 1
                                                                    (QREFELT $
                                                                             32))
                                                          (SPADCALL |args| 2
                                                                    (QREFELT $
                                                                             32)))
                                                         (QREFELT $ 48))
                                               $)
                                              . #7#)
                                        (SEQ (LETT |e1| NIL . #7#)
                                             (LETT #4# (CDR (CDR |args|))
                                                   . #7#)
                                             G190
                                             (COND
                                              ((OR (ATOM #4#)
                                                   (PROGN
                                                    (LETT |e1| (CAR #4#) . #7#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT |binaryExpr|
                                                     (SPADCALL |op|
                                                               (LIST
                                                                |binaryExpr|
                                                                (|FCTOOL;fortPre1|
                                                                 |e1| $))
                                                               (QREFELT $ 48))
                                                     . #7#)))
                                             (LETT #4# (CDR #4#) . #7#)
                                             (GO G190) G191 (EXIT NIL))
                                        (EXIT |binaryExpr|)))))))
                                  (EXIT
                                   (COND
                                    ((EQL (LENGTH |args|) 2)
                                     (SEQ
                                      (LETT |im_op|
                                            (SPADCALL 'CMPLX (QREFELT $ 45))
                                            . #7#)
                                      (LETT |arg1|
                                            (SPADCALL |args| 1 (QREFELT $ 32))
                                            . #7#)
                                      (LETT |arg2|
                                            (SPADCALL |args| 2 (QREFELT $ 32))
                                            . #7#)
                                      (EXIT
                                       (COND
                                        ((|FCTOOL;is_imaginary| |arg2| $)
                                         (COND
                                          ((EQUAL |sy| '*)
                                           (SPADCALL |im_op|
                                                     (LIST
                                                      (|FCTOOL;fortPre1|
                                                       (SPADCALL 0
                                                                 (QREFELT $
                                                                          64))
                                                       $)
                                                      (|FCTOOL;fortPre1| |arg1|
                                                       $))
                                                     (QREFELT $ 48)))
                                          ((EQUAL |sy| '+)
                                           (SPADCALL |im_op|
                                                     (LIST
                                                      (|FCTOOL;fortPre1| |arg1|
                                                       $)
                                                      (|FCTOOL;fortPre1|
                                                       (SPADCALL 1
                                                                 (QREFELT $
                                                                          64))
                                                       $))
                                                     (QREFELT $ 48)))
                                          (#8#
                                           (|FCTOOL;mkFortFn| |op| |args| 2
                                            $))))
                                        ((NULL (EQUAL |sy| '+))
                                         (|FCTOOL;mkFortFn| |op| |args| 2 $))
                                        ('T
                                         (COND
                                          ((|FCTOOL;same_subtree2| '* |arg2| $)
                                           (SEQ
                                            (LETT |n_args|
                                                  (SPADCALL |arg2|
                                                            (QREFELT $ 30))
                                                  . #7#)
                                            (EXIT
                                             (COND
                                              ((|FCTOOL;is_imaginary|
                                                (SPADCALL |n_args| 2
                                                          (QREFELT $ 32))
                                                $)
                                               (SPADCALL |im_op|
                                                         (LIST
                                                          (|FCTOOL;fortPre1|
                                                           |arg1| $)
                                                          (|FCTOOL;fortPre1|
                                                           (SPADCALL |n_args| 1
                                                                     (QREFELT $
                                                                              32))
                                                           $))
                                                         (QREFELT $ 48)))
                                              ((|FCTOOL;is_imaginary|
                                                (SPADCALL |n_args| 1
                                                          (QREFELT $ 32))
                                                $)
                                               (SPADCALL |im_op|
                                                         (LIST
                                                          (|FCTOOL;fortPre1|
                                                           |arg1| $)
                                                          (|FCTOOL;fortPre1|
                                                           (SPADCALL |n_args| 2
                                                                     (QREFELT $
                                                                              32))
                                                           $))
                                                         (QREFELT $ 48)))
                                              (#8#
                                               (|FCTOOL;mkFortFn| |op| |args| 2
                                                $))))))
                                          ((|FCTOOL;same_subtree2| '* |arg1| $)
                                           (SEQ
                                            (LETT |n_args|
                                                  (SPADCALL |arg1|
                                                            (QREFELT $ 30))
                                                  . #7#)
                                            (EXIT
                                             (COND
                                              ((|FCTOOL;is_imaginary|
                                                (SPADCALL |n_args| 2
                                                          (QREFELT $ 32))
                                                $)
                                               (SPADCALL |im_op|
                                                         (LIST
                                                          (|FCTOOL;fortPre1|
                                                           |arg2| $)
                                                          (|FCTOOL;fortPre1|
                                                           (SPADCALL |n_args| 1
                                                                     (QREFELT $
                                                                              32))
                                                           $))
                                                         (QREFELT $ 48)))
                                              ((|FCTOOL;is_imaginary|
                                                (SPADCALL |n_args| 1
                                                          (QREFELT $ 32))
                                                $)
                                               (SPADCALL |im_op|
                                                         (LIST
                                                          (|FCTOOL;fortPre1|
                                                           |arg2| $)
                                                          (|FCTOOL;fortPre1|
                                                           (SPADCALL |n_args| 2
                                                                     (QREFELT $
                                                                              32))
                                                           $))
                                                         (QREFELT $ 48)))
                                              (#8#
                                               (|FCTOOL;mkFortFn| |op| |args| 2
                                                $))))))
                                          (#8#
                                           (|FCTOOL;mkFortFn| |op| |args| 2
                                            $))))))))
                                    (#8#
                                     (|FCTOOL;mkFortFn| |op| |args|
                                      (LENGTH |args|) $))))))))))))))
                    (#8#
                     (|FCTOOL;mkFortFn| |op| |args| (LENGTH |args|) $))))))))
          #9# (EXIT #6#)))) 

(SDEFUN |FCTOOL;fortPre|
        ((|l| |List| (|OutputForm|)) ($ |List| (|OutputForm|)))
        (SPROG
         ((|res| (|List| (|OutputForm|))) (|new| (|OutputForm|))
          (#1=#:G501 NIL) (|e| NIL))
         (SEQ (SETELT $ 49 NIL)
              (SEQ (LETT |e| NIL . #2=(|FCTOOL;fortPre|)) (LETT #1# |l| . #2#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |new| (|FCTOOL;fortPre1| |e| $) . #2#)
                        (EXIT (|FCTOOL;push_expr_stack| |new| $)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (LETT |res| (NREVERSE (QREFELT $ 49)) . #2#) (SETELT $ 49 NIL)
              (EXIT |res|)))) 

(SDEFUN |FCTOOL;get_fort_indent;I;38| (($ |Integer|)) (QREFELT $ 80)) 

(SDEFUN |FCTOOL;indentFortLevel;IV;39| ((|i| |Integer|) ($ |Void|))
        (SEQ
         (SETF |$maximumFortranExpressionLength|
                 (- |$maximumFortranExpressionLength|
                    (SPADCALL 2 |i| (QREFELT $ 83))))
         (EXIT
          (SETELT $ 80 (+ (QREFELT $ 80) (SPADCALL 2 |i| (QREFELT $ 83))))))) 

(SDEFUN |FCTOOL;make_spaces| ((|x| |Integer|) ($ |String|))
        (SPROG ((#1=#:G506 NIL))
               (|make_full_CVEC|
                (PROG1 (LETT #1# |x| |FCTOOL;make_spaces|)
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#))
                (STR_ELT "   " 0)))) 

(SDEFUN |FCTOOL;fortran2Lines1|
        ((|f| |List| (|String|)) (|res| |List| (|String|))
         ($ |List| (|String|)))
        (SPROG
         ((|line| #1=(|String|)) (|ll| (|Integer|)) (|ff| (|String|))
          (|spaceLeft| (|Integer|)) (#2=#:G518 NIL) (|sff| (|Integer|))
          (|contPref| (|String|)) (|normPref| #1#))
         (SEQ
          (LETT |normPref| (|FCTOOL;make_spaces| (QREFELT $ 80) $)
                . #3=(|FCTOOL;fortran2Lines1|))
          (LETT |contPref|
                (STRCONC "     &"
                         (|FCTOOL;make_spaces| (- (QREFELT $ 80) 6) $))
                . #3#)
          (LETT |ll| (QREFELT $ 80) . #3#)
          (SEQ G190 (COND ((NULL (NULL (NULL |f|))) (GO G191)))
               (SEQ (LETT |line| |normPref| . #3#)
                    (LETT |ff| (|SPADfirst| |f|) . #3#)
                    (SEQ
                     (EXIT
                      (SEQ G190 NIL
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL
                                (+ |ll| (LETT |sff| (QCSIZE |ff|) . #3#))
                                |$fortLength| (QREFELT $ 38))
                               (SEQ (LETT |ll| (+ |ll| |sff|) . #3#)
                                    (LETT |line| (STRCONC |line| |ff|) . #3#)
                                    (LETT |f| (CDR |f|) . #3#)
                                    (EXIT
                                     (COND
                                      ((NULL |f|)
                                       (PROGN
                                        (LETT #2# |$NoValue| . #3#)
                                        (GO #4=#:G513)))
                                      ('T
                                       (LETT |ff| (|SPADfirst| |f|) . #3#))))))
                              ('T
                               (SEQ
                                (LETT |spaceLeft| (- |$fortLength| |ll|) . #3#)
                                (EXIT
                                 (COND
                                  ((< |spaceLeft| 0)
                                   (|error| "too deep indentation"))
                                  ('T
                                   (SEQ
                                    (LETT |line|
                                          (STRCONC |line|
                                                   (SPADCALL |ff|
                                                             (SPADCALL 1
                                                                       |spaceLeft|
                                                                       (QREFELT
                                                                        $ 85))
                                                             (QREFELT $ 78)))
                                          . #3#)
                                    (LETT |ff|
                                          (SPADCALL |ff|
                                                    (SPADCALL (+ |spaceLeft| 1)
                                                              (QREFELT $ 77))
                                                    (QREFELT $ 78))
                                          . #3#)
                                    (LETT |res| (CONS |line| |res|) . #3#)
                                    (LETT |ll| (QREFELT $ 80) . #3#)
                                    (EXIT
                                     (LETT |line| |contPref| . #3#)))))))))))
                           NIL (GO G190) G191 (EXIT NIL)))
                     #4# (EXIT #2#))
                    (EXIT
                     (COND
                      ((SPADCALL |ll| (QREFELT $ 80) (QREFELT $ 35))
                       (LETT |res| (CONS |line| |res|) . #3#)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |res|)))) 

(SDEFUN |FCTOOL;fort_clean_lines;2L;42|
        ((|l| |List| (|String|)) ($ |List| (|String|)))
        (SPROG
         ((|nl| (|List| (|String|))) (|res| (|List| (|String|)))
          (|el| (|String|)))
         (SEQ (LETT |nl| NIL . #1=(|FCTOOL;fort_clean_lines;2L;42|))
              (LETT |res| NIL . #1#)
              (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                   (SEQ
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |l|) NIL)
                                  ('T
                                   (SPADCALL
                                    (LETT |el| (|SPADfirst| |l|) . #1#) "%l"
                                    (QREFELT $ 86)))))
                           (GO G191)))
                         (SEQ (LETT |nl| (CONS |el| |nl|) . #1#)
                              (EXIT (LETT |l| (CDR |l|) . #1#)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (COND ((NULL (NULL |l|)) (LETT |l| (CDR |l|) . #1#)))
                    (LETT |res|
                          (|FCTOOL;fortran2Lines1| (NREVERSE |nl|) |res| $)
                          . #1#)
                    (EXIT (LETT |nl| NIL . #1#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(PUT '|FCTOOL;do_with_error_env3;MV;43| '|SPADreplace| '|do_with_error_env3|) 

(SDEFUN |FCTOOL;do_with_error_env3;MV;43| ((|f| |Mapping| (|Void|)) ($ |Void|))
        (|do_with_error_env3| |f|)) 

(SDEFUN |FCTOOL;do_with_error_env2;BML;44|
        ((|int_to_floats?| |Boolean|) (|f| |Mapping| (|List| (|String|)))
         ($ |List| (|String|)))
        (SPROG NIL
               (|do_with_error_env2| |int_to_floats?|
                                     (CONS
                                      #'|FCTOOL;do_with_error_env2;BML;44!0|
                                      (VECTOR $ |f|))))) 

(SDEFUN |FCTOOL;do_with_error_env2;BML;44!0| (($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|FCTOOL;do_with_error_env2;BML;44|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |f|) (QREFELT $ 87)))))) 

(PUT '|FCTOOL;do_with_error_env0;ML;45| '|SPADreplace| '|do_with_error_env0|) 

(SDEFUN |FCTOOL;do_with_error_env0;ML;45|
        ((|f| |Mapping| (|List| (|String|))) ($ |List| (|String|)))
        (|do_with_error_env0| |f|)) 

(SDEFUN |FCTOOL;do_with_error_env1;ML;46|
        ((|f| |Mapping| (|List| (|String|))) ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL
                (CONS #'|FCTOOL;do_with_error_env1;ML;46!0| (VECTOR $ |f|))
                (QREFELT $ 92)))) 

(SDEFUN |FCTOOL;do_with_error_env1;ML;46!0| (($$ NIL))
        (PROG (|f| $)
          (LETT |f| (QREFELT $$ 1) . #1=(|FCTOOL;do_with_error_env1;ML;46|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |f|) (QREFELT $ 87)))))) 

(SDEFUN |FCTOOL;do_expression_to_fortran|
        ((|of| |OutputForm|) ($ |List| (|String|)))
        (SPROG ((|ol| (|List| (|OutputForm|))))
               (SEQ
                (LETT |ol| (|exp2FortOptimize| (SPADCALL |of| (QREFELT $ 94)))
                      |FCTOOL;do_expression_to_fortran|)
                (EXIT
                 (|FCTOOL;fortranCleanUp|
                  (|FCTOOL;exp2Fort1|
                   (|FCTOOL;segment| (|FCTOOL;fortPre| |ol| $) $) $)
                  $))))) 

(SDEFUN |FCTOOL;expression2Fortran1;MOfBL;48|
        ((|nf| |Mapping| (|Symbol|)) (|of| |OutputForm|)
         (|int_to_floats?| |Boolean|) ($ |List| (|String|)))
        (SPROG NIL
               (|do_with_error_env4| |nf| |int_to_floats?|
                                     (CONS
                                      #'|FCTOOL;expression2Fortran1;MOfBL;48!0|
                                      (VECTOR $ |of|))))) 

(SDEFUN |FCTOOL;expression2Fortran1;MOfBL;48!0| (($$ NIL))
        (PROG (|of| $)
          (LETT |of| (QREFELT $$ 1)
                . #1=(|FCTOOL;expression2Fortran1;MOfBL;48|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FCTOOL;do_expression_to_fortran| |of| $))))) 

(SDEFUN |FCTOOL;statement2Fortran;OfL;49|
        ((|of| |OutputForm|) ($ |List| (|String|)))
        (SPADCALL (LIST #'|FCTOOL;statement2Fortran;OfL;49!0|) |of| NIL
                  (QREFELT $ 96))) 

(SDEFUN |FCTOOL;statement2Fortran;OfL;49!0| (($$ NIL)) 'DUMMY) 

(SDEFUN |FCTOOL;expression2Fortran;OfL;50|
        ((|of| |OutputForm|) ($ |List| (|String|)))
        (SPADCALL (ELT $ 15) |of| NIL (QREFELT $ 96))) 

(PUT '|FCTOOL;changeExprLength;IV;51| '|SPADreplace| '|changeExprLength|) 

(SDEFUN |FCTOOL;changeExprLength;IV;51| ((|i| |Integer|) ($ |Void|))
        (|changeExprLength| |i|)) 

(SDEFUN |FCTOOL;getStatement;OfBL;52|
        ((|of| |OutputForm|) (|int_to_floats?| |Boolean|)
         ($ |List| (|String|)))
        (SPROG NIL
               (SPADCALL |int_to_floats?|
                         (CONS #'|FCTOOL;getStatement;OfBL;52!0|
                               (VECTOR $ |of|))
                         (QREFELT $ 91)))) 

(SDEFUN |FCTOOL;getStatement;OfBL;52!0| (($$ NIL))
        (PROG (|of| $)
          (LETT |of| (QREFELT $$ 1) . #1=(|FCTOOL;getStatement;OfBL;52|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |of| (QREFELT $ 97)))))) 

(PUT '|FCTOOL;displayLines;LV;53| '|SPADreplace| '|displayLines|) 

(SDEFUN |FCTOOL;displayLines;LV;53| ((|l| |List| (|String|)) ($ |Void|))
        (|displayLines| |l|)) 

(PUT '|FCTOOL;displayLines1;LV;54| '|SPADreplace| '|displayLines1|) 

(SDEFUN |FCTOOL;displayLines1;LV;54| ((|l| |List| (|String|)) ($ |Void|))
        (|displayLines1| |l|)) 

(SDEFUN |FCTOOL;dispStatement;OfV;55| ((|of| |OutputForm|) ($ |Void|))
        (SPROG ((|l| (|List| (|String|))))
               (SEQ
                (LETT |l| (SPADCALL |of| NIL (QREFELT $ 100))
                      |FCTOOL;dispStatement;OfV;55|)
                (EXIT (SPADCALL |l| (QREFELT $ 102)))))) 

(SDEFUN |FCTOOL;fortFormatHead1|
        ((|name| |Symbol|) (|asp| |List| (|String|)) (|args| |List| (|Symbol|))
         ($ |List| (|String|)))
        (SPROG
         ((|of| (|OutputForm|)) (#1=#:G555 NIL) (|arg| NIL) (#2=#:G554 NIL))
         (SEQ
          (LETT |of|
                (SPADCALL (SPADCALL |name| (QREFELT $ 74))
                          (PROGN
                           (LETT #2# NIL . #3=(|FCTOOL;fortFormatHead1|))
                           (SEQ (LETT |arg| NIL . #3#) (LETT #1# |args| . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |arg| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |arg| (QREFELT $ 74))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 48))
                . #3#)
          (EXIT (APPEND |asp| (SPADCALL |of| (QREFELT $ 97))))))) 

(SDEFUN |FCTOOL;fortFormatHead;SULV;57|
        ((|name| |Symbol|)
         (|returnType| |Union| (|:| |fst| (|FortranScalarType|))
          (|:| |void| "void"))
         (|args| |List| (|Symbol|)) ($ |Void|))
        (SPROG
         ((|lines| (|List| (|String|))) (|l| (|Integer|))
          (|asp| (|List| (|String|))) (|s| (|String|)) (#1=#:G556 NIL))
         (SEQ
          (COND
           ((QEQCAR |returnType| 1)
            (SEQ
             (LETT |asp| (LIST "SUBROUTINE ")
                   . #2=(|FCTOOL;fortFormatHead;SULV;57|))
             (EXIT (SPADCALL (LETT |l| -11 . #2#) (QREFELT $ 99)))))
           ('T
            (SEQ
             (LETT |s|
                   (SPADCALL
                    (SPADCALL
                     (PROG2 (LETT #1# |returnType| . #2#)
                         (QCDR #1#)
                       (|check_union2| (QEQCAR #1# 0) (|FortranScalarType|)
                                       (|Union|
                                        (|:| |fst| (|FortranScalarType|))
                                        (|:| |void| "void"))
                                       #1#))
                     (QREFELT $ 104))
                    (QREFELT $ 16))
                   . #2#)
             (LETT |asp| (LIST |s| " FUNCTION ") . #2#)
             (EXIT
              (SPADCALL (LETT |l| (- -10 (QCSIZE |s|)) . #2#)
                        (QREFELT $ 99))))))
          (LETT |lines|
                (SPADCALL
                 (CONS #'|FCTOOL;fortFormatHead;SULV;57!0|
                       (VECTOR $ |args| |asp| |name|))
                 (QREFELT $ 93))
                . #2#)
          (SPADCALL |lines| (QREFELT $ 102))
          (EXIT (SPADCALL (- |l|) (QREFELT $ 99)))))) 

(SDEFUN |FCTOOL;fortFormatHead;SULV;57!0| (($$ NIL))
        (PROG (|name| |asp| |args| $)
          (LETT |name| (QREFELT $$ 3) . #1=(|FCTOOL;fortFormatHead;SULV;57|))
          (LETT |asp| (QREFELT $$ 2) . #1#)
          (LETT |args| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FCTOOL;fortFormatHead1| |name| |asp| |args| $))))) 

(SDEFUN |FCTOOL;addCommas| ((|l| |List| (|String|)) ($ |List| (|String|)))
        (SPROG ((|r| (|List| (|String|))) (#1=#:G569 NIL) (|e| NIL))
               (SEQ
                (COND ((NULL |l|) |l|)
                      ('T
                       (SEQ
                        (LETT |r| (LIST (|SPADfirst| |l|))
                              . #2=(|FCTOOL;addCommas|))
                        (SEQ (LETT |e| NIL . #2#) (LETT #1# (CDR |l|) . #2#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |e| (CAR #1#) . #2#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |r| (CONS |e| (CONS "," |r|)) . #2#)))
                             (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT (NREVERSE |r|)))))))) 

(SDEFUN |FCTOOL;nameLen| ((|n| |List| (|String|)) ($ |Integer|))
        (SPROG
         ((#1=#:G571 NIL) (#2=#:G570 #3=(|Integer|)) (#4=#:G572 #3#)
          (#5=#:G574 NIL) (|u| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|FCTOOL;nameLen|))
           (SEQ (LETT |u| NIL . #6#) (LETT #5# |n| . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |u| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (+ 1 (QCSIZE |u|)) . #6#)
                   (COND (#1# (LETT #2# (+ #2# #4#) . #6#))
                         ('T
                          (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T 0)))))) 

(SDEFUN |FCTOOL;fortFormatTypeLines;SLV;60|
        ((|typeName| |String|) (|l| |List| (|String|)) ($ |Void|))
        (SPROG ((|l1| (|List| (|String|))))
               (SEQ
                (LETT |l1|
                      (CONS |typeName| (CONS " " (|FCTOOL;addCommas| |l| $)))
                      |FCTOOL;fortFormatTypeLines;SLV;60|)
                (EXIT
                 (SPADCALL (SPADCALL |l1| (QREFELT $ 87)) (QREFELT $ 101)))))) 

(SDEFUN |FCTOOL;fortFormatTypes1|
        ((|typeName| |String|) (|names| |List| (|String|)) ($ |Void|))
        (SPROG ((|n| (|List| (|String|))) (|ln| (|Integer|)) (|l| (|Integer|)))
               (SEQ
                (LETT |l|
                      (- (- |$maximumFortranExpressionLength| 1)
                         (QCSIZE |typeName|))
                      . #1=(|FCTOOL;fortFormatTypes1|))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL (|FCTOOL;nameLen| |names| $) |l|
                                  (QREFELT $ 35)))
                       (GO G191)))
                     (SEQ (LETT |n| NIL . #1#) (LETT |ln| 0 . #1#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (<
                                   (LETT |ln|
                                         (+
                                          (+ |ln|
                                             (QCSIZE (|SPADfirst| |names|)))
                                          1)
                                         . #1#)
                                   |l|))
                                 (GO G191)))
                               (SEQ
                                (LETT |n| (CONS (|SPADfirst| |names|) |n|)
                                      . #1#)
                                (EXIT (LETT |names| (CDR |names|) . #1#)))
                               NIL (GO G190) G191 (EXIT NIL))
                          (EXIT (SPADCALL |typeName| |n| (QREFELT $ 107))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |typeName| |names| (QREFELT $ 107)))))) 

(SDEFUN |FCTOOL;par2string2| ((|u| |List| (|OutputForm|)) ($ |String|))
        (SPROG
         ((|l| (|List| (|String|))) (|ll| (|List| (|List| (|String|))))
          (#1=#:G587 NIL) (|v| NIL) (#2=#:G586 NIL))
         (SEQ
          (LETT |ll|
                (PROGN
                 (LETT #2# NIL . #3=(|FCTOOL;par2string2|))
                 (SEQ (LETT |v| NIL . #3#) (LETT #1# (CDR |u|) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (CONS "," (SPADCALL |v| (QREFELT $ 97)))
                                    #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (LETT |l|
                (SPADCALL (CDR (SPADCALL |ll| (QREFELT $ 108))) ")"
                          (QREFELT $ 109))
                . #3#)
          (EXIT
           (SPADCALL (APPEND (LIST (STRINGIMAGE (|SPADfirst| |u|)) "(") |l|)
                     (QREFELT $ 60)))))) 

(SDEFUN |FCTOOL;unravel_par| ((|u| |OutputForm|) ($ |OutputForm|))
        (SEQ
         (COND ((SPADCALL |u| (QREFELT $ 27)) |u|)
               ('T
                (SEQ
                 (LETT |u| (|SPADfirst| (SPADCALL |u| (QREFELT $ 30)))
                       |FCTOOL;unravel_par|)
                 (EXIT (CDR |u|))))))) 

(SDEFUN |FCTOOL;par2string| ((|u| |OutputForm|) ($ |String|))
        (COND ((SPADCALL |u| (QREFELT $ 27)) (STRINGIMAGE |u|))
              ('T (|FCTOOL;par2string2| (|FCTOOL;unravel_par| |u| $) $)))) 

(SDEFUN |FCTOOL;mkParameterList|
        ((|l| |List| (|OutputForm|)) ($ |List| (|String|)))
        (SPROG ((#1=#:G596 NIL) (|u| NIL) (#2=#:G595 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FCTOOL;mkParameterList|))
                 (SEQ (LETT |u| NIL . #3#) (LETT #1# |l| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|FCTOOL;par2string| |u| $) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FCTOOL;mkParameterList2|
        ((|l| |List| (|List| (|OutputForm|))) ($ |List| (|String|)))
        (SPROG ((#1=#:G600 NIL) (|u| NIL) (#2=#:G599 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|FCTOOL;mkParameterList2|))
                 (SEQ (LETT |u| NIL . #3#) (LETT #1# |l| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|FCTOOL;par2string2| |u| $) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |FCTOOL;mkCharName| ((|v| |Integer|) ($ |String|))
        (STRCONC "CHARACTER*(" (STRCONC (STRINGIMAGE |v|) ")"))) 

(SDEFUN |FCTOOL;insertEntry|
        ((|m| |Integer|) (|n| |OutputForm|)
         (|Tabl| |AssociationList| (|Integer|) (|List| (|OutputForm|)))
         ($ |Void|))
        (SPROG ((|u| (|Union| (|List| (|OutputForm|)) "failed")))
               (SEQ
                (LETT |u| (SPADCALL |m| |Tabl| (QREFELT $ 112))
                      |FCTOOL;insertEntry|)
                (EXIT
                 (COND
                  ((QEQCAR |u| 1)
                   (SPADCALL |Tabl| |m| (LIST |n|) (QREFELT $ 113)))
                  ('T
                   (SPADCALL |Tabl| |m| (CONS |n| (QCDR |u|))
                             (QREFELT $ 113)))))))) 

(SDEFUN |FCTOOL;fortFormatCharacterTypes|
        ((|names| |List| (|OutputForm|)) ($ |Void|))
        (SPROG
         ((#1=#:G616 NIL) (|u2| NIL)
          (|genuineArrays| (|List| (|List| (|OutputForm|))))
          (|u1| (|List| (|OutputForm|))) (#2=#:G615 NIL) (|u| NIL)
          (|sortedByLength|
           (|AssociationList| (|Integer|) (|List| (|OutputForm|)))))
         (SEQ
          (LETT |sortedByLength| (SPADCALL (QREFELT $ 114))
                . #3=(|FCTOOL;fortFormatCharacterTypes|))
          (LETT |genuineArrays| NIL . #3#)
          (SEQ (LETT |u| NIL . #3#) (LETT #2# |names| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |u| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL |u| (QREFELT $ 27))
                   (|FCTOOL;insertEntry| 0 |u| |sortedByLength| $))
                  ('T
                   (SEQ (LETT |u1| |u| . #3#)
                        (EXIT
                         (COND
                          ((EQL (LENGTH |u1|) 2)
                           (|FCTOOL;insertEntry| (SPADCALL |u1| (QREFELT $ 41))
                            (|SPADfirst| |u1|) |sortedByLength| $))
                          ('T
                           (LETT |genuineArrays| (CONS |u1| |genuineArrays|)
                                 . #3#)))))))))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |u2| NIL . #3#)
               (LETT #1# (SPADCALL |sortedByLength| (QREFELT $ 117)) . #3#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |u2| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (|FCTOOL;fortFormatTypes1| (|FCTOOL;mkCharName| (QCAR |u2|) $)
                  (|FCTOOL;mkParameterList| (QCDR |u2|) $) $)))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((NULL (NULL |genuineArrays|))
             (|FCTOOL;fortFormatTypes1| "CHARACTER"
              (|FCTOOL;mkParameterList2| |genuineArrays| $) $))))))) 

(SDEFUN |FCTOOL;fort_format_types1|
        ((|typeName| |String|) (|names| |List| (|OutputForm|)) ($ |Void|))
        (SPROG ((#1=#:G620 NIL) (|u| NIL) (#2=#:G619 NIL))
               (SEQ
                (COND
                 ((EQUAL |typeName| "CHARACTER")
                  (|FCTOOL;fortFormatCharacterTypes|
                   (PROGN
                    (LETT #2# NIL . #3=(|FCTOOL;fort_format_types1|))
                    (SEQ (LETT |u| NIL . #3#) (LETT #1# |names| . #3#) G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #2# (CONS (|FCTOOL;unravel_par| |u| $) #2#)
                                 . #3#)))
                         (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   $))
                 ('T
                  (|FCTOOL;fortFormatTypes1| |typeName|
                   (|FCTOOL;mkParameterList| |names| $) $)))))) 

(SDEFUN |FCTOOL;fort_format_types;SLV;71|
        ((|typeName| |String|) (|names| |List| (|OutputForm|)) ($ |Void|))
        (SPROG NIL
               (COND ((NULL |names|) (SPADCALL (QREFELT $ 118)))
                     ('T
                      (SPADCALL
                       (CONS #'|FCTOOL;fort_format_types;SLV;71!0|
                             (VECTOR |names| $ |typeName|))
                       (QREFELT $ 89)))))) 

(SDEFUN |FCTOOL;fort_format_types;SLV;71!0| (($$ NIL))
        (PROG (|typeName| $ |names|)
          (LETT |typeName| (QREFELT $$ 2)
                . #1=(|FCTOOL;fort_format_types;SLV;71|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |names| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (|FCTOOL;fort_format_types1| (SPADCALL |typeName| (QREFELT $ 16))
             |names| $))))) 

(DECLAIM (NOTINLINE |FortranCodeTools;|)) 

(DEFUN |FortranCodeTools| ()
  (SPROG NIL
         (PROG (#1=#:G625)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FortranCodeTools|)
                    . #2=(|FortranCodeTools|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FortranCodeTools|
                             (LIST (CONS NIL (CONS 1 (|FortranCodeTools;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|FortranCodeTools|)))))))))) 

(DEFUN |FortranCodeTools;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FortranCodeTools|) . #1=(|FortranCodeTools|))
          (LETT $ (GETREFV 120) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FortranCodeTools| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 17 (LIST #2="-" "~"))
          (QSETREFV $ 18 '(700 50))
          (QSETREFV $ 19
                    (LIST "|" "**" "/" ".LT." ".GT." ".EQ." ".LE." ".GE."
                          ".AND." ".OR."))
          (QSETREFV $ 20 (LIST 0 900 800 400 400 400 400 400 800 70 90))
          (QSETREFV $ 21 (LIST #2# "+" "*" "," " " "ROW" ""))
          (QSETREFV $ 22 (LIST 700 700 800 110 0 0 0))
          (QSETREFV $ 23 (APPEND (QREFELT $ 19) (QREFELT $ 21)))
          (QSETREFV $ 46 (SPADCALL '= (QREFELT $ 45)))
          (QSETREFV $ 49 NIL)
          (QSETREFV $ 50 NIL)
          (QSETREFV $ 57
                    (LIST (VECTOR '|abs| 'ABS 'DABS)
                          (VECTOR '|acos| 'ACOS 'DACOS)
                          (VECTOR '|asin| 'ASIN 'DASIN)
                          (VECTOR '|atan| 'ATAN 'DATAN)
                          (VECTOR '|cos| 'COS 'DCOS)
                          (VECTOR '|cosh| 'COSH 'DCOSH)
                          (VECTOR '|cot| 'COTAN 'DCOTAN)
                          (VECTOR '|erf| 'ERF 'DERF) (VECTOR '|exp| 'EXP 'DEXP)
                          (VECTOR '|log| 'LOG 'DLOG)
                          (VECTOR '|log10| 'LOG10 'DLOG10)
                          (VECTOR '|sin| 'SIN 'DSIN)
                          (VECTOR '|sinh| 'SINH 'DSINH)
                          (VECTOR '|sqrt| 'SQRT 'DSQRT)
                          (VECTOR '|tan| 'TAN 'DTAN)
                          (VECTOR '|tanh| 'TANH 'DTANH)))
          (QSETREFV $ 58
                    (LIST (CONS '< '.LT.) (CONS '> '.GT.) (CONS '<= '.LE.)
                          (CONS '>= '.GE.) (CONS 'EQ '.EQ.)
                          (CONS '|and| '.AND.) (CONS '|or| '.OR.)
                          (CONS '~ '.NOT.)))
          (QSETREFV $ 65
                    '(BRACKET BRACE SUB AGGLST SUPERSUB MATRIX SEGMENT
                      ALTSUPERSUB PAREN CONCAT CONCATB QUOTE STRING SIGMA STEP
                      IN SIGMA2 INTSIGN PI PI2))
          (QSETREFV $ 66 (SPADCALL '** (QREFELT $ 45)))
          (QSETREFV $ 80 6)
          $))) 

(MAKEPROP '|FortranCodeTools| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|String|) (|Symbol|) (0 . |coerce|)
              (|FortranScalarType|) (5 . |coerce|) (|FortranType|)
              (10 . |coerce|) (|TheSymbolTable|) (15 . |declare!|)
              |FCTOOL;newFortranTempVar;S;1| |FCTOOL;checkType;2S;2|
              '|unaryOps| '|unaryPrecs| '|binaryOps| '|binaryPrecs| '|naryOps|
              '|naryPrecs| '|nonUnaryOps| (|Boolean|) (|OutputForm|)
              (|OutputFormTools|) (21 . |atom?|) (26 . |operator|) (|List| 25)
              (31 . |arguments|) (|Integer|) (36 . |elt|) (|List| 6)
              (42 . |position|) (48 . >) (|List| 31) (54 . |elt|) (60 . <=)
              (|NonNegativeInteger|) (66 . ~=) (72 . |second|) (77 . |member?|)
              (83 . |symbol?|) (88 . |symbol|) (93 . |outputForm|) '|ass_form|
              (|List| $) (98 . |elt|) '|exprStack| '|used_intrinsics| (|Void|)
              |FCTOOL;clear_used_intrinsics;V;23| (104 . |string|)
              |FCTOOL;get_used_intrinsics;L;24| (|List| 7) (109 . |member?|)
              '|fort_intrinsics| '|fort_ops| (115 . |string|) (120 . |concat|)
              (125 . |message|) (130 . |integer?|) (135 . |integer|)
              (140 . |outputForm|) '|specialOps| '|pow_form| (|Character|)
              (145 . |elt|) (151 . |char|) (156 . |remove|) (162 . |position|)
              (168 . ~=) (174 . |setelt!|) (181 . |coerce|) (186 . |string?|)
              (|UniversalSegment| 31) (191 . SEGMENT) (196 . |elt|) (202 . >)
              '|fort_indent| |FCTOOL;get_fort_indent;I;38| (|PositiveInteger|)
              (208 . *) |FCTOOL;indentFortLevel;IV;39| (214 . SEGMENT)
              (220 . ~=) |FCTOOL;fort_clean_lines;2L;42| (|Mapping| 51)
              |FCTOOL;do_with_error_env3;MV;43| (|Mapping| 33)
              |FCTOOL;do_with_error_env2;BML;44|
              |FCTOOL;do_with_error_env0;ML;45|
              |FCTOOL;do_with_error_env1;ML;46| (226 . |precondition|)
              (|Mapping| 7) |FCTOOL;expression2Fortran1;MOfBL;48|
              |FCTOOL;statement2Fortran;OfL;49|
              |FCTOOL;expression2Fortran;OfL;50|
              |FCTOOL;changeExprLength;IV;51| |FCTOOL;getStatement;OfBL;52|
              |FCTOOL;displayLines;LV;53| |FCTOOL;displayLines1;LV;54|
              |FCTOOL;dispStatement;OfV;55| (231 . |coerce|)
              (|Union| (|:| |fst| 9) (|:| |void| '"void"))
              |FCTOOL;fortFormatHead;SULV;57|
              |FCTOOL;fortFormatTypeLines;SLV;60| (236 . |concat|)
              (241 . |concat|) (|Union| 29 '"failed") (|AssociationList| 31 29)
              (247 . |search|) (253 . |setelt!|) (260 . |empty|)
              (|Record| (|:| |key| 31) (|:| |entry| 29)) (|List| 115)
              (264 . |entries|) (269 . |void|)
              |FCTOOL;fort_format_types;SLV;71|)
           '#(|statement2Fortran| 273 |newFortranTempVar| 278 |indentFortLevel|
              282 |get_used_intrinsics| 287 |get_fort_indent| 291
              |getStatement| 295 |fort_format_types| 301 |fort_clean_lines| 307
              |fortFormatTypeLines| 312 |fortFormatHead| 318
              |expression2Fortran1| 325 |expression2Fortran| 332
              |do_with_error_env3| 337 |do_with_error_env2| 342
              |do_with_error_env1| 348 |do_with_error_env0| 353 |displayLines1|
              358 |displayLines| 363 |dispStatement| 368
              |clear_used_intrinsics| 373 |checkType| 377 |changeExprLength|
              382)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 119
                                                 '(1 7 0 6 8 1 9 0 7 10 1 11 0
                                                   9 12 2 13 11 7 11 14 1 26 24
                                                   25 27 1 26 25 25 28 1 26 29
                                                   25 30 2 29 25 0 31 32 2 33
                                                   31 6 0 34 2 31 24 0 0 35 2
                                                   36 31 0 31 37 2 31 24 0 0 38
                                                   2 39 24 0 0 40 1 29 25 0 41
                                                   2 33 24 6 0 42 1 26 24 25 43
                                                   1 26 7 25 44 1 25 0 7 45 2
                                                   25 0 0 47 48 1 7 6 0 53 2 55
                                                   24 7 0 56 1 26 6 25 59 1 6 0
                                                   47 60 1 25 0 6 61 1 26 24 25
                                                   62 1 26 31 25 63 1 25 0 31
                                                   64 2 6 67 0 31 68 1 67 0 6
                                                   69 2 6 0 67 0 70 2 6 31 67 0
                                                   71 2 7 24 0 0 72 3 6 67 0 31
                                                   67 73 1 7 25 0 74 1 26 24 25
                                                   75 1 76 0 31 77 2 6 0 0 76
                                                   78 2 39 24 0 0 79 2 31 0 82
                                                   0 83 2 76 0 31 31 85 2 6 24
                                                   0 0 86 1 26 25 25 94 1 9 6 0
                                                   104 1 33 0 47 108 2 33 0 0 6
                                                   109 2 111 110 31 0 112 3 111
                                                   29 0 31 29 113 0 111 0 114 1
                                                   111 116 0 117 0 51 0 118 1 0
                                                   33 25 97 0 0 7 15 1 0 51 31
                                                   84 0 0 33 54 0 0 31 81 2 0
                                                   33 25 24 100 2 0 51 6 29 119
                                                   1 0 33 33 87 2 0 51 6 33 107
                                                   3 0 51 7 105 55 106 3 0 33
                                                   95 25 24 96 1 0 33 25 98 1 0
                                                   51 88 89 2 0 33 24 90 91 1 0
                                                   33 90 93 1 0 33 90 92 1 0 51
                                                   33 102 1 0 51 33 101 1 0 51
                                                   25 103 0 0 51 52 1 0 6 6 16
                                                   1 0 51 31 99)))))
           '|lookupComplete|)) 

(MAKEPROP '|FortranCodeTools| 'NILADIC T) 
