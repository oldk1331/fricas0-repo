
(/VERSIONCHECK 2) 

(DEFUN |MMLFORM;has_op?| (|expr| |op| $)
  (PROG (|e1|)
    (RETURN
     (SEQ
      (COND ((ATOM |expr|) 'NIL)
            ('T
             (SEQ (LETT |e1| (|SPADfirst| |expr|) |MMLFORM;has_op?|)
                  (EXIT (EQ |e1| |op|))))))))) 

(DEFUN |MMLFORM;coerce;OfS;2| (|expr| $)
  (PROG (|s|)
    (RETURN
     (SEQ
      (LETT |s|
            (|MMLFORM;postcondition|
             (|MMLFORM;formatExpr| (|MMLFORM;precondition| |expr| $)
              (QREFELT $ 8) $)
             $)
            |MMLFORM;coerce;OfS;2|)
      (EXIT |s|))))) 

(PUT '|MMLFORM;sayExpr| '|SPADreplace| '|sayMathML|) 

(DEFUN |MMLFORM;sayExpr| (|s| $) (|sayMathML| |s|)) 

(DEFUN |MMLFORM;coerceS;OfS;4| (|expr| $)
  (PROG (|s|)
    (RETURN
     (SEQ
      (LETT |s|
            (|MMLFORM;postcondition|
             (|MMLFORM;formatExpr| (|MMLFORM;precondition| |expr| $)
              (QREFELT $ 8) $)
             $)
            |MMLFORM;coerceS;OfS;4|)
      (|MMLFORM;sayExpr|
       "<math xmlns=\"http://www.w3.org/1998/Math/MathML\" mathsize=\"big\" display=\"block\">"
       $)
      (|MMLFORM;displayElt| |s| $) (|MMLFORM;sayExpr| "</math>" $)
      (EXIT |s|))))) 

(DEFUN |MMLFORM;coerceL;OfS;5| (|expr| $)
  (PROG (|s|)
    (RETURN
     (SEQ
      (LETT |s|
            (|MMLFORM;postcondition|
             (|MMLFORM;formatExpr| (|MMLFORM;precondition| |expr| $)
              (QREFELT $ 8) $)
             $)
            |MMLFORM;coerceL;OfS;5|)
      (|MMLFORM;sayExpr|
       "<math xmlns=\"http://www.w3.org/1998/Math/MathML\" mathsize=\"big\" display=\"block\">"
       $)
      (|MMLFORM;sayExpr| |s| $) (|MMLFORM;sayExpr| "</math>" $) (EXIT |s|))))) 

(DEFUN |MMLFORM;display;SV;6| (|mathml| $)
  (SEQ
   (|MMLFORM;sayExpr|
    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\" mathsize=\"big\" display=\"block\">"
    $)
   (|MMLFORM;sayExpr| |mathml| $) (|MMLFORM;sayExpr| "</math>" $)
   (EXIT (SPADCALL (QREFELT $ 27))))) 

(DEFUN |MMLFORM;exprex;OfS;7| (|expr| $)
  (PROG (|s| |s1| #1=#:G211 |a| |nargs| |args| |sop| |op| |le|)
    (RETURN
     (SEQ
      (LETT |expr| (|MMLFORM;precondition| |expr| $)
            . #2=(|MMLFORM;exprex;OfS;7|))
      (COND
       ((OR (ATOM |expr|) (EQUAL (|MMLFORM;stringify| |expr| $) "NOTHING"))
        (EXIT
         (SPADCALL (LIST "{" (|MMLFORM;stringify| |expr| $) "}")
                   (QREFELT $ 30)))))
      (LETT |le| |expr| . #2#) (LETT |op| (|SPADfirst| |le|) . #2#)
      (LETT |sop| (SPADCALL |op| (QREFELT $ 31)) . #2#)
      (LETT |args| (CDR |le|) . #2#) (LETT |nargs| (LENGTH |args|) . #2#)
      (LETT |s| (SPADCALL (LIST "{" |sop|) (QREFELT $ 30)) . #2#)
      (COND
       ((SPADCALL |nargs| 0 (QREFELT $ 34))
        (SEQ (LETT |a| NIL . #2#) (LETT #1# |args| . #2#) G190
             (COND
              ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #2#) NIL))
               (GO G191)))
             (SEQ (LETT |s1| (SPADCALL |a| (QREFELT $ 31)) . #2#)
                  (EXIT
                   (LETT |s| (SPADCALL (LIST |s| |s1|) (QREFELT $ 30)) . #2#)))
             (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))))
      (EXIT (LETT |s| (SPADCALL (LIST |s| "}") (QREFELT $ 30)) . #2#)))))) 

(DEFUN |MMLFORM;displayElt| (|mathML| $)
  (PROG (|u| |enT| |enE| |name| |length| |end|)
    (RETURN
     (SEQ (LETT |end| (QCSIZE |mathML|) . #1=(|MMLFORM;displayElt|))
          (LETT |length| 60 . #1#)
          (LETT |name| (|MMLFORM;eltName| 1 |mathML| $) . #1#)
          (LETT |enE|
                (|MMLFORM;eltLimit| |name| (+ 2 (QCSIZE |name|)) |mathML| $)
                . #1#)
          (COND
           ((< |enE| |length|)
            (SEQ (LETT |u| (SPADCALL 1 |enE| (QREFELT $ 36)) . #1#)
                 (EXIT (|sayTeX| (SPADCALL |mathML| |u| (QREFELT $ 37))))))
           ('T
            (SEQ (LETT |enT| (|MMLFORM;tagEnd| |name| 1 |mathML| $) . #1#)
                 (LETT |u| (SPADCALL 1 |enT| (QREFELT $ 36)) . #1#)
                 (|sayTeX| (SPADCALL |mathML| |u| (QREFELT $ 37)))
                 (LETT |u|
                       (SPADCALL (+ |enT| 1) (- (- |enE| (QCSIZE |name|)) 3)
                                 (QREFELT $ 36))
                       . #1#)
                 (|MMLFORM;displayElt| (SPADCALL |mathML| |u| (QREFELT $ 37))
                  $)
                 (LETT |u|
                       (SPADCALL (- (- |enE| (QCSIZE |name|)) 2) |enE|
                                 (QREFELT $ 36))
                       . #1#)
                 (EXIT (|sayTeX| (SPADCALL |mathML| |u| (QREFELT $ 37)))))))
          (COND
           ((SPADCALL |end| |enE| (QREFELT $ 34))
            (SEQ (LETT |u| (SPADCALL (+ |enE| 1) |end| (QREFELT $ 36)) . #1#)
                 (EXIT
                  (|MMLFORM;displayElt| (SPADCALL |mathML| |u| (QREFELT $ 37))
                   $)))))
          (EXIT (SPADCALL (QREFELT $ 27))))))) 

(DEFUN |MMLFORM;eltName| (|pos| |mathML| $)
  (PROG (|name| |u| |i|)
    (RETURN
     (SEQ (LETT |i| (+ |pos| 1) . #1=(|MMLFORM;eltName|))
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL |mathML| |i| (QREFELT $ 39))
                            (|spadConstant| $ 41) (QREFELT $ 42)))
                 (GO G191)))
               (SEQ (EXIT (LETT |i| (+ |i| 1) . #1#))) NIL (GO G190) G191
               (EXIT NIL))
          (LETT |u| (SPADCALL (+ |pos| 1) (- |i| 1) (QREFELT $ 36)) . #1#)
          (EXIT (LETT |name| (SPADCALL |mathML| |u| (QREFELT $ 37)) . #1#)))))) 

(DEFUN |MMLFORM;eltLimit| (|name| |pos| |mathML| $)
  (PROG (|pI| |level| |endI| |startI| |endS| |startS|)
    (RETURN
     (SEQ (LETT |pI| |pos| . #1=(|MMLFORM;eltLimit|))
          (LETT |startS| (SPADCALL (LIST "<" |name|) (QREFELT $ 30)) . #1#)
          (LETT |endS| (SPADCALL (LIST "</" |name| ">") (QREFELT $ 30)) . #1#)
          (LETT |level| 1 . #1#)
          (SEQ G190
               (COND ((NULL (SPADCALL |level| 0 (QREFELT $ 34))) (GO G191)))
               (SEQ
                (LETT |startI| (SPADCALL |startS| |mathML| |pI| (QREFELT $ 43))
                      . #1#)
                (LETT |endI| (SPADCALL |endS| |mathML| |pI| (QREFELT $ 43))
                      . #1#)
                (EXIT
                 (COND
                  ((OR (EQL |startI| 0) (NULL (< |startI| |endI|)))
                   (SEQ (LETT |level| (- |level| 1) . #1#)
                        (EXIT
                         (LETT |pI| (|MMLFORM;tagEnd| |name| |endI| |mathML| $)
                               . #1#))))
                  ('T
                   (SEQ (LETT |level| (+ |level| 1) . #1#)
                        (EXIT
                         (LETT |pI|
                               (|MMLFORM;tagEnd| |name| |startI| |mathML| $)
                               . #1#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT |pI|))))) 

(DEFUN |MMLFORM;tagEnd| (|name| |pos| |mathML| $)
  (PROG (|u| |pI|)
    (RETURN
     (SEQ (LETT |pI| |pos| . #1=(|MMLFORM;tagEnd|))
          (SEQ G190
               (COND
                ((NULL
                  (SPADCALL (SPADCALL |mathML| |pI| (QREFELT $ 39))
                            (|STR_to_CHAR| ">") (QREFELT $ 44)))
                 (GO G191)))
               (SEQ (EXIT (LETT |pI| (+ |pI| 1) . #1#))) NIL (GO G190) G191
               (EXIT NIL))
          (LETT |u| (SPADCALL |pos| |pI| (QREFELT $ 36)) . #1#) (EXIT |pI|))))) 

(DEFUN |MMLFORM;atomize| (|expr| $)
  (PROG (|le| #1=#:G235 |a| |letmp|)
    (RETURN
     (SEQ (LETT |le| NIL . #2=(|MMLFORM;atomize|))
          (COND
           ((OR (ATOM |expr|) (EQUAL (|MMLFORM;stringify| |expr| $) "NOTHING"))
            (EXIT
             (LETT |le| (APPEND |le| (SPADCALL |expr| (QREFELT $ 46)))
                   . #2#))))
          (LETT |letmp| |expr| . #2#)
          (SEQ (LETT |a| NIL . #2#) (LETT #1# |letmp| . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |le| (APPEND |le| (|MMLFORM;atomize| |a| $)) . #2#)))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT |le|))))) 

(DEFUN |MMLFORM;ungroup| (|str| $)
  (PROG (|u| |u2| |u1| |rrow| |lrow| |len|)
    (RETURN
     (SEQ (LETT |len| (QCSIZE |str|) . #1=(|MMLFORM;ungroup|))
          (EXIT
           (COND ((< |len| 14) |str|)
                 ('T
                  (SEQ (LETT |lrow| "<mrow>" . #1#)
                       (LETT |rrow| "</mrow>" . #1#)
                       (LETT |u1| (SPADCALL 1 6 (QREFELT $ 36)) . #1#)
                       (LETT |u2| (SPADCALL (- |len| 6) |len| (QREFELT $ 36))
                             . #1#)
                       (COND
                        ((EQUAL (SPADCALL |str| |u1| (QREFELT $ 37)) |lrow|)
                         (COND
                          ((EQUAL (SPADCALL |str| |u2| (QREFELT $ 37)) |rrow|)
                           (SEQ
                            (LETT |u| (SPADCALL 7 (- |len| 7) (QREFELT $ 36))
                                  . #1#)
                            (EXIT
                             (LETT |str| (SPADCALL |str| |u| (QREFELT $ 37))
                                   . #1#)))))))
                       (EXIT |str|))))))))) 

(DEFUN |MMLFORM;postcondition| (|str| $)
  (PROG (|uend| |ustart| |pos| |plusminus| |len|)
    (RETURN
     (SEQ (LETT |len| (QCSIZE |str|) . #1=(|MMLFORM;postcondition|))
          (LETT |plusminus| "<mo>+</mo><mo>-</mo>" . #1#)
          (LETT |pos| (SPADCALL |plusminus| |str| 1 (QREFELT $ 43)) . #1#)
          (COND
           ((SPADCALL |pos| 0 (QREFELT $ 34))
            (SEQ (LETT |ustart| (SPADCALL 1 (- |pos| 1) (QREFELT $ 36)) . #1#)
                 (LETT |uend| (SPADCALL (+ |pos| 20) |len| (QREFELT $ 36))
                       . #1#)
                 (LETT |str|
                       (SPADCALL
                        (LIST (SPADCALL |str| |ustart| (QREFELT $ 37))
                              "<mo>-</mo>"
                              (SPADCALL |str| |uend| (QREFELT $ 37)))
                        (QREFELT $ 30))
                       . #1#)
                 (EXIT
                  (COND
                   ((< |pos| (- |len| 18))
                    (LETT |str| (|MMLFORM;postcondition| |str| $) . #1#)))))))
          (EXIT |str|))))) 

(PUT '|MMLFORM;stringify| '|SPADreplace| '|mathObject2String|) 

(DEFUN |MMLFORM;stringify| (|expr| $) (|mathObject2String| |expr|)) 

(DEFUN |MMLFORM;optionalWrap| (|expr| $)
  (PROG (|tmp|)
    (RETURN
     (SEQ
      (LETT |tmp| (|MMLFORM;formatExpr| |expr| (QREFELT $ 8) $)
            |MMLFORM;optionalWrap|)
      (COND ((OR (EQUAL |tmp| "") (EQUAL |tmp| " ")) (EXIT "<none/>")))
      (EXIT (SPADCALL (LIST "<mrow>" |tmp| "</mrow>") (QREFELT $ 30))))))) 

(DEFUN |MMLFORM;group| (|str| $)
  (SPADCALL (LIST "<mrow>" |str| "</mrow>") (QREFELT $ 30))) 

(DEFUN |MMLFORM;addBraces| (|str| $)
  (SPADCALL (LIST "<mo>{</mo>" |str| "<mo>}</mo>") (QREFELT $ 30))) 

(DEFUN |MMLFORM;addBrackets| (|str| $)
  (SPADCALL (LIST "<mo>[</mo>" |str| "<mo>]</mo>") (QREFELT $ 30))) 

(DEFUN |MMLFORM;parenthesize| (|str| $)
  (SPADCALL (LIST "<mo>(</mo>" |str| "<mo>)</mo>") (QREFELT $ 30))) 

(PUT '|MMLFORM;precondition| '|SPADreplace| '|outputTran|) 

(DEFUN |MMLFORM;precondition| (|expr| $) (|outputTran| |expr|)) 

(DEFUN |MMLFORM;formatSpecial| (|op| |args| |prec| $)
  (PROG (|tmp| |base| |tmp3| |tmp2| |tmp1| |n| #1=#:G290 |u| #2=#:G289
         |prescript|)
    (RETURN
     (SEQ (LETT |prescript| 'NIL . #3=(|MMLFORM;formatSpecial|))
          (EXIT
           (COND ((EQUAL |op| '|theMap|) "<mtext>theMap(...)</mtext>")
                 ((EQUAL |op| 'AGGLST)
                  (|MMLFORM;formatNary| '|,| "" 0 |args| |prec| $))
                 ((EQUAL |op| 'AGGSET)
                  (|MMLFORM;formatNary| '|;| "" 0 |args| |prec| $))
                 ((EQUAL |op| 'TAG)
                  (|MMLFORM;group|
                   (SPADCALL
                    (LIST (|MMLFORM;formatExpr| (|SPADfirst| |args|) |prec| $)
                          "<mo>&#x02192;</mo>"
                          (|MMLFORM;formatExpr|
                           (SPADCALL |args| (QREFELT $ 47)) |prec| $))
                    (QREFELT $ 30))
                   $))
                 ((EQUAL |op| 'SLASH)
                  (|MMLFORM;group|
                   (SPADCALL
                    (LIST (|MMLFORM;formatExpr| (|SPADfirst| |args|) |prec| $)
                          "<mo>/</mo>"
                          (|MMLFORM;formatExpr|
                           (SPADCALL |args| (QREFELT $ 47)) |prec| $))
                    (QREFELT $ 30))
                   $))
                 ((EQUAL |op| 'VCONCAT)
                  (|MMLFORM;group|
                   (SPADCALL
                    (LIST "<mtable><mtr>"
                          (SPADCALL
                           (PROGN
                            (LETT #2# NIL . #3#)
                            (SEQ (LETT |u| NIL . #3#) (LETT #1# |args| . #3#)
                                 G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #2#
                                         (CONS
                                          (SPADCALL
                                           (LIST "<mtd>"
                                                 (|MMLFORM;formatExpr| |u|
                                                  (QREFELT $ 8) $)
                                                 "</mtd>")
                                           (QREFELT $ 30))
                                          #2#)
                                         . #3#)))
                                 (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                 (EXIT (NREVERSE #2#))))
                           (QREFELT $ 30))
                          "</mtr></mtable>")
                    (QREFELT $ 30))
                   $))
                 ((EQUAL |op| 'CONCATB)
                  (|MMLFORM;formatNary| 'STRSEP " " 0 |args| (QREFELT $ 8) $))
                 ((EQUAL |op| 'CONCAT)
                  (|MMLFORM;formatNary| 'STRSEP "" 0 |args| (QREFELT $ 8) $))
                 ((EQUAL |op| 'QUOTE)
                  (|MMLFORM;group|
                   (STRCONC "<mo>'</mo>"
                            (|MMLFORM;formatExpr| (|SPADfirst| |args|)
                             (QREFELT $ 8) $))
                   $))
                 ((EQUAL |op| 'BRACKET)
                  (|MMLFORM;group|
                   (|MMLFORM;addBrackets|
                    (|MMLFORM;ungroup|
                     (|MMLFORM;formatExpr| (|SPADfirst| |args|) (QREFELT $ 8)
                      $)
                     $)
                    $)
                   $))
                 ((EQUAL |op| 'BRACE)
                  (|MMLFORM;group|
                   (|MMLFORM;addBraces|
                    (|MMLFORM;ungroup|
                     (|MMLFORM;formatExpr| (|SPADfirst| |args|) (QREFELT $ 8)
                      $)
                     $)
                    $)
                   $))
                 ((EQUAL |op| 'PAREN)
                  (|MMLFORM;group|
                   (|MMLFORM;parenthesize|
                    (|MMLFORM;ungroup|
                     (|MMLFORM;formatExpr| (|SPADfirst| |args|) (QREFELT $ 8)
                      $)
                     $)
                    $)
                   $))
                 ((EQUAL |op| 'PRIME) (|MMLFORM;formatPrime| |args| |prec| $))
                 ((EQUAL |op| 'OVERBAR)
                  (COND ((NULL |args|) "")
                        (#4='T
                         (|MMLFORM;group|
                          (SPADCALL
                           (LIST "<mover accent='true'><mrow>"
                                 (|MMLFORM;formatExpr| (|SPADfirst| |args|)
                                  (QREFELT $ 8) $)
                                 "</mrow><mo stretchy='true'>&#x000AF;</mo></mover>")
                           (QREFELT $ 30))
                          $))))
                 ((EQUAL |op| 'ROOT)
                  (COND ((NULL |args|) "")
                        (#4#
                         (SEQ
                          (LETT |tmp|
                                (|MMLFORM;group|
                                 (|MMLFORM;formatExpr| (|SPADfirst| |args|)
                                  (QREFELT $ 8) $)
                                 $)
                                . #3#)
                          (EXIT
                           (COND
                            ((NULL (CDR |args|))
                             (SPADCALL (LIST "<msqrt>" |tmp| "</msqrt>")
                                       (QREFELT $ 30)))
                            (#4#
                             (|MMLFORM;group|
                              (SPADCALL
                               (LIST "<mroot><mrow>" |tmp| "</mrow>"
                                     (|MMLFORM;formatExpr|
                                      (|SPADfirst| (CDR |args|)) (QREFELT $ 8)
                                      $)
                                     "</mroot>")
                               (QREFELT $ 30))
                              $))))))))
                 ((EQUAL |op| 'SEGMENT)
                  (SEQ
                   (LETT |tmp|
                         (SPADCALL
                          (LIST
                           (|MMLFORM;formatExpr| (|SPADfirst| |args|)
                            (QREFELT $ 8) $)
                           "<mo>..</mo>")
                          (QREFELT $ 30))
                         . #3#)
                   (EXIT
                    (|MMLFORM;group|
                     (COND ((NULL (CDR |args|)) |tmp|)
                           (#4#
                            (SPADCALL
                             (LIST |tmp|
                                   (|MMLFORM;formatExpr|
                                    (|SPADfirst| (CDR |args|)) (QREFELT $ 8)
                                    $))
                             (QREFELT $ 30))))
                     $))))
                 ((EQUAL |op| 'SUB)
                  (|MMLFORM;group|
                   (SPADCALL
                    (LIST "<msub>"
                          (|MMLFORM;formatExpr| (|SPADfirst| |args|)
                           (QREFELT $ 8) $)
                          (|MMLFORM;formatSpecial| 'AGGLST (CDR |args|)
                           (QREFELT $ 8) $)
                          "</msub>")
                    (QREFELT $ 30))
                   $))
                 ((EQUAL |op| 'SUPERSUB)
                  (SEQ
                   (LETT |base|
                         (SPADCALL
                          (LIST "<mrow>"
                                (|MMLFORM;formatExpr| (|SPADfirst| |args|)
                                 (QREFELT $ 8) $)
                                "</mrow>")
                          (QREFELT $ 30))
                         . #3#)
                   (LETT |args| (CDR |args|) . #3#)
                   (LETT |n| (LENGTH |args|) . #3#)
                   (EXIT
                    (COND
                     ((SPADCALL |n| 4 (QREFELT $ 49))
                      (|error| "multiscript object has more than 4 scripts"))
                     (#4#
                      (SEQ
                       (LETT |tmp1|
                             (|MMLFORM;optionalWrap|
                              (SPADCALL |args| 1 (QREFELT $ 50)) $)
                             . #3#)
                       (EXIT
                        (COND
                         ((EQL |n| 1)
                          (SPADCALL (LIST "<msub>" |base| |tmp1| "</msub>")
                                    (QREFELT $ 30)))
                         (#4#
                          (SEQ
                           (LETT |tmp2|
                                 (|MMLFORM;optionalWrap|
                                  (SPADCALL |args| 2 (QREFELT $ 50)) $)
                                 . #3#)
                           (EXIT
                            (COND
                             ((EQL |n| 2)
                              (SPADCALL
                               (LIST "<msubsup>" |base| |tmp1| |tmp2|
                                     "</msubsup>")
                               (QREFELT $ 30)))
                             (#4#
                              (SEQ
                               (LETT |tmp3|
                                     (|MMLFORM;optionalWrap|
                                      (SPADCALL |args| 3 (QREFELT $ 50)) $)
                                     . #3#)
                               (LETT |base|
                                     (SPADCALL
                                      (LIST "<mmultiscripts>" |base| |tmp1|
                                            |tmp2| "<mprescripts/>" |tmp3|)
                                      (QREFELT $ 30))
                                     . #3#)
                               (EXIT
                                (COND
                                 ((EQL |n| 3)
                                  (SPADCALL
                                   (LIST |base| "<none/></mmultiscripts>")
                                   (QREFELT $ 30)))
                                 (#4#
                                  (SPADCALL
                                   (LIST |base|
                                         (|MMLFORM;optionalWrap|
                                          (SPADCALL |args| 4 (QREFELT $ 50)) $)
                                         "</mmultiscripts>")
                                   (QREFELT $ 30)))))))))))))))))))
                 ((EQUAL |op| 'SC)
                  (COND ((NULL |args|) "")
                        (#4#
                         (SEQ
                          (LETT |tmp|
                                (|MMLFORM;formatNaryNoGroup| 'STRSEP
                                 "</mtd></mtr><mtr><mtd>" 800 |args|
                                 (QREFELT $ 8) $)
                                . #3#)
                          (EXIT
                           (|MMLFORM;group|
                            (SPADCALL
                             (LIST "<mtable><mtr><mtd>" |tmp|
                                   "</mtd></mtr></mtable>")
                             (QREFELT $ 30))
                            $))))))
                 ((EQUAL |op| 'MATRIX) (|MMLFORM;formatMatrix| (CDR |args|) $))
                 ((EQUAL |op| 'BOX)
                  (COND ((NULL |args|) "")
                        (#4#
                         (SEQ
                          (LETT |tmp|
                                (|MMLFORM;formatNaryNoGroup| 'STRSEP "" 0
                                 |args| (QREFELT $ 8) $)
                                . #3#)
                          (EXIT
                           (|MMLFORM;group|
                            (SPADCALL
                             (LIST "<mtable frame=\"solid\"><mtr><mtd>" |tmp|
                                   "</mtd></mtr></mtable>")
                             (QREFELT $ 30))
                            $))))))
                 ((EQUAL |op| 'EQUATNUM)
                  (SPADCALL
                   (LIST "<mtable><mtr><mtd>"
                         (|MMLFORM;formatExpr|
                          (SPADCALL |args| 1 (QREFELT $ 50)) (QREFELT $ 8) $)
                         "</mtd><mtd style=\"padding-left: 50px;\">"
                         (|MMLFORM;formatExpr|
                          (SPADCALL |args| 2 (QREFELT $ 50)) (QREFELT $ 8) $)
                         "</mtd></mtr></mtable>")
                   (QREFELT $ 30)))
                 ((EQUAL |op| 'BINOMIAL)
                  (SPADCALL
                   (LIST "<mrow><mo stretchy=\"true\">(</mo>"
                         "<mfrac linethickness=\"0\">"
                         (|MMLFORM;formatExpr|
                          (SPADCALL |args| 1 (QREFELT $ 50)) (QREFELT $ 8) $)
                         (|MMLFORM;formatExpr|
                          (SPADCALL |args| 2 (QREFELT $ 50)) (QREFELT $ 8) $)
                         "</mfrac><mo>)</mo></mrow>")
                   (QREFELT $ 30)))
                 ((EQUAL |op| 'NOTHING) "<none/>")
                 ((EQUAL |op| 'ZAG)
                  (SPADCALL
                   (LIST
                    "<mtable><mtr><mtd style=\"border-right: solid 1px black;"
                    " border-bottom: solid 1px black; padding-right: 2px;"
                    " padding-left: 2px;\">"
                    (|MMLFORM;formatExpr| (|SPADfirst| |args|) (QREFELT $ 8) $)
                    "</mtd></mtr><mtr><mtd style=\"border-left: solid 1px black;"
                    " padding-left: 2px; padding-right: 2px;\">"
                    (|MMLFORM;formatExpr| (|SPADfirst| (CDR |args|))
                     (QREFELT $ 8) $)
                    "</mtd></mtr></mtable>")
                   (QREFELT $ 30)))
                 (#4#
                  (SPADCALL
                   (LIST "<mtext>not done yet for: "
                         (SPADCALL |op| (QREFELT $ 52)) "</mtext>")
                   (QREFELT $ 30))))))))) 

(DEFUN |MMLFORM;formatPrime| (|args| |prec| $)
  (PROG (|arg2| |s| |commaTest| #1=#:G298 |i| |commaS|)
    (RETURN
     (SEQ
      (LETT |arg2| (SPADCALL |args| (QREFELT $ 47))
            . #2=(|MMLFORM;formatPrime|))
      (COND
       ((STRINGP |arg2|)
        (SEQ (LETT |commaS| |arg2| . #2#) (LETT |commaTest| "," . #2#)
             (EXIT
              (COND
               ((SPADCALL (SPADCALL |commaTest| |commaS| 1 (QREFELT $ 43)) 0
                          (QREFELT $ 34))
                (SEQ (LETT |s| "<mo>&#x02032;</mo>" . #2#)
                     (SEQ (LETT |i| 2 . #2#) (LETT #1# (QCSIZE |commaS|) . #2#)
                          G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (LETT |commaTest|
                                 (SPADCALL |commaTest| "," (QREFELT $ 53))
                                 . #2#)
                           (EXIT
                            (LETT |s|
                                  (SPADCALL |s| "<mo>&#x02032;</mo>"
                                            (QREFELT $ 53))
                                  . #2#)))
                          (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT
                      (COND
                       ((EQUAL |commaS| |commaTest|)
                        (LETT |arg2| (SPADCALL |s| (QREFELT $ 54))
                              . #2#)))))))))))
      (EXIT
       (|MMLFORM;formatSpecial| 'SUPERSUB
        (LIST (|SPADfirst| |args|) " " |arg2|) |prec| $)))))) 

(DEFUN |MMLFORM;formatPlex| (|op| |args| |prec| $)
  (PROG (|s| |t1| |t2| |body| |ops| |n| |opPrec| |p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |op| (QREFELT $ 16) (QREFELT $ 56))
            . #1=(|MMLFORM;formatPlex|))
      (EXIT
       (COND ((< |p| 1) (|error| "unknown plex op"))
             (#2='T
              (SEQ
               (LETT |opPrec| (SPADCALL (QREFELT $ 17) |p| (QREFELT $ 58))
                     . #1#)
               (LETT |n| (LENGTH |args|) . #1#)
               (COND
                ((SPADCALL |n| 2 (QREFELT $ 59))
                 (COND
                  ((SPADCALL |n| 3 (QREFELT $ 59))
                   (EXIT (|error| "wrong number of arguments for plex"))))))
               (LETT |ops|
                     (COND
                      ((EQUAL |op| 'SIGMA)
                       (COND ((EQL |n| 2) "&Sum;")
                             (#2#
                              (|error| "wrong number of arguments for plex"))))
                      ((EQUAL |op| 'SIGMA2)
                       (COND ((EQL |n| 3) "&Sum;")
                             (#2#
                              (|error| "wrong number of arguments for plex"))))
                      ((EQUAL |op| 'PI)
                       (COND ((EQL |n| 2) "&Pi;")
                             (#2#
                              (|error| "wrong number of arguments for plex"))))
                      ((EQUAL |op| 'PI2)
                       (COND ((EQL |n| 3) "&Pi;")
                             (#2#
                              (|error| "wrong number of arguments for plex"))))
                      ((EQUAL |op| 'INTSIGN)
                       (COND ((EQL |n| 3) "&int;")
                             (#2#
                              (|error| "wrong number of arguments for plex"))))
                      ((EQUAL |op| 'INDEFINTEGRAL)
                       (|error| "INDEFINTEGRAL not handled"))
                      (#2#
                       (|error|
                        (SPADCALL
                         (SPADCALL "Unexpected plex op:"
                                   (SPADCALL |op| (QREFELT $ 52))
                                   (QREFELT $ 53))
                         (QREFELT $ 60)))))
                     . #1#)
               (LETT |body|
                     (COND
                      ((EQUAL |op| 'INTSIGN)
                       (|MMLFORM;formatExpr| (SPADCALL |args| 3 (QREFELT $ 50))
                        (QREFELT $ 8) $))
                      (#2#
                       (|MMLFORM;formatExpr|
                        (SPADCALL |args| |n| (QREFELT $ 50)) |opPrec| $)))
                     . #1#)
               (LETT |t2|
                     (COND
                      ((EQL |n| 3)
                       (|MMLFORM;formatExpr| (SPADCALL |args| 2 (QREFELT $ 50))
                        (QREFELT $ 8) $))
                      (#2# "<none/>"))
                     . #1#)
               (LETT |t1|
                     (|MMLFORM;formatExpr| (SPADCALL |args| 1 (QREFELT $ 50))
                      (QREFELT $ 8) $)
                     . #1#)
               (LETT |s|
                     (SPADCALL
                      (LIST "<munderover><mo>" |ops| "</mo>" |t1| |t2|
                            "</munderover>" |body|)
                      (QREFELT $ 30))
                     . #1#)
               (COND
                ((< |opPrec| |prec|)
                 (LETT |s| (|MMLFORM;parenthesize| |s| $) . #1#)))
               (EXIT (|MMLFORM;group| |s| $)))))))))) 

(DEFUN |MMLFORM;formatMatrix| (|args| $)
  (|MMLFORM;group|
   (|MMLFORM;addBrackets|
    (SPADCALL
     (LIST "<mtable><mtr><mtd>"
           (|MMLFORM;formatNaryNoGroup| 'STRSEP "</mtd></mtr><mtr><mtd>" 0
            |args| (QREFELT $ 8) $)
           "</mtd></mtr></mtable>")
     (QREFELT $ 30))
    $)
   $)) 

(DEFUN |MMLFORM;formatFunction| (|op| |args| |prec| $)
  (PROG (|ops|)
    (RETURN
     (SEQ
      (LETT |ops| (|MMLFORM;formatExpr| |op| (QREFELT $ 8) $)
            |MMLFORM;formatFunction|)
      (EXIT
       (|MMLFORM;group|
        (SPADCALL
         (LIST "<mo>" |ops| "</mo>"
               (|MMLFORM;parenthesize|
                (|MMLFORM;formatNary| '|,| "" 0 |args| (QREFELT $ 8) $) $))
         (QREFELT $ 30))
        $)))))) 

(DEFUN |MMLFORM;formatNullary| (|op| $)
  (COND ((EQUAL |op| 'NOTHING) "")
        ('T
         (|MMLFORM;group|
          (SPADCALL
           (LIST "<mo>" (SPADCALL |op| (QREFELT $ 52))
                 "</mo><mo>(</mo><mo>)</mo>")
           (QREFELT $ 30))
          $)))) 

(DEFUN |MMLFORM;formatUnary| (|op| |arg| |prec| $)
  (PROG (|s| |opPrec| |p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |op| (QREFELT $ 9) (QREFELT $ 56))
            . #1=(|MMLFORM;formatUnary|))
      (EXIT
       (COND ((< |p| 1) (|error| "unknown unary op"))
             (#2='T
              (SEQ
               (LETT |opPrec| (SPADCALL (QREFELT $ 10) |p| (QREFELT $ 58))
                     . #1#)
               (LETT |s|
                     (SPADCALL
                      (LIST "<mo>" (SPADCALL |op| (QREFELT $ 52)) "</mo>"
                            (|MMLFORM;formatExpr| |arg| |opPrec| $))
                      (QREFELT $ 30))
                     . #1#)
               (EXIT
                (COND
                 ((< |opPrec| |prec|)
                  (|MMLFORM;group| (|MMLFORM;parenthesize| |s| $) $))
                 ((EQUAL |op| '-) |s|) (#2# (|MMLFORM;group| |s| $)))))))))))) 

(DEFUN |MMLFORM;formatBinary| (|op| |args| |prec| $)
  (PROG (|s| |ops| |s2| |s1| |opPrec| |p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |op| (QREFELT $ 11) (QREFELT $ 56))
            . #1=(|MMLFORM;formatBinary|))
      (EXIT
       (COND ((< |p| 1) (|error| "unknown binary op"))
             (#2='T
              (SEQ
               (LETT |opPrec| (SPADCALL (QREFELT $ 12) |p| (QREFELT $ 58))
                     . #1#)
               (LETT |s1|
                     (|MMLFORM;formatExpr| (|SPADfirst| |args|) |opPrec| $)
                     . #1#)
               (LETT |s2|
                     (|MMLFORM;formatExpr| (|SPADfirst| (CDR |args|)) |opPrec|
                      $)
                     . #1#)
               (LETT |s|
                     (COND
                      ((EQUAL |op| '^)
                       (SPADCALL
                        (LIST "<msup><mrow>" |s1| "</mrow><mrow>" |s2|
                              "</mrow></msup>")
                        (QREFELT $ 30)))
                      ((EQUAL |op| '/)
                       (SPADCALL
                        (LIST "<mfrac><mrow>" |s1| "</mrow><mrow>" |s2|
                              "</mrow></mfrac>")
                        (QREFELT $ 30)))
                      (#2#
                       (COND
                        ((EQUAL |op| 'OVER)
                         (SPADCALL
                          (LIST "<mfrac><mrow>" |s1| "</mrow><mrow>" |s2|
                                "</mrow></mfrac>")
                          (QREFELT $ 30)))
                        (#2#
                         (SEQ
                          (LETT |ops|
                                (COND ((EQUAL |op| 'LET) ":=")
                                      ((EQUAL |op| '<) "&lt;")
                                      ((EQUAL |op| '<=) "&lt;=")
                                      (#2# (SPADCALL |op| (QREFELT $ 52))))
                                . #1#)
                          (EXIT
                           (SPADCALL
                            (LIST "<mrow>" |s1| "</mrow><mo>" |ops|
                                  "</mo><mrow>" |s2| "</mrow>")
                            (QREFELT $ 30))))))))
                     . #1#)
               (EXIT
                (|MMLFORM;group|
                 (COND
                  ((OR (OR (EQUAL |op| '/) (EQUAL |op| 'OVER))
                       (NULL (< |opPrec| |prec|)))
                   |s|)
                  ('T (|MMLFORM;parenthesize| |s| $)))
                 $)))))))))) 

(DEFUN |MMLFORM;formatNary| (|op| |sep| |opprec| |args| |prec| $)
  (|MMLFORM;group|
   (|MMLFORM;formatNaryNoGroup| |op| |sep| |opprec| |args| |prec| $) $)) 

(DEFUN |MMLFORM;formatNaryNoGroup| (|op| |sep| |opprec| |args| |prec| $)
  (PROG (|s| |l| #1=#:G336 |a| |opPrec| |ops| |p|)
    (RETURN
     (SEQ
      (COND ((NULL |args|) "")
            (#2='T
             (SEQ
              (LETT |p| (SPADCALL |op| (QREFELT $ 13) (QREFELT $ 56))
                    . #3=(|MMLFORM;formatNaryNoGroup|))
              (EXIT
               (COND ((< |p| 1) (|error| "unknown nary op"))
                     (#2#
                      (SEQ
                       (LETT |ops|
                             (COND ((EQUAL |op| 'STRSEP) |sep|)
                                   ((EQUAL |op| '*) "<mo>&#x02062;</mo>")
                                   (#2#
                                    (COND ((EQUAL |op| 'ROW) "</mtd><mtd>")
                                          ((EQUAL |op| 'TENSOR)
                                           "<mo>&#x02297;</mo>")
                                          (#2#
                                           (SPADCALL
                                            (LIST "<mo>"
                                                  (SPADCALL |op|
                                                            (QREFELT $ 52))
                                                  "</mo>")
                                            (QREFELT $ 30))))))
                             . #3#)
                       (LETT |l| NIL . #3#)
                       (LETT |opPrec|
                             (COND ((EQUAL |op| 'STRSEP) |opprec|)
                                   (#2#
                                    (SPADCALL (QREFELT $ 14) |p|
                                              (QREFELT $ 58))))
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
                                           (|MMLFORM;formatExpr| |a| |opPrec|
                                            $)
                                           |l|))
                                    . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |s| (SPADCALL (REVERSE (CDR |l|)) (QREFELT $ 30))
                             . #3#)
                       (EXIT
                        (COND
                         ((< |opPrec| |prec|) (|MMLFORM;parenthesize| |s| $))
                         (#2# |s|)))))))))))))) 

(DEFUN |MMLFORM;formatExpr| (|expr| |prec| $)
  (PROG (|op| |nargs| |args| |opf| |l| |i| |nstr| |str| |len| |intSplitLen|)
    (RETURN
     (SEQ (LETT |intSplitLen| 20 . #1=(|MMLFORM;formatExpr|))
          (EXIT
           (COND
            ((ATOM |expr|)
             (SEQ (LETT |str| (|MMLFORM;stringify| |expr| $) . #1#)
                  (LETT |len| (QCSIZE |str|) . #1#)
                  (EXIT
                   (COND
                    ((FIXP |expr|)
                     (SEQ (LETT |i| |expr| . #1#)
                          (EXIT
                           (COND
                            ((OR (< |i| 0) (SPADCALL |i| 9 (QREFELT $ 34)))
                             (|MMLFORM;group|
                              (SEQ (LETT |nstr| "" . #1#)
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (SPADCALL
                                            (LETT |len| (QCSIZE |str|) . #1#)
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
                                                (QREFELT $ 30))
                                               . #1#)
                                         (EXIT
                                          (LETT |str|
                                                (SPADCALL |str|
                                                          (SPADCALL
                                                           (+ |intSplitLen| 1)
                                                           (QREFELT $ 61))
                                                          (QREFELT $ 37))
                                                . #1#)))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |nstr| (QREFELT $ 62))
                                      (SPADCALL (LIST "<mn>" |str| "</mn>")
                                                (QREFELT $ 30)))
                                     (#2='T
                                      (SEQ
                                       (LETT |nstr|
                                             (COND
                                              ((SPADCALL |str| (QREFELT $ 62))
                                               |nstr|)
                                              (#2#
                                               (SPADCALL
                                                (LIST |nstr| " " |str|)
                                                (QREFELT $ 30))))
                                             . #1#)
                                       (EXIT
                                        (SPADCALL
                                         (LIST "<mn>"
                                               (SPADCALL |nstr|
                                                         (SPADCALL 2
                                                                   (QREFELT $
                                                                            61))
                                                         (QREFELT $ 37))
                                               "</mn>")
                                         (QREFELT $ 30))))))))
                              $))
                            ('T
                             (SPADCALL (LIST "<mn>" |str| "</mn>")
                                       (QREFELT $ 30)))))))
                    ((EQUAL |str| "%pi") "<mi>&#x003C0;</mi>")
                    ((EQUAL |str| "%e") "<mi>&#x02147;</mi>")
                    ((EQUAL |str| "%i") "<mi>&#x02148;</mi>")
                    (#2#
                     (SEQ
                      (COND
                       ((SPADCALL |len| 0 (QREFELT $ 34))
                        (COND
                         ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 39))
                                    (|STR_to_CHAR| "%"))
                          (EXIT
                           (SPADCALL (LIST "<mi>" |str| "</mi>")
                                     (QREFELT $ 30)))))))
                      (COND
                       ((SPADCALL |len| 1 (QREFELT $ 34))
                        (COND
                         ((SPADCALL (SPADCALL |str| 1 (QREFELT $ 39))
                                    (QREFELT $ 63))
                          (EXIT
                           (SPADCALL (LIST "<mn>" |str| "</mn>")
                                     (QREFELT $ 30)))))))
                      (COND
                       ((SPADCALL |len| 0 (QREFELT $ 34))
                        (COND
                         ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 39))
                                    (|STR_to_CHAR| "\""))
                          (EXIT
                           (SPADCALL (LIST "<mtext>" |str| "</mtext>")
                                     (QREFELT $ 30)))))))
                      (COND
                       ((EQL |len| 1)
                        (COND
                         ((|eql_SI| (SPADCALL |str| 1 (QREFELT $ 39))
                                    (|STR_to_CHAR| " "))
                          (EXIT " ")))))
                      (COND
                       ((SYMBOLP |expr|)
                        (SEQ (LETT |op| |expr| . #1#)
                             (LETT |i|
                                   (SPADCALL |op| (QREFELT $ 19)
                                             (QREFELT $ 56))
                                   . #1#)
                             (EXIT
                              (COND
                               ((SPADCALL |i| 0 (QREFELT $ 34))
                                (SPADCALL (QREFELT $ 20) |i|
                                          (QREFELT $ 65))))))))
                      (LETT |i|
                            (SPADCALL (|STR_to_CHAR| " ") |str| (QREFELT $ 67))
                            . #1#)
                      (EXIT
                       (COND
                        ((SPADCALL |i| 0 (QREFELT $ 34))
                         (SPADCALL (LIST "<mtext>" |str| "</mtext>")
                                   (QREFELT $ 30)))
                        (#2#
                         (SPADCALL (LIST "<mi>" |str| "</mi>")
                                   (QREFELT $ 30)))))))))))
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
                                                    (QREFELT $ 68))
                                          (|MMLFORM;formatSpecial| |op| |args|
                                           |prec| $))
                                         ((SPADCALL |op| (QREFELT $ 16)
                                                    (QREFELT $ 68))
                                          (|MMLFORM;formatPlex| |op| |args|
                                           |prec| $))
                                         ((EQL 0 |nargs|)
                                          (|MMLFORM;formatNullary| |op| $))
                                         (#2#
                                          (SEQ
                                           (COND
                                            ((EQL 1 |nargs|)
                                             (COND
                                              ((SPADCALL |op| (QREFELT $ 9)
                                                         (QREFELT $ 68))
                                               (EXIT
                                                (|MMLFORM;formatUnary| |op|
                                                 (|SPADfirst| |args|) |prec|
                                                 $))))))
                                           (COND
                                            ((EQL 2 |nargs|)
                                             (COND
                                              ((SPADCALL |op| (QREFELT $ 11)
                                                         (QREFELT $ 68))
                                               (EXIT
                                                (|MMLFORM;formatBinary| |op|
                                                 |args| |prec| $))))))
                                           (EXIT
                                            (COND
                                             ((SPADCALL |op| (QREFELT $ 15)
                                                        (QREFELT $ 68))
                                              (|MMLFORM;formatNaryNoGroup| |op|
                                               "" 0 |args| |prec| $))
                                             ((SPADCALL |op| (QREFELT $ 13)
                                                        (QREFELT $ 68))
                                              (|MMLFORM;formatNary| |op| "" 0
                                               |args| |prec| $))
                                             (#2#
                                              (|MMLFORM;formatFunction|
                                               (|SPADfirst| |l|) |args| |prec|
                                               $))))))))))
                                 (#2#
                                  (|MMLFORM;formatFunction| (|SPADfirst| |l|)
                                   |args| |prec| $)))))))))))))))) 

(DEFUN |MathMLFormat| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G368)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|MathMLFormat|)
                . #2=(|MathMLFormat|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|MathMLFormat|
                         (LIST (CONS NIL (CONS 1 (|MathMLFormat;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#) (HREM |$ConstructorCache| '|MathMLFormat|))))))))))) 

(DEFUN |MathMLFormat;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|MathMLFormat|) . #1=(|MathMLFormat|))
      (LETT $ (GETREFV 71) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|MathMLFormat| NIL (CONS 1 $))
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
                (LIST "<mo>cos</mo>" "<mo>cot</mo>" "<mo>csc</mo>"
                      "<mo>log</mo>" "<mo>sec</mo>" "<mo>sin</mo>"
                      "<mo>tan</mo>" "<mo>cosh</mo>" "<mo>coth</mo>"
                      "<mo>csch</mo>" "<mo>sech</mo>" "<mo>sinh</mo>"
                      "<mo>tanh</mo>" "<mo>arccos</mo>" "<mo>arcsin</mo>"
                      "<mo>arctan</mo>" "<mo>erf</mo>" "<mo>&#x2026;</mo>"
                      "<mo>$</mo>" "<mo>&#x221E;</mo>" "<mo>&#x0413;</mo>"))
      $)))) 

(MAKEPROP '|MathMLFormat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|blank| '|maxPrec| '|minPrec|
              '|unaryOps| '|unaryPrecs| '|binaryOps| '|binaryPrecs| '|naryOps|
              '|naryPrecs| '|naryNGOps| '|plexOps| '|plexPrecs| '|specialOps|
              '|specialStrings| '|specialStringsInMML| (|String|)
              (|OutputForm|) |MMLFORM;coerce;OfS;2| |MMLFORM;coerceS;OfS;4|
              |MMLFORM;coerceL;OfS;5| (|Void|) (0 . |void|)
              |MMLFORM;display;SV;6| (|List| $) (4 . |concat|)
              |MMLFORM;exprex;OfS;7| (|Boolean|) (|Integer|) (9 . >)
              (|UniversalSegment| 33) (15 . |segment|) (21 . |elt|)
              (|Character|) (27 . |elt|) (|CharacterClass|) (33 . |lowerCase|)
              (37 . |member?|) (43 . |position|) (50 . ~=) (|List| 22)
              (56 . |list|) (61 . |second|) (|NonNegativeInteger|) (66 . >)
              (72 . |elt|) (|Symbol|) (78 . |string|) (83 . |elt|)
              (89 . |message|) (|List| 51) (94 . |position|) (|List| 33)
              (100 . |elt|) (106 . ~=) (112 . |coerce|) (117 . |segment|)
              (122 . |empty?|) (127 . |digit?|) (|List| 21) (132 . |elt|)
              (138 . |char|) (143 . |position|) (149 . |member?|)
              (|SingleInteger|) (|HashState|))
           '#(~= 155 |latex| 161 |hashUpdate!| 166 |hash| 172 |exprex| 177
              |display| 182 |coerceS| 187 |coerceL| 192 |coerce| 197 = 207)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 22))
                        (|makeByteWordVec2| 70
                                            '(0 26 0 27 1 21 0 29 30 2 33 32 0
                                              0 34 2 35 0 33 33 36 2 21 0 0 35
                                              37 2 21 38 0 33 39 0 40 0 41 2 40
                                              32 38 0 42 3 21 33 0 0 33 43 2 38
                                              32 0 0 44 1 45 0 22 46 1 45 22 0
                                              47 2 48 32 0 0 49 2 45 22 0 33 50
                                              1 51 21 0 52 2 21 0 0 0 53 1 22 0
                                              21 54 2 55 33 51 0 56 2 57 33 0
                                              33 58 2 33 32 0 0 59 1 21 22 0 60
                                              1 35 0 33 61 1 21 32 0 62 1 38 32
                                              0 63 2 64 21 0 33 65 1 38 0 21 66
                                              2 21 33 38 0 67 2 55 32 51 0 68 2
                                              0 32 0 0 1 1 0 21 0 1 2 0 70 70 0
                                              1 1 0 69 0 1 1 0 21 22 31 1 0 26
                                              21 28 1 0 21 22 24 1 0 21 22 25 1
                                              0 21 22 23 1 0 22 0 1 2 0 32 0 0
                                              1)))))
           '|lookupComplete|)) 

(MAKEPROP '|MathMLFormat| 'NILADIC T) 
