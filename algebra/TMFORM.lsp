
(/VERSIONCHECK 2) 

(DEFUN |TMFORM;has_op?| (|expr| |op| $)
  (PROG (|e1|)
    (RETURN
     (SEQ
      (COND ((ATOM |expr|) 'NIL)
            ('T
             (SEQ (LETT |e1| (|SPADfirst| |expr|) |TMFORM;has_op?|)
                  (EXIT (EQ |e1| |op|))))))))) 

(DEFUN |TMFORM;coerce;OfS;2| (|expr| $)
  (PROG (|s|)
    (RETURN
     (SEQ
      (LETT |s|
            (|TMFORM;postcondition|
             (|TMFORM;formatExpr| (|TMFORM;precondition| |expr| $)
              (QREFELT $ 8) $)
             $)
            |TMFORM;coerce;OfS;2|)
      (EXIT |s|))))) 

(PUT '|TMFORM;sayExpr| '|SPADreplace| '|sayTexmacs|) 

(DEFUN |TMFORM;sayExpr| (|s| $) (|sayTexmacs| |s|)) 

(DEFUN |TMFORM;coerceL;OfS;4| (|expr| $)
  (PROG (|s|)
    (RETURN
     (SEQ
      (LETT |s|
            (|TMFORM;postcondition|
             (|TMFORM;formatExpr| (|TMFORM;precondition| |expr| $)
              (QREFELT $ 8) $)
             $)
            |TMFORM;coerceL;OfS;4|)
      (|TMFORM;sayExpr| "scheme: (with \"mode\" \"math\"" $)
      (|TMFORM;sayExpr| |s| $) (|TMFORM;sayExpr| ")" $) (EXIT |s|))))) 

(DEFUN |TMFORM;display;SV;5| (|texmacs| $)
  (SEQ (|TMFORM;sayExpr| "scheme: (with \"mode\" \"math\"" $)
       (|TMFORM;sayExpr| |texmacs| $) (|TMFORM;sayExpr| ")" $)
       (EXIT (SPADCALL (QREFELT $ 26))))) 

(PUT '|TMFORM;ungroup| '|SPADreplace| '(XLAM (|str|) |str|)) 

(DEFUN |TMFORM;ungroup| (|str| $) |str|) 

(DEFUN |TMFORM;postcondition| (|str| $)
  (PROG (|uend| |ustart| |pos| |plusminus| |len|)
    (RETURN
     (SEQ (LETT |len| (QCSIZE |str|) . #1=(|TMFORM;postcondition|))
          (LETT |plusminus| "\"+\" (concat \"-\"" . #1#)
          (LETT |pos| (SPADCALL |plusminus| |str| 1 (QREFELT $ 29)) . #1#)
          (COND
           ((SPADCALL |pos| 0 (QREFELT $ 31))
            (SEQ (LETT |ustart| (SPADCALL 1 (- |pos| 1) (QREFELT $ 33)) . #1#)
                 (LETT |uend| (SPADCALL (+ |pos| 15) |len| (QREFELT $ 33))
                       . #1#)
                 (LETT |str|
                       (SPADCALL
                        (LIST (SPADCALL |str| |ustart| (QREFELT $ 34))
                              "(concat \"-\""
                              (SPADCALL |str| |uend| (QREFELT $ 34)))
                        (QREFELT $ 36))
                       . #1#)
                 (EXIT
                  (COND
                   ((< |pos| (- |len| 13))
                    (LETT |str| (|TMFORM;postcondition| |str| $) . #1#)))))))
          (EXIT |str|))))) 

(PUT '|TMFORM;stringify| '|SPADreplace| '|mathObject2String|) 

(DEFUN |TMFORM;stringify| (|expr| $) (|mathObject2String| |expr|)) 

(DEFUN |TMFORM;optionalWrap| (|s| |expr| |prec| $)
  (PROG (|tmp|)
    (RETURN
     (SEQ
      (LETT |tmp| (|TMFORM;formatExpr| |expr| |prec| $) |TMFORM;optionalWrap|)
      (COND ((OR (EQUAL |tmp| "") (EQUAL |tmp| " ")) (EXIT "")))
      (EXIT (SPADCALL (LIST "(" |s| " " |tmp| ")") (QREFELT $ 36))))))) 

(DEFUN |TMFORM;group| (|str| $)
  (SPADCALL (LIST "(concat " |str| ")") (QREFELT $ 36))) 

(DEFUN |TMFORM;addBraces| (|str| $)
  (SPADCALL (LIST " \"{\" " |str| " \"}\" ") (QREFELT $ 36))) 

(DEFUN |TMFORM;addBrackets| (|str| $)
  (SPADCALL (LIST " \"[\" " |str| " \"]\" ") (QREFELT $ 36))) 

(DEFUN |TMFORM;parenthesize| (|str| $)
  (SPADCALL (LIST " \"(\" " |str| " \")\" ") (QREFELT $ 36))) 

(PUT '|TMFORM;precondition| '|SPADreplace| '|outputTran|) 

(DEFUN |TMFORM;precondition| (|expr| $) (|outputTran| |expr|)) 

(DEFUN |TMFORM;formatSpecial| (|op| |args| |prec| $)
  (PROG (|base| |tmp| |prescript|)
    (RETURN
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
                    (LIST (|TMFORM;formatExpr| (|SPADfirst| |args|) |prec| $)
                          " \"<rightarrow>\" "
                          (|TMFORM;formatExpr| (SPADCALL |args| (QREFELT $ 38))
                           |prec| $))
                    (QREFELT $ 36))
                   $))
                 ((EQUAL |op| 'SLASH)
                  (|TMFORM;group|
                   (SPADCALL
                    (LIST (|TMFORM;formatExpr| (|SPADfirst| |args|) |prec| $)
                          " \"/\" "
                          (|TMFORM;formatExpr| (SPADCALL |args| (QREFELT $ 38))
                           |prec| $))
                    (QREFELT $ 36))
                   $))
                 ((EQUAL |op| 'CONCATB)
                  (|TMFORM;formatNary| 'STRSEP "(space \"1quad\")" 0 |args|
                   |prec| $))
                 ((EQUAL |op| 'CONCAT)
                  (|TMFORM;formatNary| 'STRSEP "" 0 |args| (QREFELT $ 8) $))
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
                     (|TMFORM;formatExpr| (|SPADfirst| |args|) (QREFELT $ 8) $)
                     $)
                    $)
                   $))
                 ((EQUAL |op| 'BRACE)
                  (|TMFORM;group|
                   (|TMFORM;addBraces|
                    (|TMFORM;ungroup|
                     (|TMFORM;formatExpr| (|SPADfirst| |args|) (QREFELT $ 8) $)
                     $)
                    $)
                   $))
                 ((EQUAL |op| 'PAREN)
                  (|TMFORM;group|
                   (|TMFORM;parenthesize|
                    (|TMFORM;ungroup|
                     (|TMFORM;formatExpr| (|SPADfirst| |args|) (QREFELT $ 8) $)
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
                                     (|SPADfirst| (CDR |args|)) (QREFELT $ 8)
                                     $)
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
                                    (|SPADfirst| (CDR |args|)) (QREFELT $ 8)
                                    $))
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
                      (|error| "multiscript object has more than 4 scripts"))
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
                 ((EQUAL |op| 'MATRIX) (|TMFORM;formatMatrix| (CDR |args|) $))
                 ((EQUAL |op| 'BINOMIAL)
                  (SPADCALL
                   (LIST "(binom "
                         (|TMFORM;formatExpr|
                          (SPADCALL |args| 1 (QREFELT $ 39)) (QREFELT $ 8) $)
                         " "
                         (|TMFORM;formatExpr|
                          (SPADCALL |args| 2 (QREFELT $ 39)) (QREFELT $ 8) $)
                         ")")
                   (QREFELT $ 36)))
                 ((EQUAL |op| 'NOTHING) "\"\"")
                 (#2#
                  (SPADCALL
                   (LIST "(concat \"not done yet for: "
                         (SPADCALL |op| (QREFELT $ 41)) "\")")
                   (QREFELT $ 36))))))))) 

(DEFUN |TMFORM;formatPlex| (|op| |args| |prec| $)
  (PROG (|s| |t1| |t2| |body| |ops| |n| |opPrec| |p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |op| (QREFELT $ 16) (QREFELT $ 43))
            . #1=(|TMFORM;formatPlex|))
      (EXIT
       (COND ((< |p| 1) (|error| "unknown plex op"))
             (#2='T
              (SEQ
               (LETT |opPrec| (SPADCALL (QREFELT $ 17) |p| (QREFELT $ 45))
                     . #1#)
               (LETT |n| (LENGTH |args|) . #1#)
               (COND
                ((SPADCALL |n| 2 (QREFELT $ 46))
                 (COND
                  ((SPADCALL |n| 3 (QREFELT $ 46))
                   (EXIT (|error| "wrong number of arguments for plex"))))))
               (LETT |ops|
                     (COND
                      ((EQUAL |op| 'SIGMA)
                       (COND ((EQL |n| 2) "<sum>")
                             (#2#
                              (|error| "wrong number of arguments for plex"))))
                      ((EQUAL |op| 'SIGMA2)
                       (COND ((EQL |n| 3) "<sum>")
                             (#2#
                              (|error| "wrong number of arguments for plex"))))
                      ((EQUAL |op| 'PI)
                       (COND ((EQL |n| 2) "<prod>")
                             (#2#
                              (|error| "wrong number of arguments for plex"))))
                      ((EQUAL |op| 'PI2)
                       (COND ((EQL |n| 3) "<prod>")
                             (#2#
                              (|error| "wrong number of arguments for plex"))))
                      ((EQUAL |op| 'INTSIGN)
                       (COND ((EQL |n| 3) "<int>")
                             (#2#
                              (|error| "wrong number of arguments for plex"))))
                      ((EQUAL |op| 'INDEFINTEGRAL)
                       (|error| "INDEFINTEGRAL not handled"))
                      (#2#
                       (|error|
                        (SPADCALL
                         (SPADCALL "Unexpected plex op:"
                                   (SPADCALL |op| (QREFELT $ 41))
                                   (QREFELT $ 47))
                         (QREFELT $ 48)))))
                     . #1#)
               (LETT |body|
                     (COND
                      ((EQUAL |op| 'INTSIGN)
                       (STRCONC
                        (|TMFORM;formatIntBody|
                         (SPADCALL |args| 3 (QREFELT $ 39)) (QREFELT $ 8) $)
                        " (big \".\")"))
                      (#2#
                       (|TMFORM;formatExpr|
                        (SPADCALL |args| |n| (QREFELT $ 39)) |opPrec| $)))
                     . #1#)
               (LETT |t2|
                     (COND
                      ((EQL |n| 3)
                       (SPADCALL
                        (LIST " (rsup "
                              (|TMFORM;formatExpr|
                               (SPADCALL |args| 2 (QREFELT $ 39)) (QREFELT $ 8)
                               $)
                              ")")
                        (QREFELT $ 36)))
                      (#2# ""))
                     . #1#)
               (LETT |t1|
                     (|TMFORM;formatExpr| (SPADCALL |args| 1 (QREFELT $ 39))
                      (QREFELT $ 8) $)
                     . #1#)
               (LETT |s|
                     (SPADCALL
                      (LIST "(big-around \"" |ops| "\" (concat (rsub " |t1| ")"
                            |t2| " " |body| "))")
                      (QREFELT $ 36))
                     . #1#)
               (COND
                ((< |opPrec| |prec|)
                 (LETT |s| (|TMFORM;parenthesize| |s| $) . #1#)))
               (EXIT |s|))))))))) 

(DEFUN |TMFORM;formatIntBody| (|body| |opPrec| $)
  (PROG (#1=#:G264 |bvarS| |bvarL| |bvar| |bodyL|)
    (RETURN
     (SEQ
      (EXIT
       (SEQ
        (COND
         ((|TMFORM;has_op?| |body| '* $)
          (SEQ (LETT |bodyL| |body| . #2=(|TMFORM;formatIntBody|))
               (EXIT
                (COND
                 ((EQL (LENGTH |bodyL|) 3)
                  (COND
                   ((|TMFORM;has_op?|
                     (LETT |bvar| (SPADCALL |bodyL| 3 (QREFELT $ 39)) . #2#)
                     'CONCAT $)
                    (SEQ (LETT |bvarL| |bvar| . #2#)
                         (EXIT
                          (COND
                           ((EQL (LENGTH |bvarL|) 3)
                            (COND
                             ((EQ (SPADCALL |bvarL| 2 (QREFELT $ 39)) '|d|)
                              (SEQ
                               (LETT |bvarS|
                                     (|TMFORM;stringify|
                                      (SPADCALL |bvarL| 3 (QREFELT $ 39)) $)
                                     . #2#)
                               (EXIT
                                (PROGN
                                 (LETT #1#
                                       (SPADCALL
                                        (LIST "(concat "
                                              (|TMFORM;formatExpr|
                                               (SPADCALL |bodyL| 2
                                                         (QREFELT $ 39))
                                               |opPrec| $)
                                              " \"*<mathd>" |bvarS| "\")")
                                        (QREFELT $ 36))
                                       . #2#)
                                 (GO #1#))))))))))))))))))
        (EXIT (|TMFORM;formatExpr| |body| |opPrec| $))))
      #1# (EXIT #1#))))) 

(DEFUN |TMFORM;formatMatrix| (|args| $)
  (|TMFORM;group|
   (SPADCALL
    (LIST "(matrix (tformat (table (row (cell "
          (|TMFORM;formatNaryNoGroup| 'STRSEP ")) (row (cell " 0 |args|
           (QREFELT $ 8) $)
          ")))))")
    (QREFELT $ 36))
   $)) 

(DEFUN |TMFORM;formatFunction| (|op| |args| |prec| $)
  (PROG (|ops|)
    (RETURN
     (SEQ
      (LETT |ops| (|TMFORM;formatExpr| |op| (QREFELT $ 8) $)
            |TMFORM;formatFunction|)
      (EXIT
       (|TMFORM;group|
        (SPADCALL
         (LIST |ops| " "
               (|TMFORM;parenthesize|
                (|TMFORM;formatNary| '|,| "" 0 |args| (QREFELT $ 8) $) $))
         (QREFELT $ 36))
        $)))))) 

(DEFUN |TMFORM;formatNullary| (|op| $)
  (COND ((EQUAL |op| 'NOTHING) "\"\"")
        ('T
         (|TMFORM;group|
          (SPADCALL (LIST "\"" (SPADCALL |op| (QREFELT $ 41)) "()\"")
                    (QREFELT $ 36))
          $)))) 

(DEFUN |TMFORM;formatUnary| (|op| |arg| |prec| $)
  (PROG (|s| |opPrec| |p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |op| (QREFELT $ 9) (QREFELT $ 43))
            . #1=(|TMFORM;formatUnary|))
      (EXIT
       (COND ((< |p| 1) (|error| "unknown unary op"))
             (#2='T
              (SEQ
               (LETT |opPrec| (SPADCALL (QREFELT $ 10) |p| (QREFELT $ 45))
                     . #1#)
               (LETT |s|
                     (SPADCALL
                      (LIST "(concat \"" (SPADCALL |op| (QREFELT $ 41)) "\" "
                            (|TMFORM;formatExpr| |arg| |opPrec| $) ")")
                      (QREFELT $ 36))
                     . #1#)
               (EXIT
                (COND
                 ((< |opPrec| |prec|)
                  (|TMFORM;group| (|TMFORM;parenthesize| |s| $) $))
                 ((EQUAL |op| '-) |s|) (#2# (|TMFORM;group| |s| $)))))))))))) 

(DEFUN |TMFORM;formatBinary| (|op| |args| |prec| $)
  (PROG (|s| |ops| |s2| |s1| |opPrec| |p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |op| (QREFELT $ 11) (QREFELT $ 43))
            . #1=(|TMFORM;formatBinary|))
      (EXIT
       (COND ((< |p| 1) (|error| "unknown binary op"))
             (#2='T
              (SEQ
               (LETT |opPrec| (SPADCALL (QREFELT $ 12) |p| (QREFELT $ 45))
                     . #1#)
               (LETT |s1| (|TMFORM;formatExpr| (|SPADfirst| |args|) |opPrec| $)
                     . #1#)
               (LETT |s2|
                     (|TMFORM;formatExpr| (|SPADfirst| (CDR |args|)) |opPrec|
                      $)
                     . #1#)
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
                      (#2#
                       (COND
                        ((EQUAL |op| 'OVER)
                         (SPADCALL (LIST "(frac " |s1| " " |s2| ")")
                                   (QREFELT $ 36)))
                        (#2#
                         (SEQ
                          (LETT |ops|
                                (COND ((EQUAL |op| '~=) "<ne>")
                                      ((EQUAL |op| '<) "<less>")
                                      ((EQUAL |op| '<=) "<leq>")
                                      ((EQUAL |op| '>) "<gtr>")
                                      ((EQUAL |op| '>=) "<geq>")
                                      (#2#
                                       (COND ((EQUAL |op| 'LET) ":=")
                                             (#2#
                                              (SPADCALL |op|
                                                        (QREFELT $ 41))))))
                                . #1#)
                          (EXIT
                           (SPADCALL
                            (LIST "(concat " |s1| " \"" |ops| "\" " |s2| ")")
                            (QREFELT $ 36))))))))
                     . #1#)
               (EXIT
                (|TMFORM;group|
                 (COND
                  ((OR (OR (EQUAL |op| '/) (EQUAL |op| 'OVER))
                       (NULL (< |opPrec| |prec|)))
                   |s|)
                  ('T (|TMFORM;parenthesize| |s| $)))
                 $)))))))))) 

(DEFUN |TMFORM;formatNary| (|op| |sep| |opprec| |args| |prec| $)
  (|TMFORM;group|
   (|TMFORM;formatNaryNoGroup| |op| |sep| |opprec| |args| |prec| $) $)) 

(DEFUN |TMFORM;formatNaryNoGroup| (|op| |sep| |opprec| |args| |prec| $)
  (PROG (|s| |l| #1=#:G294 |a| |opPrec| |ops| |tmpS| |p|)
    (RETURN
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
                          ((|TMFORM;has_op?| (SPADCALL |args| 2 (QREFELT $ 39))
                            'ZAG $)
                           (EXIT
                            (COND
                             ((SPADCALL |op| '+ (QREFELT $ 49))
                              (|error| "ZAG in unexpected place"))
                             (#2#
                              (SEQ
                               (LETT |tmpS|
                                     (|TMFORM;stringify| (|SPADfirst| |args|)
                                      $)
                                     . #3#)
                               (EXIT
                                (COND
                                 ((|TMFORM;has_op?|
                                   (SPADCALL |args| 1 (QREFELT $ 39)) 'ZAG $)
                                  (|TMFORM;formatZag| |args| $))
                                 (#2#
                                  (SPADCALL
                                   (LIST
                                    (|TMFORM;formatExpr| (|SPADfirst| |args|)
                                     (QREFELT $ 8) $)
                                    " \"+\" "
                                    (|TMFORM;formatZag| (CDR |args|) $))
                                   (QREFELT $ 36)))))))))))))
                       (LETT |ops|
                             (COND ((EQUAL |op| 'STRSEP) |sep|)
                                   ((EQUAL |op| 'ROW) ") (cell ")
                                   ((EQUAL |op| 'TENSOR) " \"<otimes>\" ")
                                   (#2#
                                    (SPADCALL
                                     (LIST " \"" (SPADCALL |op| (QREFELT $ 41))
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
                       (SEQ (LETT |a| NIL . #3#) (LETT #1# |args| . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |l|
                                    (CONS |ops|
                                          (CONS
                                           (|TMFORM;formatExpr| |a| |opPrec| $)
                                           |l|))
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |s| (SPADCALL (REVERSE (CDR |l|)) (QREFELT $ 36))
                             . #3#)
                       (EXIT
                        (COND
                         ((< |opPrec| |prec|) (|TMFORM;parenthesize| |s| $))
                         (#2# |s|)))))))))))))) 

(DEFUN |TMFORM;formatZag| (|args| $)
  (PROG (|op| |tmpZag|)
    (RETURN
     (SEQ (LETT |tmpZag| (|SPADfirst| |args|) . #1=(|TMFORM;formatZag|))
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
                                              (|TMFORM;formatZag| (CDR |args|)
                                               $)
                                              "))" (QREFELT $ 47))
                                             (QREFELT $ 47))
                                   (QREFELT $ 47))
                                  (QREFELT $ 47))
                        (QREFELT $ 47))
                       (QREFELT $ 47)))
            ((SPADCALL (|SPADfirst| |args|) (SPADCALL '|...| (QREFELT $ 50))
                       (QREFELT $ 51))
             "<ldots>")
            ((|TMFORM;has_op?| (SPADCALL |args| 1 (QREFELT $ 39)) 'ZAG $)
             (SPADCALL "(frac "
                       (SPADCALL
                        (|TMFORM;formatExpr| (|SPADfirst| (CDR |tmpZag|))
                         (QREFELT $ 8) $)
                        (SPADCALL
                         (|TMFORM;formatExpr|
                          (|SPADfirst| (CDR (CDR |tmpZag|))) (QREFELT $ 8) $)
                         ")" (QREFELT $ 47))
                        (QREFELT $ 47))
                       (QREFELT $ 47)))
            ('T
             (SEQ (LETT |op| (|TMFORM;stringify| (|SPADfirst| |args|) $) . #1#)
                  (EXIT
                   (|error|
                    (SPADCALL
                     (SPADCALL
                      "formatZag: Last argument in ZAG construct has unknown operator: "
                      |op| (QREFELT $ 47))
                     (QREFELT $ 48)))))))))))) 

(DEFUN |TMFORM;formatExpr| (|expr| |prec| $)
  (PROG (|op| |nargs| |args| |opf| |l| |i| |nstr| |str| |len| |intSplitLen|)
    (RETURN
     (SEQ (LETT |intSplitLen| 20 . #1=(|TMFORM;formatExpr|))
          (EXIT
           (COND
            ((ATOM |expr|)
             (SEQ (LETT |str| (|TMFORM;stringify| |expr| $) . #1#)
                  (LETT |len| (QCSIZE |str|) . #1#)
                  (EXIT
                   (COND
                    ((FIXP |expr|)
                     (SEQ (LETT |i| |expr| . #1#)
                          (EXIT
                           (COND
                            ((OR (< |i| 0) (SPADCALL |i| 9 (QREFELT $ 31)))
                             (|TMFORM;group|
                              (SEQ (LETT |nstr| "" . #1#)
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (SPADCALL
                                            (LETT |len| (QCSIZE |str|) . #1#)
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
                                                           (+ |intSplitLen| 1)
                                                           (QREFELT $ 52))
                                                          (QREFELT $ 34))
                                                . #1#)))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |nstr| (QREFELT $ 53))
                                      (SPADCALL (LIST " \"" |str| "\" ")
                                                (QREFELT $ 36)))
                                     (#2='T
                                      (SEQ
                                       (LETT |nstr|
                                             (COND
                                              ((SPADCALL |str| (QREFELT $ 53))
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
                                                    (SPADCALL 2 (QREFELT $ 52))
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
                         ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 55))
                                    (|STR_to_CHAR| "%"))
                          (EXIT
                           (SPADCALL (LIST " \"" |str| "\" ")
                                     (QREFELT $ 36)))))))
                      (COND
                       ((SPADCALL |len| 0 (QREFELT $ 31))
                        (COND
                         ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 55))
                                    (|STR_to_CHAR| "\""))
                          (EXIT
                           (SPADCALL (LIST "(concat " |str| ")")
                                     (QREFELT $ 36)))))))
                      (COND
                       ((EQL |len| 1)
                        (COND
                         ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 55))
                                    (|STR_to_CHAR| " "))
                          (EXIT " ")))))
                      (COND
                       ((SYMBOLP |expr|)
                        (SEQ (LETT |op| |expr| . #1#)
                             (LETT |i|
                                   (SPADCALL |op| (QREFELT $ 19)
                                             (QREFELT $ 43))
                                   . #1#)
                             (EXIT
                              (COND
                               ((SPADCALL |i| 0 (QREFELT $ 31))
                                (SPADCALL (QREFELT $ 20) |i|
                                          (QREFELT $ 57))))))))
                      (LETT |i|
                            (SPADCALL (|STR_to_CHAR| " ") |str| (QREFELT $ 59))
                            . #1#)
                      (EXIT
                       (COND
                        ((SPADCALL |i| 0 (QREFELT $ 31))
                         (SPADCALL (LIST " \"" |str| "\" ") (QREFELT $ 36)))
                        (#2#
                         (|TMFORM;group|
                          (SPADCALL (LIST " \"" |str| "\" ") (QREFELT $ 36))
                          $))))))))))
            (#2#
             (SEQ (LETT |l| |expr| . #1#)
                  (EXIT
                   (COND ((NULL |l|) (QREFELT $ 6))
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
                                         ((SPADCALL |op| (QREFELT $ 18)
                                                    (QREFELT $ 60))
                                          (|TMFORM;formatSpecial| |op| |args|
                                           |prec| $))
                                         ((SPADCALL |op| (QREFELT $ 16)
                                                    (QREFELT $ 60))
                                          (|TMFORM;formatPlex| |op| |args|
                                           |prec| $))
                                         ((EQL 0 |nargs|)
                                          (|TMFORM;formatNullary| |op| $))
                                         (#2#
                                          (SEQ
                                           (COND
                                            ((EQL 1 |nargs|)
                                             (COND
                                              ((SPADCALL |op| (QREFELT $ 9)
                                                         (QREFELT $ 60))
                                               (EXIT
                                                (|TMFORM;formatUnary| |op|
                                                 (|SPADfirst| |args|) |prec|
                                                 $))))))
                                           (COND
                                            ((EQL 2 |nargs|)
                                             (COND
                                              ((SPADCALL |op| (QREFELT $ 11)
                                                         (QREFELT $ 60))
                                               (EXIT
                                                (|TMFORM;formatBinary| |op|
                                                 |args| |prec| $))))))
                                           (EXIT
                                            (COND
                                             ((SPADCALL |op| (QREFELT $ 15)
                                                        (QREFELT $ 60))
                                              (|TMFORM;formatNaryNoGroup| |op|
                                               "" 0 |args| |prec| $))
                                             ((SPADCALL |op| (QREFELT $ 13)
                                                        (QREFELT $ 60))
                                              (|TMFORM;formatNary| |op| "" 0
                                               |args| |prec| $))
                                             (#2#
                                              (|TMFORM;formatFunction|
                                               (|SPADfirst| |l|) |args| |prec|
                                               $))))))))))
                                 (#2#
                                  (|TMFORM;formatFunction| (|SPADfirst| |l|)
                                   |args| |prec| $)))))))))))))))) 

(DECLAIM (NOTINLINE |TexmacsFormat;|)) 

(DEFUN |TexmacsFormat| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G330)
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
             ((NOT #1#) (HREM |$ConstructorCache| '|TexmacsFormat|))))))))))) 

(DEFUN |TexmacsFormat;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|TexmacsFormat|) . #1=(|TexmacsFormat|))
      (LETT $ (GETREFV 63) . #1#)
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
                '(MATRIX BRACKET BRACE CONCATB VCONCAT AGGLST CONCAT OVERBAR
                  ROOT SUB TAG SUPERSUB ZAG AGGSET SC PAREN SEGMENT QUOTE
                  |theMap| SLASH PRIME BOX EQUATNUM BINOMIAL NOTHING))
      (QSETREFV $ 19
                '(|cos| |cot| |csc| |log| |sec| |sin| |tan| |cosh| |coth|
                  |csch| |sech| |sinh| |tanh| |acos| |asin| |atan| |erf| |...|
                  $ |infinity| |Gamma|))
      (QSETREFV $ 20
                (LIST "\"cos\"" "\"cot\"" "\"csc\"" "\"log\"" "\"sec\""
                      "\"sin\"" "\"tan\"" "\"cosh\"" "\"coth\"" "\"csch\""
                      "\"sech\"" "\"sinh\"" "\"tanh\"" "\"arccos\""
                      "\"arcsin\"" "\"arctan\"" "\"erf\"" "\"<cdots>\"" "\"$\""
                      "\"<infty>\"" "\"<Gamma>\""))
      $)))) 

(MAKEPROP '|TexmacsFormat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|blank| '|maxPrec| '|minPrec|
              '|unaryOps| '|unaryPrecs| '|binaryOps| '|binaryPrecs| '|naryOps|
              '|naryPrecs| '|naryNGOps| '|plexOps| '|plexPrecs| '|specialOps|
              '|specialStrings| '|specialStringsInMML| (|String|)
              (|OutputForm|) |TMFORM;coerce;OfS;2| |TMFORM;coerceL;OfS;4|
              (|Void|) (0 . |void|) |TMFORM;display;SV;5| (|Integer|)
              (4 . |position|) (|Boolean|) (11 . >) (|UniversalSegment| 28)
              (17 . |segment|) (23 . |elt|) (|List| $) (29 . |concat|)
              (|List| 22) (34 . |second|) (39 . |elt|) (|Symbol|)
              (45 . |string|) (|List| 40) (50 . |position|) (|List| 28)
              (56 . |elt|) (62 . ~=) (68 . |elt|) (74 . |coerce|) (79 . ~=)
              (85 . |coerce|) (90 . =) (96 . |segment|) (101 . |empty?|)
              (|Character|) (106 . |elt|) (|List| 21) (112 . |elt|)
              (118 . |char|) (123 . |position|) (129 . |member?|)
              (|SingleInteger|) (|HashState|))
           '#(~= 135 |latex| 141 |hashUpdate!| 146 |hash| 152 |display| 157
              |coerceL| 162 |coerce| 167 = 177)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 22))
                        (|makeByteWordVec2| 62
                                            '(0 25 0 26 3 21 28 0 0 28 29 2 28
                                              30 0 0 31 2 32 0 28 28 33 2 21 0
                                              0 32 34 1 21 0 35 36 1 37 22 0 38
                                              2 37 22 0 28 39 1 40 21 0 41 2 42
                                              28 40 0 43 2 44 28 0 28 45 2 28
                                              30 0 0 46 2 21 0 0 0 47 1 21 22 0
                                              48 2 40 30 0 0 49 1 40 22 0 50 2
                                              22 30 0 0 51 1 32 0 28 52 1 21 30
                                              0 53 2 21 54 0 28 55 2 56 21 0 28
                                              57 1 54 0 21 58 2 21 28 54 0 59 2
                                              42 30 40 0 60 2 0 30 0 0 1 1 0 21
                                              0 1 2 0 62 62 0 1 1 0 61 0 1 1 0
                                              25 21 27 1 0 21 22 24 1 0 21 22
                                              23 1 0 22 0 1 2 0 30 0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|TexmacsFormat| 'NILADIC T) 
