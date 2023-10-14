
(SDEFUN |TMFORM;coerce;OfS;1| ((|expr| |OutputForm|) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ
                (LETT |s|
                      (|TMFORM;postcondition|
                       (|TMFORM;formatExpr| (|TMFORM;precondition| |expr| $)
                        (QREFELT $ 12) $)
                       $)
                      |TMFORM;coerce;OfS;1|)
                (EXIT |s|)))) 

(PUT '|TMFORM;sayExpr| '|SPADreplace| '|sayTexmacs|) 

(SDEFUN |TMFORM;sayExpr| ((|s| |String|) ($ |Void|)) (|sayTexmacs| |s|)) 

(SDEFUN |TMFORM;coerceL;OfS;3| ((|expr| |OutputForm|) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ
                (LETT |s|
                      (|TMFORM;postcondition|
                       (|TMFORM;formatExpr| (|TMFORM;precondition| |expr| $)
                        (QREFELT $ 12) $)
                       $)
                      |TMFORM;coerceL;OfS;3|)
                (|TMFORM;sayExpr| "scheme: (with \"mode\" \"math\"" $)
                (|TMFORM;sayExpr| |s| $) (|TMFORM;sayExpr| ")" $) (EXIT |s|)))) 

(SDEFUN |TMFORM;display;SV;4| ((|texmacs| |String|) ($ |Void|))
        (SEQ (|TMFORM;sayExpr| "scheme: (with \"mode\" \"math\"" $)
             (|TMFORM;sayExpr| |texmacs| $) (|TMFORM;sayExpr| ")" $)
             (EXIT (SPADCALL (QREFELT $ 30))))) 

(PUT '|TMFORM;ungroup| '|SPADreplace| '(XLAM (|str|) |str|)) 

(SDEFUN |TMFORM;ungroup| ((|str| |String|) ($ |String|)) |str|) 

(SDEFUN |TMFORM;postcondition| ((|str| |String|) ($ |String|))
        (SPROG
         ((|uend| #1=(|UniversalSegment| (|Integer|))) (|ustart| #1#)
          (|pos| (|Integer|)) (|plusminus| (|String|)) (|len| (|Integer|)))
         (SEQ (LETT |len| (QCSIZE |str|) . #2=(|TMFORM;postcondition|))
              (LETT |plusminus| "\"+\" (concat \"-\"" . #2#)
              (LETT |pos| (SPADCALL |plusminus| |str| 1 (QREFELT $ 32)) . #2#)
              (COND
               ((SPADCALL |pos| 0 (QREFELT $ 34))
                (SEQ
                 (LETT |ustart| (SPADCALL 1 (- |pos| 1) (QREFELT $ 36)) . #2#)
                 (LETT |uend| (SPADCALL (+ |pos| 15) |len| (QREFELT $ 36))
                       . #2#)
                 (LETT |str|
                       (SPADCALL
                        (LIST (SPADCALL |str| |ustart| (QREFELT $ 37))
                              "(concat \"-\""
                              (SPADCALL |str| |uend| (QREFELT $ 37)))
                        (QREFELT $ 39))
                       . #2#)
                 (EXIT
                  (COND
                   ((< |pos| (- |len| 13))
                    (LETT |str| (|TMFORM;postcondition| |str| $) . #2#)))))))
              (EXIT |str|)))) 

(PUT '|TMFORM;stringify| '|SPADreplace| '|mathObject2String|) 

(SDEFUN |TMFORM;stringify| ((|expr| |OutputForm|) ($ |String|))
        (|mathObject2String| |expr|)) 

(SDEFUN |TMFORM;optionalWrap|
        ((|s| |String|) (|expr| |OutputForm|) (|prec| |Integer|) ($ |String|))
        (SPROG ((|tmp| (|String|)))
               (SEQ
                (LETT |tmp| (|TMFORM;formatExpr| |expr| |prec| $)
                      |TMFORM;optionalWrap|)
                (COND ((OR (EQUAL |tmp| "") (EQUAL |tmp| " ")) (EXIT "")))
                (EXIT (SPADCALL (LIST "(" |s| " " |tmp| ")") (QREFELT $ 39)))))) 

(SDEFUN |TMFORM;group| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "(concat " |str| ")") (QREFELT $ 39))) 

(SDEFUN |TMFORM;cork| ((|x| |SingleInteger|) ($ |String|))
        (SPROG ((#1=#:G193 NIL) (#2=#:G194 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| NIL . #3=(|TMFORM;cork|))
                       (LETT #2# (QREFELT $ 9) . #3#) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((|eql_SI| (QCDR |i|) |x|)
                           (PROGN
                            (LETT #1# (QCAR |i|) . #3#)
                            (GO #4=#:G192))))))
                       (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                  (EXIT (NUM2USTR |x|))))
                #4# (EXIT #1#)))) 

(SDEFUN |TMFORM;utf2cork| ((|str| |String|) ($ |String|))
        (SPROG ((#1=#:G198 NIL) (|i| NIL) (#2=#:G197 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|TMFORM;utf2cork|))
                  (SEQ (LETT |i| NIL . #3#) (LETT #1# (UENTRIES |str|) . #3#)
                       G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (|TMFORM;cork| |i| $) #2#) . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 39))))) 

(SDEFUN |TMFORM;addBraces| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST " \"{\" " |str| " \"}\" ") (QREFELT $ 39))) 

(SDEFUN |TMFORM;addBrackets| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST " \"[\" " |str| " \"]\" ") (QREFELT $ 39))) 

(SDEFUN |TMFORM;parenthesize| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST " \"(\" " |str| " \")\" ") (QREFELT $ 39))) 

(PUT '|TMFORM;precondition| '|SPADreplace| '|outputTran|) 

(SDEFUN |TMFORM;precondition| ((|expr| |OutputForm|) ($ |OutputForm|))
        (|outputTran| |expr|)) 

(SDEFUN |TMFORM;formatSpecial|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG
         ((|tmp| (|String|)) (|base| (|String|)) (|prescript| (|Boolean|)))
         (SEQ (LETT |prescript| 'NIL . #1=(|TMFORM;formatSpecial|))
              (EXIT
               (COND ((EQUAL |op| '|theMap|) "(concat \"theMap(...)\")")
                     ((EQUAL |op| 'AGGLST)
                      (|TMFORM;formatNary| '|,| "" 0 |args| |prec| $))
                     ((EQUAL |op| 'AGGSET)
                      (|TMFORM;formatNary| '|;| "" 0 |args| |prec| $))
                     ((EQUAL |op| 'TAG)
                      (|TMFORM;group|
                       (SPADCALL
                        (LIST
                         (|TMFORM;formatExpr| (|SPADfirst| |args|) |prec| $)
                         " \"<rightarrow>\" "
                         (|TMFORM;formatExpr| (SPADCALL |args| (QREFELT $ 41))
                          |prec| $))
                        (QREFELT $ 39))
                       $))
                     ((EQUAL |op| 'SLASH)
                      (|TMFORM;group|
                       (SPADCALL
                        (LIST
                         (|TMFORM;formatExpr| (|SPADfirst| |args|) |prec| $)
                         " \"/\" "
                         (|TMFORM;formatExpr| (SPADCALL |args| (QREFELT $ 41))
                          |prec| $))
                        (QREFELT $ 39))
                       $))
                     ((EQUAL |op| 'CONCATB)
                      (|TMFORM;formatNary| 'STRSEP " " 0 |args| |prec| $))
                     ((EQUAL |op| 'CONCAT)
                      (|TMFORM;formatNary| 'STRSEP "" 0 |args| (QREFELT $ 12)
                       $))
                     ((EQUAL |op| 'QUOTE)
                      (|TMFORM;group|
                       (STRCONC "'"
                                (|TMFORM;formatExpr| (|SPADfirst| |args|)
                                 (QREFELT $ 12) $))
                       $))
                     ((EQUAL |op| 'BRACKET)
                      (|TMFORM;group|
                       (|TMFORM;addBrackets|
                        (|TMFORM;ungroup|
                         (|TMFORM;formatExpr| (|SPADfirst| |args|)
                          (QREFELT $ 12) $)
                         $)
                        $)
                       $))
                     ((EQUAL |op| 'BRACE)
                      (|TMFORM;group|
                       (|TMFORM;addBraces|
                        (|TMFORM;ungroup|
                         (|TMFORM;formatExpr| (|SPADfirst| |args|)
                          (QREFELT $ 12) $)
                         $)
                        $)
                       $))
                     ((EQUAL |op| 'PAREN)
                      (|TMFORM;group|
                       (|TMFORM;parenthesize|
                        (|TMFORM;ungroup|
                         (|TMFORM;formatExpr| (|SPADfirst| |args|)
                          (QREFELT $ 12) $)
                         $)
                        $)
                       $))
                     ((EQUAL |op| 'PRIME)
                      (|TMFORM;formatSpecial| 'SUPERSUB
                       (LIST (|SPADfirst| |args|) " "
                             (SPADCALL |args| (QREFELT $ 41)))
                       |prec| $))
                     ((EQUAL |op| 'OVERBAR)
                      (COND ((NULL |args|) "")
                            (#2='T
                             (SPADCALL
                              (LIST "(wide "
                                    (|TMFORM;formatExpr| (|SPADfirst| |args|)
                                     (QREFELT $ 12) $)
                                    " \"<bar>\")")
                              (QREFELT $ 39)))))
                     ((EQUAL |op| 'ROOT)
                      (COND ((NULL |args|) "")
                            (#2#
                             (SEQ
                              (LETT |tmp|
                                    (|TMFORM;group|
                                     (|TMFORM;formatExpr| (|SPADfirst| |args|)
                                      (QREFELT $ 12) $)
                                     $)
                                    . #1#)
                              (EXIT
                               (COND
                                ((NULL (CDR |args|))
                                 (SPADCALL (LIST "(sqrt " |tmp| ")")
                                           (QREFELT $ 39)))
                                (#2#
                                 (SPADCALL
                                  (LIST "(sqrt " |tmp| " "
                                        (|TMFORM;formatExpr|
                                         (|SPADfirst| (CDR |args|))
                                         (QREFELT $ 12) $)
                                        ")")
                                  (QREFELT $ 39)))))))))
                     ((EQUAL |op| 'SEGMENT)
                      (SEQ
                       (LETT |tmp|
                             (SPADCALL
                              (LIST
                               (|TMFORM;formatExpr| (|SPADfirst| |args|)
                                (QREFELT $ 12) $)
                               " \"..\" ")
                              (QREFELT $ 39))
                             . #1#)
                       (EXIT
                        (|TMFORM;group|
                         (COND ((NULL (CDR |args|)) |tmp|)
                               (#2#
                                (SPADCALL
                                 (LIST |tmp|
                                       (|TMFORM;formatExpr|
                                        (|SPADfirst| (CDR |args|))
                                        (QREFELT $ 12) $))
                                 (QREFELT $ 39))))
                         $))))
                     ((EQUAL |op| 'SUB)
                      (|TMFORM;group|
                       (SPADCALL
                        (LIST "(concat "
                              (|TMFORM;formatExpr| (|SPADfirst| |args|)
                               (QREFELT $ 12) $)
                              "(rsub "
                              (|TMFORM;formatSpecial| 'AGGLST (CDR |args|)
                               (QREFELT $ 12) $)
                              "))")
                        (QREFELT $ 39))
                       $))
                     ((EQUAL |op| 'SUPERSUB)
                      (SEQ
                       (LETT |base|
                             (|TMFORM;formatExpr| (|SPADfirst| |args|)
                              (QREFELT $ 12) $)
                             . #1#)
                       (LETT |args| (CDR |args|) . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL (LENGTH |args|) 4 (QREFELT $ 43))
                          (|error|
                           "multiscript object has more than 4 scripts"))
                         (#2#
                          (SEQ
                           (COND
                            ((NULL (NULL |args|))
                             (SEQ
                              (LETT |base|
                                    (SPADCALL
                                     (LIST |base| " "
                                           (|TMFORM;optionalWrap| "rsub"
                                            (SPADCALL |args| 1 (QREFELT $ 44))
                                            (QREFELT $ 12) $))
                                     (QREFELT $ 39))
                                    . #1#)
                              (EXIT (LETT |args| (CDR |args|) . #1#)))))
                           (COND
                            ((NULL (NULL |args|))
                             (SEQ
                              (LETT |base|
                                    (SPADCALL
                                     (LIST |base| " "
                                           (|TMFORM;optionalWrap| "rsup"
                                            (SPADCALL |args| 1 (QREFELT $ 44))
                                            (QREFELT $ 12) $))
                                     (QREFELT $ 39))
                                    . #1#)
                              (EXIT (LETT |args| (CDR |args|) . #1#)))))
                           (COND
                            ((NULL (NULL |args|))
                             (SEQ
                              (LETT |base|
                                    (SPADCALL
                                     (LIST
                                      (|TMFORM;optionalWrap| "lsup"
                                       (SPADCALL |args| 1 (QREFELT $ 44))
                                       (QREFELT $ 12) $)
                                      " " |base|)
                                     (QREFELT $ 39))
                                    . #1#)
                              (EXIT (LETT |args| (CDR |args|) . #1#)))))
                           (COND
                            ((NULL (NULL |args|))
                             (LETT |base|
                                   (SPADCALL
                                    (LIST
                                     (|TMFORM;optionalWrap| "lsub"
                                      (SPADCALL |args| 1 (QREFELT $ 44))
                                      (QREFELT $ 12) $)
                                     " " |base|)
                                    (QREFELT $ 39))
                                   . #1#)))
                           (EXIT
                            (SPADCALL (LIST "(concat " |base| ")")
                                      (QREFELT $ 39)))))))))
                     ((EQUAL |op| 'SC)
                      (COND ((NULL |args|) "")
                            (#2#
                             (SEQ
                              (LETT |tmp|
                                    (|TMFORM;formatNaryNoGroup| 'STRSEP
                                     ")) (row (cell " 0 |args| (QREFELT $ 12)
                                     $)
                                    . #1#)
                              (EXIT
                               (SPADCALL
                                (LIST
                                 "(tabular (tformat (twith \"table-valign\" \"t\") (table (row (cell "
                                 |tmp| ")))))")
                                (QREFELT $ 39)))))))
                     ((EQUAL |op| 'MATRIX)
                      (|TMFORM;formatMatrix| (CDR |args|) $))
                     ((EQUAL |op| 'BINOMIAL)
                      (SPADCALL
                       (LIST "(binom "
                             (|TMFORM;formatExpr|
                              (SPADCALL |args| 1 (QREFELT $ 44)) (QREFELT $ 12)
                              $)
                             " "
                             (|TMFORM;formatExpr|
                              (SPADCALL |args| 2 (QREFELT $ 44)) (QREFELT $ 12)
                              $)
                             ")")
                       (QREFELT $ 39)))
                     ((EQUAL |op| 'NOTHING) "\"\"")
                     (#2#
                      (SPADCALL
                       (LIST "(concat \"not done yet for: "
                             (SPADCALL |op| (QREFELT $ 46)) "\")")
                       (QREFELT $ 39)))))))) 

(SDEFUN |TMFORM;formatPlex|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG
         ((|s| (|String|)) (|t1| #1=(|String|)) (|t2| (|String|)) (|body| #1#)
          (|ops| (|String|)) (|n| (|Integer|)) (|opPrec| (|Integer|))
          (|p| (|Integer|)))
         (SEQ
          (LETT |p| (SPADCALL |op| (QREFELT $ 20) (QREFELT $ 48))
                . #2=(|TMFORM;formatPlex|))
          (EXIT
           (COND ((< |p| 1) (|error| "unknown plex op"))
                 (#3='T
                  (SEQ
                   (LETT |opPrec| (SPADCALL (QREFELT $ 21) |p| (QREFELT $ 50))
                         . #2#)
                   (LETT |n| (LENGTH |args|) . #2#)
                   (COND
                    ((SPADCALL |n| 2 (QREFELT $ 51))
                     (COND
                      ((SPADCALL |n| 3 (QREFELT $ 51))
                       (EXIT
                        (|error| "wrong number of arguments for plex"))))))
                   (LETT |ops|
                         (COND
                          ((EQUAL |op| 'SIGMA)
                           (COND ((EQL |n| 2) "<sum>")
                                 (#3#
                                  (|error|
                                   "wrong number of arguments for plex"))))
                          ((EQUAL |op| 'SIGMA2)
                           (COND ((EQL |n| 3) "<sum>")
                                 (#3#
                                  (|error|
                                   "wrong number of arguments for plex"))))
                          ((EQUAL |op| 'PI)
                           (COND ((EQL |n| 2) "<prod>")
                                 (#3#
                                  (|error|
                                   "wrong number of arguments for plex"))))
                          ((EQUAL |op| 'PI2)
                           (COND ((EQL |n| 3) "<prod>")
                                 (#3#
                                  (|error|
                                   "wrong number of arguments for plex"))))
                          ((EQUAL |op| 'INTSIGN)
                           (COND ((EQL |n| 3) "<int>")
                                 (#3#
                                  (|error|
                                   "wrong number of arguments for plex"))))
                          (#3#
                           (|error|
                            (SPADCALL "Unexpected plex op:"
                                      (SPADCALL |op| (QREFELT $ 46))
                                      (QREFELT $ 52)))))
                         . #2#)
                   (LETT |body|
                         (COND
                          ((EQUAL |op| 'INTSIGN)
                           (STRCONC
                            (|TMFORM;formatIntBody|
                             (SPADCALL |args| 3 (QREFELT $ 44)) (QREFELT $ 12)
                             $)
                            " (big \".\")"))
                          (#3#
                           (|TMFORM;formatExpr|
                            (SPADCALL |args| |n| (QREFELT $ 44)) |opPrec| $)))
                         . #2#)
                   (LETT |t2|
                         (COND
                          ((EQL |n| 3)
                           (SPADCALL
                            (LIST " (rsup "
                                  (|TMFORM;formatExpr|
                                   (SPADCALL |args| 2 (QREFELT $ 44))
                                   (QREFELT $ 12) $)
                                  ")")
                            (QREFELT $ 39)))
                          (#3# ""))
                         . #2#)
                   (LETT |t1|
                         (|TMFORM;formatExpr|
                          (SPADCALL |args| 1 (QREFELT $ 44)) (QREFELT $ 12) $)
                         . #2#)
                   (LETT |s|
                         (SPADCALL
                          (LIST "(big-around \"" |ops| "\" (concat (rsub " |t1|
                                ")" |t2| " " |body| "))")
                          (QREFELT $ 39))
                         . #2#)
                   (COND
                    ((< |opPrec| |prec|)
                     (LETT |s| (|TMFORM;parenthesize| |s| $) . #2#)))
                   (EXIT |s|)))))))) 

(SDEFUN |TMFORM;formatIntBody|
        ((|body| |OutputForm|) (|opPrec| |Integer|) ($ |String|))
        (SPROG
         ((#1=#:G253 NIL) (|bvarS| (|String|))
          (|bvarL| #2=(|List| (|OutputForm|))) (|bvar| (|OutputForm|))
          (|bodyL| #2#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |body| '* (QREFELT $ 54))
              (SEQ
               (LETT |bodyL| (SPADCALL |body| (QREFELT $ 55))
                     . #3=(|TMFORM;formatIntBody|))
               (EXIT
                (COND
                 ((EQL (LENGTH |bodyL|) 2)
                  (COND
                   ((SPADCALL
                     (LETT |bvar| (SPADCALL |bodyL| 2 (QREFELT $ 44)) . #3#)
                     'CONCAT (QREFELT $ 54))
                    (SEQ (LETT |bvarL| (SPADCALL |bvar| (QREFELT $ 55)) . #3#)
                         (EXIT
                          (COND
                           ((EQL (LENGTH |bvarL|) 2)
                            (COND
                             ((SPADCALL (SPADCALL |bvarL| 1 (QREFELT $ 44))
                                        '|d| (QREFELT $ 56))
                              (SEQ
                               (LETT |bvarS|
                                     (|TMFORM;stringify|
                                      (SPADCALL |bvarL| 2 (QREFELT $ 44)) $)
                                     . #3#)
                               (EXIT
                                (PROGN
                                 (LETT #1#
                                       (SPADCALL
                                        (LIST "(concat "
                                              (|TMFORM;formatExpr|
                                               (SPADCALL |bodyL| 1
                                                         (QREFELT $ 44))
                                               |opPrec| $)
                                              " \"*<mathd>" |bvarS| "\")")
                                        (QREFELT $ 39))
                                       . #3#)
                                 (GO #4=#:G252))))))))))))))))))
            (EXIT (|TMFORM;formatExpr| |body| |opPrec| $))))
          #4# (EXIT #1#)))) 

(SDEFUN |TMFORM;formatMatrix| ((|args| |List| (|OutputForm|)) ($ |String|))
        (|TMFORM;group|
         (SPADCALL
          (LIST "(matrix (tformat (table (row (cell "
                (|TMFORM;formatNaryNoGroup| 'STRSEP ")) (row (cell " 0 |args|
                 (QREFELT $ 12) $)
                ")))))")
          (QREFELT $ 39))
         $)) 

(SDEFUN |TMFORM;formatFunction|
        ((|op| |OutputForm|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG ((|ops| (|String|)))
               (SEQ
                (LETT |ops| (|TMFORM;formatExpr| |op| (QREFELT $ 12) $)
                      |TMFORM;formatFunction|)
                (EXIT
                 (|TMFORM;group|
                  (SPADCALL
                   (LIST |ops| " "
                         (|TMFORM;parenthesize|
                          (|TMFORM;formatNary| '|,| "" 0 |args| (QREFELT $ 12)
                           $)
                          $))
                   (QREFELT $ 39))
                  $))))) 

(SDEFUN |TMFORM;formatNullary| ((|op| |Symbol|) ($ |String|))
        (COND ((EQUAL |op| 'NOTHING) "\"\"")
              ('T
               (|TMFORM;group|
                (SPADCALL (LIST "\"" (SPADCALL |op| (QREFELT $ 46)) "()\"")
                          (QREFELT $ 39))
                $)))) 

(SDEFUN |TMFORM;formatUnary|
        ((|op| |Symbol|) (|arg| |OutputForm|) (|prec| |Integer|) ($ |String|))
        (SPROG ((|s| (|String|)) (|opPrec| (|Integer|)) (|p| (|Integer|)))
               (SEQ
                (LETT |p| (SPADCALL |op| (QREFELT $ 13) (QREFELT $ 48))
                      . #1=(|TMFORM;formatUnary|))
                (EXIT
                 (COND ((< |p| 1) (|error| "unknown unary op"))
                       (#2='T
                        (SEQ
                         (LETT |opPrec|
                               (SPADCALL (QREFELT $ 14) |p| (QREFELT $ 50))
                               . #1#)
                         (LETT |s|
                               (SPADCALL
                                (LIST "(concat \""
                                      (SPADCALL |op| (QREFELT $ 46)) "\" "
                                      (|TMFORM;formatExpr| |arg| |opPrec| $)
                                      ")")
                                (QREFELT $ 39))
                               . #1#)
                         (EXIT
                          (COND
                           ((< |opPrec| |prec|)
                            (|TMFORM;group| (|TMFORM;parenthesize| |s| $) $))
                           ((EQUAL |op| '-) |s|)
                           (#2# (|TMFORM;group| |s| $))))))))))) 

(SDEFUN |TMFORM;formatBinary|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG
         ((|s| (|String|)) (|ops| (|String|)) (|s2| #1=(|String|)) (|s1| #1#)
          (|opPrec| (|Integer|)) (|p| (|Integer|)))
         (SEQ
          (LETT |p| (SPADCALL |op| (QREFELT $ 15) (QREFELT $ 48))
                . #2=(|TMFORM;formatBinary|))
          (EXIT
           (COND ((< |p| 1) (|error| "unknown binary op"))
                 (#3='T
                  (SEQ
                   (LETT |opPrec| (SPADCALL (QREFELT $ 16) |p| (QREFELT $ 50))
                         . #2#)
                   (LETT |s1|
                         (|TMFORM;formatExpr| (|SPADfirst| |args|) |opPrec| $)
                         . #2#)
                   (LETT |s2|
                         (|TMFORM;formatExpr| (|SPADfirst| (CDR |args|))
                          |opPrec| $)
                         . #2#)
                   (LETT |s|
                         (COND
                          ((EQUAL |op| '^)
                           (SPADCALL
                            (LIST
                             (SPADCALL "(concat "
                                       (SPADCALL |s1|
                                                 (SPADCALL "(rsup "
                                                           (SPADCALL |s2| "))"
                                                                     (QREFELT $
                                                                              52))
                                                           (QREFELT $ 52))
                                                 (QREFELT $ 52))
                                       (QREFELT $ 52)))
                            (QREFELT $ 39)))
                          ((EQUAL |op| '/)
                           (SPADCALL (LIST "(frac " |s1| " " |s2| ")")
                                     (QREFELT $ 39)))
                          (#3#
                           (COND
                            ((EQUAL |op| 'OVER)
                             (SPADCALL (LIST "(frac " |s1| " " |s2| ")")
                                       (QREFELT $ 39)))
                            (#3#
                             (SEQ
                              (LETT |ops|
                                    (COND ((EQUAL |op| '~=) "<ne>")
                                          ((EQUAL |op| '<) "<less>")
                                          ((EQUAL |op| '<=) "<leq>")
                                          ((EQUAL |op| '>) "<gtr>")
                                          ((EQUAL |op| '>=) "<geq>")
                                          ((EQUAL |op| '+->) "<mapsto>")
                                          (#3#
                                           (COND ((EQUAL |op| 'LET) ":=")
                                                 (#3#
                                                  (SPADCALL |op|
                                                            (QREFELT $ 46))))))
                                    . #2#)
                              (EXIT
                               (SPADCALL
                                (LIST "(concat " |s1| " \"" |ops| "\" " |s2|
                                      ")")
                                (QREFELT $ 39))))))))
                         . #2#)
                   (EXIT
                    (|TMFORM;group|
                     (COND
                      ((OR (OR (EQUAL |op| '/) (EQUAL |op| 'OVER))
                           (NULL (< |opPrec| |prec|)))
                       |s|)
                      ('T (|TMFORM;parenthesize| |s| $)))
                     $))))))))) 

(SDEFUN |TMFORM;formatNary|
        ((|op| |Symbol|) (|sep| |String|) (|opprec| |Integer|)
         (|args| |List| (|OutputForm|)) (|prec| |Integer|) ($ |String|))
        (|TMFORM;group|
         (|TMFORM;formatNaryNoGroup| |op| |sep| |opprec| |args| |prec| $) $)) 

(SDEFUN |TMFORM;formatNaryNoGroup|
        ((|op| |Symbol|) (|sep| |String|) (|opprec| |Integer|)
         (|args| |List| (|OutputForm|)) (|prec| |Integer|) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|l| (|List| (|String|))) (#1=#:G283 NIL) (|a| NIL)
          (|opPrec| (|Integer|)) (|ops| (|String|)) (|p| (|Integer|)))
         (SEQ
          (COND ((NULL |args|) "")
                (#2='T
                 (SEQ
                  (LETT |p| (SPADCALL |op| (QREFELT $ 17) (QREFELT $ 48))
                        . #3=(|TMFORM;formatNaryNoGroup|))
                  (EXIT
                   (COND ((< |p| 1) (|error| "unknown nary op"))
                         (#2#
                          (SEQ
                           (COND
                            ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 43))
                             (COND
                              ((SPADCALL (SPADCALL |args| 2 (QREFELT $ 44))
                                         'ZAG (QREFELT $ 54))
                               (EXIT
                                (COND
                                 ((SPADCALL |op| '+ (QREFELT $ 57))
                                  (|error| "ZAG in unexpected place"))
                                 ((SPADCALL (SPADCALL |args| 1 (QREFELT $ 44))
                                            'ZAG (QREFELT $ 54))
                                  (|TMFORM;formatZag| |args| $))
                                 (#2#
                                  (SPADCALL
                                   (LIST
                                    (|TMFORM;formatExpr| (|SPADfirst| |args|)
                                     (QREFELT $ 12) $)
                                    " \"+\" "
                                    (|TMFORM;formatZag| (CDR |args|) $))
                                   (QREFELT $ 39)))))))))
                           (LETT |ops|
                                 (COND ((EQUAL |op| 'STRSEP) |sep|)
                                       ((EQUAL |op| 'ROW) ") (cell ")
                                       ((EQUAL |op| 'TENSOR) " \"<otimes>\" ")
                                       (#2#
                                        (SPADCALL
                                         (LIST " \""
                                               (SPADCALL |op| (QREFELT $ 46))
                                               "\" ")
                                         (QREFELT $ 39))))
                                 . #3#)
                           (LETT |l| NIL . #3#)
                           (LETT |opPrec|
                                 (COND ((EQUAL |op| 'STRSEP) |opprec|)
                                       (#2#
                                        (SPADCALL (QREFELT $ 18) |p|
                                                  (QREFELT $ 50))))
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
                                               (|TMFORM;formatExpr| |a|
                                                |opPrec| $)
                                               |l|))
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT NIL))
                           (LETT |s|
                                 (SPADCALL (REVERSE (CDR |l|)) (QREFELT $ 39))
                                 . #3#)
                           (EXIT
                            (COND
                             ((< |opPrec| |prec|)
                              (|TMFORM;parenthesize| |s| $))
                             (#2# |s|))))))))))))) 

(SDEFUN |TMFORM;formatZag| ((|args| |List| (|OutputForm|)) ($ |String|))
        (SPROG ((|tmpZag| (|List| (|OutputForm|))) (|op| (|String|)))
               (SEQ
                (COND
                 ((SPADCALL (|SPADfirst| |args|) '|...| (QREFELT $ 56))
                  "<ldots>")
                 ((NULL (SPADCALL (|SPADfirst| |args|) 'ZAG (QREFELT $ 54)))
                  (LETT |op|
                        (|TMFORM;stringify|
                         (|SPADfirst|
                          (SPADCALL |args|
                                    (|error|
                                     (SPADCALL
                                      "formatZag: Last argument in ZAG construct "
                                      (SPADCALL "has unknown operator: " |op|
                                                (QREFELT $ 52))
                                      (QREFELT $ 52)))
                                    (QREFELT $ 58)))
                         $)
                        . #1=(|TMFORM;formatZag|)))
                 ('T
                  (SEQ
                   (LETT |tmpZag|
                         (SPADCALL (|SPADfirst| |args|) (QREFELT $ 55)) . #1#)
                   (EXIT
                    (COND
                     ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 43))
                      (SPADCALL "(frac "
                                (SPADCALL
                                 (|TMFORM;formatExpr| (|SPADfirst| |tmpZag|)
                                  (QREFELT $ 12) $)
                                 (SPADCALL "(concat "
                                           (SPADCALL
                                            (|TMFORM;formatExpr|
                                             (|SPADfirst| (CDR |tmpZag|))
                                             (QREFELT $ 12) $)
                                            (SPADCALL " \"+\" "
                                                      (SPADCALL
                                                       (|TMFORM;formatZag|
                                                        (CDR |args|) $)
                                                       "))" (QREFELT $ 52))
                                                      (QREFELT $ 52))
                                            (QREFELT $ 52))
                                           (QREFELT $ 52))
                                 (QREFELT $ 52))
                                (QREFELT $ 52)))
                     ('T
                      (SPADCALL "(frac "
                                (SPADCALL
                                 (|TMFORM;formatExpr| (|SPADfirst| |tmpZag|)
                                  (QREFELT $ 12) $)
                                 (SPADCALL
                                  (|TMFORM;formatExpr|
                                   (|SPADfirst| (CDR |tmpZag|)) (QREFELT $ 12)
                                   $)
                                  ")" (QREFELT $ 52))
                                 (QREFELT $ 52))
                                (QREFELT $ 52))))))))))) 

(SDEFUN |TMFORM;formatExpr|
        ((|expr| |OutputForm|) (|prec| |Integer|) ($ |String|))
        (SPROG
         ((|op| (|Symbol|)) (|nargs| (|Integer|))
          (|args| (|List| (|OutputForm|))) (|opf| (|OutputForm|))
          (|i| (|Integer|)) (|nstr| (|String|)) (|str| (|String|))
          (|len| (|Integer|)) (|intSplitLen| (|Integer|)))
         (SEQ (LETT |intSplitLen| 20 . #1=(|TMFORM;formatExpr|))
              (EXIT
               (COND
                ((SPADCALL |expr| (QREFELT $ 59))
                 (SEQ (LETT |str| (|TMFORM;stringify| |expr| $) . #1#)
                      (LETT |len| (QCSIZE |str|) . #1#)
                      (EXIT
                       (COND
                        ((SPADCALL |expr| (QREFELT $ 60))
                         (SEQ (LETT |i| (SPADCALL |expr| (QREFELT $ 61)) . #1#)
                              (EXIT
                               (COND
                                ((OR (< |i| 0) (SPADCALL |i| 9 (QREFELT $ 34)))
                                 (|TMFORM;group|
                                  (SEQ (LETT |nstr| "" . #1#)
                                       (SEQ G190
                                            (COND
                                             ((NULL
                                               (SPADCALL
                                                (LETT |len| (QCSIZE |str|)
                                                      . #1#)
                                                |intSplitLen| (QREFELT $ 34)))
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
                                                                               36))
                                                                    (QREFELT $
                                                                             37)))
                                                    (QREFELT $ 39))
                                                   . #1#)
                                             (EXIT
                                              (LETT |str|
                                                    (SPADCALL |str|
                                                              (SPADCALL
                                                               (+ |intSplitLen|
                                                                  1)
                                                               (QREFELT $ 62))
                                                              (QREFELT $ 37))
                                                    . #1#)))
                                            NIL (GO G190) G191 (EXIT NIL))
                                       (EXIT
                                        (COND
                                         ((SPADCALL |nstr| (QREFELT $ 63))
                                          (SPADCALL (LIST " \"" |str| "\" ")
                                                    (QREFELT $ 39)))
                                         (#2='T
                                          (SEQ
                                           (LETT |nstr|
                                                 (COND
                                                  ((SPADCALL |str|
                                                             (QREFELT $ 63))
                                                   |nstr|)
                                                  (#2#
                                                   (SPADCALL
                                                    (LIST |nstr| " " |str|)
                                                    (QREFELT $ 39))))
                                                 . #1#)
                                           (EXIT
                                            (SPADCALL
                                             (LIST
                                              (SPADCALL |nstr|
                                                        (SPADCALL 2
                                                                  (QREFELT $
                                                                           62))
                                                        (QREFELT $ 37)))
                                             (QREFELT $ 39))))))))
                                  $))
                                ('T
                                 (SPADCALL (LIST " \"" |str| "\" ")
                                           (QREFELT $ 39)))))))
                        ((EQUAL |str| "%pi") "<pi>") ((EQUAL |str| "%e") "e")
                        ((EQUAL |str| "%i") "i")
                        (#2#
                         (SEQ
                          (COND
                           ((SPADCALL |len| 0 (QREFELT $ 34))
                            (COND
                             ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 65))
                                        (|STR_to_CHAR| "%"))
                              (EXIT
                               (SPADCALL (LIST " \"" |str| "\" ")
                                         (QREFELT $ 39)))))))
                          (COND
                           ((SPADCALL |len| 0 (QREFELT $ 34))
                            (COND
                             ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 65))
                                        (|STR_to_CHAR| "\""))
                              (EXIT
                               (SPADCALL
                                (LIST "(text (concat " "\"\\\"\" "
                                      (SPADCALL
                                       (LIST "(math "
                                             (|TMFORM;utf2cork| |str| $) ")")
                                       (QREFELT $ 39))
                                      " \"\\\"\") )")
                                (QREFELT $ 39)))))))
                          (COND
                           ((EQL |len| 1)
                            (COND
                             ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 65))
                                        (|STR_to_CHAR| " "))
                              (EXIT " ")))))
                          (COND
                           ((SPADCALL |expr| (QREFELT $ 66))
                            (SEQ
                             (LETT |op| (SPADCALL |expr| (QREFELT $ 67)) . #1#)
                             (LETT |i|
                                   (SPADCALL |op| (QREFELT $ 23)
                                             (QREFELT $ 48))
                                   . #1#)
                             (EXIT
                              (COND
                               ((SPADCALL |i| 0 (QREFELT $ 34))
                                (SPADCALL (QREFELT $ 24) |i|
                                          (QREFELT $ 69))))))))
                          (LETT |i|
                                (SPADCALL (|STR_to_CHAR| " ") |str|
                                          (QREFELT $ 71))
                                . #1#)
                          (EXIT
                           (COND
                            ((SPADCALL |i| 0 (QREFELT $ 34))
                             (SPADCALL (LIST " \"" |str| "\" ")
                                       (QREFELT $ 39)))
                            (#2#
                             (|TMFORM;group|
                              (|TMFORM;utf2cork|
                               (SPADCALL (LIST " \"" |str| "\" ")
                                         (QREFELT $ 39))
                               $)
                              $))))))))))
                (#2#
                 (SEQ (LETT |opf| (SPADCALL |expr| (QREFELT $ 72)) . #1#)
                      (LETT |args| (SPADCALL |expr| (QREFELT $ 55)) . #1#)
                      (LETT |nargs| (LENGTH |args|) . #1#)
                      (EXIT
                       (COND
                        ((SPADCALL |opf| (QREFELT $ 66))
                         (SEQ (LETT |op| (SPADCALL |opf| (QREFELT $ 67)) . #1#)
                              (EXIT
                               (COND
                                ((SPADCALL |op| (QREFELT $ 22) (QREFELT $ 73))
                                 (|TMFORM;formatSpecial| |op| |args| |prec| $))
                                ((SPADCALL |op| (QREFELT $ 20) (QREFELT $ 73))
                                 (|TMFORM;formatPlex| |op| |args| |prec| $))
                                ((EQL 0 |nargs|)
                                 (|TMFORM;formatNullary| |op| $))
                                (#2#
                                 (SEQ
                                  (COND
                                   ((EQL 1 |nargs|)
                                    (COND
                                     ((SPADCALL |op| (QREFELT $ 13)
                                                (QREFELT $ 73))
                                      (EXIT
                                       (|TMFORM;formatUnary| |op|
                                        (|SPADfirst| |args|) |prec| $))))))
                                  (COND
                                   ((EQL 2 |nargs|)
                                    (COND
                                     ((SPADCALL |op| (QREFELT $ 15)
                                                (QREFELT $ 73))
                                      (EXIT
                                       (|TMFORM;formatBinary| |op| |args|
                                        |prec| $))))))
                                  (EXIT
                                   (COND
                                    ((SPADCALL |op| (QREFELT $ 19)
                                               (QREFELT $ 73))
                                     (|TMFORM;formatNaryNoGroup| |op| "" 0
                                      |args| |prec| $))
                                    ((SPADCALL |op| (QREFELT $ 17)
                                               (QREFELT $ 73))
                                     (|TMFORM;formatNary| |op| "" 0 |args|
                                      |prec| $))
                                    (#2#
                                     (|TMFORM;formatFunction| |opf| |args|
                                      |prec| $))))))))))
                        (#2#
                         (|TMFORM;formatFunction| |opf| |args| |prec|
                          $))))))))))) 

(DECLAIM (NOTINLINE |TexmacsFormat;|)) 

(DEFUN |TexmacsFormat| ()
  (SPROG NIL
         (PROG (#1=#:G317)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|TexmacsFormat|)
                    . #2=(|TexmacsFormat|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|TexmacsFormat|
                             (LIST (CONS NIL (CONS 1 (|TexmacsFormat;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|TexmacsFormat|)))))))))) 

(DEFUN |TexmacsFormat;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|TexmacsFormat|) . #1=(|TexmacsFormat|))
          (LETT $ (GETREFV 75) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TexmacsFormat| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9
                    (LIST (CONS "<less>" (SPADCALL 60 (QREFELT $ 8)))
                          (CONS "<gtr>" (SPADCALL 62 (QREFELT $ 8)))
                          (CONS "<varspace>" (SPADCALL 160 (QREFELT $ 8)))
                          (CONS "<cent>" (SPADCALL 162 (QREFELT $ 8)))
                          (CONS "<sterling>" (SPADCALL 163 (QREFELT $ 8)))
                          (CONS "<currency>" (SPADCALL 164 (QREFELT $ 8)))
                          (CONS "<yen>" (SPADCALL 165 (QREFELT $ 8)))
                          (CONS "<brokenvert>" (SPADCALL 166 (QREFELT $ 8)))
                          (CONS "<copyright>" (SPADCALL 169 (QREFELT $ 8)))
                          (CONS "<ordfeminine>" (SPADCALL 170 (QREFELT $ 8)))
                          (CONS "<guillemotleft>" (SPADCALL 171 (QREFELT $ 8)))
                          (CONS "<neg>" (SPADCALL 172 (QREFELT $ 8)))
                          (CONS "<hyphen>" (SPADCALL 173 (QREFELT $ 8)))
                          (CONS "<circledR>" (SPADCALL 174 (QREFELT $ 8)))
                          (CONS "<degree>" (SPADCALL 176 (QREFELT $ 8)))
                          (CONS "<pm>" (SPADCALL 177 (QREFELT $ 8)))
                          (CONS "<twosuperior>" (SPADCALL 178 (QREFELT $ 8)))
                          (CONS "<threesuperior>" (SPADCALL 179 (QREFELT $ 8)))
                          (CONS #2="<mu>" (SPADCALL 181 (QREFELT $ 8)))
                          (CONS "<paragraph>" (SPADCALL 182 (QREFELT $ 8)))
                          (CONS "<centerdot>" (SPADCALL 183 (QREFELT $ 8)))
                          (CONS "<onesuperior>" (SPADCALL 185 (QREFELT $ 8)))
                          (CONS "<masculine>" (SPADCALL 186 (QREFELT $ 8)))
                          (CONS "<onequarter>" (SPADCALL 188 (QREFELT $ 8)))
                          (CONS "<onehalf>" (SPADCALL 189 (QREFELT $ 8)))
                          (CONS "<threequarters>" (SPADCALL 190 (QREFELT $ 8)))
                          (CONS "<times>" (SPADCALL 215 (QREFELT $ 8)))
                          (CONS "<div>" (SPADCALL 247 (QREFELT $ 8)))
                          (CONS "<nbhyph>" (SPADCALL 8209 (QREFELT $ 8)))
                          (CONS "<||>" (SPADCALL 8214 (QREFELT $ 8)))
                          (CONS "<dagger>" (SPADCALL 8224 (QREFELT $ 8)))
                          (CONS "<ddagger>" (SPADCALL 8225 (QREFELT $ 8)))
                          (CONS "<bullet>" (SPADCALL 8226 (QREFELT $ 8)))
                          (CONS "..." (SPADCALL 8230 (QREFELT $ 8)))
                          (CONS "<prime>" (SPADCALL 8242 (QREFELT $ 8)))
                          (CONS "<backprime>" (SPADCALL 8245 (QREFELT $ 8)))
                          (CONS "<bbb-C>" (SPADCALL 8450 (QREFELT $ 8)))
                          (CONS "<cal-g>" (SPADCALL 8458 (QREFELT $ 8)))
                          (CONS "<cal-H>" (SPADCALL 8459 (QREFELT $ 8)))
                          (CONS "<frak-H>" (SPADCALL 8460 (QREFELT $ 8)))
                          (CONS "<bbb-H>" (SPADCALL 8461 (QREFELT $ 8)))
                          (CONS "<hslash>" (SPADCALL 8463 (QREFELT $ 8)))
                          (CONS "<cal-I>" (SPADCALL 8464 (QREFELT $ 8)))
                          (CONS "<frak-I>" (SPADCALL 8465 (QREFELT $ 8)))
                          (CONS "<cal-L>" (SPADCALL 8466 (QREFELT $ 8)))
                          (CONS "<ell>" (SPADCALL 8467 (QREFELT $ 8)))
                          (CONS "<bbb-N>" (SPADCALL 8469 (QREFELT $ 8)))
                          (CONS "<wp>" (SPADCALL 8472 (QREFELT $ 8)))
                          (CONS "<bbb-P>" (SPADCALL 8473 (QREFELT $ 8)))
                          (CONS "<bbb-Q>" (SPADCALL 8474 (QREFELT $ 8)))
                          (CONS "<cal-R>" (SPADCALL 8475 (QREFELT $ 8)))
                          (CONS "<frak-R>" (SPADCALL 8476 (QREFELT $ 8)))
                          (CONS "<bbb-R>" (SPADCALL 8477 (QREFELT $ 8)))
                          (CONS "<trademark>" (SPADCALL 8482 (QREFELT $ 8)))
                          (CONS "<bbb-Z>" (SPADCALL 8484 (QREFELT $ 8)))
                          (CONS "<Mho>" (SPADCALL 8487 (QREFELT $ 8)))
                          (CONS "<frak-Z>" (SPADCALL 8488 (QREFELT $ 8)))
                          (CONS "<cal-B>" (SPADCALL 8492 (QREFELT $ 8)))
                          (CONS "<frak-C>" (SPADCALL 8493 (QREFELT $ 8)))
                          (CONS "<cal-e>" (SPADCALL 8495 (QREFELT $ 8)))
                          (CONS "<cal-E>" (SPADCALL 8496 (QREFELT $ 8)))
                          (CONS "<cal-F>" (SPADCALL 8497 (QREFELT $ 8)))
                          (CONS "<cal-M>" (SPADCALL 8499 (QREFELT $ 8)))
                          (CONS "<cal-o>" (SPADCALL 8500 (QREFELT $ 8)))
                          (CONS "<aleph>" (SPADCALL 8501 (QREFELT $ 8)))
                          (CONS "<beth>" (SPADCALL 8502 (QREFELT $ 8)))
                          (CONS "<gimel>" (SPADCALL 8503 (QREFELT $ 8)))
                          (CONS "<daleth>" (SPADCALL 8504 (QREFELT $ 8)))
                          (CONS "<leftarrow>" (SPADCALL 8592 (QREFELT $ 8)))
                          (CONS "<uparrow>" (SPADCALL 8593 (QREFELT $ 8)))
                          (CONS "<rightarrow>" (SPADCALL 8594 (QREFELT $ 8)))
                          (CONS "<downarrow>" (SPADCALL 8595 (QREFELT $ 8)))
                          (CONS "<leftrightarrow>"
                                (SPADCALL 8596 (QREFELT $ 8)))
                          (CONS "<updownarrow>" (SPADCALL 8597 (QREFELT $ 8)))
                          (CONS "<nwarrow>" (SPADCALL 8598 (QREFELT $ 8)))
                          (CONS "<nearrow>" (SPADCALL 8599 (QREFELT $ 8)))
                          (CONS "<searrow>" (SPADCALL 8600 (QREFELT $ 8)))
                          (CONS "<swarrow>" (SPADCALL 8601 (QREFELT $ 8)))
                          (CONS "<nleftarrow>" (SPADCALL 8602 (QREFELT $ 8)))
                          (CONS "<nrightarrow>" (SPADCALL 8603 (QREFELT $ 8)))
                          (CONS "<leftsquigarrow>"
                                (SPADCALL 8604 (QREFELT $ 8)))
                          (CONS "<rightsquigarrow>"
                                (SPADCALL 8605 (QREFELT $ 8)))
                          (CONS "<twoheadleftarrow>"
                                (SPADCALL 8606 (QREFELT $ 8)))
                          (CONS "<twoheadrightarrow>"
                                (SPADCALL 8608 (QREFELT $ 8)))
                          (CONS "<leftarrowtail>"
                                (SPADCALL 8610 (QREFELT $ 8)))
                          (CONS "<rightarrowtail>"
                                (SPADCALL 8611 (QREFELT $ 8)))
                          (CONS "<mapsfrom>" (SPADCALL 8612 (QREFELT $ 8)))
                          (CONS "<mapsto>" (SPADCALL 8614 (QREFELT $ 8)))
                          (CONS "<hookleftarrow>"
                                (SPADCALL 8617 (QREFELT $ 8)))
                          (CONS "<hookrightarrow>"
                                (SPADCALL 8618 (QREFELT $ 8)))
                          (CONS "<looparrowleft>"
                                (SPADCALL 8619 (QREFELT $ 8)))
                          (CONS "<looparrowright>"
                                (SPADCALL 8620 (QREFELT $ 8)))
                          (CONS "<leftrightsquigarrow>"
                                (SPADCALL 8621 (QREFELT $ 8)))
                          (CONS "<nleftrightarrow>"
                                (SPADCALL 8622 (QREFELT $ 8)))
                          (CONS "<lightning>" (SPADCALL 8623 (QREFELT $ 8)))
                          (CONS "<Lsh>" (SPADCALL 8624 (QREFELT $ 8)))
                          (CONS "<Rsh>" (SPADCALL 8625 (QREFELT $ 8)))
                          (CONS "<curvearrowleft>"
                                (SPADCALL 8630 (QREFELT $ 8)))
                          (CONS "<curvearrowright>"
                                (SPADCALL 8631 (QREFELT $ 8)))
                          (CONS "<circlearrowleft>"
                                (SPADCALL 8634 (QREFELT $ 8)))
                          (CONS "<circlearrowright>"
                                (SPADCALL 8635 (QREFELT $ 8)))
                          (CONS "<leftharpoonup>"
                                (SPADCALL 8636 (QREFELT $ 8)))
                          (CONS "<leftharpoondown>"
                                (SPADCALL 8637 (QREFELT $ 8)))
                          (CONS "<upharpoonright>"
                                (SPADCALL 8638 (QREFELT $ 8)))
                          (CONS "<upharpoonleft>"
                                (SPADCALL 8639 (QREFELT $ 8)))
                          (CONS "<rightharpoonup>"
                                (SPADCALL 8640 (QREFELT $ 8)))
                          (CONS "<rightharpoondown>"
                                (SPADCALL 8641 (QREFELT $ 8)))
                          (CONS "<downharpoonright>"
                                (SPADCALL 8642 (QREFELT $ 8)))
                          (CONS "<downharpoonleft>"
                                (SPADCALL 8643 (QREFELT $ 8)))
                          (CONS "<rightleftarrows>"
                                (SPADCALL 8644 (QREFELT $ 8)))
                          (CONS "<leftrightarrows>"
                                (SPADCALL 8646 (QREFELT $ 8)))
                          (CONS "<leftleftarrows>"
                                (SPADCALL 8647 (QREFELT $ 8)))
                          (CONS "<upuparrows>" (SPADCALL 8648 (QREFELT $ 8)))
                          (CONS "<rightrightarrows>"
                                (SPADCALL 8649 (QREFELT $ 8)))
                          (CONS "<downdownarrows>"
                                (SPADCALL 8650 (QREFELT $ 8)))
                          (CONS "<leftrightharpoons>"
                                (SPADCALL 8651 (QREFELT $ 8)))
                          (CONS "<rightleftharpoons>"
                                (SPADCALL 8652 (QREFELT $ 8)))
                          (CONS "<nLeftarrow>" (SPADCALL 8653 (QREFELT $ 8)))
                          (CONS "<nLeftrightarrow>"
                                (SPADCALL 8654 (QREFELT $ 8)))
                          (CONS "<nRightarrow>" (SPADCALL 8655 (QREFELT $ 8)))
                          (CONS "<Leftarrow>" (SPADCALL 8656 (QREFELT $ 8)))
                          (CONS "<Uparrow>" (SPADCALL 8657 (QREFELT $ 8)))
                          (CONS "<Rightarrow>" (SPADCALL 8658 (QREFELT $ 8)))
                          (CONS "<Downarrow>" (SPADCALL 8659 (QREFELT $ 8)))
                          (CONS "<Leftrightarrow>"
                                (SPADCALL 8660 (QREFELT $ 8)))
                          (CONS "<Updownarrow>" (SPADCALL 8661 (QREFELT $ 8)))
                          (CONS "<Lleftarrow>" (SPADCALL 8666 (QREFELT $ 8)))
                          (CONS "<Rrightarrow>" (SPADCALL 8667 (QREFELT $ 8)))
                          (CONS "<forall>" (SPADCALL 8704 (QREFELT $ 8)))
                          (CONS "<complement>" (SPADCALL 8705 (QREFELT $ 8)))
                          (CONS "<partial>" (SPADCALL 8706 (QREFELT $ 8)))
                          (CONS "<exists>" (SPADCALL 8707 (QREFELT $ 8)))
                          (CONS "<nexists>" (SPADCALL 8708 (QREFELT $ 8)))
                          (CONS "<emptyset>" (SPADCALL 8709 (QREFELT $ 8)))
                          (CONS "<nabla>" (SPADCALL 8711 (QREFELT $ 8)))
                          (CONS "<in>" (SPADCALL 8712 (QREFELT $ 8)))
                          (CONS "<nin>" (SPADCALL 8713 (QREFELT $ 8)))
                          (CONS "<ni>" (SPADCALL 8715 (QREFELT $ 8)))
                          (CONS "<nni>" (SPADCALL 8716 (QREFELT $ 8)))
                          (CONS "<big-prod>" (SPADCALL 8719 (QREFELT $ 8)))
                          (CONS "<big-amalg>" (SPADCALL 8720 (QREFELT $ 8)))
                          (CONS "<big-sum>" (SPADCALL 8721 (QREFELT $ 8)))
                          (CONS "<minus>" (SPADCALL 8722 (QREFELT $ 8)))
                          (CONS "<mp>" (SPADCALL 8723 (QREFELT $ 8)))
                          (CONS "<dotplus>" (SPADCALL 8724 (QREFELT $ 8)))
                          (CONS "<setminus>" (SPADCALL 8726 (QREFELT $ 8)))
                          (CONS "<ast>" (SPADCALL 8727 (QREFELT $ 8)))
                          (CONS "<circ>" (SPADCALL 8728 (QREFELT $ 8)))
                          (CONS "<sqrt>" (SPADCALL 8730 (QREFELT $ 8)))
                          (CONS "<propto>" (SPADCALL 8733 (QREFELT $ 8)))
                          (CONS "<infty>" (SPADCALL 8734 (QREFELT $ 8)))
                          (CONS "<angle>" (SPADCALL 8736 (QREFELT $ 8)))
                          (CONS "<measuredangle>"
                                (SPADCALL 8737 (QREFELT $ 8)))
                          (CONS "<sphericalangle>"
                                (SPADCALL 8738 (QREFELT $ 8)))
                          (CONS "<mid>" (SPADCALL 8739 (QREFELT $ 8)))
                          (CONS "<nmid>" (SPADCALL 8740 (QREFELT $ 8)))
                          (CONS "<parallel>" (SPADCALL 8741 (QREFELT $ 8)))
                          (CONS "<nparallel>" (SPADCALL 8742 (QREFELT $ 8)))
                          (CONS "<wedge>" (SPADCALL 8743 (QREFELT $ 8)))
                          (CONS "<vee>" (SPADCALL 8744 (QREFELT $ 8)))
                          (CONS "<cap>" (SPADCALL 8745 (QREFELT $ 8)))
                          (CONS "<cup>" (SPADCALL 8746 (QREFELT $ 8)))
                          (CONS "<big-int>" (SPADCALL 8747 (QREFELT $ 8)))
                          (CONS "<big-oint>" (SPADCALL 8750 (QREFELT $ 8)))
                          (CONS "<therefore>" (SPADCALL 8756 (QREFELT $ 8)))
                          (CONS "<because>" (SPADCALL 8757 (QREFELT $ 8)))
                          (CONS "<sim>" (SPADCALL 8764 (QREFELT $ 8)))
                          (CONS "<backsim>" (SPADCALL 8765 (QREFELT $ 8)))
                          (CONS "<wr>" (SPADCALL 8768 (QREFELT $ 8)))
                          (CONS "<nsim>" (SPADCALL 8769 (QREFELT $ 8)))
                          (CONS "<eqsim>" (SPADCALL 8770 (QREFELT $ 8)))
                          (CONS "<simeq>" (SPADCALL 8771 (QREFELT $ 8)))
                          (CONS "<nsimeq>" (SPADCALL 8772 (QREFELT $ 8)))
                          (CONS "<cong>" (SPADCALL 8773 (QREFELT $ 8)))
                          (CONS "<ncong>" (SPADCALL 8775 (QREFELT $ 8)))
                          (CONS "<approx>" (SPADCALL 8776 (QREFELT $ 8)))
                          (CONS "<napprox>" (SPADCALL 8777 (QREFELT $ 8)))
                          (CONS "<approxeq>" (SPADCALL 8778 (QREFELT $ 8)))
                          (CONS "<asymp>" (SPADCALL 8781 (QREFELT $ 8)))
                          (CONS "<Bumpeq>" (SPADCALL 8782 (QREFELT $ 8)))
                          (CONS "<bumpeq>" (SPADCALL 8783 (QREFELT $ 8)))
                          (CONS "<doteq>" (SPADCALL 8784 (QREFELT $ 8)))
                          (CONS "<doteqdot>" (SPADCALL 8785 (QREFELT $ 8)))
                          (CONS "<fallingdoteq>" (SPADCALL 8786 (QREFELT $ 8)))
                          (CONS "<risingdoteq>" (SPADCALL 8787 (QREFELT $ 8)))
                          (CONS "<assign>" (SPADCALL 8788 (QREFELT $ 8)))
                          (CONS "<eqcirc>" (SPADCALL 8790 (QREFELT $ 8)))
                          (CONS "<circeq>" (SPADCALL 8791 (QREFELT $ 8)))
                          (CONS "<triangleq>" (SPADCALL 8796 (QREFELT $ 8)))
                          (CONS "<neq>" (SPADCALL 8800 (QREFELT $ 8)))
                          (CONS "<equiv>" (SPADCALL 8801 (QREFELT $ 8)))
                          (CONS "<nequiv>" (SPADCALL 8802 (QREFELT $ 8)))
                          (CONS "<leq>" (SPADCALL 8804 (QREFELT $ 8)))
                          (CONS "<geq>" (SPADCALL 8805 (QREFELT $ 8)))
                          (CONS "<leqq>" (SPADCALL 8806 (QREFELT $ 8)))
                          (CONS "<geqq>" (SPADCALL 8807 (QREFELT $ 8)))
                          (CONS "<lneqq>" (SPADCALL 8808 (QREFELT $ 8)))
                          (CONS "<gneqq>" (SPADCALL 8809 (QREFELT $ 8)))
                          (CONS "<ll>" (SPADCALL 8810 (QREFELT $ 8)))
                          (CONS "<gg>" (SPADCALL 8811 (QREFELT $ 8)))
                          (CONS "<between>" (SPADCALL 8812 (QREFELT $ 8)))
                          (CONS "<nasymp>" (SPADCALL 8813 (QREFELT $ 8)))
                          (CONS "<nless>" (SPADCALL 8814 (QREFELT $ 8)))
                          (CONS "<ngtr>" (SPADCALL 8815 (QREFELT $ 8)))
                          (CONS "<nleq>" (SPADCALL 8816 (QREFELT $ 8)))
                          (CONS "<ngeq>" (SPADCALL 8817 (QREFELT $ 8)))
                          (CONS "<lesssim>" (SPADCALL 8818 (QREFELT $ 8)))
                          (CONS "<gtrsim>" (SPADCALL 8819 (QREFELT $ 8)))
                          (CONS "<lessgtr>" (SPADCALL 8822 (QREFELT $ 8)))
                          (CONS "<gtrless>" (SPADCALL 8823 (QREFELT $ 8)))
                          (CONS "<prec>" (SPADCALL 8826 (QREFELT $ 8)))
                          (CONS "<succ>" (SPADCALL 8827 (QREFELT $ 8)))
                          (CONS "<preccurlyeq>" (SPADCALL 8828 (QREFELT $ 8)))
                          (CONS "<succcurlyeq>" (SPADCALL 8829 (QREFELT $ 8)))
                          (CONS "<precsim>" (SPADCALL 8830 (QREFELT $ 8)))
                          (CONS "<succsim>" (SPADCALL 8831 (QREFELT $ 8)))
                          (CONS "<nprec>" (SPADCALL 8832 (QREFELT $ 8)))
                          (CONS "<nsucc>" (SPADCALL 8833 (QREFELT $ 8)))
                          (CONS "<subset>" (SPADCALL 8834 (QREFELT $ 8)))
                          (CONS "<supset>" (SPADCALL 8835 (QREFELT $ 8)))
                          (CONS "<nsubset>" (SPADCALL 8836 (QREFELT $ 8)))
                          (CONS "<nsupset>" (SPADCALL 8837 (QREFELT $ 8)))
                          (CONS "<subseteq>" (SPADCALL 8838 (QREFELT $ 8)))
                          (CONS "<supseteq>" (SPADCALL 8839 (QREFELT $ 8)))
                          (CONS "<nsubseteq>" (SPADCALL 8840 (QREFELT $ 8)))
                          (CONS "<nsupseteq>" (SPADCALL 8841 (QREFELT $ 8)))
                          (CONS "<subsetneq>" (SPADCALL 8842 (QREFELT $ 8)))
                          (CONS "<supsetneq>" (SPADCALL 8843 (QREFELT $ 8)))
                          (CONS "<uplus>" (SPADCALL 8846 (QREFELT $ 8)))
                          (CONS "<sqsubset>" (SPADCALL 8847 (QREFELT $ 8)))
                          (CONS "<sqsupset>" (SPADCALL 8848 (QREFELT $ 8)))
                          (CONS "<sqsubseteq>" (SPADCALL 8849 (QREFELT $ 8)))
                          (CONS "<sqsupseteq>" (SPADCALL 8850 (QREFELT $ 8)))
                          (CONS "<sqcap>" (SPADCALL 8851 (QREFELT $ 8)))
                          (CONS "<sqcup>" (SPADCALL 8852 (QREFELT $ 8)))
                          (CONS "<varoplus>" (SPADCALL 8853 (QREFELT $ 8)))
                          (CONS "<varominus>" (SPADCALL 8854 (QREFELT $ 8)))
                          (CONS "<varotimes>" (SPADCALL 8855 (QREFELT $ 8)))
                          (CONS "<varoslash>" (SPADCALL 8856 (QREFELT $ 8)))
                          (CONS "<varodot>" (SPADCALL 8857 (QREFELT $ 8)))
                          (CONS "<varocircle>" (SPADCALL 8858 (QREFELT $ 8)))
                          (CONS "<varoast>" (SPADCALL 8859 (QREFELT $ 8)))
                          (CONS "<circleddash>" (SPADCALL 8861 (QREFELT $ 8)))
                          (CONS "<boxplus>" (SPADCALL 8862 (QREFELT $ 8)))
                          (CONS "<boxminus>" (SPADCALL 8863 (QREFELT $ 8)))
                          (CONS "<boxtimes>" (SPADCALL 8864 (QREFELT $ 8)))
                          (CONS "<boxdot>" (SPADCALL 8865 (QREFELT $ 8)))
                          (CONS "<vdash>" (SPADCALL 8866 (QREFELT $ 8)))
                          (CONS "<dashv>" (SPADCALL 8867 (QREFELT $ 8)))
                          (CONS "<top>" (SPADCALL 8868 (QREFELT $ 8)))
                          (CONS "<bot>" (SPADCALL 8869 (QREFELT $ 8)))
                          (CONS "<models>" (SPADCALL 8871 (QREFELT $ 8)))
                          (CONS "<vDash>" (SPADCALL 8872 (QREFELT $ 8)))
                          (CONS "<Vdash>" (SPADCALL 8873 (QREFELT $ 8)))
                          (CONS "<Vvdash>" (SPADCALL 8874 (QREFELT $ 8)))
                          (CONS "<nvdash>" (SPADCALL 8876 (QREFELT $ 8)))
                          (CONS "<nvDash>" (SPADCALL 8877 (QREFELT $ 8)))
                          (CONS "<nVdash>" (SPADCALL 8878 (QREFELT $ 8)))
                          (CONS "<nVDash>" (SPADCALL 8879 (QREFELT $ 8)))
                          (CONS "<vartriangleleft>"
                                (SPADCALL 8882 (QREFELT $ 8)))
                          (CONS "<vartriangleright>"
                                (SPADCALL 8883 (QREFELT $ 8)))
                          (CONS "<trianglelefteq>"
                                (SPADCALL 8884 (QREFELT $ 8)))
                          (CONS "<trianglerighteq>"
                                (SPADCALL 8885 (QREFELT $ 8)))
                          (CONS "<multimap>" (SPADCALL 8888 (QREFELT $ 8)))
                          (CONS "<intercal>" (SPADCALL 8890 (QREFELT $ 8)))
                          (CONS "<veebar>" (SPADCALL 8891 (QREFELT $ 8)))
                          (CONS "<big-wedge>" (SPADCALL 8896 (QREFELT $ 8)))
                          (CONS "<big-vee>" (SPADCALL 8897 (QREFELT $ 8)))
                          (CONS "<big-cap>" (SPADCALL 8898 (QREFELT $ 8)))
                          (CONS "<big-cup>" (SPADCALL 8899 (QREFELT $ 8)))
                          (CONS "<diamond>" (SPADCALL 8900 (QREFELT $ 8)))
                          (CONS "<cdot>" (SPADCALL 8901 (QREFELT $ 8)))
                          (CONS "<star>" (SPADCALL 8902 (QREFELT $ 8)))
                          (CONS "<divideontimes>"
                                (SPADCALL 8903 (QREFELT $ 8)))
                          (CONS "<join>" (SPADCALL 8904 (QREFELT $ 8)))
                          (CONS "<ltimes>" (SPADCALL 8905 (QREFELT $ 8)))
                          (CONS "<rtimes>" (SPADCALL 8906 (QREFELT $ 8)))
                          (CONS "<leftthreetimes>"
                                (SPADCALL 8907 (QREFELT $ 8)))
                          (CONS "<rightthreetimes>"
                                (SPADCALL 8908 (QREFELT $ 8)))
                          (CONS "<backsimeq>" (SPADCALL 8909 (QREFELT $ 8)))
                          (CONS "<curlyvee>" (SPADCALL 8910 (QREFELT $ 8)))
                          (CONS "<curlywedge>" (SPADCALL 8911 (QREFELT $ 8)))
                          (CONS "<Subset>" (SPADCALL 8912 (QREFELT $ 8)))
                          (CONS "<Supset>" (SPADCALL 8913 (QREFELT $ 8)))
                          (CONS "<Cap>" (SPADCALL 8914 (QREFELT $ 8)))
                          (CONS "<Cup>" (SPADCALL 8915 (QREFELT $ 8)))
                          (CONS "<pitchfork>" (SPADCALL 8916 (QREFELT $ 8)))
                          (CONS "<lessdot>" (SPADCALL 8918 (QREFELT $ 8)))
                          (CONS "<gtrdot>" (SPADCALL 8919 (QREFELT $ 8)))
                          (CONS "<lll>" (SPADCALL 8920 (QREFELT $ 8)))
                          (CONS "<ggg>" (SPADCALL 8921 (QREFELT $ 8)))
                          (CONS "<lesseqgtr>" (SPADCALL 8922 (QREFELT $ 8)))
                          (CONS "<gtreqless>" (SPADCALL 8923 (QREFELT $ 8)))
                          (CONS "<curlyeqprec>" (SPADCALL 8926 (QREFELT $ 8)))
                          (CONS "<curlyeqsucc>" (SPADCALL 8927 (QREFELT $ 8)))
                          (CONS "<npreccurlyeq>" (SPADCALL 8928 (QREFELT $ 8)))
                          (CONS "<nsucccurlyeq>" (SPADCALL 8929 (QREFELT $ 8)))
                          (CONS "<nsqsubseteq>" (SPADCALL 8930 (QREFELT $ 8)))
                          (CONS "<nsqsupseteq>" (SPADCALL 8931 (QREFELT $ 8)))
                          (CONS "<lnsim>" (SPADCALL 8934 (QREFELT $ 8)))
                          (CONS "<gnsim>" (SPADCALL 8935 (QREFELT $ 8)))
                          (CONS "<precnsim>" (SPADCALL 8936 (QREFELT $ 8)))
                          (CONS "<succnsim>" (SPADCALL 8937 (QREFELT $ 8)))
                          (CONS "<ntriangleleft>"
                                (SPADCALL 8938 (QREFELT $ 8)))
                          (CONS "<ntriangleright>"
                                (SPADCALL 8939 (QREFELT $ 8)))
                          (CONS "<ntrianglelefteq>"
                                (SPADCALL 8940 (QREFELT $ 8)))
                          (CONS "<ntrianglerighteq>"
                                (SPADCALL 8941 (QREFELT $ 8)))
                          (CONS "<vdots>" (SPADCALL 8942 (QREFELT $ 8)))
                          (CONS "<cdots>" (SPADCALL 8943 (QREFELT $ 8)))
                          (CONS "<udots>" (SPADCALL 8944 (QREFELT $ 8)))
                          (CONS "<ddots>" (SPADCALL 8945 (QREFELT $ 8)))
                          (CONS "<diameter>" (SPADCALL 8960 (QREFELT $ 8)))
                          (CONS "<barwedge>" (SPADCALL 8965 (QREFELT $ 8)))
                          (CONS "<doublebarwedge>"
                                (SPADCALL 8966 (QREFELT $ 8)))
                          (CONS "<lceil>" (SPADCALL 8968 (QREFELT $ 8)))
                          (CONS "<rceil>" (SPADCALL 8969 (QREFELT $ 8)))
                          (CONS "<lfloor>" (SPADCALL 8970 (QREFELT $ 8)))
                          (CONS "<rfloor>" (SPADCALL 8971 (QREFELT $ 8)))
                          (CONS "<invneg>" (SPADCALL 8976 (QREFELT $ 8)))
                          (CONS "<recorder>" (SPADCALL 8981 (QREFELT $ 8)))
                          (CONS "<ulcorner>" (SPADCALL 8988 (QREFELT $ 8)))
                          (CONS "<urcorner>" (SPADCALL 8989 (QREFELT $ 8)))
                          (CONS "<llcorner>" (SPADCALL 8990 (QREFELT $ 8)))
                          (CONS "<lrcorner>" (SPADCALL 8991 (QREFELT $ 8)))
                          (CONS "<frown>" (SPADCALL 8994 (QREFELT $ 8)))
                          (CONS "<smile>" (SPADCALL 8995 (QREFELT $ 8)))
                          (CONS "<talloblong>" (SPADCALL 9016 (QREFELT $ 8)))
                          (CONS "<APLleftarrowbox>"
                                (SPADCALL 9031 (QREFELT $ 8)))
                          (CONS "<APLrightarrowbox>"
                                (SPADCALL 9032 (QREFELT $ 8)))
                          (CONS "<APLuparrowbox>"
                                (SPADCALL 9040 (QREFELT $ 8)))
                          (CONS "<APLdownarrowbox>"
                                (SPADCALL 9047 (QREFELT $ 8)))
                          (CONS "<APLinput>" (SPADCALL 9054 (QREFELT $ 8)))
                          (CONS "<APLbox>" (SPADCALL 9109 (QREFELT $ 8)))
                          (CONS "<circledS>" (SPADCALL 9416 (QREFELT $ 8)))
                          (CONS "<blacksquare>" (SPADCALL 9632 (QREFELT $ 8)))
                          (CONS "<Square>" (SPADCALL 9633 (QREFELT $ 8)))
                          (CONS "<oblong>" (SPADCALL 9647 (QREFELT $ 8)))
                          (CONS "<bigtriangleup>"
                                (SPADCALL 9651 (QREFELT $ 8)))
                          (CONS "<blacktriangle>"
                                (SPADCALL 9652 (QREFELT $ 8)))
                          (CONS "<vartriangle>" (SPADCALL 9653 (QREFELT $ 8)))
                          (CONS "<blacktriangleright>"
                                (SPADCALL 9656 (QREFELT $ 8)))
                          (CONS "<triangleright>"
                                (SPADCALL 9657 (QREFELT $ 8)))
                          (CONS "<bigtriangledown>"
                                (SPADCALL 9661 (QREFELT $ 8)))
                          (CONS "<blacktriangledown>"
                                (SPADCALL 9662 (QREFELT $ 8)))
                          (CONS "<triangledown>" (SPADCALL 9663 (QREFELT $ 8)))
                          (CONS "<blacktriangleleft>"
                                (SPADCALL 9666 (QREFELT $ 8)))
                          (CONS "<triangleleft>" (SPADCALL 9667 (QREFELT $ 8)))
                          (CONS "<wasyDiamond>" (SPADCALL 9671 (QREFELT $ 8)))
                          (CONS "<lozenge>" (SPADCALL 9674 (QREFELT $ 8)))
                          (CONS "<Circle>" (SPADCALL 9675 (QREFELT $ 8)))
                          (CONS "<CIRCLE>" (SPADCALL 9679 (QREFELT $ 8)))
                          (CONS "<LEFTcircle>" (SPADCALL 9680 (QREFELT $ 8)))
                          (CONS "<RIGHTcircle>" (SPADCALL 9681 (QREFELT $ 8)))
                          (CONS "<LEFTCIRCLE>" (SPADCALL 9686 (QREFELT $ 8)))
                          (CONS "<RIGHTCIRCLE>" (SPADCALL 9687 (QREFELT $ 8)))
                          (CONS "<varbigcirc>" (SPADCALL 9711 (QREFELT $ 8)))
                          (CONS "<square>" (SPADCALL 9725 (QREFELT $ 8)))
                          (CONS "<bigstar>" (SPADCALL 9733 (QREFELT $ 8)))
                          (CONS "<astrosun>" (SPADCALL 9737 (QREFELT $ 8)))
                          (CONS "<ascnode>" (SPADCALL 9738 (QREFELT $ 8)))
                          (CONS "<descnode>" (SPADCALL 9739 (QREFELT $ 8)))
                          (CONS "<conjunction>" (SPADCALL 9740 (QREFELT $ 8)))
                          (CONS "<opposition>" (SPADCALL 9741 (QREFELT $ 8)))
                          (CONS "<phone>" (SPADCALL 9742 (QREFELT $ 8)))
                          (CONS "<XBox>" (SPADCALL 9745 (QREFELT $ 8)))
                          (CONS "<CheckedBox>" (SPADCALL 9746 (QREFELT $ 8)))
                          (CONS "<frownie>" (SPADCALL 9785 (QREFELT $ 8)))
                          (CONS "<smiley>" (SPADCALL 9786 (QREFELT $ 8)))
                          (CONS "<blacksmiley>" (SPADCALL 9787 (QREFELT $ 8)))
                          (CONS "<sun>" (SPADCALL 9788 (QREFELT $ 8)))
                          (CONS "<rightmoon>" (SPADCALL 9789 (QREFELT $ 8)))
                          (CONS "<leftmoon>" (SPADCALL 9790 (QREFELT $ 8)))
                          (CONS "<mercury>" (SPADCALL 9791 (QREFELT $ 8)))
                          (CONS "<female>" (SPADCALL 9792 (QREFELT $ 8)))
                          (CONS "<earth>" (SPADCALL 9793 (QREFELT $ 8)))
                          (CONS "<male>" (SPADCALL 9794 (QREFELT $ 8)))
                          (CONS "<jupiter>" (SPADCALL 9795 (QREFELT $ 8)))
                          (CONS "<saturn>" (SPADCALL 9796 (QREFELT $ 8)))
                          (CONS "<uranus>" (SPADCALL 9797 (QREFELT $ 8)))
                          (CONS "<neptune>" (SPADCALL 9798 (QREFELT $ 8)))
                          (CONS "<pluto>" (SPADCALL 9799 (QREFELT $ 8)))
                          (CONS "<aries>" (SPADCALL 9800 (QREFELT $ 8)))
                          (CONS "<taurus>" (SPADCALL 9801 (QREFELT $ 8)))
                          (CONS "<gemini>" (SPADCALL 9802 (QREFELT $ 8)))
                          (CONS "<cancer>" (SPADCALL 9803 (QREFELT $ 8)))
                          (CONS "<leo>" (SPADCALL 9804 (QREFELT $ 8)))
                          (CONS "<virgo>" (SPADCALL 9805 (QREFELT $ 8)))
                          (CONS "<libra>" (SPADCALL 9806 (QREFELT $ 8)))
                          (CONS "<scorpio>" (SPADCALL 9807 (QREFELT $ 8)))
                          (CONS "<sagittarius>" (SPADCALL 9808 (QREFELT $ 8)))
                          (CONS "<capricornus>" (SPADCALL 9809 (QREFELT $ 8)))
                          (CONS "<aquarius>" (SPADCALL 9810 (QREFELT $ 8)))
                          (CONS "<pisces>" (SPADCALL 9811 (QREFELT $ 8)))
                          (CONS "<spadesuit>" (SPADCALL 9824 (QREFELT $ 8)))
                          (CONS "<clubsuit>" (SPADCALL 9827 (QREFELT $ 8)))
                          (CONS "<heartsuit>" (SPADCALL 9829 (QREFELT $ 8)))
                          (CONS "<diamondsuit>" (SPADCALL 9830 (QREFELT $ 8)))
                          (CONS "<quarternote>" (SPADCALL 9833 (QREFELT $ 8)))
                          (CONS "<eighthnote>" (SPADCALL 9834 (QREFELT $ 8)))
                          (CONS "<twonotes>" (SPADCALL 9835 (QREFELT $ 8)))
                          (CONS "<flat>" (SPADCALL 9837 (QREFELT $ 8)))
                          (CONS "<natural>" (SPADCALL 9838 (QREFELT $ 8)))
                          (CONS "<sharp>" (SPADCALL 9839 (QREFELT $ 8)))
                          (CONS "<checkmark>" (SPADCALL 10003 (QREFELT $ 8)))
                          (CONS "<Alpha>" (SPADCALL 913 (QREFELT $ 8)))
                          (CONS "<Beta>" (SPADCALL 914 (QREFELT $ 8)))
                          (CONS "<Gamma>" (SPADCALL 915 (QREFELT $ 8)))
                          (CONS "<Delta>" (SPADCALL 916 (QREFELT $ 8)))
                          (CONS "<Epsilon>" (SPADCALL 917 (QREFELT $ 8)))
                          (CONS "<Zeta>" (SPADCALL 918 (QREFELT $ 8)))
                          (CONS "<Eta>" (SPADCALL 919 (QREFELT $ 8)))
                          (CONS "<Theta>" (SPADCALL 920 (QREFELT $ 8)))
                          (CONS "<Iota>" (SPADCALL 921 (QREFELT $ 8)))
                          (CONS "<Kappa>" (SPADCALL 922 (QREFELT $ 8)))
                          (CONS "<Lambda>" (SPADCALL 923 (QREFELT $ 8)))
                          (CONS "<Mu>" (SPADCALL 924 (QREFELT $ 8)))
                          (CONS "<Nu>" (SPADCALL 925 (QREFELT $ 8)))
                          (CONS "<Xi>" (SPADCALL 926 (QREFELT $ 8)))
                          (CONS "<Omicron>" (SPADCALL 927 (QREFELT $ 8)))
                          (CONS "<Pi>" (SPADCALL 928 (QREFELT $ 8)))
                          (CONS "<Rho>" (SPADCALL 929 (QREFELT $ 8)))
                          (CONS "<Sigma>" (SPADCALL 931 (QREFELT $ 8)))
                          (CONS "<Tau>" (SPADCALL 932 (QREFELT $ 8)))
                          (CONS "<Upsilon>" (SPADCALL 933 (QREFELT $ 8)))
                          (CONS "<Phi>" (SPADCALL 934 (QREFELT $ 8)))
                          (CONS "<Chi>" (SPADCALL 935 (QREFELT $ 8)))
                          (CONS "<Psi>" (SPADCALL 936 (QREFELT $ 8)))
                          (CONS "<Omega>" (SPADCALL 937 (QREFELT $ 8)))
                          (CONS "<alpha>" (SPADCALL 945 (QREFELT $ 8)))
                          (CONS "<beta>" (SPADCALL 946 (QREFELT $ 8)))
                          (CONS "<gamma>" (SPADCALL 947 (QREFELT $ 8)))
                          (CONS "<delta>" (SPADCALL 948 (QREFELT $ 8)))
                          (CONS "<varepsilon>" (SPADCALL 949 (QREFELT $ 8)))
                          (CONS "<zeta>" (SPADCALL 950 (QREFELT $ 8)))
                          (CONS "<eta>" (SPADCALL 951 (QREFELT $ 8)))
                          (CONS "<theta>" (SPADCALL 952 (QREFELT $ 8)))
                          (CONS "<iota>" (SPADCALL 953 (QREFELT $ 8)))
                          (CONS "<kappa>" (SPADCALL 954 (QREFELT $ 8)))
                          (CONS "<lambda>" (SPADCALL 955 (QREFELT $ 8)))
                          (CONS #2# (SPADCALL 956 (QREFELT $ 8)))
                          (CONS "<nu>" (SPADCALL 957 (QREFELT $ 8)))
                          (CONS "<xi>" (SPADCALL 958 (QREFELT $ 8)))
                          (CONS "<omicron>" (SPADCALL 959 (QREFELT $ 8)))
                          (CONS "<pi>" (SPADCALL 960 (QREFELT $ 8)))
                          (CONS "<rho>" (SPADCALL 961 (QREFELT $ 8)))
                          (CONS "<varsigma>" (SPADCALL 962 (QREFELT $ 8)))
                          (CONS "<sigma>" (SPADCALL 963 (QREFELT $ 8)))
                          (CONS "<tau>" (SPADCALL 964 (QREFELT $ 8)))
                          (CONS "<upsilon>" (SPADCALL 965 (QREFELT $ 8)))
                          (CONS "<varphi>" (SPADCALL 966 (QREFELT $ 8)))
                          (CONS "<chi>" (SPADCALL 967 (QREFELT $ 8)))
                          (CONS "<psi>" (SPADCALL 968 (QREFELT $ 8)))
                          (CONS "<omega>" (SPADCALL 969 (QREFELT $ 8)))
                          (CONS "<vartheta>" (SPADCALL 977 (QREFELT $ 8)))
                          (CONS "<phi>" (SPADCALL 981 (QREFELT $ 8)))
                          (CONS "<varpi>" (SPADCALL 982 (QREFELT $ 8)))
                          (CONS "<digamma>" (SPADCALL 989 (QREFELT $ 8)))
                          (CONS "<varkappa>" (SPADCALL 1008 (QREFELT $ 8)))
                          (CONS "<varrho>" (SPADCALL 1009 (QREFELT $ 8)))
                          (CONS "<epsilon>" (SPADCALL 1013 (QREFELT $ 8)))
                          (CONS "<longequal>" (SPADCALL 65309 (QREFELT $ 8)))
                          (CONS "<b-up-A>" (SPADCALL 119808 (QREFELT $ 8)))
                          (CONS "<b-up-B>" (SPADCALL 119809 (QREFELT $ 8)))
                          (CONS "<b-up-C>" (SPADCALL 119810 (QREFELT $ 8)))
                          (CONS "<b-up-D>" (SPADCALL 119811 (QREFELT $ 8)))
                          (CONS "<b-up-E>" (SPADCALL 119812 (QREFELT $ 8)))
                          (CONS "<b-up-F>" (SPADCALL 119813 (QREFELT $ 8)))
                          (CONS "<b-up-G>" (SPADCALL 119814 (QREFELT $ 8)))
                          (CONS "<b-up-H>" (SPADCALL 119815 (QREFELT $ 8)))
                          (CONS "<b-up-I>" (SPADCALL 119816 (QREFELT $ 8)))
                          (CONS "<b-up-J>" (SPADCALL 119817 (QREFELT $ 8)))
                          (CONS "<b-up-K>" (SPADCALL 119818 (QREFELT $ 8)))
                          (CONS "<b-up-L>" (SPADCALL 119819 (QREFELT $ 8)))
                          (CONS "<b-up-M>" (SPADCALL 119820 (QREFELT $ 8)))
                          (CONS "<b-up-N>" (SPADCALL 119821 (QREFELT $ 8)))
                          (CONS "<b-up-O>" (SPADCALL 119822 (QREFELT $ 8)))
                          (CONS "<b-up-P>" (SPADCALL 119823 (QREFELT $ 8)))
                          (CONS "<b-up-Q>" (SPADCALL 119824 (QREFELT $ 8)))
                          (CONS "<b-up-R>" (SPADCALL 119825 (QREFELT $ 8)))
                          (CONS "<b-up-S>" (SPADCALL 119826 (QREFELT $ 8)))
                          (CONS "<b-up-T>" (SPADCALL 119827 (QREFELT $ 8)))
                          (CONS "<b-up-U>" (SPADCALL 119828 (QREFELT $ 8)))
                          (CONS "<b-up-V>" (SPADCALL 119829 (QREFELT $ 8)))
                          (CONS "<b-up-W>" (SPADCALL 119830 (QREFELT $ 8)))
                          (CONS "<b-up-X>" (SPADCALL 119831 (QREFELT $ 8)))
                          (CONS "<b-up-Y>" (SPADCALL 119832 (QREFELT $ 8)))
                          (CONS "<b-up-Z>" (SPADCALL 119833 (QREFELT $ 8)))
                          (CONS "<b-up-a>" (SPADCALL 119834 (QREFELT $ 8)))
                          (CONS "<b-up-b>" (SPADCALL 119835 (QREFELT $ 8)))
                          (CONS "<b-up-c>" (SPADCALL 119836 (QREFELT $ 8)))
                          (CONS "<b-up-d>" (SPADCALL 119837 (QREFELT $ 8)))
                          (CONS "<b-up-e>" (SPADCALL 119838 (QREFELT $ 8)))
                          (CONS "<b-up-f>" (SPADCALL 119839 (QREFELT $ 8)))
                          (CONS "<b-up-g>" (SPADCALL 119840 (QREFELT $ 8)))
                          (CONS "<b-up-h>" (SPADCALL 119841 (QREFELT $ 8)))
                          (CONS "<b-up-i>" (SPADCALL 119842 (QREFELT $ 8)))
                          (CONS "<b-up-j>" (SPADCALL 119843 (QREFELT $ 8)))
                          (CONS "<b-up-k>" (SPADCALL 119844 (QREFELT $ 8)))
                          (CONS "<b-up-l>" (SPADCALL 119845 (QREFELT $ 8)))
                          (CONS "<b-up-m>" (SPADCALL 119846 (QREFELT $ 8)))
                          (CONS "<b-up-n>" (SPADCALL 119847 (QREFELT $ 8)))
                          (CONS "<b-up-o>" (SPADCALL 119848 (QREFELT $ 8)))
                          (CONS "<b-up-p>" (SPADCALL 119849 (QREFELT $ 8)))
                          (CONS "<b-up-q>" (SPADCALL 119850 (QREFELT $ 8)))
                          (CONS "<b-up-r>" (SPADCALL 119851 (QREFELT $ 8)))
                          (CONS "<b-up-s>" (SPADCALL 119852 (QREFELT $ 8)))
                          (CONS "<b-up-t>" (SPADCALL 119853 (QREFELT $ 8)))
                          (CONS "<b-up-u>" (SPADCALL 119854 (QREFELT $ 8)))
                          (CONS "<b-up-v>" (SPADCALL 119855 (QREFELT $ 8)))
                          (CONS "<b-up-w>" (SPADCALL 119856 (QREFELT $ 8)))
                          (CONS "<b-up-x>" (SPADCALL 119857 (QREFELT $ 8)))
                          (CONS "<b-up-y>" (SPADCALL 119858 (QREFELT $ 8)))
                          (CONS "<b-up-z>" (SPADCALL 119859 (QREFELT $ 8)))
                          (CONS "<b-A>" (SPADCALL 119912 (QREFELT $ 8)))
                          (CONS "<b-B>" (SPADCALL 119913 (QREFELT $ 8)))
                          (CONS "<b-C>" (SPADCALL 119914 (QREFELT $ 8)))
                          (CONS "<b-D>" (SPADCALL 119915 (QREFELT $ 8)))
                          (CONS "<b-E>" (SPADCALL 119916 (QREFELT $ 8)))
                          (CONS "<b-F>" (SPADCALL 119917 (QREFELT $ 8)))
                          (CONS "<b-G>" (SPADCALL 119918 (QREFELT $ 8)))
                          (CONS "<b-H>" (SPADCALL 119919 (QREFELT $ 8)))
                          (CONS "<b-I>" (SPADCALL 119920 (QREFELT $ 8)))
                          (CONS "<b-J>" (SPADCALL 119921 (QREFELT $ 8)))
                          (CONS "<b-K>" (SPADCALL 119922 (QREFELT $ 8)))
                          (CONS "<b-L>" (SPADCALL 119923 (QREFELT $ 8)))
                          (CONS "<b-M>" (SPADCALL 119924 (QREFELT $ 8)))
                          (CONS "<b-N>" (SPADCALL 119925 (QREFELT $ 8)))
                          (CONS "<b-O>" (SPADCALL 119926 (QREFELT $ 8)))
                          (CONS "<b-P>" (SPADCALL 119927 (QREFELT $ 8)))
                          (CONS "<b-Q>" (SPADCALL 119928 (QREFELT $ 8)))
                          (CONS "<b-R>" (SPADCALL 119929 (QREFELT $ 8)))
                          (CONS "<b-S>" (SPADCALL 119930 (QREFELT $ 8)))
                          (CONS "<b-T>" (SPADCALL 119931 (QREFELT $ 8)))
                          (CONS "<b-U>" (SPADCALL 119932 (QREFELT $ 8)))
                          (CONS "<b-V>" (SPADCALL 119933 (QREFELT $ 8)))
                          (CONS "<b-W>" (SPADCALL 119934 (QREFELT $ 8)))
                          (CONS "<b-X>" (SPADCALL 119935 (QREFELT $ 8)))
                          (CONS "<b-Y>" (SPADCALL 119936 (QREFELT $ 8)))
                          (CONS "<b-Z>" (SPADCALL 119937 (QREFELT $ 8)))
                          (CONS "<b-a>" (SPADCALL 119938 (QREFELT $ 8)))
                          (CONS "<b-b>" (SPADCALL 119939 (QREFELT $ 8)))
                          (CONS "<b-c>" (SPADCALL 119940 (QREFELT $ 8)))
                          (CONS "<b-d>" (SPADCALL 119941 (QREFELT $ 8)))
                          (CONS "<b-e>" (SPADCALL 119942 (QREFELT $ 8)))
                          (CONS "<b-f>" (SPADCALL 119943 (QREFELT $ 8)))
                          (CONS "<b-g>" (SPADCALL 119944 (QREFELT $ 8)))
                          (CONS "<b-h>" (SPADCALL 119945 (QREFELT $ 8)))
                          (CONS "<b-i>" (SPADCALL 119946 (QREFELT $ 8)))
                          (CONS "<b-j>" (SPADCALL 119947 (QREFELT $ 8)))
                          (CONS "<b-k>" (SPADCALL 119948 (QREFELT $ 8)))
                          (CONS "<b-l>" (SPADCALL 119949 (QREFELT $ 8)))
                          (CONS "<b-m>" (SPADCALL 119950 (QREFELT $ 8)))
                          (CONS "<b-n>" (SPADCALL 119951 (QREFELT $ 8)))
                          (CONS "<b-o>" (SPADCALL 119952 (QREFELT $ 8)))
                          (CONS "<b-p>" (SPADCALL 119953 (QREFELT $ 8)))
                          (CONS "<b-q>" (SPADCALL 119954 (QREFELT $ 8)))
                          (CONS "<b-r>" (SPADCALL 119955 (QREFELT $ 8)))
                          (CONS "<b-s>" (SPADCALL 119956 (QREFELT $ 8)))
                          (CONS "<b-t>" (SPADCALL 119957 (QREFELT $ 8)))
                          (CONS "<b-u>" (SPADCALL 119958 (QREFELT $ 8)))
                          (CONS "<b-v>" (SPADCALL 119959 (QREFELT $ 8)))
                          (CONS "<b-w>" (SPADCALL 119960 (QREFELT $ 8)))
                          (CONS "<b-x>" (SPADCALL 119961 (QREFELT $ 8)))
                          (CONS "<b-y>" (SPADCALL 119962 (QREFELT $ 8)))
                          (CONS "<b-z>" (SPADCALL 119963 (QREFELT $ 8)))
                          (CONS "<cal-A>" (SPADCALL 119964 (QREFELT $ 8)))
                          (CONS "<cal-C>" (SPADCALL 119966 (QREFELT $ 8)))
                          (CONS "<cal-D>" (SPADCALL 119967 (QREFELT $ 8)))
                          (CONS "<cal-G>" (SPADCALL 119970 (QREFELT $ 8)))
                          (CONS "<cal-J>" (SPADCALL 119973 (QREFELT $ 8)))
                          (CONS "<cal-K>" (SPADCALL 119974 (QREFELT $ 8)))
                          (CONS "<cal-N>" (SPADCALL 119977 (QREFELT $ 8)))
                          (CONS "<cal-O>" (SPADCALL 119978 (QREFELT $ 8)))
                          (CONS "<cal-P>" (SPADCALL 119979 (QREFELT $ 8)))
                          (CONS "<cal-Q>" (SPADCALL 119980 (QREFELT $ 8)))
                          (CONS "<cal-S>" (SPADCALL 119982 (QREFELT $ 8)))
                          (CONS "<cal-T>" (SPADCALL 119983 (QREFELT $ 8)))
                          (CONS "<cal-U>" (SPADCALL 119984 (QREFELT $ 8)))
                          (CONS "<cal-V>" (SPADCALL 119985 (QREFELT $ 8)))
                          (CONS "<cal-W>" (SPADCALL 119986 (QREFELT $ 8)))
                          (CONS "<cal-X>" (SPADCALL 119987 (QREFELT $ 8)))
                          (CONS "<cal-Y>" (SPADCALL 119988 (QREFELT $ 8)))
                          (CONS "<cal-Z>" (SPADCALL 119989 (QREFELT $ 8)))
                          (CONS "<cal-a>" (SPADCALL 119990 (QREFELT $ 8)))
                          (CONS "<cal-b>" (SPADCALL 119991 (QREFELT $ 8)))
                          (CONS "<cal-c>" (SPADCALL 119992 (QREFELT $ 8)))
                          (CONS "<cal-d>" (SPADCALL 119993 (QREFELT $ 8)))
                          (CONS "<cal-f>" (SPADCALL 119995 (QREFELT $ 8)))
                          (CONS "<cal-h>" (SPADCALL 119997 (QREFELT $ 8)))
                          (CONS "<cal-i>" (SPADCALL 119998 (QREFELT $ 8)))
                          (CONS "<cal-j>" (SPADCALL 119999 (QREFELT $ 8)))
                          (CONS "<cal-k>" (SPADCALL 120000 (QREFELT $ 8)))
                          (CONS "<cal-l>" (SPADCALL 120001 (QREFELT $ 8)))
                          (CONS "<cal-m>" (SPADCALL 120002 (QREFELT $ 8)))
                          (CONS "<cal-n>" (SPADCALL 120003 (QREFELT $ 8)))
                          (CONS "<cal-p>" (SPADCALL 120005 (QREFELT $ 8)))
                          (CONS "<cal-q>" (SPADCALL 120006 (QREFELT $ 8)))
                          (CONS "<cal-r>" (SPADCALL 120007 (QREFELT $ 8)))
                          (CONS "<cal-s>" (SPADCALL 120008 (QREFELT $ 8)))
                          (CONS "<cal-t>" (SPADCALL 120009 (QREFELT $ 8)))
                          (CONS "<cal-u>" (SPADCALL 120010 (QREFELT $ 8)))
                          (CONS "<cal-v>" (SPADCALL 120011 (QREFELT $ 8)))
                          (CONS "<cal-w>" (SPADCALL 120012 (QREFELT $ 8)))
                          (CONS "<cal-x>" (SPADCALL 120013 (QREFELT $ 8)))
                          (CONS "<cal-y>" (SPADCALL 120014 (QREFELT $ 8)))
                          (CONS "<cal-z>" (SPADCALL 120015 (QREFELT $ 8)))
                          (CONS "<frak-A>" (SPADCALL 120068 (QREFELT $ 8)))
                          (CONS "<frak-B>" (SPADCALL 120069 (QREFELT $ 8)))
                          (CONS "<frak-D>" (SPADCALL 120071 (QREFELT $ 8)))
                          (CONS "<frak-E>" (SPADCALL 120072 (QREFELT $ 8)))
                          (CONS "<frak-F>" (SPADCALL 120073 (QREFELT $ 8)))
                          (CONS "<frak-G>" (SPADCALL 120074 (QREFELT $ 8)))
                          (CONS "<frak-J>" (SPADCALL 120077 (QREFELT $ 8)))
                          (CONS "<frak-K>" (SPADCALL 120078 (QREFELT $ 8)))
                          (CONS "<frak-L>" (SPADCALL 120079 (QREFELT $ 8)))
                          (CONS "<frak-M>" (SPADCALL 120080 (QREFELT $ 8)))
                          (CONS "<frak-N>" (SPADCALL 120081 (QREFELT $ 8)))
                          (CONS "<frak-O>" (SPADCALL 120082 (QREFELT $ 8)))
                          (CONS "<frak-P>" (SPADCALL 120083 (QREFELT $ 8)))
                          (CONS "<frak-Q>" (SPADCALL 120084 (QREFELT $ 8)))
                          (CONS "<frak-S>" (SPADCALL 120086 (QREFELT $ 8)))
                          (CONS "<frak-T>" (SPADCALL 120087 (QREFELT $ 8)))
                          (CONS "<frak-U>" (SPADCALL 120088 (QREFELT $ 8)))
                          (CONS "<frak-V>" (SPADCALL 120089 (QREFELT $ 8)))
                          (CONS "<frak-W>" (SPADCALL 120090 (QREFELT $ 8)))
                          (CONS "<frak-X>" (SPADCALL 120091 (QREFELT $ 8)))
                          (CONS "<frak-Y>" (SPADCALL 120092 (QREFELT $ 8)))
                          (CONS "<frak-a>" (SPADCALL 120094 (QREFELT $ 8)))
                          (CONS "<frak-b>" (SPADCALL 120095 (QREFELT $ 8)))
                          (CONS "<frak-c>" (SPADCALL 120096 (QREFELT $ 8)))
                          (CONS "<frak-d>" (SPADCALL 120097 (QREFELT $ 8)))
                          (CONS "<frak-e>" (SPADCALL 120098 (QREFELT $ 8)))
                          (CONS "<frak-f>" (SPADCALL 120099 (QREFELT $ 8)))
                          (CONS "<frak-g>" (SPADCALL 120100 (QREFELT $ 8)))
                          (CONS "<frak-h>" (SPADCALL 120101 (QREFELT $ 8)))
                          (CONS "<frak-i>" (SPADCALL 120102 (QREFELT $ 8)))
                          (CONS "<frak-j>" (SPADCALL 120103 (QREFELT $ 8)))
                          (CONS "<frak-k>" (SPADCALL 120104 (QREFELT $ 8)))
                          (CONS "<frak-l>" (SPADCALL 120105 (QREFELT $ 8)))
                          (CONS "<frak-m>" (SPADCALL 120106 (QREFELT $ 8)))
                          (CONS "<frak-n>" (SPADCALL 120107 (QREFELT $ 8)))
                          (CONS "<frak-o>" (SPADCALL 120108 (QREFELT $ 8)))
                          (CONS "<frak-p>" (SPADCALL 120109 (QREFELT $ 8)))
                          (CONS "<frak-q>" (SPADCALL 120110 (QREFELT $ 8)))
                          (CONS "<frak-r>" (SPADCALL 120111 (QREFELT $ 8)))
                          (CONS "<frak-s>" (SPADCALL 120112 (QREFELT $ 8)))
                          (CONS "<frak-t>" (SPADCALL 120113 (QREFELT $ 8)))
                          (CONS "<frak-u>" (SPADCALL 120114 (QREFELT $ 8)))
                          (CONS "<frak-v>" (SPADCALL 120115 (QREFELT $ 8)))
                          (CONS "<frak-w>" (SPADCALL 120116 (QREFELT $ 8)))
                          (CONS "<frak-x>" (SPADCALL 120117 (QREFELT $ 8)))
                          (CONS "<frak-y>" (SPADCALL 120118 (QREFELT $ 8)))
                          (CONS "<frak-z>" (SPADCALL 120119 (QREFELT $ 8)))
                          (CONS "<bbb-A>" (SPADCALL 120120 (QREFELT $ 8)))
                          (CONS "<bbb-B>" (SPADCALL 120121 (QREFELT $ 8)))
                          (CONS "<bbb-D>" (SPADCALL 120123 (QREFELT $ 8)))
                          (CONS "<bbb-E>" (SPADCALL 120124 (QREFELT $ 8)))
                          (CONS "<bbb-F>" (SPADCALL 120125 (QREFELT $ 8)))
                          (CONS "<bbb-G>" (SPADCALL 120126 (QREFELT $ 8)))
                          (CONS "<bbb-I>" (SPADCALL 120128 (QREFELT $ 8)))
                          (CONS "<bbb-J>" (SPADCALL 120129 (QREFELT $ 8)))
                          (CONS "<bbb-K>" (SPADCALL 120130 (QREFELT $ 8)))
                          (CONS "<bbb-L>" (SPADCALL 120131 (QREFELT $ 8)))
                          (CONS "<bbb-M>" (SPADCALL 120132 (QREFELT $ 8)))
                          (CONS "<bbb-O>" (SPADCALL 120134 (QREFELT $ 8)))
                          (CONS "<bbb-S>" (SPADCALL 120138 (QREFELT $ 8)))
                          (CONS "<bbb-T>" (SPADCALL 120139 (QREFELT $ 8)))
                          (CONS "<bbb-U>" (SPADCALL 120140 (QREFELT $ 8)))
                          (CONS "<bbb-V>" (SPADCALL 120141 (QREFELT $ 8)))
                          (CONS "<bbb-W>" (SPADCALL 120142 (QREFELT $ 8)))
                          (CONS "<bbb-X>" (SPADCALL 120143 (QREFELT $ 8)))
                          (CONS "<bbb-Y>" (SPADCALL 120144 (QREFELT $ 8)))
                          (CONS "<bbb-a>" (SPADCALL 120146 (QREFELT $ 8)))
                          (CONS "<bbb-b>" (SPADCALL 120147 (QREFELT $ 8)))
                          (CONS "<bbb-c>" (SPADCALL 120148 (QREFELT $ 8)))
                          (CONS "<bbb-d>" (SPADCALL 120149 (QREFELT $ 8)))
                          (CONS "<bbb-e>" (SPADCALL 120150 (QREFELT $ 8)))
                          (CONS "<bbb-f>" (SPADCALL 120151 (QREFELT $ 8)))
                          (CONS "<bbb-g>" (SPADCALL 120152 (QREFELT $ 8)))
                          (CONS "<bbb-h>" (SPADCALL 120153 (QREFELT $ 8)))
                          (CONS "<bbb-i>" (SPADCALL 120154 (QREFELT $ 8)))
                          (CONS "<bbb-j>" (SPADCALL 120155 (QREFELT $ 8)))
                          (CONS "<bbb-k>" (SPADCALL 120156 (QREFELT $ 8)))
                          (CONS "<bbb-l>" (SPADCALL 120157 (QREFELT $ 8)))
                          (CONS "<bbb-m>" (SPADCALL 120158 (QREFELT $ 8)))
                          (CONS "<bbb-n>" (SPADCALL 120159 (QREFELT $ 8)))
                          (CONS "<bbb-o>" (SPADCALL 120160 (QREFELT $ 8)))
                          (CONS "<bbb-p>" (SPADCALL 120161 (QREFELT $ 8)))
                          (CONS "<bbb-q>" (SPADCALL 120162 (QREFELT $ 8)))
                          (CONS "<bbb-r>" (SPADCALL 120163 (QREFELT $ 8)))
                          (CONS "<bbb-s>" (SPADCALL 120164 (QREFELT $ 8)))
                          (CONS "<bbb-t>" (SPADCALL 120165 (QREFELT $ 8)))
                          (CONS "<bbb-u>" (SPADCALL 120166 (QREFELT $ 8)))
                          (CONS "<bbb-v>" (SPADCALL 120167 (QREFELT $ 8)))
                          (CONS "<bbb-w>" (SPADCALL 120168 (QREFELT $ 8)))
                          (CONS "<bbb-x>" (SPADCALL 120169 (QREFELT $ 8)))
                          (CONS "<bbb-y>" (SPADCALL 120170 (QREFELT $ 8)))
                          (CONS "<bbb-z>" (SPADCALL 120171 (QREFELT $ 8)))
                          (CONS "<b-Alpha>" (SPADCALL 120488 (QREFELT $ 8)))
                          (CONS "<b-Beta>" (SPADCALL 120489 (QREFELT $ 8)))
                          (CONS "<b-Gamma>" (SPADCALL 120490 (QREFELT $ 8)))
                          (CONS "<b-Delta>" (SPADCALL 120491 (QREFELT $ 8)))
                          (CONS "<b-Epsilon>" (SPADCALL 120492 (QREFELT $ 8)))
                          (CONS "<b-Zeta>" (SPADCALL 120493 (QREFELT $ 8)))
                          (CONS "<b-Eta>" (SPADCALL 120494 (QREFELT $ 8)))
                          (CONS "<b-Theta>" (SPADCALL 120495 (QREFELT $ 8)))
                          (CONS "<b-Iota>" (SPADCALL 120496 (QREFELT $ 8)))
                          (CONS "<b-Kappa>" (SPADCALL 120497 (QREFELT $ 8)))
                          (CONS "<b-Lambda>" (SPADCALL 120498 (QREFELT $ 8)))
                          (CONS "<b-Mu>" (SPADCALL 120499 (QREFELT $ 8)))
                          (CONS "<b-Nu>" (SPADCALL 120500 (QREFELT $ 8)))
                          (CONS "<b-Xi>" (SPADCALL 120501 (QREFELT $ 8)))
                          (CONS "<b-Omicron>" (SPADCALL 120502 (QREFELT $ 8)))
                          (CONS "<b-Pi>" (SPADCALL 120503 (QREFELT $ 8)))
                          (CONS "<b-Rho>" (SPADCALL 120504 (QREFELT $ 8)))
                          (CONS "<b-Sigma>" (SPADCALL 120506 (QREFELT $ 8)))
                          (CONS "<b-Tau>" (SPADCALL 120507 (QREFELT $ 8)))
                          (CONS "<b-Upsilon>" (SPADCALL 120508 (QREFELT $ 8)))
                          (CONS "<b-Phi>" (SPADCALL 120509 (QREFELT $ 8)))
                          (CONS "<b-Chi>" (SPADCALL 120510 (QREFELT $ 8)))
                          (CONS "<b-Psi>" (SPADCALL 120511 (QREFELT $ 8)))
                          (CONS "<b-Omega>" (SPADCALL 120512 (QREFELT $ 8)))
                          (CONS "<b-up-alpha>" (SPADCALL 120514 (QREFELT $ 8)))
                          (CONS "<b-up-beta>" (SPADCALL 120515 (QREFELT $ 8)))
                          (CONS "<b-up-gamma>" (SPADCALL 120516 (QREFELT $ 8)))
                          (CONS "<b-up-delta>" (SPADCALL 120517 (QREFELT $ 8)))
                          (CONS "<b-up-varepsilon>"
                                (SPADCALL 120518 (QREFELT $ 8)))
                          (CONS "<b-up-zeta>" (SPADCALL 120519 (QREFELT $ 8)))
                          (CONS "<b-up-eta>" (SPADCALL 120520 (QREFELT $ 8)))
                          (CONS "<b-up-theta>" (SPADCALL 120521 (QREFELT $ 8)))
                          (CONS "<b-up-iota>" (SPADCALL 120522 (QREFELT $ 8)))
                          (CONS "<b-up-kappa>" (SPADCALL 120523 (QREFELT $ 8)))
                          (CONS "<b-up-lambda>"
                                (SPADCALL 120524 (QREFELT $ 8)))
                          (CONS "<b-up-mu>" (SPADCALL 120525 (QREFELT $ 8)))
                          (CONS "<b-up-nu>" (SPADCALL 120526 (QREFELT $ 8)))
                          (CONS "<b-up-xi>" (SPADCALL 120527 (QREFELT $ 8)))
                          (CONS "<b-up-omicron>"
                                (SPADCALL 120528 (QREFELT $ 8)))
                          (CONS "<b-up-pi>" (SPADCALL 120529 (QREFELT $ 8)))
                          (CONS "<b-up-rho>" (SPADCALL 120530 (QREFELT $ 8)))
                          (CONS "<b-up-varsigma>"
                                (SPADCALL 120531 (QREFELT $ 8)))
                          (CONS "<b-up-sigma>" (SPADCALL 120532 (QREFELT $ 8)))
                          (CONS "<b-up-tau>" (SPADCALL 120533 (QREFELT $ 8)))
                          (CONS "<b-up-upsilon>"
                                (SPADCALL 120534 (QREFELT $ 8)))
                          (CONS "<b-up-varphi>"
                                (SPADCALL 120535 (QREFELT $ 8)))
                          (CONS "<b-up-chi>" (SPADCALL 120536 (QREFELT $ 8)))
                          (CONS "<b-up-psi>" (SPADCALL 120537 (QREFELT $ 8)))
                          (CONS "<b-up-omega>" (SPADCALL 120538 (QREFELT $ 8)))
                          (CONS "<b-up-epsilon>"
                                (SPADCALL 120540 (QREFELT $ 8)))
                          (CONS "<b-up-vartheta>"
                                (SPADCALL 120541 (QREFELT $ 8)))
                          (CONS "<b-up-varkappa>"
                                (SPADCALL 120542 (QREFELT $ 8)))
                          (CONS "<b-up-phi>" (SPADCALL 120543 (QREFELT $ 8)))
                          (CONS "<b-up-varrho>"
                                (SPADCALL 120544 (QREFELT $ 8)))
                          (CONS "<b-up-varpi>" (SPADCALL 120545 (QREFELT $ 8)))
                          (CONS "<b-alpha>" (SPADCALL 120630 (QREFELT $ 8)))
                          (CONS "<b-beta>" (SPADCALL 120631 (QREFELT $ 8)))
                          (CONS "<b-gamma>" (SPADCALL 120632 (QREFELT $ 8)))
                          (CONS "<b-delta>" (SPADCALL 120633 (QREFELT $ 8)))
                          (CONS "<b-varepsilon>"
                                (SPADCALL 120634 (QREFELT $ 8)))
                          (CONS "<b-zeta>" (SPADCALL 120635 (QREFELT $ 8)))
                          (CONS "<b-eta>" (SPADCALL 120636 (QREFELT $ 8)))
                          (CONS "<b-theta>" (SPADCALL 120637 (QREFELT $ 8)))
                          (CONS "<b-iota>" (SPADCALL 120638 (QREFELT $ 8)))
                          (CONS "<b-kappa>" (SPADCALL 120639 (QREFELT $ 8)))
                          (CONS "<b-lambda>" (SPADCALL 120640 (QREFELT $ 8)))
                          (CONS "<b-mu>" (SPADCALL 120641 (QREFELT $ 8)))
                          (CONS "<b-nu>" (SPADCALL 120642 (QREFELT $ 8)))
                          (CONS "<b-xi>" (SPADCALL 120643 (QREFELT $ 8)))
                          (CONS "<b-omicron>" (SPADCALL 120644 (QREFELT $ 8)))
                          (CONS "<b-pi>" (SPADCALL 120645 (QREFELT $ 8)))
                          (CONS "<b-rho>" (SPADCALL 120646 (QREFELT $ 8)))
                          (CONS "<b-varsigma>" (SPADCALL 120647 (QREFELT $ 8)))
                          (CONS "<b-sigma>" (SPADCALL 120648 (QREFELT $ 8)))
                          (CONS "<b-tau>" (SPADCALL 120649 (QREFELT $ 8)))
                          (CONS "<b-upsilon>" (SPADCALL 120650 (QREFELT $ 8)))
                          (CONS "<b-varphi>" (SPADCALL 120651 (QREFELT $ 8)))
                          (CONS "<b-chi>" (SPADCALL 120652 (QREFELT $ 8)))
                          (CONS "<b-psi>" (SPADCALL 120653 (QREFELT $ 8)))
                          (CONS "<b-omega>" (SPADCALL 120654 (QREFELT $ 8)))
                          (CONS "<b-epsilon>" (SPADCALL 120656 (QREFELT $ 8)))
                          (CONS "<b-vartheta>" (SPADCALL 120657 (QREFELT $ 8)))
                          (CONS "<b-varkappa>" (SPADCALL 120658 (QREFELT $ 8)))
                          (CONS "<b-phi>" (SPADCALL 120659 (QREFELT $ 8)))
                          (CONS "<b-varrho>" (SPADCALL 120660 (QREFELT $ 8)))
                          (CONS "<b-varpi>" (SPADCALL 120661 (QREFELT $ 8)))
                          (CONS "<b-0>" (SPADCALL 120782 (QREFELT $ 8)))
                          (CONS "<b-1>" (SPADCALL 120783 (QREFELT $ 8)))
                          (CONS "<b-2>" (SPADCALL 120784 (QREFELT $ 8)))
                          (CONS "<b-3>" (SPADCALL 120785 (QREFELT $ 8)))
                          (CONS "<b-4>" (SPADCALL 120786 (QREFELT $ 8)))
                          (CONS "<b-5>" (SPADCALL 120787 (QREFELT $ 8)))
                          (CONS "<b-6>" (SPADCALL 120788 (QREFELT $ 8)))
                          (CONS "<b-7>" (SPADCALL 120789 (QREFELT $ 8)))
                          (CONS "<b-8>" (SPADCALL 120790 (QREFELT $ 8)))
                          (CONS "<b-9>" (SPADCALL 120791 (QREFELT $ 8)))))
          (QSETREFV $ 10 " \\  ")
          (QSETREFV $ 11 1000000)
          (QSETREFV $ 12 0)
          (QSETREFV $ 13 '(-))
          (QSETREFV $ 14 '(710))
          (QSETREFV $ 15 '(+-> |\|| ^ / = ~= < <= > >= OVER LET))
          (QSETREFV $ 16 (LIST 0 0 900 700 400 400 400 400 400 400 700 125))
          (QSETREFV $ 17 '(- + * |,| |;| ROW STRSEP TENSOR))
          (QSETREFV $ 18 (LIST 700 700 800 110 110 0 0 850))
          (QSETREFV $ 19 '(ROW))
          (QSETREFV $ 20 '(SIGMA SIGMA2 PI PI2 INTSIGN))
          (QSETREFV $ 21 '(750 750 750 750 700))
          (QSETREFV $ 22
                    '(MATRIX BRACKET BRACE CONCATB VCONCAT AGGLST CONCAT
                      OVERBAR ROOT SUB TAG SUPERSUB ZAG AGGSET SC PAREN SEGMENT
                      QUOTE |theMap| SLASH PRIME BOX EQUATNUM BINOMIAL
                      NOTHING))
          (QSETREFV $ 23
                    '(|cos| |cot| |csc| |log| |sec| |sin| |tan| |cosh| |coth|
                      |csch| |sech| |sinh| |tanh| |acos| |asin| |atan| |erf|
                      |...| $ |infinity| |Gamma|))
          (QSETREFV $ 24
                    (LIST "\"cos\"" "\"cot\"" "\"csc\"" "\"log\"" "\"sec\""
                          "\"sin\"" "\"tan\"" "\"cosh\"" "\"coth\"" "\"csch\""
                          "\"sech\"" "\"sinh\"" "\"tanh\"" "\"arccos\""
                          "\"arcsin\"" "\"arctan\"" "\"erf\"" "\"<cdots>\""
                          "\"$\"" "\"<infty>\"" "\"<Gamma>\""))
          $))) 

(MAKEPROP '|TexmacsFormat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|SingleInteger|)
              (0 . |coerce|) '|Cork| '|blank| '|maxPrec| '|minPrec| '|unaryOps|
              '|unaryPrecs| '|binaryOps| '|binaryPrecs| '|naryOps| '|naryPrecs|
              '|naryNGOps| '|plexOps| '|plexPrecs| '|specialOps|
              '|specialStrings| '|specialStringsInMML| (|String|)
              (|OutputForm|) |TMFORM;coerce;OfS;1| |TMFORM;coerceL;OfS;3|
              (|Void|) (5 . |void|) |TMFORM;display;SV;4| (9 . |position|)
              (|Boolean|) (16 . >) (|UniversalSegment| 6) (22 . |segment|)
              (28 . |elt|) (|List| $) (34 . |concat|) (|List| 26)
              (39 . |second|) (|NonNegativeInteger|) (44 . >) (50 . |elt|)
              (|Symbol|) (56 . |string|) (|List| 45) (61 . |position|)
              (|List| 6) (67 . |elt|) (73 . ~=) (79 . |elt|)
              (|OutputFormTools|) (85 . |has_op?|) (91 . |arguments|)
              (96 . |is_symbol?|) (102 . ~=) (108 . |elt|) (114 . |atom?|)
              (119 . |integer?|) (124 . |integer|) (129 . |segment|)
              (134 . |empty?|) (|Character|) (139 . |elt|) (145 . |symbol?|)
              (150 . |symbol|) (|List| 25) (155 . |elt|) (161 . |char|)
              (166 . |position|) (172 . |operator|) (177 . |member?|)
              (|HashState|))
           '#(~= 183 |latex| 189 |hashUpdate!| 194 |hash| 200 |display| 205
              |coerceL| 210 |coerce| 215 = 225)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 26))
                        (|makeByteWordVec2| 74
                                            '(1 7 0 6 8 0 29 0 30 3 25 6 0 0 6
                                              32 2 6 33 0 0 34 2 35 0 6 6 36 2
                                              25 0 0 35 37 1 25 0 38 39 1 40 26
                                              0 41 2 42 33 0 0 43 2 40 26 0 6
                                              44 1 45 25 0 46 2 47 6 45 0 48 2
                                              49 6 0 6 50 2 6 33 0 0 51 2 25 0
                                              0 0 52 2 53 33 26 45 54 1 53 40
                                              26 55 2 53 33 26 45 56 2 45 33 0
                                              0 57 2 40 0 0 35 58 1 53 33 26 59
                                              1 53 33 26 60 1 53 6 26 61 1 35 0
                                              6 62 1 25 33 0 63 2 25 64 0 6 65
                                              1 53 33 26 66 1 53 45 26 67 2 68
                                              25 0 6 69 1 64 0 25 70 2 25 6 64
                                              0 71 1 53 26 26 72 2 47 33 45 0
                                              73 2 0 33 0 0 1 1 0 25 0 1 2 0 74
                                              74 0 1 1 0 7 0 1 1 0 29 25 31 1 0
                                              25 26 28 1 0 25 26 27 1 0 26 0 1
                                              2 0 33 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|TexmacsFormat| 'NILADIC T) 
