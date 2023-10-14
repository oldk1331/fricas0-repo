
(SDEFUN |TEX;new;$;1| (($ $)) (VECTOR (LIST "$$") (LIST "") (LIST "$$"))) 

(SDEFUN |TEX;newWithNum| ((|stepNum| |Integer|) ($ $))
        (SPROG ((|num| (|String|)))
               (SEQ
                (LETT |num|
                      (STRCONC (STRCONC "\\leqno(" (STRINGIMAGE |stepNum|))
                               ")")
                      |TEX;newWithNum|)
                (EXIT (VECTOR (LIST "$$") (LIST "") (LIST |num| "$$")))))) 

(SDEFUN |TEX;coerce;Of$;3| ((|expr| |OutputForm|) ($ $))
        (SPROG ((|f| ($)))
               (SEQ (LETT |f| (SPADCALL (QREFELT $ 22)) |TEX;coerce;Of$;3|)
                    (QSETVELT |f| 1
                              (LIST
                               (|TEX;postcondition|
                                (|TEX;formatExpr| (|TEX;precondition| |expr| $)
                                 (QREFELT $ 9) $)
                                $)))
                    (EXIT |f|)))) 

(SDEFUN |TEX;convert;OfI$;4|
        ((|expr| |OutputForm|) (|stepNum| |Integer|) ($ $))
        (SPROG ((|f| ($)))
               (SEQ
                (LETT |f| (|TEX;newWithNum| |stepNum| $) |TEX;convert;OfI$;4|)
                (QSETVELT |f| 1
                          (LIST
                           (|TEX;postcondition|
                            (|TEX;formatExpr| (|TEX;precondition| |expr| $)
                             (QREFELT $ 9) $)
                            $)))
                (EXIT |f|)))) 

(PUT '|TEX;sayExpr| '|SPADreplace| '|sayTeX|) 

(SDEFUN |TEX;sayExpr| ((|s| |String|) ($ |Void|)) (|sayTeX| |s|)) 

(SDEFUN |TEX;display;$IV;6| ((|f| $) (|len| |Integer|) ($ |Void|))
        (SPROG
         ((#1=#:G212 NIL) (|s| NIL) (#2=#:G211 NIL) (|t| NIL) (#3=#:G210 NIL)
          (#4=#:G209 NIL))
         (SEQ
          (SEQ (LETT |s| NIL . #5=(|TEX;display;$IV;6|))
               (LETT #4# (QVELT |f| 0) . #5#) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |s| (CAR #4#) . #5#) NIL))
                 (GO G191)))
               (SEQ (EXIT (|TEX;sayExpr| |s| $))) (LETT #4# (CDR #4#) . #5#)
               (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |s| NIL . #5#) (LETT #3# (QVELT |f| 1) . #5#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |s| (CAR #3#) . #5#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |t| NIL . #5#)
                      (LETT #2# (|TEX;splitLong| |s| |len| $) . #5#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #5#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (|TEX;sayExpr| |t| $)))
                      (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))))
               (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |s| NIL . #5#) (LETT #1# (QVELT |f| 2) . #5#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #5#) NIL))
                 (GO G191)))
               (SEQ (EXIT (|TEX;sayExpr| |s| $))) (LETT #1# (CDR #1#) . #5#)
               (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (QREFELT $ 28)))))) 

(SDEFUN |TEX;display;$V;7| ((|f| $) ($ |Void|))
        (SPADCALL |f| $LINELENGTH (QREFELT $ 29))) 

(PUT '|TEX;prologue;$L;8| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 0))) 

(SDEFUN |TEX;prologue;$L;8| ((|f| $) ($ |List| (|String|))) (QVELT |f| 0)) 

(PUT '|TEX;tex;$L;9| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 1))) 

(SDEFUN |TEX;tex;$L;9| ((|f| $) ($ |List| (|String|))) (QVELT |f| 1)) 

(PUT '|TEX;epilogue;$L;10| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 2))) 

(SDEFUN |TEX;epilogue;$L;10| ((|f| $) ($ |List| (|String|))) (QVELT |f| 2)) 

(PUT '|TEX;setPrologue!;$2L;11| '|SPADreplace|
     '(XLAM (|f| |l|) (QSETVELT |f| 0 |l|))) 

(SDEFUN |TEX;setPrologue!;$2L;11|
        ((|f| $) (|l| |List| (|String|)) ($ |List| (|String|)))
        (QSETVELT |f| 0 |l|)) 

(PUT '|TEX;setTex!;$2L;12| '|SPADreplace|
     '(XLAM (|f| |l|) (QSETVELT |f| 1 |l|))) 

(SDEFUN |TEX;setTex!;$2L;12|
        ((|f| $) (|l| |List| (|String|)) ($ |List| (|String|)))
        (QSETVELT |f| 1 |l|)) 

(PUT '|TEX;setEpilogue!;$2L;13| '|SPADreplace|
     '(XLAM (|f| |l|) (QSETVELT |f| 2 |l|))) 

(SDEFUN |TEX;setEpilogue!;$2L;13|
        ((|f| $) (|l| |List| (|String|)) ($ |List| (|String|)))
        (QSETVELT |f| 2 |l|)) 

(SDEFUN |TEX;coerce;$Of;14| ((|f| $) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|String|))) (#1=#:G229 NIL) (|s| NIL) (#2=#:G228 NIL)
          (|t| NIL) (#3=#:G227 NIL) (#4=#:G226 NIL))
         (SEQ (LETT |l| NIL . #5=(|TEX;coerce;$Of;14|))
              (SEQ (LETT |s| NIL . #5#) (LETT #4# (QVELT |f| 0) . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |s| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT |l| (CONS |s| |l|) . #5#)))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |s| NIL . #5#) (LETT #3# (QVELT |f| 1) . #5#) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |s| (CAR #3#) . #5#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |t| NIL . #5#)
                          (LETT #2# (|TEX;splitLong| |s| (- $LINELENGTH 4) $)
                                . #5#)
                          G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |t| (CAR #2#) . #5#) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT |l| (CONS |t| |l|) . #5#)))
                          (LETT #2# (CDR #2#) . #5#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |s| NIL . #5#) (LETT #1# (QVELT |f| 2) . #5#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT |l| (CONS |s| |l|) . #5#)))
                   (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (REVERSE |l|) (QREFELT $ 38)))))) 

(SDEFUN |TEX;ungroup| ((|str| |String|) ($ |String|))
        (SPROG
         ((|u| (|UniversalSegment| (|Integer|))) (|rbrace| #1=(|Character|))
          (|lbrace| #1#) (|len| (|Integer|)))
         (SEQ (LETT |len| (QCSIZE |str|) . #2=(|TEX;ungroup|))
              (EXIT
               (COND ((< |len| 2) |str|)
                     ('T
                      (SEQ (LETT |lbrace| (|STR_to_CHAR| "{") . #2#)
                           (LETT |rbrace| (|STR_to_CHAR| "}") . #2#)
                           (COND
                            ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 42))
                                       |lbrace|)
                             (COND
                              ((|eql_SI| (SPADCALL |str| |len| (QREFELT $ 42))
                                         |rbrace|)
                               (SEQ
                                (LETT |u|
                                      (SPADCALL 2 (- |len| 1) (QREFELT $ 44))
                                      . #2#)
                                (EXIT
                                 (LETT |str|
                                       (SPADCALL |str| |u| (QREFELT $ 45))
                                       . #2#)))))))
                           (EXIT |str|)))))))) 

(SDEFUN |TEX;postcondition| ((|str| |String|) ($ |String|))
        (SPROG
         ((#1=#:G242 NIL) (|i| NIL) (|minus| #2=(|Character|)) (|plus| #2#)
          (|len| (|Integer|)))
         (SEQ (LETT |str| (|TEX;ungroup| |str| $) . #3=(|TEX;postcondition|))
              (LETT |len| (QCSIZE |str|) . #3#)
              (LETT |plus| (|STR_to_CHAR| "+") . #3#)
              (LETT |minus| (|STR_to_CHAR| "-") . #3#)
              (EXIT
               (COND ((< |len| 4) |str|)
                     ('T
                      (SEQ
                       (SEQ (LETT |i| 1 . #3#) (LETT #1# (- |len| 1) . #3#)
                            G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((|eql_SI| (SPADCALL |str| |i| (QREFELT $ 42))
                                          |plus|)
                                (COND
                                 ((|eql_SI|
                                   (SPADCALL |str| (+ |i| 1) (QREFELT $ 42))
                                   |minus|)
                                  (SPADCALL |str| |i| (|STR_to_CHAR| " ")
                                            (QREFELT $ 46))))))))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |str|)))))))) 

(PUT '|TEX;stringify| '|SPADreplace| '|mathObject2String|) 

(SDEFUN |TEX;stringify| ((|expr| |OutputForm|) ($ |String|))
        (|mathObject2String| |expr|)) 

(SDEFUN |TEX;lineConcat|
        ((|line| |String|) (|lines| |List| (|String|)) ($ |List| (|String|)))
        (SPROG ((|length| (|NonNegativeInteger|)))
               (SEQ (LETT |length| (QCSIZE |line|) . #1=(|TEX;lineConcat|))
                    (COND
                     ((SPADCALL |length| 0 (QREFELT $ 49))
                      (SEQ
                       (COND
                        ((|eql_SI| (SPADCALL |line| |length| (QREFELT $ 42))
                                   (|STR_to_CHAR| "\\"))
                         (LETT |line| (STRCONC |line| " ") . #1#)))
                       (COND
                        ((|eql_SI| (SPADCALL |line| 1 (QREFELT $ 42))
                                   (|STR_to_CHAR| "%"))
                         (LETT |line| (STRCONC " \\" |line|) . #1#))
                        ((|eql_SI| (SPADCALL |line| 1 (QREFELT $ 42))
                                   (|STR_to_CHAR| "\\"))
                         (COND
                          ((SPADCALL |length| 1 (QREFELT $ 49))
                           (COND
                            ((|eql_SI| (SPADCALL |line| 2 (QREFELT $ 42))
                                       (|STR_to_CHAR| "%"))
                             (LETT |line| (STRCONC " " |line|) . #1#)))))))
                       (EXIT (LETT |lines| (CONS |line| |lines|) . #1#)))))
                    (EXIT |lines|)))) 

(SDEFUN |TEX;splitLong|
        ((|str| |String|) (|len| |Integer|) ($ |List| (|String|)))
        (SEQ (COND ((< |len| 20) (LETT |len| $LINELENGTH |TEX;splitLong|)))
             (EXIT (|TEX;splitLong1| |str| |len| $)))) 

(SDEFUN |TEX;splitLong1|
        ((|str| |String|) (|len| |Integer|) ($ |List| (|String|)))
        (SPROG
         ((|l| (|List| (|String|))) (|s| (|String|)) (|ls| (|Integer|))
          (|ownLine| (|Boolean|)) (|u| (|UniversalSegment| (|Integer|)))
          (|lss| (|Integer|)) (#1=#:G272 NIL) (|ss| NIL))
         (SEQ (LETT |l| NIL . #2=(|TEX;splitLong1|)) (LETT |s| "" . #2#)
              (LETT |ls| 0 . #2#)
              (SEQ (LETT |ss| NIL . #2#)
                   (LETT #1#
                         (SPADCALL |str| (|STR_to_CHAR| " ") (QREFELT $ 51))
                         . #2#)
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ss| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQUAL |ss| "\\\\")
                       (SEQ
                        (LETT |l| (|TEX;lineConcat| (STRCONC |s| |ss|) |l| $)
                              . #2#)
                        (LETT |s| "" . #2#) (EXIT (LETT |ls| 0 . #2#))))
                      ('T
                       (SEQ (LETT |lss| (QCSIZE |ss|) . #2#)
                            (LETT |ownLine|
                                  (SEQ
                                   (LETT |u| (SPADCALL 1 4 (QREFELT $ 44))
                                         . #2#)
                                   (COND
                                    ((SPADCALL |lss| 3 (QREFELT $ 52))
                                     (COND
                                      ((EQUAL "\\end"
                                              (SPADCALL |ss| |u|
                                                        (QREFELT $ 45)))
                                       (EXIT 'T)))))
                                   (LETT |u| (SPADCALL 1 5 (QREFELT $ 44))
                                         . #2#)
                                   (COND
                                    ((SPADCALL |lss| 4 (QREFELT $ 52))
                                     (COND
                                      ((EQUAL "\\left"
                                              (SPADCALL |ss| |u|
                                                        (QREFELT $ 45)))
                                       (EXIT 'T)))))
                                   (LETT |u| (SPADCALL 1 6 (QREFELT $ 44))
                                         . #2#)
                                   (COND
                                    ((SPADCALL |lss| 5 (QREFELT $ 52))
                                     (COND
                                      ((OR
                                        (EQUAL "\\right"
                                               (SPADCALL |ss| |u|
                                                         (QREFELT $ 45)))
                                        (EQUAL "\\begin"
                                               (SPADCALL |ss| |u|
                                                         (QREFELT $ 45))))
                                       (EXIT 'T)))))
                                   (EXIT 'NIL))
                                  . #2#)
                            (COND
                             ((OR |ownLine|
                                  (SPADCALL (+ |ls| |lss|) |len|
                                            (QREFELT $ 52)))
                              (SEQ
                               (COND
                                ((NULL (SPADCALL |s| (QREFELT $ 53)))
                                 (LETT |l| (|TEX;lineConcat| |s| |l| $)
                                       . #2#)))
                               (LETT |s| "" . #2#)
                               (EXIT (LETT |ls| 0 . #2#)))))
                            (COND
                             ((OR |ownLine|
                                  (SPADCALL |lss| |len| (QREFELT $ 52)))
                              (EXIT
                               (LETT |l| (|TEX;lineConcat| |ss| |l| $)
                                     . #2#))))
                            (COND
                             ((EQL |lss| 1)
                              (COND
                               ((|eql_SI| (SPADCALL |ss| 1 (QREFELT $ 42))
                                          (|STR_to_CHAR| "\\"))
                                (EXIT
                                 (SEQ (LETT |ls| (+ (+ |ls| |lss|) 2) . #2#)
                                      (EXIT
                                       (LETT |s|
                                             (STRCONC |s| (STRCONC |ss| "  "))
                                             . #2#))))))))
                            (LETT |ls| (+ (+ |ls| |lss|) 1) . #2#)
                            (EXIT
                             (LETT |s| (STRCONC |s| (STRCONC |ss| " "))
                                   . #2#)))))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL |ls| 0 (QREFELT $ 52))
                (LETT |l| (|TEX;lineConcat| |s| |l| $) . #2#)))
              (EXIT (REVERSE |l|))))) 

(SDEFUN |TEX;group| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "{" |str| "}") (QREFELT $ 54))) 

(SDEFUN |TEX;addBraces| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "\\left\\{ " |str| " \\right\\}") (QREFELT $ 54))) 

(SDEFUN |TEX;addBrackets| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "\\left[ " |str| " \\right]") (QREFELT $ 54))) 

(SDEFUN |TEX;parenthesize| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "\\left( " |str| " \\right)") (QREFELT $ 54))) 

(PUT '|TEX;precondition| '|SPADreplace| '|outputTran|) 

(SDEFUN |TEX;precondition| ((|expr| |OutputForm|) ($ |OutputForm|))
        (|outputTran| |expr|)) 

(SDEFUN |TEX;formatSpecial|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG
         ((|tmp| (|String|)) (|prescript| (|Boolean|))
          (|form| (|List| (|String|))) (#1=#:G326 NIL) (|u| NIL)
          (#2=#:G325 NIL))
         (SEQ (LETT |prescript| 'NIL . #3=(|TEX;formatSpecial|))
              (EXIT
               (COND ((EQUAL |op| '|theMap|) "\\mbox{theMap(...)}")
                     ((EQUAL |op| 'AGGLST)
                      (|TEX;formatNary| '|,| "" 0 |args| |prec| $))
                     ((EQUAL |op| 'AGGSET)
                      (|TEX;formatNary| '|;| "" 0 |args| |prec| $))
                     ((EQUAL |op| 'TAG)
                      (|TEX;group|
                       (SPADCALL
                        (LIST (|TEX;formatExpr| (|SPADfirst| |args|) |prec| $)
                              "\\rightarrow"
                              (|TEX;formatExpr|
                               (SPADCALL |args| (QREFELT $ 56)) |prec| $))
                        (QREFELT $ 54))
                       $))
                     ((EQUAL |op| 'SLASH)
                      (|TEX;group|
                       (SPADCALL
                        (LIST (|TEX;formatExpr| (|SPADfirst| |args|) |prec| $)
                              "/"
                              (|TEX;formatExpr|
                               (SPADCALL |args| (QREFELT $ 56)) |prec| $))
                        (QREFELT $ 54))
                       $))
                     ((EQUAL |op| 'VCONCAT)
                      (|TEX;group|
                       (STRCONC "\\begin{array}{c}"
                                (STRCONC
                                 (SPADCALL
                                  (PROGN
                                   (LETT #2# NIL . #3#)
                                   (SEQ (LETT |u| NIL . #3#)
                                        (LETT #1# |args| . #3#) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |u| (CAR #1#) . #3#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (STRCONC
                                                  (|TEX;formatExpr| |u|
                                                   (QREFELT $ 9) $)
                                                  "\\\\")
                                                 #2#)
                                                . #3#)))
                                        (LETT #1# (CDR #1#) . #3#) (GO G190)
                                        G191 (EXIT (NREVERSE #2#))))
                                  (QREFELT $ 54))
                                 "\\end{array}"))
                       $))
                     ((EQUAL |op| 'CONCATB)
                      (|TEX;formatNary| 'STRSEP " \\ " 0 |args| |prec| $))
                     ((EQUAL |op| 'CONCAT)
                      (|TEX;formatNary| 'STRSEP "" 0 |args| (QREFELT $ 9) $))
                     ((EQUAL |op| 'QUOTE)
                      (|TEX;group|
                       (STRCONC "{\\tt '}"
                                (|TEX;formatExpr| (|SPADfirst| |args|)
                                 (QREFELT $ 9) $))
                       $))
                     ((EQUAL |op| 'BRACKET)
                      (|TEX;group|
                       (|TEX;addBrackets|
                        (|TEX;ungroup|
                         (|TEX;formatExpr| (|SPADfirst| |args|) (QREFELT $ 9)
                          $)
                         $)
                        $)
                       $))
                     ((EQUAL |op| 'BRACE)
                      (|TEX;group|
                       (|TEX;addBraces|
                        (|TEX;ungroup|
                         (|TEX;formatExpr| (|SPADfirst| |args|) (QREFELT $ 9)
                          $)
                         $)
                        $)
                       $))
                     ((EQUAL |op| 'PAREN)
                      (|TEX;group|
                       (|TEX;parenthesize|
                        (|TEX;ungroup|
                         (|TEX;formatExpr| (|SPADfirst| |args|) (QREFELT $ 9)
                          $)
                         $)
                        $)
                       $))
                     ((EQUAL |op| 'PRIME)
                      (|TEX;formatSpecial| 'SUPERSUB
                       (LIST (|SPADfirst| |args|) " "
                             (SPADCALL |args| (QREFELT $ 56)))
                       |prec| $))
                     ((EQUAL |op| 'OVERBAR)
                      (COND ((NULL |args|) "")
                            (#4='T
                             (|TEX;group|
                              (SPADCALL
                               (LIST "\\overline "
                                     (|TEX;formatExpr| (|SPADfirst| |args|)
                                      (QREFELT $ 9) $))
                               (QREFELT $ 54))
                              $))))
                     ((EQUAL |op| 'ROOT)
                      (COND ((NULL |args|) "")
                            (#4#
                             (SEQ
                              (LETT |tmp|
                                    (|TEX;group|
                                     (|TEX;formatExpr| (|SPADfirst| |args|)
                                      (QREFELT $ 9) $)
                                     $)
                                    . #3#)
                              (EXIT
                               (COND
                                ((NULL (CDR |args|))
                                 (|TEX;group|
                                  (SPADCALL (LIST "\\sqrt " |tmp|)
                                            (QREFELT $ 54))
                                  $))
                                (#4#
                                 (|TEX;group|
                                  (SPADCALL
                                   (LIST "\\root "
                                         (|TEX;group|
                                          (|TEX;formatExpr|
                                           (|SPADfirst| (CDR |args|))
                                           (QREFELT $ 9) $)
                                          $)
                                         " \\of " |tmp|)
                                   (QREFELT $ 54))
                                  $))))))))
                     ((EQUAL |op| 'SEGMENT)
                      (SEQ
                       (LETT |tmp|
                             (SPADCALL
                              (LIST
                               (|TEX;formatExpr| (|SPADfirst| |args|)
                                (QREFELT $ 9) $)
                               "..")
                              (QREFELT $ 54))
                             . #3#)
                       (EXIT
                        (|TEX;group|
                         (COND ((NULL (CDR |args|)) |tmp|)
                               (#4#
                                (SPADCALL
                                 (LIST |tmp|
                                       (|TEX;formatExpr|
                                        (|SPADfirst| (CDR |args|))
                                        (QREFELT $ 9) $))
                                 (QREFELT $ 54))))
                         $))))
                     ((EQUAL |op| 'SUB)
                      (|TEX;group|
                       (SPADCALL
                        (LIST
                         (|TEX;formatExpr| (|SPADfirst| |args|) (QREFELT $ 9)
                          $)
                         " \\sb "
                         (|TEX;formatSpecial| 'AGGLST (CDR |args|)
                          (QREFELT $ 9) $))
                        (QREFELT $ 54))
                       $))
                     ((EQUAL |op| 'SUPERSUB)
                      (SEQ
                       (LETT |form|
                             (LIST
                              (|TEX;formatExpr| (|SPADfirst| |args|)
                               (QREFELT $ 9) $))
                             . #3#)
                       (LETT |args| (CDR |args|) . #3#)
                       (EXIT
                        (COND ((NULL |args|) (SPADCALL |form| (QREFELT $ 54)))
                              (#4#
                               (SEQ
                                (LETT |tmp|
                                      (|TEX;formatExpr| (|SPADfirst| |args|)
                                       (QREFELT $ 9) $)
                                      . #3#)
                                (COND
                                 ((SPADCALL |tmp| "" (QREFELT $ 57))
                                  (COND
                                   ((SPADCALL |tmp| "{}" (QREFELT $ 57))
                                    (COND
                                     ((SPADCALL |tmp| " " (QREFELT $ 57))
                                      (LETT |form|
                                            (APPEND |form|
                                                    (LIST " \\sb "
                                                          (|TEX;group| |tmp|
                                                           $)))
                                            . #3#)))))))
                                (LETT |args| (CDR |args|) . #3#)
                                (EXIT
                                 (COND
                                  ((NULL |args|)
                                   (|TEX;group|
                                    (SPADCALL |form| (QREFELT $ 54)) $))
                                  (#4#
                                   (SEQ
                                    (LETT |tmp|
                                          (|TEX;formatExpr|
                                           (|SPADfirst| |args|) (QREFELT $ 9)
                                           $)
                                          . #3#)
                                    (COND
                                     ((SPADCALL |tmp| "" (QREFELT $ 57))
                                      (COND
                                       ((SPADCALL |tmp| "{}" (QREFELT $ 57))
                                        (COND
                                         ((SPADCALL |tmp| " " (QREFELT $ 57))
                                          (LETT |form|
                                                (APPEND |form|
                                                        (LIST " \\sp "
                                                              (|TEX;group|
                                                               |tmp| $)))
                                                . #3#)))))))
                                    (LETT |args| (CDR |args|) . #3#)
                                    (EXIT
                                     (COND
                                      ((NULL |args|)
                                       (|TEX;group|
                                        (SPADCALL |form| (QREFELT $ 54)) $))
                                      (#4#
                                       (SEQ
                                        (LETT |tmp|
                                              (|TEX;formatExpr|
                                               (|SPADfirst| |args|)
                                               (QREFELT $ 9) $)
                                              . #3#)
                                        (COND
                                         ((SPADCALL |tmp| "" (QREFELT $ 57))
                                          (COND
                                           ((SPADCALL |tmp| "{}"
                                                      (QREFELT $ 57))
                                            (COND
                                             ((SPADCALL |tmp| " "
                                                        (QREFELT $ 57))
                                              (SEQ
                                               (LETT |form|
                                                     (APPEND
                                                      (LIST " \\sp "
                                                            (|TEX;group| |tmp|
                                                             $))
                                                      |form|)
                                                     . #3#)
                                               (EXIT
                                                (LETT |prescript| 'T
                                                      . #3#)))))))))
                                        (LETT |args| (CDR |args|) . #3#)
                                        (EXIT
                                         (COND
                                          ((NULL |args|)
                                           (|TEX;group|
                                            (SPADCALL
                                             (COND
                                              (|prescript| (CONS "{}" |form|))
                                              (#4# |form|))
                                             (QREFELT $ 54))
                                            $))
                                          (#4#
                                           (SEQ
                                            (LETT |tmp|
                                                  (|TEX;formatExpr|
                                                   (|SPADfirst| |args|)
                                                   (QREFELT $ 9) $)
                                                  . #3#)
                                            (COND
                                             ((SPADCALL |tmp| ""
                                                        (QREFELT $ 57))
                                              (COND
                                               ((SPADCALL |tmp| "{}"
                                                          (QREFELT $ 57))
                                                (COND
                                                 ((SPADCALL |tmp| " "
                                                            (QREFELT $ 57))
                                                  (SEQ
                                                   (LETT |form|
                                                         (APPEND
                                                          (LIST " \\sb "
                                                                (|TEX;group|
                                                                 |tmp| $))
                                                          |form|)
                                                         . #3#)
                                                   (EXIT
                                                    (LETT |prescript| 'T
                                                          . #3#)))))))))
                                            (EXIT
                                             (|TEX;group|
                                              (SPADCALL
                                               (COND
                                                (|prescript|
                                                 (CONS "{}" |form|))
                                                (#4# |form|))
                                               (QREFELT $ 54))
                                              $))))))))))))))))))))
                     ((EQUAL |op| 'SC)
                      (COND ((NULL |args|) "")
                            (#4#
                             (SEQ
                              (LETT |tmp|
                                    (|TEX;formatNaryNoGroup| 'STRSEP " \\\\ "
                                     800 |args| (QREFELT $ 9) $)
                                    . #3#)
                              (EXIT
                               (|TEX;group|
                                (SPADCALL
                                 (LIST "\\begin{array}{l} " |tmp|
                                       " \\end{array} ")
                                 (QREFELT $ 54))
                                $))))))
                     ((EQUAL |op| 'MATRIX) (|TEX;formatMatrix| (CDR |args|) $))
                     ((EQUAL |op| 'ZAG)
                      (SPADCALL
                       (LIST " \\zag{"
                             (|TEX;formatExpr| (|SPADfirst| |args|)
                              (QREFELT $ 9) $)
                             "}{"
                             (|TEX;formatExpr| (|SPADfirst| (CDR |args|))
                              (QREFELT $ 9) $)
                             "}")
                       (QREFELT $ 54)))
                     (#4#
                      (SPADCALL
                       (LIST "not done yet for "
                             (SPADCALL |op| (QREFELT $ 59)))
                       (QREFELT $ 54)))))))) 

(SDEFUN |TEX;formatPlex|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG
         ((|s| (|String|)) (|hold| (|String|)) (|n| (|Integer|))
          (|opPrec| (|Integer|)) (|p| (|Integer|)))
         (SEQ
          (LETT |p| (SPADCALL |op| (QREFELT $ 17) (QREFELT $ 61))
                . #1=(|TEX;formatPlex|))
          (EXIT
           (COND ((< |p| 1) (|error| "unknown plex op"))
                 (#2='T
                  (SEQ
                   (LETT |opPrec| (SPADCALL (QREFELT $ 18) |p| (QREFELT $ 63))
                         . #1#)
                   (LETT |n| (LENGTH |args|) . #1#)
                   (COND
                    ((SPADCALL |n| 2 (QREFELT $ 64))
                     (COND
                      ((SPADCALL |n| 3 (QREFELT $ 64))
                       (EXIT
                        (|error| "wrong number of arguments for plex"))))))
                   (LETT |s|
                         (COND
                          ((OR (EQUAL |op| 'SIGMA) (EQUAL |op| 'SIGMA2))
                           "\\sum")
                          ((OR (EQUAL |op| 'PI) (EQUAL |op| 'PI2)) "\\prod")
                          ((OR (EQUAL |op| 'INTSIGN)
                               (EQUAL |op| 'INDEFINTEGRAL))
                           "\\int")
                          ('T "????"))
                         . #1#)
                   (LETT |hold|
                         (|TEX;formatExpr| (|SPADfirst| |args|) (QREFELT $ 9)
                          $)
                         . #1#)
                   (LETT |args| (CDR |args|) . #1#)
                   (COND
                    ((SPADCALL |op| 'INDEFINTEGRAL (QREFELT $ 65))
                     (SEQ
                      (COND
                       ((SPADCALL |hold| "" (QREFELT $ 57))
                        (LETT |s|
                              (SPADCALL
                               (LIST |s| " \\sb"
                                     (|TEX;group|
                                      (SPADCALL (LIST "\\displaystyle " |hold|)
                                                (QREFELT $ 54))
                                      $))
                               (QREFELT $ 54))
                              . #1#)))
                      (COND
                       ((NULL (NULL (CDR |args|)))
                        (SEQ
                         (LETT |hold|
                               (|TEX;formatExpr| (|SPADfirst| |args|)
                                (QREFELT $ 9) $)
                               . #1#)
                         (COND
                          ((SPADCALL |hold| "" (QREFELT $ 57))
                           (LETT |s|
                                 (SPADCALL
                                  (LIST |s| " \\sp"
                                        (|TEX;group|
                                         (SPADCALL
                                          (LIST "\\displaystyle " |hold|)
                                          (QREFELT $ 54))
                                         $))
                                  (QREFELT $ 54))
                                 . #1#)))
                         (EXIT (LETT |args| (CDR |args|) . #1#)))))
                      (EXIT
                       (LETT |s|
                             (SPADCALL
                              (LIST |s| " "
                                    (|TEX;formatExpr| (|SPADfirst| |args|)
                                     |opPrec| $))
                              (QREFELT $ 54))
                             . #1#))))
                    (#2#
                     (SEQ
                      (LETT |hold|
                            (|TEX;group|
                             (SPADCALL
                              (LIST |hold| " "
                                    (|TEX;formatExpr| (|SPADfirst| |args|)
                                     (QREFELT $ 9) $))
                              (QREFELT $ 54))
                             $)
                            . #1#)
                      (EXIT
                       (LETT |s|
                             (SPADCALL (LIST |s| " " |hold|) (QREFELT $ 54))
                             . #1#)))))
                   (COND
                    ((< |opPrec| |prec|)
                     (LETT |s| (|TEX;parenthesize| |s| $) . #1#)))
                   (EXIT (|TEX;group| |s| $))))))))) 

(SDEFUN |TEX;formatMatrix| ((|args| |List| (|OutputForm|)) ($ |String|))
        (SPROG ((|cols| (|String|)) (#1=#:G349 NIL) (|i| NIL))
               (SEQ (LETT |cols| "{" . #2=(|TEX;formatMatrix|))
                    (SEQ (LETT |i| 2 . #2#)
                         (LETT #1# (LENGTH (|SPADfirst| |args|)) . #2#) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (EXIT (LETT |cols| (STRCONC |cols| "c") . #2#)))
                         (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                         (EXIT NIL))
                    (LETT |cols| (STRCONC |cols| "} ") . #2#)
                    (EXIT
                     (|TEX;group|
                      (|TEX;addBrackets|
                       (SPADCALL
                        (LIST "\\begin{array}" |cols|
                              (|TEX;formatNaryNoGroup| 'STRSEP " \\\\ " 0
                               |args| (QREFELT $ 9) $)
                              " \\end{array} ")
                        (QREFELT $ 54))
                       $)
                      $))))) 

(SDEFUN |TEX;formatFunction|
        ((|op| |OutputForm|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG ((|ops| (|String|)))
               (SEQ
                (LETT |ops| (|TEX;formatExpr| |op| (QREFELT $ 9) $)
                      |TEX;formatFunction|)
                (EXIT
                 (|TEX;group|
                  (SPADCALL
                   (LIST |ops| " "
                         (|TEX;parenthesize|
                          (|TEX;formatNary| '|,| "" 0 |args| (QREFELT $ 9) $)
                          $))
                   (QREFELT $ 54))
                  $))))) 

(SDEFUN |TEX;formatNullary| ((|op| |Symbol|) ($ |String|))
        (COND ((EQUAL |op| 'NOTHING) "")
              ('T
               (|TEX;group|
                (SPADCALL (LIST (SPADCALL |op| (QREFELT $ 59)) "()")
                          (QREFELT $ 54))
                $)))) 

(SDEFUN |TEX;formatUnary|
        ((|op| |Symbol|) (|arg| |OutputForm|) (|prec| |Integer|) ($ |String|))
        (SPROG ((|s| (|String|)) (|opPrec| (|Integer|)) (|p| (|Integer|)))
               (SEQ
                (LETT |p| (SPADCALL |op| (QREFELT $ 10) (QREFELT $ 61))
                      . #1=(|TEX;formatUnary|))
                (EXIT
                 (COND ((< |p| 1) (|error| "unknown unary op"))
                       (#2='T
                        (SEQ
                         (LETT |opPrec|
                               (SPADCALL (QREFELT $ 11) |p| (QREFELT $ 63))
                               . #1#)
                         (LETT |s|
                               (SPADCALL
                                (LIST (SPADCALL |op| (QREFELT $ 59))
                                      (|TEX;formatExpr| |arg| |opPrec| $))
                                (QREFELT $ 54))
                               . #1#)
                         (EXIT
                          (COND
                           ((< |opPrec| |prec|)
                            (|TEX;group| (|TEX;parenthesize| |s| $) $))
                           ((EQUAL |op| '-) |s|)
                           (#2# (|TEX;group| |s| $))))))))))) 

(SDEFUN |TEX;formatBinary|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG
         ((|s| (|String|)) (|ops| (|String|)) (|s2| #1=(|String|)) (|s1| #1#)
          (|opPrec| (|Integer|)) (|p| (|Integer|)))
         (SEQ
          (LETT |p| (SPADCALL |op| (QREFELT $ 12) (QREFELT $ 61))
                . #2=(|TEX;formatBinary|))
          (EXIT
           (COND ((< |p| 1) (|error| "unknown binary op"))
                 (#3='T
                  (SEQ
                   (LETT |opPrec| (SPADCALL (QREFELT $ 13) |p| (QREFELT $ 63))
                         . #2#)
                   (LETT |s1|
                         (|TEX;formatExpr| (|SPADfirst| |args|) |opPrec| $)
                         . #2#)
                   (LETT |s2|
                         (|TEX;formatExpr| (|SPADfirst| (CDR |args|))
                          (COND ((EQUAL |op| '^) (QREFELT $ 9)) (#3# |opPrec|))
                          $)
                         . #2#)
                   (LETT |ops|
                         (COND ((EQUAL |op| '|\||) " \\mid ")
                               ((EQUAL |op| '^) " \\sp ")
                               ((EQUAL |op| '/) " \\over ")
                               (#3#
                                (COND ((EQUAL |op| 'OVER) " \\over ")
                                      ((EQUAL |op| '+->) " \\mapsto ")
                                      ((EQUAL |op| '~=) " \\ne ")
                                      ((EQUAL |op| '<=) " \\leq ")
                                      ((EQUAL |op| '>=) " \\geq ")
                                      (#3#
                                       (COND ((EQUAL |op| 'LET) " := ")
                                             (#3#
                                              (SPADCALL |op|
                                                        (QREFELT $ 59))))))))
                         . #2#)
                   (LETT |s|
                         (COND
                          ((EQUAL |op| '^)
                           (SPADCALL
                            (LIST (|TEX;group| |s1| $) |ops|
                                  (|TEX;group| |s2| $))
                            (QREFELT $ 54)))
                          (#3#
                           (SPADCALL (LIST |s1| |ops| |s2|) (QREFELT $ 54))))
                         . #2#)
                   (EXIT
                    (|TEX;group|
                     (COND
                      ((OR (OR (EQUAL |op| '/) (EQUAL |op| 'OVER))
                           (NULL (< |opPrec| |prec|)))
                       |s|)
                      ('T (|TEX;parenthesize| |s| $)))
                     $))))))))) 

(SDEFUN |TEX;formatNary|
        ((|op| |Symbol|) (|sep| |String|) (|opprec| |Integer|)
         (|args| |List| (|OutputForm|)) (|prec| |Integer|) ($ |String|))
        (|TEX;group|
         (|TEX;formatNaryNoGroup| |op| |sep| |opprec| |args| |prec| $) $)) 

(SDEFUN |TEX;formatNaryNoGroup|
        ((|op| |Symbol|) (|sep| |String|) (|opprec| |Integer|)
         (|args| |List| (|OutputForm|)) (|prec| |Integer|) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|l| (|List| (|String|))) (#1=#:G374 NIL) (|a| NIL)
          (|opPrec| (|Integer|)) (|ops| (|String|)) (|p| (|Integer|)))
         (SEQ
          (COND ((NULL |args|) "")
                (#2='T
                 (SEQ
                  (LETT |p| (SPADCALL |op| (QREFELT $ 14) (QREFELT $ 61))
                        . #3=(|TEX;formatNaryNoGroup|))
                  (EXIT
                   (COND ((< |p| 1) (|error| "unknown nary op"))
                         (#2#
                          (SEQ
                           (LETT |ops|
                                 (COND ((EQUAL |op| 'STRSEP) |sep|)
                                       ((EQUAL |op| '|,|) ", \\: ")
                                       ((EQUAL |op| '|;|) "; \\: ")
                                       ((EQUAL |op| '*) (QREFELT $ 7))
                                       (#2#
                                        (COND ((EQUAL |op| '| |) " \\ ")
                                              ((EQUAL |op| 'ROW) " & ")
                                              ((EQUAL |op| 'TENSOR)
                                               " \\otimes ")
                                              (#2#
                                               (SPADCALL |op|
                                                         (QREFELT $ 59))))))
                                 . #3#)
                           (LETT |l| NIL . #3#)
                           (LETT |opPrec|
                                 (COND ((EQUAL |op| 'STRSEP) |opprec|)
                                       (#2#
                                        (SPADCALL (QREFELT $ 15) |p|
                                                  (QREFELT $ 63))))
                                 . #3#)
                           (SEQ (LETT |a| NIL . #3#) (LETT #1# |args| . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |l|
                                        (CONS |ops|
                                              (CONS
                                               (|TEX;formatExpr| |a| |opPrec|
                                                $)
                                               |l|))
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT NIL))
                           (LETT |s|
                                 (SPADCALL (REVERSE (CDR |l|)) (QREFELT $ 54))
                                 . #3#)
                           (EXIT
                            (COND
                             ((< |opPrec| |prec|) (|TEX;parenthesize| |s| $))
                             (#2# |s|))))))))))))) 

(SDEFUN |TEX;formatExpr|
        ((|expr| |OutputForm|) (|prec| |Integer|) ($ |String|))
        (SPROG
         ((|op| (|Symbol|)) (|nargs| (|Integer|))
          (|args| (|List| (|OutputForm|))) (|opf| (|OutputForm|))
          (|l| (|List| (|OutputForm|))) (|i| (|Integer|)) (|str| (|String|))
          (|u| (|UniversalSegment| (|Integer|))) (|nstr| (|String|))
          (|len| (|Integer|)) (|intSplitLen| (|Integer|)))
         (SEQ (LETT |intSplitLen| 20 . #1=(|TEX;formatExpr|))
              (EXIT
               (COND
                ((ATOM |expr|)
                 (SEQ (LETT |str| (|TEX;stringify| |expr| $) . #1#)
                      (LETT |len| (QCSIZE |str|) . #1#)
                      (EXIT
                       (COND
                        ((FIXP |expr|)
                         (SEQ (LETT |i| |expr| . #1#)
                              (EXIT
                               (COND
                                ((OR (< |i| 0) (SPADCALL |i| 9 (QREFELT $ 52)))
                                 (|TEX;group|
                                  (SEQ (LETT |nstr| "" . #1#)
                                       (SEQ G190
                                            (COND
                                             ((NULL
                                               (SPADCALL
                                                (LETT |len| (QCSIZE |str|)
                                                      . #1#)
                                                |intSplitLen| (QREFELT $ 52)))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |nstr|
                                                   (SPADCALL
                                                    (LIST |nstr| " "
                                                          (SPADCALL |str|
                                                                    (SPADCALL 1
                                                                              |intSplitLen|
                                                                              (QREFELT
                                                                               $
                                                                               44))
                                                                    (QREFELT $
                                                                             45)))
                                                    (QREFELT $ 54))
                                                   . #1#)
                                             (EXIT
                                              (LETT |str|
                                                    (SPADCALL |str|
                                                              (SPADCALL
                                                               (+ |intSplitLen|
                                                                  1)
                                                               (QREFELT $ 66))
                                                              (QREFELT $ 45))
                                                    . #1#)))
                                            NIL (GO G190) G191 (EXIT NIL))
                                       (EXIT
                                        (COND
                                         ((SPADCALL |nstr| (QREFELT $ 53))
                                          |str|)
                                         (#2='T
                                          (SEQ
                                           (LETT |nstr|
                                                 (COND
                                                  ((SPADCALL |str|
                                                             (QREFELT $ 53))
                                                   |nstr|)
                                                  (#2#
                                                   (SPADCALL
                                                    (LIST |nstr| " " |str|)
                                                    (QREFELT $ 54))))
                                                 . #1#)
                                           (EXIT
                                            (SPADCALL |nstr|
                                                      (SPADCALL 2
                                                                (QREFELT $ 66))
                                                      (QREFELT $ 45))))))))
                                  $))
                                ('T |str|)))))
                        ((EQUAL |str| "%pi") "\\pi") ((EQUAL |str| "%e") "e")
                        ((EQUAL |str| "%i") "i")
                        (#2#
                         (SEQ
                          (COND
                           ((SPADCALL |len| 1 (QREFELT $ 52))
                            (COND
                             ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 42))
                                        (|STR_to_CHAR| "%"))
                              (COND
                               ((|eql_SI| (SPADCALL |str| 2 (QREFELT $ 42))
                                          (|STR_to_CHAR| "%"))
                                (EXIT
                                 (SEQ
                                  (LETT |u| (SPADCALL 3 |len| (QREFELT $ 44))
                                        . #1#)
                                  (EXIT
                                   (STRCONC " \\%\\%"
                                            (SPADCALL |str| |u|
                                                      (QREFELT $ 45))))))))))))
                          (COND
                           ((SPADCALL |len| 0 (QREFELT $ 52))
                            (COND
                             ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 42))
                                        (|STR_to_CHAR| "%"))
                              (EXIT (STRCONC " \\" |str|))))))
                          (COND
                           ((SPADCALL |len| 1 (QREFELT $ 52))
                            (COND
                             ((SPADCALL (SPADCALL |str| 1 (QREFELT $ 42))
                                        (QREFELT $ 67))
                              (EXIT (|TEX;group| |str| $))))))
                          (COND
                           ((SPADCALL |len| 0 (QREFELT $ 52))
                            (COND
                             ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 42))
                                        (|STR_to_CHAR| "\""))
                              (EXIT
                               (STRCONC (STRCONC " \\mbox{\\tt " |str|)
                                        "} "))))))
                          (COND
                           ((EQL |len| 1)
                            (COND
                             ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 42))
                                        (|STR_to_CHAR| " "))
                              (EXIT "{\\ }")))))
                          (COND
                           ((SYMBOLP |expr|)
                            (SEQ (LETT |op| |expr| . #1#)
                                 (LETT |i|
                                       (SPADCALL |op| (QREFELT $ 20)
                                                 (QREFELT $ 61))
                                       . #1#)
                                 (EXIT
                                  (COND
                                   ((SPADCALL |i| 0 (QREFELT $ 52))
                                    (LETT |str|
                                          (SPADCALL (QREFELT $ 21) |i|
                                                    (QREFELT $ 68))
                                          . #1#)))))))
                          (LETT |i|
                                (SPADCALL (|STR_to_CHAR| " ") |str|
                                          (QREFELT $ 70))
                                . #1#)
                          (EXIT
                           (COND
                            ((SPADCALL |i| 0 (QREFELT $ 52))
                             (SPADCALL (LIST " \\mbox{\\rm " |str| "} ")
                                       (QREFELT $ 54)))
                            (#2# |str|)))))))))
                (#2#
                 (SEQ (LETT |l| |expr| . #1#)
                      (EXIT
                       (COND ((NULL |l|) (QREFELT $ 7))
                             (#2#
                              (SEQ (LETT |opf| (|SPADfirst| |l|) . #1#)
                                   (LETT |args| (CDR |l|) . #1#)
                                   (LETT |nargs| (LENGTH |args|) . #1#)
                                   (EXIT
                                    (COND
                                     ((SYMBOLP |opf|)
                                      (SEQ (LETT |op| |opf| . #1#)
                                           (EXIT
                                            (COND
                                             ((SPADCALL |op| (QREFELT $ 19)
                                                        (QREFELT $ 71))
                                              (|TEX;formatSpecial| |op| |args|
                                               |prec| $))
                                             ((SPADCALL |op| (QREFELT $ 17)
                                                        (QREFELT $ 71))
                                              (|TEX;formatPlex| |op| |args|
                                               |prec| $))
                                             ((EQL 0 |nargs|)
                                              (|TEX;formatNullary| |op| $))
                                             (#2#
                                              (SEQ
                                               (COND
                                                ((EQL 1 |nargs|)
                                                 (COND
                                                  ((SPADCALL |op|
                                                             (QREFELT $ 10)
                                                             (QREFELT $ 71))
                                                   (EXIT
                                                    (|TEX;formatUnary| |op|
                                                     (|SPADfirst| |args|)
                                                     |prec| $))))))
                                               (COND
                                                ((EQL 2 |nargs|)
                                                 (COND
                                                  ((SPADCALL |op|
                                                             (QREFELT $ 12)
                                                             (QREFELT $ 71))
                                                   (EXIT
                                                    (|TEX;formatBinary| |op|
                                                     |args| |prec| $))))))
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |op| (QREFELT $ 16)
                                                            (QREFELT $ 71))
                                                  (|TEX;formatNaryNoGroup| |op|
                                                   "" 0 |args| |prec| $))
                                                 ((SPADCALL |op| (QREFELT $ 14)
                                                            (QREFELT $ 71))
                                                  (|TEX;formatNary| |op| "" 0
                                                   |args| |prec| $))
                                                 (#2#
                                                  (|TEX;formatFunction|
                                                   (|SPADfirst| |l|) |args|
                                                   |prec| $))))))))))
                                     (#2#
                                      (|TEX;formatFunction| (|SPADfirst| |l|)
                                       |args| |prec| $))))))))))))))) 

(DECLAIM (NOTINLINE |TexFormat;|)) 

(DEFUN |TexFormat| ()
  (SPROG NIL
         (PROG (#1=#:G410)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|TexFormat|)
                    . #2=(|TexFormat|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|TexFormat|
                             (LIST (CONS NIL (CONS 1 (|TexFormat;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|TexFormat|)))))))))) 

(DEFUN |TexFormat;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|TexFormat|) . #1=(|TexFormat|))
          (LETT $ (GETREFV 74) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TexFormat| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6
                    (|Record| (|:| |prolog| (|List| (|String|)))
                              (|:| |TeX| (|List| (|String|)))
                              (|:| |epilog| (|List| (|String|)))))
          (QSETREFV $ 7 " \\  ")
          (QSETREFV $ 8 1000000)
          (QSETREFV $ 9 0)
          (QSETREFV $ 10 '(-))
          (QSETREFV $ 11 '(710))
          (QSETREFV $ 12 '(+-> |\|| ^ / = ~= < <= > >= OVER LET))
          (QSETREFV $ 13 (LIST 0 0 900 700 400 400 400 400 400 400 700 125))
          (QSETREFV $ 14 '(- + * |,| |;| ROW STRSEP TENSOR))
          (QSETREFV $ 15 (LIST 700 700 800 110 110 0 0 850))
          (QSETREFV $ 16 '(ROW))
          (QSETREFV $ 17 '(SIGMA SIGMA2 PI PI2 INTSIGN INDEFINTEGRAL))
          (QSETREFV $ 18 '(750 750 750 750 700 700))
          (QSETREFV $ 19
                    '(MATRIX BRACKET BRACE CONCATB VCONCAT AGGLST CONCAT
                      OVERBAR ROOT SUB TAG SUPERSUB ZAG AGGSET SC PAREN SEGMENT
                      QUOTE |theMap| SLASH PRIME))
          (QSETREFV $ 20
                    '(|cos| |cot| |csc| |log| |sec| |sin| |tan| |cosh| |coth|
                      |csch| |sech| |sinh| |tanh| |acos| |asin| |atan| |erf|
                      |...| $ |infinity| |Gamma|))
          (QSETREFV $ 21
                    (LIST "\\cos" "\\cot" "\\csc" "\\log" "\\sec" "\\sin"
                          "\\tan" "\\cosh" "\\coth" "\\csch" "\\sech" "\\sinh"
                          "\\tanh" "\\arccos" "\\arcsin" "\\arctan" "\\erf"
                          "\\ldots" "\\$" "\\infty" "\\Gamma"))
          $))) 

(MAKEPROP '|TexFormat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| '|blank| '|maxPrec| '|minPrec|
              '|unaryOps| '|unaryPrecs| '|binaryOps| '|binaryPrecs| '|naryOps|
              '|naryPrecs| '|naryNGOps| '|plexOps| '|plexPrecs| '|specialOps|
              '|specialStrings| '|specialStringsInTeX| |TEX;new;$;1|
              (|OutputForm|) |TEX;coerce;Of$;3| (|Integer|)
              |TEX;convert;OfI$;4| (|Void|) (0 . |void|) |TEX;display;$IV;6|
              |TEX;display;$V;7| (|List| 41) |TEX;prologue;$L;8| |TEX;tex;$L;9|
              |TEX;epilogue;$L;10| |TEX;setPrologue!;$2L;11|
              |TEX;setTex!;$2L;12| |TEX;setEpilogue!;$2L;13| (4 . |coerce|)
              |TEX;coerce;$Of;14| (|Character|) (|String|) (9 . |elt|)
              (|UniversalSegment| 25) (15 . |segment|) (21 . |elt|)
              (27 . |setelt!|) (|Boolean|) (|NonNegativeInteger|) (34 . >)
              (|List| $) (40 . |split|) (46 . >) (52 . |empty?|)
              (57 . |concat|) (|List| 23) (62 . |second|) (67 . ~=) (|Symbol|)
              (73 . |string|) (|List| 58) (78 . |position|) (|List| 25)
              (84 . |elt|) (90 . ~=) (96 . ~=) (102 . |segment|)
              (107 . |digit?|) (112 . |elt|) (118 . |char|) (123 . |position|)
              (129 . |member?|) (|SingleInteger|) (|HashState|))
           '#(~= 135 |tex| 141 |setTex!| 146 |setPrologue!| 152 |setEpilogue!|
              158 |prologue| 164 |new| 169 |latex| 173 |hashUpdate!| 178 |hash|
              184 |epilogue| 189 |display| 194 |convert| 205 |coerce| 218 =
              228)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 23))
                        (|makeByteWordVec2| 73
                                            '(0 27 0 28 1 31 23 0 38 2 41 40 0
                                              25 42 2 43 0 25 25 44 2 41 0 0 43
                                              45 3 41 40 0 25 40 46 2 48 47 0 0
                                              49 2 41 50 0 40 51 2 25 47 0 0 52
                                              1 41 47 0 53 1 41 0 50 54 1 55 23
                                              0 56 2 41 47 0 0 57 1 58 41 0 59
                                              2 60 25 58 0 61 2 62 25 0 25 63 2
                                              25 47 0 0 64 2 58 47 0 0 65 1 43
                                              0 25 66 1 40 47 0 67 2 31 41 0 25
                                              68 1 40 0 41 69 2 41 25 40 0 70 2
                                              60 47 58 0 71 2 0 47 0 0 1 1 0 31
                                              0 33 2 0 31 0 31 36 2 0 31 0 31
                                              35 2 0 31 0 31 37 1 0 31 0 32 0 0
                                              0 22 1 0 41 0 1 2 0 73 73 0 1 1 0
                                              72 0 1 1 0 31 0 34 2 0 27 0 25 29
                                              1 0 27 0 30 2 0 0 23 25 26 3 0 0
                                              23 25 23 1 1 0 0 23 24 1 0 23 0
                                              39 2 0 47 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|TexFormat| 'NILADIC T) 
