
(SDEFUN |TMFORM;coerce;OfS;1| ((|expr| |OutputForm|) ($ |String|))
        (SPROG ((|s| (|String|)))
               (SEQ
                (LETT |s|
                      (|TMFORM;postcondition|
                       (|TMFORM;formatExpr| (|TMFORM;precondition| |expr| $)
                        (QREFELT $ 8) $)
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
                        (QREFELT $ 8) $)
                       $)
                      |TMFORM;coerceL;OfS;3|)
                (|TMFORM;sayExpr| "scheme: (with \"mode\" \"math\"" $)
                (|TMFORM;sayExpr| |s| $) (|TMFORM;sayExpr| ")" $) (EXIT |s|)))) 

(SDEFUN |TMFORM;display;SV;4| ((|texmacs| |String|) ($ |Void|))
        (SEQ (|TMFORM;sayExpr| "scheme: (with \"mode\" \"math\"" $)
             (|TMFORM;sayExpr| |texmacs| $) (|TMFORM;sayExpr| ")" $)
             (EXIT (SPADCALL (QREFELT $ 26))))) 

(PUT '|TMFORM;ungroup| '|SPADreplace| '(XLAM (|str|) |str|)) 

(SDEFUN |TMFORM;ungroup| ((|str| |String|) ($ |String|)) |str|) 

(SDEFUN |TMFORM;postcondition| ((|str| |String|) ($ |String|))
        (SPROG
         ((|uend| #1=(|UniversalSegment| (|Integer|))) (|ustart| #1#)
          (|pos| (|Integer|)) (|plusminus| (|String|)) (|len| (|Integer|)))
         (SEQ (LETT |len| (QCSIZE |str|) . #2=(|TMFORM;postcondition|))
              (LETT |plusminus| "\"+\" (concat \"-\"" . #2#)
              (LETT |pos| (SPADCALL |plusminus| |str| 1 (QREFELT $ 29)) . #2#)
              (COND
               ((SPADCALL |pos| 0 (QREFELT $ 31))
                (SEQ
                 (LETT |ustart| (SPADCALL 1 (- |pos| 1) (QREFELT $ 33)) . #2#)
                 (LETT |uend| (SPADCALL (+ |pos| 15) |len| (QREFELT $ 33))
                       . #2#)
                 (LETT |str|
                       (SPADCALL
                        (LIST (SPADCALL |str| |ustart| (QREFELT $ 34))
                              "(concat \"-\""
                              (SPADCALL |str| |uend| (QREFELT $ 34)))
                        (QREFELT $ 36))
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
                (EXIT (SPADCALL (LIST "(" |s| " " |tmp| ")") (QREFELT $ 36)))))) 

(SDEFUN |TMFORM;group| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST "(concat " |str| ")") (QREFELT $ 36))) 

(SDEFUN |TMFORM;addBraces| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST " \"{\" " |str| " \"}\" ") (QREFELT $ 36))) 

(SDEFUN |TMFORM;addBrackets| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST " \"[\" " |str| " \"]\" ") (QREFELT $ 36))) 

(SDEFUN |TMFORM;parenthesize| ((|str| |String|) ($ |String|))
        (SPADCALL (LIST " \"(\" " |str| " \")\" ") (QREFELT $ 36))) 

(PUT '|TMFORM;precondition| '|SPADreplace| '|outputTran|) 

(SDEFUN |TMFORM;precondition| ((|expr| |OutputForm|) ($ |OutputForm|))
        (|outputTran| |expr|)) 

(SDEFUN |TMFORM;formatSpecial|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG
         ((|base| (|String|)) (|tmp| (|String|)) (|prescript| (|Boolean|)))
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
                         (|TMFORM;formatExpr| (SPADCALL |args| (QREFELT $ 38))
                          |prec| $))
                        (QREFELT $ 36))
                       $))
                     ((EQUAL |op| 'SLASH)
                      (|TMFORM;group|
                       (SPADCALL
                        (LIST
                         (|TMFORM;formatExpr| (|SPADfirst| |args|) |prec| $)
                         " \"/\" "
                         (|TMFORM;formatExpr| (SPADCALL |args| (QREFELT $ 38))
                          |prec| $))
                        (QREFELT $ 36))
                       $))
                     ((EQUAL |op| 'CONCATB)
                      (|TMFORM;formatNary| 'STRSEP "(space \"1quad\")" 0 |args|
                       |prec| $))
                     ((EQUAL |op| 'CONCAT)
                      (|TMFORM;formatNary| 'STRSEP "" 0 |args| (QREFELT $ 8)
                       $))
                     ((EQUAL |op| 'QUOTE)
                      (|TMFORM;group|
                       (STRCONC "'"
                                (|TMFORM;formatExpr| (|SPADfirst| |args|)
                                 (QREFELT $ 8) $))
                       $))
                     ((EQUAL |op| 'BRACKET)
                      (|TMFORM;group|
                       (|TMFORM;addBrackets|
                        (|TMFORM;ungroup|
                         (|TMFORM;formatExpr| (|SPADfirst| |args|)
                          (QREFELT $ 8) $)
                         $)
                        $)
                       $))
                     ((EQUAL |op| 'BRACE)
                      (|TMFORM;group|
                       (|TMFORM;addBraces|
                        (|TMFORM;ungroup|
                         (|TMFORM;formatExpr| (|SPADfirst| |args|)
                          (QREFELT $ 8) $)
                         $)
                        $)
                       $))
                     ((EQUAL |op| 'PAREN)
                      (|TMFORM;group|
                       (|TMFORM;parenthesize|
                        (|TMFORM;ungroup|
                         (|TMFORM;formatExpr| (|SPADfirst| |args|)
                          (QREFELT $ 8) $)
                         $)
                        $)
                       $))
                     ((EQUAL |op| 'PRIME)
                      (|TMFORM;formatSpecial| 'SUPERSUB
                       (LIST (|SPADfirst| |args|) " "
                             (SPADCALL |args| (QREFELT $ 38)))
                       |prec| $))
                     ((EQUAL |op| 'OVERBAR)
                      (COND ((NULL |args|) "")
                            (#2='T
                             (SPADCALL
                              (LIST "(wide "
                                    (|TMFORM;formatExpr| (|SPADfirst| |args|)
                                     (QREFELT $ 8) $)
                                    " \"<bar>\")")
                              (QREFELT $ 36)))))
                     ((EQUAL |op| 'ROOT)
                      (COND ((NULL |args|) "")
                            (#2#
                             (SEQ
                              (LETT |tmp|
                                    (|TMFORM;group|
                                     (|TMFORM;formatExpr| (|SPADfirst| |args|)
                                      (QREFELT $ 8) $)
                                     $)
                                    . #1#)
                              (EXIT
                               (COND
                                ((NULL (CDR |args|))
                                 (SPADCALL (LIST "(sqrt " |tmp| ")")
                                           (QREFELT $ 36)))
                                (#2#
                                 (SPADCALL
                                  (LIST "(sqrt " |tmp| " "
                                        (|TMFORM;formatExpr|
                                         (|SPADfirst| (CDR |args|))
                                         (QREFELT $ 8) $)
                                        ")")
                                  (QREFELT $ 36)))))))))
                     ((EQUAL |op| 'SEGMENT)
                      (SEQ
                       (LETT |tmp|
                             (SPADCALL
                              (LIST
                               (|TMFORM;formatExpr| (|SPADfirst| |args|)
                                (QREFELT $ 8) $)
                               " \"..\" ")
                              (QREFELT $ 36))
                             . #1#)
                       (EXIT
                        (|TMFORM;group|
                         (COND ((NULL (CDR |args|)) |tmp|)
                               (#2#
                                (SPADCALL
                                 (LIST |tmp|
                                       (|TMFORM;formatExpr|
                                        (|SPADfirst| (CDR |args|))
                                        (QREFELT $ 8) $))
                                 (QREFELT $ 36))))
                         $))))
                     ((EQUAL |op| 'SUB)
                      (|TMFORM;group|
                       (SPADCALL
                        (LIST "(concat "
                              (|TMFORM;formatExpr| (|SPADfirst| |args|)
                               (QREFELT $ 8) $)
                              "(rsub "
                              (|TMFORM;formatSpecial| 'AGGLST (CDR |args|)
                               (QREFELT $ 8) $)
                              "))")
                        (QREFELT $ 36))
                       $))
                     ((EQUAL |op| 'SUPERSUB)
                      (SEQ
                       (LETT |base|
                             (|TMFORM;formatExpr| (|SPADfirst| |args|)
                              (QREFELT $ 8) $)
                             . #1#)
                       (LETT |args| (CDR |args|) . #1#)
                       (EXIT
                        (COND
                         ((SPADCALL (LENGTH |args|) 4 (QREFELT $ 31))
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
                                            (SPADCALL |args| 1 (QREFELT $ 39))
                                            (QREFELT $ 8) $))
                                     (QREFELT $ 36))
                                    . #1#)
                              (EXIT (LETT |args| (CDR |args|) . #1#)))))
                           (COND
                            ((NULL (NULL |args|))
                             (SEQ
                              (LETT |base|
                                    (SPADCALL
                                     (LIST |base| " "
                                           (|TMFORM;optionalWrap| "rsup"
                                            (SPADCALL |args| 1 (QREFELT $ 39))
                                            (QREFELT $ 8) $))
                                     (QREFELT $ 36))
                                    . #1#)
                              (EXIT (LETT |args| (CDR |args|) . #1#)))))
                           (COND
                            ((NULL (NULL |args|))
                             (SEQ
                              (LETT |base|
                                    (SPADCALL
                                     (LIST
                                      (|TMFORM;optionalWrap| "lsup"
                                       (SPADCALL |args| 1 (QREFELT $ 39))
                                       (QREFELT $ 8) $)
                                      " " |base|)
                                     (QREFELT $ 36))
                                    . #1#)
                              (EXIT (LETT |args| (CDR |args|) . #1#)))))
                           (COND
                            ((NULL (NULL |args|))
                             (LETT |base|
                                   (SPADCALL
                                    (LIST
                                     (|TMFORM;optionalWrap| "lsub"
                                      (SPADCALL |args| 1 (QREFELT $ 39))
                                      (QREFELT $ 8) $)
                                     " " |base|)
                                    (QREFELT $ 36))
                                   . #1#)))
                           (EXIT
                            (SPADCALL (LIST "(concat " |base| ")")
                                      (QREFELT $ 36)))))))))
                     ((EQUAL |op| 'MATRIX)
                      (|TMFORM;formatMatrix| (CDR |args|) $))
                     ((EQUAL |op| 'BINOMIAL)
                      (SPADCALL
                       (LIST "(binom "
                             (|TMFORM;formatExpr|
                              (SPADCALL |args| 1 (QREFELT $ 39)) (QREFELT $ 8)
                              $)
                             " "
                             (|TMFORM;formatExpr|
                              (SPADCALL |args| 2 (QREFELT $ 39)) (QREFELT $ 8)
                              $)
                             ")")
                       (QREFELT $ 36)))
                     ((EQUAL |op| 'NOTHING) "\"\"")
                     (#2#
                      (SPADCALL
                       (LIST "(concat \"not done yet for: "
                             (SPADCALL |op| (QREFELT $ 41)) "\")")
                       (QREFELT $ 36)))))))) 

(SDEFUN |TMFORM;formatPlex|
        ((|op| |Symbol|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG
         ((|s| (|String|)) (|t1| #1=(|String|)) (|t2| (|String|)) (|body| #1#)
          (|ops| (|String|)) (|n| (|Integer|)) (|opPrec| (|Integer|))
          (|p| (|Integer|)))
         (SEQ
          (LETT |p| (SPADCALL |op| (QREFELT $ 16) (QREFELT $ 43))
                . #2=(|TMFORM;formatPlex|))
          (EXIT
           (COND ((< |p| 1) (|error| "unknown plex op"))
                 (#3='T
                  (SEQ
                   (LETT |opPrec| (SPADCALL (QREFELT $ 17) |p| (QREFELT $ 45))
                         . #2#)
                   (LETT |n| (LENGTH |args|) . #2#)
                   (COND
                    ((SPADCALL |n| 2 (QREFELT $ 46))
                     (COND
                      ((SPADCALL |n| 3 (QREFELT $ 46))
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
                          ((EQUAL |op| 'INDEFINTEGRAL)
                           (|error| "INDEFINTEGRAL not handled"))
                          (#3#
                           (|error|
                            (SPADCALL "Unexpected plex op:"
                                      (SPADCALL |op| (QREFELT $ 41))
                                      (QREFELT $ 47)))))
                         . #2#)
                   (LETT |body|
                         (COND
                          ((EQUAL |op| 'INTSIGN)
                           (STRCONC
                            (|TMFORM;formatIntBody|
                             (SPADCALL |args| 3 (QREFELT $ 39)) (QREFELT $ 8)
                             $)
                            " (big \".\")"))
                          (#3#
                           (|TMFORM;formatExpr|
                            (SPADCALL |args| |n| (QREFELT $ 39)) |opPrec| $)))
                         . #2#)
                   (LETT |t2|
                         (COND
                          ((EQL |n| 3)
                           (SPADCALL
                            (LIST " (rsup "
                                  (|TMFORM;formatExpr|
                                   (SPADCALL |args| 2 (QREFELT $ 39))
                                   (QREFELT $ 8) $)
                                  ")")
                            (QREFELT $ 36)))
                          (#3# ""))
                         . #2#)
                   (LETT |t1|
                         (|TMFORM;formatExpr|
                          (SPADCALL |args| 1 (QREFELT $ 39)) (QREFELT $ 8) $)
                         . #2#)
                   (LETT |s|
                         (SPADCALL
                          (LIST "(big-around \"" |ops| "\" (concat (rsub " |t1|
                                ")" |t2| " " |body| "))")
                          (QREFELT $ 36))
                         . #2#)
                   (COND
                    ((< |opPrec| |prec|)
                     (LETT |s| (|TMFORM;parenthesize| |s| $) . #2#)))
                   (EXIT |s|)))))))) 

(SDEFUN |TMFORM;formatIntBody|
        ((|body| |OutputForm|) (|opPrec| |Integer|) ($ |String|))
        (SPROG
         ((#1=#:G240 NIL) (|bvarS| (|String|))
          (|bvarL| #2=(|List| (|OutputForm|))) (|bvar| (|OutputForm|))
          (|bodyL| #2#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |body| '* (QREFELT $ 49))
              (SEQ
               (LETT |bodyL| (SPADCALL |body| (QREFELT $ 50))
                     . #3=(|TMFORM;formatIntBody|))
               (EXIT
                (COND
                 ((EQL (LENGTH |bodyL|) 2)
                  (COND
                   ((SPADCALL
                     (LETT |bvar| (SPADCALL |bodyL| 2 (QREFELT $ 39)) . #3#)
                     'CONCAT (QREFELT $ 49))
                    (SEQ (LETT |bvarL| (SPADCALL |bvar| (QREFELT $ 50)) . #3#)
                         (EXIT
                          (COND
                           ((EQL (LENGTH |bvarL|) 2)
                            (COND
                             ((SPADCALL (SPADCALL |bvarL| 1 (QREFELT $ 39))
                                        '|d| (QREFELT $ 51))
                              (SEQ
                               (LETT |bvarS|
                                     (|TMFORM;stringify|
                                      (SPADCALL |bvarL| 2 (QREFELT $ 39)) $)
                                     . #3#)
                               (EXIT
                                (PROGN
                                 (LETT #1#
                                       (SPADCALL
                                        (LIST "(concat "
                                              (|TMFORM;formatExpr|
                                               (SPADCALL |bodyL| 1
                                                         (QREFELT $ 39))
                                               |opPrec| $)
                                              " \"*<mathd>" |bvarS| "\")")
                                        (QREFELT $ 36))
                                       . #3#)
                                 (GO #4=#:G239))))))))))))))))))
            (EXIT (|TMFORM;formatExpr| |body| |opPrec| $))))
          #4# (EXIT #1#)))) 

(SDEFUN |TMFORM;formatMatrix| ((|args| |List| (|OutputForm|)) ($ |String|))
        (|TMFORM;group|
         (SPADCALL
          (LIST "(matrix (tformat (table (row (cell "
                (|TMFORM;formatNaryNoGroup| 'STRSEP ")) (row (cell " 0 |args|
                 (QREFELT $ 8) $)
                ")))))")
          (QREFELT $ 36))
         $)) 

(SDEFUN |TMFORM;formatFunction|
        ((|op| |OutputForm|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |String|))
        (SPROG ((|ops| (|String|)))
               (SEQ
                (LETT |ops| (|TMFORM;formatExpr| |op| (QREFELT $ 8) $)
                      |TMFORM;formatFunction|)
                (EXIT
                 (|TMFORM;group|
                  (SPADCALL
                   (LIST |ops| " "
                         (|TMFORM;parenthesize|
                          (|TMFORM;formatNary| '|,| "" 0 |args| (QREFELT $ 8)
                           $)
                          $))
                   (QREFELT $ 36))
                  $))))) 

(SDEFUN |TMFORM;formatNullary| ((|op| |Symbol|) ($ |String|))
        (COND ((EQUAL |op| 'NOTHING) "\"\"")
              ('T
               (|TMFORM;group|
                (SPADCALL (LIST "\"" (SPADCALL |op| (QREFELT $ 41)) "()\"")
                          (QREFELT $ 36))
                $)))) 

(SDEFUN |TMFORM;formatUnary|
        ((|op| |Symbol|) (|arg| |OutputForm|) (|prec| |Integer|) ($ |String|))
        (SPROG ((|s| (|String|)) (|opPrec| (|Integer|)) (|p| (|Integer|)))
               (SEQ
                (LETT |p| (SPADCALL |op| (QREFELT $ 9) (QREFELT $ 43))
                      . #1=(|TMFORM;formatUnary|))
                (EXIT
                 (COND ((< |p| 1) (|error| "unknown unary op"))
                       (#2='T
                        (SEQ
                         (LETT |opPrec|
                               (SPADCALL (QREFELT $ 10) |p| (QREFELT $ 45))
                               . #1#)
                         (LETT |s|
                               (SPADCALL
                                (LIST "(concat \""
                                      (SPADCALL |op| (QREFELT $ 41)) "\" "
                                      (|TMFORM;formatExpr| |arg| |opPrec| $)
                                      ")")
                                (QREFELT $ 36))
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
          (LETT |p| (SPADCALL |op| (QREFELT $ 11) (QREFELT $ 43))
                . #2=(|TMFORM;formatBinary|))
          (EXIT
           (COND ((< |p| 1) (|error| "unknown binary op"))
                 (#3='T
                  (SEQ
                   (LETT |opPrec| (SPADCALL (QREFELT $ 12) |p| (QREFELT $ 45))
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
                                                                              47))
                                                           (QREFELT $ 47))
                                                 (QREFELT $ 47))
                                       (QREFELT $ 47)))
                            (QREFELT $ 36)))
                          ((EQUAL |op| '/)
                           (SPADCALL (LIST "(frac " |s1| " " |s2| ")")
                                     (QREFELT $ 36)))
                          (#3#
                           (COND
                            ((EQUAL |op| 'OVER)
                             (SPADCALL (LIST "(frac " |s1| " " |s2| ")")
                                       (QREFELT $ 36)))
                            (#3#
                             (SEQ
                              (LETT |ops|
                                    (COND ((EQUAL |op| '~=) "<ne>")
                                          ((EQUAL |op| '<) "<less>")
                                          ((EQUAL |op| '<=) "<leq>")
                                          ((EQUAL |op| '>) "<gtr>")
                                          ((EQUAL |op| '>=) "<geq>")
                                          (#3#
                                           (COND ((EQUAL |op| 'LET) ":=")
                                                 (#3#
                                                  (SPADCALL |op|
                                                            (QREFELT $ 41))))))
                                    . #2#)
                              (EXIT
                               (SPADCALL
                                (LIST "(concat " |s1| " \"" |ops| "\" " |s2|
                                      ")")
                                (QREFELT $ 36))))))))
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
         ((|s| (|String|)) (|l| (|List| (|String|))) (#1=#:G270 NIL) (|a| NIL)
          (|opPrec| (|Integer|)) (|ops| (|String|)) (|tmpS| (|String|))
          (|p| (|Integer|)))
         (SEQ
          (COND ((NULL |args|) "")
                (#2='T
                 (SEQ
                  (LETT |p| (SPADCALL |op| (QREFELT $ 13) (QREFELT $ 43))
                        . #3=(|TMFORM;formatNaryNoGroup|))
                  (EXIT
                   (COND ((< |p| 1) (|error| "unknown nary op"))
                         (#2#
                          (SEQ
                           (COND
                            ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 31))
                             (COND
                              ((SPADCALL (SPADCALL |args| 2 (QREFELT $ 39))
                                         'ZAG (QREFELT $ 49))
                               (EXIT
                                (COND
                                 ((SPADCALL |op| '+ (QREFELT $ 52))
                                  (|error| "ZAG in unexpected place"))
                                 (#2#
                                  (SEQ
                                   (LETT |tmpS|
                                         (|TMFORM;stringify|
                                          (|SPADfirst| |args|) $)
                                         . #3#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |args| 1 (QREFELT $ 39)) 'ZAG
                                       (QREFELT $ 49))
                                      (|TMFORM;formatZag| |args| $))
                                     (#2#
                                      (SPADCALL
                                       (LIST
                                        (|TMFORM;formatExpr|
                                         (|SPADfirst| |args|) (QREFELT $ 8) $)
                                        " \"+\" "
                                        (|TMFORM;formatZag| (CDR |args|) $))
                                       (QREFELT $ 36)))))))))))))
                           (LETT |ops|
                                 (COND ((EQUAL |op| 'STRSEP) |sep|)
                                       ((EQUAL |op| 'ROW) ") (cell ")
                                       ((EQUAL |op| 'TENSOR) " \"<otimes>\" ")
                                       (#2#
                                        (SPADCALL
                                         (LIST " \""
                                               (SPADCALL |op| (QREFELT $ 41))
                                               "\" ")
                                         (QREFELT $ 36))))
                                 . #3#)
                           (LETT |l| NIL . #3#)
                           (LETT |opPrec|
                                 (COND ((EQUAL |op| 'STRSEP) |opprec|)
                                       (#2#
                                        (SPADCALL (QREFELT $ 14) |p|
                                                  (QREFELT $ 45))))
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
                                 (SPADCALL (REVERSE (CDR |l|)) (QREFELT $ 36))
                                 . #3#)
                           (EXIT
                            (COND
                             ((< |opPrec| |prec|)
                              (|TMFORM;parenthesize| |s| $))
                             (#2# |s|))))))))))))) 

(SDEFUN |TMFORM;formatZag| ((|args| |List| (|OutputForm|)) ($ |String|))
        (SPROG ((|op| (|String|)) (|tmpZag| (|List| (|OutputForm|))))
               (SEQ
                (LETT |tmpZag| (|SPADfirst| |args|) . #1=(|TMFORM;formatZag|))
                (EXIT
                 (COND
                  ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 31))
                   (SPADCALL "(frac "
                             (SPADCALL
                              (|TMFORM;formatExpr| (|SPADfirst| (CDR |tmpZag|))
                               (QREFELT $ 8) $)
                              (SPADCALL "(concat "
                                        (SPADCALL
                                         (|TMFORM;formatExpr|
                                          (|SPADfirst| (CDR (CDR |tmpZag|)))
                                          (QREFELT $ 8) $)
                                         (SPADCALL " \"+\" "
                                                   (SPADCALL
                                                    (|TMFORM;formatZag|
                                                     (CDR |args|) $)
                                                    "))" (QREFELT $ 47))
                                                   (QREFELT $ 47))
                                         (QREFELT $ 47))
                                        (QREFELT $ 47))
                              (QREFELT $ 47))
                             (QREFELT $ 47)))
                  ((SPADCALL (|SPADfirst| |args|)
                             (SPADCALL '|...| (QREFELT $ 53)) (QREFELT $ 54))
                   "<ldots>")
                  ((SPADCALL (SPADCALL |args| 1 (QREFELT $ 39)) 'ZAG
                             (QREFELT $ 49))
                   (SPADCALL "(frac "
                             (SPADCALL
                              (|TMFORM;formatExpr| (|SPADfirst| (CDR |tmpZag|))
                               (QREFELT $ 8) $)
                              (SPADCALL
                               (|TMFORM;formatExpr|
                                (|SPADfirst| (CDR (CDR |tmpZag|)))
                                (QREFELT $ 8) $)
                               ")" (QREFELT $ 47))
                              (QREFELT $ 47))
                             (QREFELT $ 47)))
                  ('T
                   (SEQ
                    (LETT |op| (|TMFORM;stringify| (|SPADfirst| |args|) $)
                          . #1#)
                    (EXIT
                     (|error|
                      (SPADCALL
                       "formatZag: Last argument in ZAG construct has unknown operator: "
                       |op| (QREFELT $ 47))))))))))) 

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
                ((SPADCALL |expr| (QREFELT $ 55))
                 (SEQ (LETT |str| (|TMFORM;stringify| |expr| $) . #1#)
                      (LETT |len| (QCSIZE |str|) . #1#)
                      (EXIT
                       (COND
                        ((SPADCALL |expr| (QREFELT $ 56))
                         (SEQ (LETT |i| (SPADCALL |expr| (QREFELT $ 57)) . #1#)
                              (EXIT
                               (COND
                                ((OR (< |i| 0) (SPADCALL |i| 9 (QREFELT $ 31)))
                                 (|TMFORM;group|
                                  (SEQ (LETT |nstr| "" . #1#)
                                       (SEQ G190
                                            (COND
                                             ((NULL
                                               (SPADCALL
                                                (LETT |len| (QCSIZE |str|)
                                                      . #1#)
                                                |intSplitLen| (QREFELT $ 31)))
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
                                                                               33))
                                                                    (QREFELT $
                                                                             34)))
                                                    (QREFELT $ 36))
                                                   . #1#)
                                             (EXIT
                                              (LETT |str|
                                                    (SPADCALL |str|
                                                              (SPADCALL
                                                               (+ |intSplitLen|
                                                                  1)
                                                               (QREFELT $ 58))
                                                              (QREFELT $ 34))
                                                    . #1#)))
                                            NIL (GO G190) G191 (EXIT NIL))
                                       (EXIT
                                        (COND
                                         ((SPADCALL |nstr| (QREFELT $ 59))
                                          (SPADCALL (LIST " \"" |str| "\" ")
                                                    (QREFELT $ 36)))
                                         (#2='T
                                          (SEQ
                                           (LETT |nstr|
                                                 (COND
                                                  ((SPADCALL |str|
                                                             (QREFELT $ 59))
                                                   |nstr|)
                                                  (#2#
                                                   (SPADCALL
                                                    (LIST |nstr| " " |str|)
                                                    (QREFELT $ 36))))
                                                 . #1#)
                                           (EXIT
                                            (SPADCALL
                                             (LIST
                                              (SPADCALL |nstr|
                                                        (SPADCALL 2
                                                                  (QREFELT $
                                                                           58))
                                                        (QREFELT $ 34)))
                                             (QREFELT $ 36))))))))
                                  $))
                                ('T
                                 (SPADCALL (LIST " \"" |str| "\" ")
                                           (QREFELT $ 36)))))))
                        ((EQUAL |str| "%pi") "<pi>") ((EQUAL |str| "%e") "e")
                        ((EQUAL |str| "%i") "i")
                        (#2#
                         (SEQ
                          (COND
                           ((SPADCALL |len| 0 (QREFELT $ 31))
                            (COND
                             ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 61))
                                        (|STR_to_CHAR| "%"))
                              (EXIT
                               (SPADCALL (LIST " \"" |str| "\" ")
                                         (QREFELT $ 36)))))))
                          (COND
                           ((SPADCALL |len| 0 (QREFELT $ 31))
                            (COND
                             ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 61))
                                        (|STR_to_CHAR| "\""))
                              (EXIT
                               (SPADCALL (LIST "(concat " |str| ")")
                                         (QREFELT $ 36)))))))
                          (COND
                           ((EQL |len| 1)
                            (COND
                             ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 61))
                                        (|STR_to_CHAR| " "))
                              (EXIT " ")))))
                          (COND
                           ((SPADCALL |expr| (QREFELT $ 62))
                            (SEQ
                             (LETT |op| (SPADCALL |expr| (QREFELT $ 63)) . #1#)
                             (LETT |i|
                                   (SPADCALL |op| (QREFELT $ 19)
                                             (QREFELT $ 43))
                                   . #1#)
                             (EXIT
                              (COND
                               ((SPADCALL |i| 0 (QREFELT $ 31))
                                (SPADCALL (QREFELT $ 20) |i|
                                          (QREFELT $ 65))))))))
                          (LETT |i|
                                (SPADCALL (|STR_to_CHAR| " ") |str|
                                          (QREFELT $ 67))
                                . #1#)
                          (EXIT
                           (COND
                            ((SPADCALL |i| 0 (QREFELT $ 31))
                             (SPADCALL (LIST " \"" |str| "\" ")
                                       (QREFELT $ 36)))
                            (#2#
                             (|TMFORM;group|
                              (SPADCALL (LIST " \"" |str| "\" ")
                                        (QREFELT $ 36))
                              $))))))))))
                (#2#
                 (SEQ (LETT |opf| (SPADCALL |expr| (QREFELT $ 68)) . #1#)
                      (LETT |args| (SPADCALL |expr| (QREFELT $ 50)) . #1#)
                      (LETT |nargs| (LENGTH |args|) . #1#)
                      (EXIT
                       (COND
                        ((SPADCALL |opf| (QREFELT $ 62))
                         (SEQ (LETT |op| (SPADCALL |opf| (QREFELT $ 63)) . #1#)
                              (EXIT
                               (COND
                                ((SPADCALL |op| (QREFELT $ 18) (QREFELT $ 69))
                                 (|TMFORM;formatSpecial| |op| |args| |prec| $))
                                ((SPADCALL |op| (QREFELT $ 16) (QREFELT $ 69))
                                 (|TMFORM;formatPlex| |op| |args| |prec| $))
                                ((EQL 0 |nargs|)
                                 (|TMFORM;formatNullary| |op| $))
                                (#2#
                                 (SEQ
                                  (COND
                                   ((EQL 1 |nargs|)
                                    (COND
                                     ((SPADCALL |op| (QREFELT $ 9)
                                                (QREFELT $ 69))
                                      (EXIT
                                       (|TMFORM;formatUnary| |op|
                                        (|SPADfirst| |args|) |prec| $))))))
                                  (COND
                                   ((EQL 2 |nargs|)
                                    (COND
                                     ((SPADCALL |op| (QREFELT $ 11)
                                                (QREFELT $ 69))
                                      (EXIT
                                       (|TMFORM;formatBinary| |op| |args|
                                        |prec| $))))))
                                  (EXIT
                                   (COND
                                    ((SPADCALL |op| (QREFELT $ 15)
                                               (QREFELT $ 69))
                                     (|TMFORM;formatNaryNoGroup| |op| "" 0
                                      |args| |prec| $))
                                    ((SPADCALL |op| (QREFELT $ 13)
                                               (QREFELT $ 69))
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
         (PROG (#1=#:G305)
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
          (LETT $ (GETREFV 72) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|TexmacsFormat| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 " \\  ")
          (QSETREFV $ 7 1000000)
          (QSETREFV $ 8 0)
          (QSETREFV $ 9 '(-))
          (QSETREFV $ 10 '(710))
          (QSETREFV $ 11 '(+-> |\|| ^ / = ~= < <= > >= OVER LET))
          (QSETREFV $ 12 (LIST 0 0 900 700 400 400 400 400 400 400 700 125))
          (QSETREFV $ 13 '(- + * |,| |;| ROW STRSEP TENSOR))
          (QSETREFV $ 14 (LIST 700 700 800 110 110 0 0 850))
          (QSETREFV $ 15 '(ROW))
          (QSETREFV $ 16 '(SIGMA SIGMA2 PI PI2 INTSIGN INDEFINTEGRAL))
          (QSETREFV $ 17 '(750 750 750 750 700 700))
          (QSETREFV $ 18
                    '(MATRIX BRACKET BRACE CONCATB VCONCAT AGGLST CONCAT
                      OVERBAR ROOT SUB TAG SUPERSUB ZAG AGGSET SC PAREN SEGMENT
                      QUOTE |theMap| SLASH PRIME BOX EQUATNUM BINOMIAL
                      NOTHING))
          (QSETREFV $ 19
                    '(|cos| |cot| |csc| |log| |sec| |sin| |tan| |cosh| |coth|
                      |csch| |sech| |sinh| |tanh| |acos| |asin| |atan| |erf|
                      |...| $ |infinity| |Gamma|))
          (QSETREFV $ 20
                    (LIST "\"cos\"" "\"cot\"" "\"csc\"" "\"log\"" "\"sec\""
                          "\"sin\"" "\"tan\"" "\"cosh\"" "\"coth\"" "\"csch\""
                          "\"sech\"" "\"sinh\"" "\"tanh\"" "\"arccos\""
                          "\"arcsin\"" "\"arctan\"" "\"erf\"" "\"<cdots>\""
                          "\"$\"" "\"<infty>\"" "\"<Gamma>\""))
          $))) 

(MAKEPROP '|TexmacsFormat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|blank| '|maxPrec| '|minPrec|
              '|unaryOps| '|unaryPrecs| '|binaryOps| '|binaryPrecs| '|naryOps|
              '|naryPrecs| '|naryNGOps| '|plexOps| '|plexPrecs| '|specialOps|
              '|specialStrings| '|specialStringsInMML| (|String|)
              (|OutputForm|) |TMFORM;coerce;OfS;1| |TMFORM;coerceL;OfS;3|
              (|Void|) (0 . |void|) |TMFORM;display;SV;4| (|Integer|)
              (4 . |position|) (|Boolean|) (11 . >) (|UniversalSegment| 28)
              (17 . |segment|) (23 . |elt|) (|List| $) (29 . |concat|)
              (|List| 22) (34 . |second|) (39 . |elt|) (|Symbol|)
              (45 . |string|) (|List| 40) (50 . |position|) (|List| 28)
              (56 . |elt|) (62 . ~=) (68 . |elt|) (|OutputFormTools|)
              (74 . |has_op?|) (80 . |arguments|) (85 . |is_symbol?|) (91 . ~=)
              (97 . |coerce|) (102 . =) (108 . |atom?|) (113 . |integer?|)
              (118 . |integer|) (123 . |segment|) (128 . |empty?|)
              (|Character|) (133 . |elt|) (139 . |symbol?|) (144 . |symbol|)
              (|List| 21) (149 . |elt|) (155 . |char|) (160 . |position|)
              (166 . |operator|) (171 . |member?|) (|SingleInteger|)
              (|HashState|))
           '#(~= 177 |latex| 183 |hashUpdate!| 188 |hash| 194 |display| 199
              |coerceL| 204 |coerce| 209 = 219)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 22))
                        (|makeByteWordVec2| 71
                                            '(0 25 0 26 3 21 28 0 0 28 29 2 28
                                              30 0 0 31 2 32 0 28 28 33 2 21 0
                                              0 32 34 1 21 0 35 36 1 37 22 0 38
                                              2 37 22 0 28 39 1 40 21 0 41 2 42
                                              28 40 0 43 2 44 28 0 28 45 2 28
                                              30 0 0 46 2 21 0 0 0 47 2 48 30
                                              22 40 49 1 48 37 22 50 2 48 30 22
                                              40 51 2 40 30 0 0 52 1 40 22 0 53
                                              2 22 30 0 0 54 1 48 30 22 55 1 48
                                              30 22 56 1 48 28 22 57 1 32 0 28
                                              58 1 21 30 0 59 2 21 60 0 28 61 1
                                              48 30 22 62 1 48 40 22 63 2 64 21
                                              0 28 65 1 60 0 21 66 2 21 28 60 0
                                              67 1 48 22 22 68 2 42 30 40 0 69
                                              2 0 30 0 0 1 1 0 21 0 1 2 0 71 71
                                              0 1 1 0 70 0 1 1 0 25 21 27 1 0
                                              21 22 24 1 0 21 22 23 1 0 22 0 1
                                              2 0 30 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|TexmacsFormat| 'NILADIC T) 
