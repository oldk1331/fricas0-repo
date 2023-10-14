
(DEFUN |FORMULA;new;$;1| ($)
  (VECTOR (LIST ".eq set blank @" ":df.") (LIST "") (LIST ":edf."))) 

(DEFUN |FORMULA;coerce;Of$;2| (|expr| $)
  (PROG (|f|)
    (RETURN
     (SEQ (LETT |f| (SPADCALL (QREFELT $ 23)) |FORMULA;coerce;Of$;2|)
          (QSETVELT |f| 1
                    (LIST
                     (|FORMULA;postcondition|
                      (|FORMULA;formatFormula|
                       (|FORMULA;precondition| |expr| $) (QREFELT $ 9) $)
                      $)))
          (EXIT |f|))))) 

(DEFUN |FORMULA;convert;OfI$;3| (|expr| |stepNum| $)
  (PROG (|f|)
    (RETURN
     (SEQ (LETT |f| (SPADCALL (QREFELT $ 23)) |FORMULA;convert;OfI$;3|)
          (QSETVELT |f| 1
                    (SPADCALL
                     (LIST "<leqno lparen " (STRINGIMAGE |stepNum|) " rparen>")
                     (LIST
                      (|FORMULA;postcondition|
                       (|FORMULA;formatFormula|
                        (|FORMULA;precondition| |expr| $) (QREFELT $ 9) $)
                       $))
                     (QREFELT $ 27)))
          (EXIT |f|))))) 

(DEFUN |FORMULA;display;$IV;4| (|f| |len| $)
  (PROG (#1=#:G141 |s| #2=#:G140 |t| #3=#:G139 #4=#:G138)
    (RETURN
     (SEQ
      (SEQ (LETT |s| NIL . #5=(|FORMULA;display;$IV;4|))
           (LETT #4# (QVELT |f| 0) . #5#) G190
           (COND
            ((OR (ATOM #4#) (PROGN (LETT |s| (CAR #4#) . #5#) NIL)) (GO G191)))
           (SEQ (EXIT (|sayFORMULA| |s|))) (LETT #4# (CDR #4#) . #5#) (GO G190)
           G191 (EXIT NIL))
      (SEQ (LETT |s| NIL . #5#) (LETT #3# (QVELT |f| 1) . #5#) G190
           (COND
            ((OR (ATOM #3#) (PROGN (LETT |s| (CAR #3#) . #5#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (SEQ (LETT |t| NIL . #5#)
                  (LETT #2# (|FORMULA;splitLong| |s| |len| $) . #5#) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #5#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (|sayFORMULA| |t|))) (LETT #2# (CDR #2#) . #5#)
                  (GO G190) G191 (EXIT NIL))))
           (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
      (SEQ (LETT |s| NIL . #5#) (LETT #1# (QVELT |f| 2) . #5#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #5#) NIL)) (GO G191)))
           (SEQ (EXIT (|sayFORMULA| |s|))) (LETT #1# (CDR #1#) . #5#) (GO G190)
           G191 (EXIT NIL))
      (EXIT (SPADCALL (QREFELT $ 31))))))) 

(DEFUN |FORMULA;display;$V;5| (|f| $) (SPADCALL |f| $LINELENGTH (QREFELT $ 32))) 

(PUT '|FORMULA;prologue;$L;6| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 0))) 

(DEFUN |FORMULA;prologue;$L;6| (|f| $) (QVELT |f| 0)) 

(PUT '|FORMULA;formula;$L;7| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 1))) 

(DEFUN |FORMULA;formula;$L;7| (|f| $) (QVELT |f| 1)) 

(PUT '|FORMULA;epilogue;$L;8| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 2))) 

(DEFUN |FORMULA;epilogue;$L;8| (|f| $) (QVELT |f| 2)) 

(PUT '|FORMULA;setPrologue!;$2L;9| '|SPADreplace|
     '(XLAM (|f| |l|) (QSETVELT |f| 0 |l|))) 

(DEFUN |FORMULA;setPrologue!;$2L;9| (|f| |l| $) (QSETVELT |f| 0 |l|)) 

(PUT '|FORMULA;setFormula!;$2L;10| '|SPADreplace|
     '(XLAM (|f| |l|) (QSETVELT |f| 1 |l|))) 

(DEFUN |FORMULA;setFormula!;$2L;10| (|f| |l| $) (QSETVELT |f| 1 |l|)) 

(PUT '|FORMULA;setEpilogue!;$2L;11| '|SPADreplace|
     '(XLAM (|f| |l|) (QSETVELT |f| 2 |l|))) 

(DEFUN |FORMULA;setEpilogue!;$2L;11| (|f| |l| $) (QSETVELT |f| 2 |l|)) 

(DEFUN |FORMULA;coerce;$Of;12| (|f| $)
  (PROG (|l| #1=#:G158 |s| #2=#:G157 |t| #3=#:G156 #4=#:G155)
    (RETURN
     (SEQ (LETT |l| NIL . #5=(|FORMULA;coerce;$Of;12|))
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
                      (LETT #2# (|FORMULA;splitLong| |s| (- $LINELENGTH 4) $)
                            . #5#)
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #5#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT |l| (CONS |t| |l|) . #5#)))
                      (LETT #2# (CDR #2#) . #5#) (GO G190) G191 (EXIT NIL))))
               (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |s| NIL . #5#) (LETT #1# (QVELT |f| 2) . #5#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #5#) NIL))
                 (GO G191)))
               (SEQ (EXIT (LETT |l| (CONS |s| |l|) . #5#)))
               (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (REVERSE |l|) (QREFELT $ 40))))))) 

(DEFUN |FORMULA;postcondition| (|str| $)
  (PROG (#1=#:G165 |i| |minus| |plus| |len|)
    (RETURN
     (SEQ (LETT |len| (QCSIZE |str|) . #2=(|FORMULA;postcondition|))
          (EXIT
           (COND ((< |len| 4) |str|)
                 ('T
                  (SEQ (LETT |plus| (|STR_to_CHAR| "+") . #2#)
                       (LETT |minus| (|STR_to_CHAR| "-") . #2#)
                       (SEQ (LETT |i| 1 . #2#) (LETT #1# (- |len| 1) . #2#)
                            G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((|eql_SI| (SPADCALL |str| |i| (QREFELT $ 44))
                                          |plus|)
                                (COND
                                 ((|eql_SI|
                                   (SPADCALL |str| (+ |i| 1) (QREFELT $ 44))
                                   |minus|)
                                  (SPADCALL |str| |i| (|STR_to_CHAR| " ")
                                            (QREFELT $ 45))))))))
                            (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |str|))))))))) 

(PUT '|FORMULA;stringify| '|SPADreplace| '|object2String|) 

(DEFUN |FORMULA;stringify| (|expr| $) (|object2String| |expr|)) 

(DEFUN |FORMULA;splitLong| (|str| |len| $)
  (SEQ (COND ((< |len| 20) (LETT |len| $LINELENGTH |FORMULA;splitLong|)))
       (EXIT (|FORMULA;splitLong1| |str| |len| $)))) 

(DEFUN |FORMULA;splitLong1| (|str| |len| $)
  (PROG (|l| |s| |ls| |lss| #1=#:G176 |ss|)
    (RETURN
     (SEQ (LETT |l| NIL . #2=(|FORMULA;splitLong1|)) (LETT |s| "" . #2#)
          (LETT |ls| 0 . #2#)
          (SEQ (LETT |ss| NIL . #2#)
               (LETT #1# (SPADCALL |str| (|STR_to_CHAR| " ") (QREFELT $ 47))
                     . #2#)
               G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ss| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (LETT |lss| (QCSIZE |ss|) . #2#)
                    (COND
                     ((SPADCALL (+ |ls| |lss|) |len| (QREFELT $ 49))
                      (SEQ (LETT |l| (CONS |s| |l|) . #2#) (LETT |s| "" . #2#)
                           (EXIT (LETT |ls| 0 . #2#)))))
                    (EXIT
                     (COND
                      ((SPADCALL |lss| |len| (QREFELT $ 49))
                       (LETT |l| (CONS |ss| |l|) . #2#))
                      ('T
                       (SEQ (LETT |ls| (+ (+ |ls| |lss|) 1) . #2#)
                            (EXIT
                             (LETT |s| (STRCONC |s| (STRCONC |ss| " "))
                                   . #2#)))))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL |ls| 0 (QREFELT $ 49)) (LETT |l| (CONS |s| |l|) . #2#)))
          (EXIT (REVERSE |l|)))))) 

(DEFUN |FORMULA;group| (|str| $) (SPADCALL (LIST "<" |str| ">") (QREFELT $ 50))) 

(DEFUN |FORMULA;addBraces| (|str| $)
  (SPADCALL (LIST "left lbrace " |str| " right rbrace") (QREFELT $ 50))) 

(DEFUN |FORMULA;addBrackets| (|str| $)
  (SPADCALL (LIST "left lb " |str| " right rb") (QREFELT $ 50))) 

(DEFUN |FORMULA;parenthesize| (|str| $)
  (SPADCALL (LIST "left lparen " |str| " right rparen") (QREFELT $ 50))) 

(PUT '|FORMULA;precondition| '|SPADreplace| '|outputTran|) 

(DEFUN |FORMULA;precondition| (|expr| $) (|outputTran| |expr|)) 

(DEFUN |FORMULA;formatSpecial| (|op| |args| |prec| $)
  (PROG (|form| |tmp|)
    (RETURN
     (SEQ
      (COND ((EQUAL |op| "AGGLST") (|FORMULA;formatNary| "," |args| |prec| $))
            ((EQUAL |op| "AGGSET") (|FORMULA;formatNary| ";" |args| |prec| $))
            ((EQUAL |op| "CONCATB") (|FORMULA;formatNary| " " |args| |prec| $))
            ((EQUAL |op| "CONCAT") (|FORMULA;formatNary| "" |args| |prec| $))
            ((EQUAL |op| "BRACKET")
             (|FORMULA;group|
              (|FORMULA;addBrackets|
               (|FORMULA;formatFormula| (|SPADfirst| |args|) (QREFELT $ 9) $)
               $)
              $))
            ((EQUAL |op| "BRACE")
             (|FORMULA;group|
              (|FORMULA;addBraces|
               (|FORMULA;formatFormula| (|SPADfirst| |args|) (QREFELT $ 9) $)
               $)
              $))
            ((EQUAL |op| "PAREN")
             (|FORMULA;group|
              (|FORMULA;parenthesize|
               (|FORMULA;formatFormula| (|SPADfirst| |args|) (QREFELT $ 9) $)
               $)
              $))
            ((EQUAL |op| "PRIME")
             (|FORMULA;formatSpecial| "SUPERSUB"
              (LIST (|SPADfirst| |args|) " " (SPADCALL |args| (QREFELT $ 52)))
              |prec| $))
            ((EQUAL |op| "OVERBAR")
             (COND ((NULL |args|) "")
                   (#1='T
                    (|FORMULA;group|
                     (SPADCALL
                      (LIST
                       (|FORMULA;formatFormula| (|SPADfirst| |args|)
                        (QREFELT $ 9) $)
                       " bar")
                      (QREFELT $ 50))
                     $))))
            ((EQUAL |op| "ROOT")
             (COND ((NULL |args|) "")
                   (#1#
                    (SEQ
                     (LETT |tmp|
                           (|FORMULA;formatFormula| (|SPADfirst| |args|)
                            (QREFELT $ 9) $)
                           . #2=(|FORMULA;formatSpecial|))
                     (EXIT
                      (COND
                       ((NULL (CDR |args|))
                        (|FORMULA;group|
                         (SPADCALL (LIST "sqrt " |tmp|) (QREFELT $ 50)) $))
                       (#1#
                        (|FORMULA;group|
                         (SPADCALL
                          (LIST "midsup adjust(u 1.5 r 9) "
                                (|FORMULA;formatFormula|
                                 (|SPADfirst| (CDR |args|)) (QREFELT $ 9) $)
                                " sqrt " |tmp|)
                          (QREFELT $ 50))
                         $))))))))
            ((EQUAL |op| "SC")
             (|FORMULA;formatNary| " labove " |args| |prec| $))
            ((EQUAL |op| "SUB")
             (|FORMULA;group|
              (SPADCALL
               (LIST
                (|FORMULA;formatFormula| (|SPADfirst| |args|) (QREFELT $ 9) $)
                " sub "
                (|FORMULA;formatSpecial| "AGGLST" (CDR |args|) (QREFELT $ 9)
                 $))
               (QREFELT $ 50))
              $))
            ((EQUAL |op| "SUPERSUB")
             (SEQ
              (LETT |form|
                    (LIST
                     (|FORMULA;formatFormula| (|SPADfirst| |args|)
                      (QREFELT $ 9) $))
                    . #2#)
              (LETT |args| (CDR |args|) . #2#)
              (EXIT
               (COND ((NULL |args|) (SPADCALL |form| (QREFELT $ 50)))
                     (#1#
                      (SEQ
                       (LETT |tmp|
                             (|FORMULA;formatFormula| (|SPADfirst| |args|)
                              (QREFELT $ 9) $)
                             . #2#)
                       (COND
                        ((SPADCALL |tmp| "" (QREFELT $ 53))
                         (LETT |form| (APPEND |form| (LIST " sub " |tmp|))
                               . #2#)))
                       (LETT |args| (CDR |args|) . #2#)
                       (EXIT
                        (COND
                         ((NULL |args|)
                          (|FORMULA;group| (SPADCALL |form| (QREFELT $ 50)) $))
                         (#1#
                          (SEQ
                           (LETT |tmp|
                                 (|FORMULA;formatFormula| (|SPADfirst| |args|)
                                  (QREFELT $ 9) $)
                                 . #2#)
                           (COND
                            ((SPADCALL |tmp| "" (QREFELT $ 53))
                             (LETT |form| (APPEND |form| (LIST " sup " |tmp|))
                                   . #2#)))
                           (LETT |args| (CDR |args|) . #2#)
                           (EXIT
                            (COND
                             ((NULL |args|)
                              (|FORMULA;group| (SPADCALL |form| (QREFELT $ 50))
                               $))
                             (#1#
                              (SEQ
                               (LETT |tmp|
                                     (|FORMULA;formatFormula|
                                      (|SPADfirst| |args|) (QREFELT $ 9) $)
                                     . #2#)
                               (COND
                                ((SPADCALL |tmp| "" (QREFELT $ 53))
                                 (LETT |form|
                                       (APPEND |form| (LIST " presup " |tmp|))
                                       . #2#)))
                               (LETT |args| (CDR |args|) . #2#)
                               (EXIT
                                (COND
                                 ((NULL |args|)
                                  (|FORMULA;group|
                                   (SPADCALL |form| (QREFELT $ 50)) $))
                                 (#1#
                                  (SEQ
                                   (LETT |tmp|
                                         (|FORMULA;formatFormula|
                                          (|SPADfirst| |args|) (QREFELT $ 9) $)
                                         . #2#)
                                   (COND
                                    ((SPADCALL |tmp| "" (QREFELT $ 53))
                                     (LETT |form|
                                           (APPEND |form|
                                                   (LIST " presub " |tmp|))
                                           . #2#)))
                                   (EXIT
                                    (|FORMULA;group|
                                     (SPADCALL |form| (QREFELT $ 50))
                                     $))))))))))))))))))))
            ((EQUAL |op| "MATRIX") (|FORMULA;formatMatrix| (CDR |args|) $))
            (#1# (SPADCALL (LIST "not done yet for " |op|) (QREFELT $ 50)))))))) 

(DEFUN |FORMULA;formatPlex| (|op| |args| |prec| $)
  (PROG (|s| |hold| |n| |opPrec| |p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |op| (QREFELT $ 18) (QREFELT $ 54))
            . #1=(|FORMULA;formatPlex|))
      (EXIT
       (COND ((< |p| 1) (|error| "unknown Script Formula Formatter unary op"))
             (#2='T
              (SEQ
               (LETT |opPrec| (SPADCALL (QREFELT $ 19) |p| (QREFELT $ 56))
                     . #1#)
               (LETT |n| (LENGTH |args|) . #1#)
               (COND
                ((SPADCALL |n| 2 (QREFELT $ 57))
                 (COND
                  ((SPADCALL |n| 3 (QREFELT $ 57))
                   (EXIT (|error| "wrong number of arguments for plex"))))))
               (LETT |s|
                     (COND ((EQUAL |op| "SIGMA") "sum")
                           ((EQUAL |op| "PI") "product")
                           ((OR (EQUAL |op| "INTSIGN")
                                (EQUAL |op| "INDEFINTEGRAL"))
                            "integral")
                           (#2# "????"))
                     . #1#)
               (LETT |hold|
                     (|FORMULA;formatFormula| (|SPADfirst| |args|)
                      (QREFELT $ 9) $)
                     . #1#)
               (LETT |args| (CDR |args|) . #1#)
               (COND
                ((SPADCALL |op| "INDEFINTEGRAL" (QREFELT $ 53))
                 (SEQ
                  (COND
                   ((SPADCALL |hold| "" (QREFELT $ 53))
                    (LETT |s|
                          (SPADCALL
                           (LIST |s| " from"
                                 (|FORMULA;group|
                                  (SPADCALL (LIST "\\displaystyle " |hold|)
                                            (QREFELT $ 50))
                                  $))
                           (QREFELT $ 50))
                          . #1#)))
                  (COND
                   ((NULL (NULL (CDR |args|)))
                    (SEQ
                     (LETT |hold|
                           (|FORMULA;formatFormula| (|SPADfirst| |args|)
                            (QREFELT $ 9) $)
                           . #1#)
                     (COND
                      ((SPADCALL |hold| "" (QREFELT $ 53))
                       (LETT |s|
                             (SPADCALL
                              (LIST |s| " to"
                                    (|FORMULA;group|
                                     (SPADCALL (LIST "\\displaystyle " |hold|)
                                               (QREFELT $ 50))
                                     $))
                              (QREFELT $ 50))
                             . #1#)))
                     (EXIT (LETT |args| (CDR |args|) . #1#)))))
                  (EXIT
                   (LETT |s|
                         (SPADCALL
                          (LIST |s| " "
                                (|FORMULA;formatFormula| (|SPADfirst| |args|)
                                 (QREFELT $ 9) $))
                          (QREFELT $ 50))
                         . #1#))))
                (#2#
                 (SEQ
                  (LETT |hold|
                        (|FORMULA;group|
                         (SPADCALL
                          (LIST |hold| " "
                                (|FORMULA;formatFormula| (|SPADfirst| |args|)
                                 (QREFELT $ 9) $))
                          (QREFELT $ 50))
                         $)
                        . #1#)
                  (EXIT
                   (LETT |s| (SPADCALL (LIST |s| " " |hold|) (QREFELT $ 50))
                         . #1#)))))
               (COND
                ((< |opPrec| |prec|)
                 (LETT |s| (|FORMULA;parenthesize| |s| $) . #1#)))
               (EXIT (|FORMULA;group| |s| $)))))))))) 

(DEFUN |FORMULA;formatMatrix| (|args| $)
  (|FORMULA;group|
   (|FORMULA;addBrackets|
    (|FORMULA;formatNary| " habove " |args| (QREFELT $ 9) $) $)
   $)) 

(DEFUN |FORMULA;formatFunction| (|op| |args| |prec| $)
  (|FORMULA;group|
   (SPADCALL
    (LIST |op| " "
          (|FORMULA;parenthesize|
           (|FORMULA;formatNary| "," |args| (QREFELT $ 9) $) $))
    (QREFELT $ 50))
   $)) 

(DEFUN |FORMULA;formatNullary| (|op| $)
  (COND ((EQUAL |op| "NOTHING") "")
        ('T (|FORMULA;group| (SPADCALL (LIST |op| "()") (QREFELT $ 50)) $)))) 

(DEFUN |FORMULA;formatUnary| (|op| |arg| |prec| $)
  (PROG (|s| |opPrec| |p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |op| (QREFELT $ 11) (QREFELT $ 54))
            . #1=(|FORMULA;formatUnary|))
      (EXIT
       (COND ((< |p| 1) (|error| "unknown Script Formula Formatter unary op"))
             (#2='T
              (SEQ
               (LETT |opPrec| (SPADCALL (QREFELT $ 12) |p| (QREFELT $ 56))
                     . #1#)
               (LETT |s|
                     (SPADCALL
                      (LIST |op| (|FORMULA;formatFormula| |arg| |opPrec| $))
                      (QREFELT $ 50))
                     . #1#)
               (EXIT
                (COND
                 ((< |opPrec| |prec|)
                  (|FORMULA;group| (|FORMULA;parenthesize| |s| $) $))
                 ((EQUAL |op| "-") |s|) (#2# (|FORMULA;group| |s| $)))))))))))) 

(DEFUN |FORMULA;formatBinary| (|op| |args| |prec| $)
  (PROG (|s| |opPrec| |p|)
    (RETURN
     (SEQ
      (LETT |p| (SPADCALL |op| (QREFELT $ 13) (QREFELT $ 54))
            . #1=(|FORMULA;formatBinary|))
      (EXIT
       (COND ((< |p| 1) (|error| "unknown Script Formula Formatter binary op"))
             (#2='T
              (SEQ
               (LETT |op|
                     (COND ((EQUAL |op| "^") " sup ")
                           ((OR (EQUAL |op| "/") (EQUAL |op| "OVER")) " over ")
                           (#2# |op|))
                     . #1#)
               (LETT |opPrec| (SPADCALL (QREFELT $ 14) |p| (QREFELT $ 56))
                     . #1#)
               (LETT |s|
                     (|FORMULA;formatFormula| (|SPADfirst| |args|) |opPrec| $)
                     . #1#)
               (LETT |s|
                     (SPADCALL
                      (LIST |s| |op|
                            (|FORMULA;formatFormula| (|SPADfirst| (CDR |args|))
                             |opPrec| $))
                      (QREFELT $ 50))
                     . #1#)
               (EXIT
                (|FORMULA;group|
                 (COND
                  ((OR (EQUAL |op| " over ") (NULL (< |opPrec| |prec|))) |s|)
                  ('T (|FORMULA;parenthesize| |s| $)))
                 $)))))))))) 

(DEFUN |FORMULA;formatNary| (|op| |args| |prec| $)
  (|FORMULA;group| (|FORMULA;formatNaryNoGroup| |op| |args| |prec| $) $)) 

(DEFUN |FORMULA;formatNaryNoGroup| (|op| |args| |prec| $)
  (PROG (|s| |l| #1=#:G225 |a| |opPrec| |p|)
    (RETURN
     (SEQ
      (COND ((NULL |args|) "")
            (#2='T
             (SEQ
              (LETT |p| (SPADCALL |op| (QREFELT $ 15) (QREFELT $ 54))
                    . #3=(|FORMULA;formatNaryNoGroup|))
              (EXIT
               (COND
                ((< |p| 1)
                 (|error| "unknown Script Formula Formatter nary op"))
                (#2#
                 (SEQ
                  (LETT |op|
                        (COND ((EQUAL |op| ",") ", @@ ")
                              ((EQUAL |op| ";") "; @@ ")
                              ((OR (EQUAL |op| "*") (EQUAL |op| " "))
                               (QREFELT $ 7))
                              ((EQUAL |op| "ROW") " here ") (#2# |op|))
                        . #3#)
                  (LETT |l| NIL . #3#)
                  (LETT |opPrec| (SPADCALL (QREFELT $ 16) |p| (QREFELT $ 56))
                        . #3#)
                  (SEQ (LETT |a| NIL . #3#) (LETT #1# |args| . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |l|
                               (CONS |op|
                                     (CONS
                                      (|FORMULA;formatFormula| |a| |opPrec| $)
                                      |l|))
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191 (EXIT NIL))
                  (LETT |s| (SPADCALL (REVERSE (CDR |l|)) (QREFELT $ 50))
                        . #3#)
                  (EXIT
                   (COND ((< |opPrec| |prec|) (|FORMULA;parenthesize| |s| $))
                         (#2# |s|)))))))))))))) 

(DEFUN |FORMULA;formatFormula| (|expr| |prec| $)
  (PROG (|op| |nargs| |args| |l| |i| |str|)
    (RETURN
     (SEQ
      (COND
       ((ATOM |expr|)
        (SEQ
         (LETT |str| (|FORMULA;stringify| |expr| $)
               . #1=(|FORMULA;formatFormula|))
         (EXIT
          (COND
           ((FIXP |expr|)
            (SEQ (LETT |i| |expr| . #1#)
                 (EXIT
                  (COND
                   ((OR (< |i| 0) (SPADCALL |i| 9 (QREFELT $ 49)))
                    (|FORMULA;group| |str| $))
                   ('T |str|)))))
           (#2='T
            (SEQ
             (LETT |i| (SPADCALL |str| (QREFELT $ 21) (QREFELT $ 54)) . #1#)
             (EXIT
              (COND
               ((SPADCALL |i| 0 (QREFELT $ 49))
                (SPADCALL (QREFELT $ 22) |i| (QREFELT $ 58)))
               (#2# |str|)))))))))
       (#2#
        (SEQ (LETT |l| |expr| . #1#)
             (EXIT
              (COND ((NULL |l|) (QREFELT $ 7))
                    (#2#
                     (SEQ
                      (LETT |op| (|FORMULA;stringify| (|SPADfirst| |l|) $)
                            . #1#)
                      (LETT |args| (CDR |l|) . #1#)
                      (LETT |nargs| (LENGTH |args|) . #1#)
                      (EXIT
                       (COND
                        ((SPADCALL |op| (QREFELT $ 20) (QREFELT $ 59))
                         (|FORMULA;formatSpecial| |op| |args| |prec| $))
                        ((SPADCALL |op| (QREFELT $ 18) (QREFELT $ 59))
                         (|FORMULA;formatPlex| |op| |args| |prec| $))
                        ((EQL 0 |nargs|) (|FORMULA;formatNullary| |op| $))
                        (#2#
                         (SEQ
                          (COND
                           ((EQL 1 |nargs|)
                            (COND
                             ((SPADCALL |op| (QREFELT $ 11) (QREFELT $ 59))
                              (EXIT
                               (|FORMULA;formatUnary| |op| (|SPADfirst| |args|)
                                |prec| $))))))
                          (COND
                           ((EQL 2 |nargs|)
                            (COND
                             ((SPADCALL |op| (QREFELT $ 13) (QREFELT $ 59))
                              (EXIT
                               (|FORMULA;formatBinary| |op| |args| |prec|
                                $))))))
                          (EXIT
                           (COND
                            ((SPADCALL |op| (QREFELT $ 17) (QREFELT $ 59))
                             (|FORMULA;formatNaryNoGroup| |op| |args| |prec|
                              $))
                            ((SPADCALL |op| (QREFELT $ 15) (QREFELT $ 59))
                             (|FORMULA;formatNary| |op| |args| |prec| $))
                            (#2#
                             (SEQ
                              (LETT |op|
                                    (|FORMULA;formatFormula| (|SPADfirst| |l|)
                                     (QREFELT $ 9) $)
                                    . #1#)
                              (EXIT
                               (|FORMULA;formatFunction| |op| |args| |prec|
                                $))))))))))))))))))))) 

(DECLAIM (NOTINLINE |ScriptFormulaFormat;|)) 

(DEFUN |ScriptFormulaFormat| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G241)
       (RETURN
        (COND
         ((LETT #1# (HGET |$ConstructorCache| '|ScriptFormulaFormat|)
                . #2=(|ScriptFormulaFormat|))
          (|CDRwithIncrement| (CDAR #1#)))
         ('T
          (UNWIND-PROTECT
              (PROG1
                  (CDDAR
                   (HPUT |$ConstructorCache| '|ScriptFormulaFormat|
                         (LIST (CONS NIL (CONS 1 (|ScriptFormulaFormat;|))))))
                (LETT #1# T . #2#))
            (COND
             ((NOT #1#)
              (HREM |$ConstructorCache| '|ScriptFormulaFormat|))))))))))) 

(DEFUN |ScriptFormulaFormat;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|ScriptFormulaFormat|) . #1=(|ScriptFormulaFormat|))
      (LETT $ (GETREFV 62) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|ScriptFormulaFormat| NIL (CONS 1 $))
      (|stuffDomainSlots| $)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 6
                (|Record| (|:| |prolog| (|List| (|String|)))
                          (|:| |formula| (|List| (|String|)))
                          (|:| |epilog| (|List| (|String|)))))
      (QSETREFV $ 7 " @@ ")
      (QSETREFV $ 8 1000000)
      (QSETREFV $ 9 0)
      (QSETREFV $ 10 " <>[](){}+*=,-%")
      (QSETREFV $ 11 (LIST #2="-"))
      (QSETREFV $ 12 '(700))
      (QSETREFV $ 13 (LIST "+->" "|" "^" "/" "<" ">" "=" "OVER"))
      (QSETREFV $ 14 (LIST 0 0 900 700 400 400 400 700))
      (QSETREFV $ 15
                (LIST #2# "+" "*" (QREFELT $ 7) "," ";" " " "ROW" "" " habove "
                      " here " " labove "))
      (QSETREFV $ 16 (LIST 700 700 800 800 110 110 0 0 0 0 0 0))
      (QSETREFV $ 17 NIL)
      (QSETREFV $ 18 (LIST "SIGMA" "PI" "INTSIGN" "INDEFINTEGRAL"))
      (QSETREFV $ 19 '(700 800 700 700))
      (QSETREFV $ 20
                (LIST "MATRIX" "BRACKET" "BRACE" "CONCATB" "AGGLST" "CONCAT"
                      "OVERBAR" "ROOT" "SUB" "SUPERSUB" "ZAG" "AGGSET" "SC"
                      "PAREN" "PRIME"))
      (QSETREFV $ 21 (LIST "5" "..."))
      (QSETREFV $ 22 (LIST " alpha " " ellipsis "))
      $)))) 

(MAKEPROP '|ScriptFormulaFormat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| '|blank| '|maxPrec| '|minPrec|
              '|splitChars| '|unaryOps| '|unaryPrecs| '|binaryOps|
              '|binaryPrecs| '|naryOps| '|naryPrecs| '|naryNGOps| '|plexOps|
              '|plexPrecs| '|specialOps| '|specialStrings|
              '|specialStringsInFormula| |FORMULA;new;$;1| (|OutputForm|)
              |FORMULA;coerce;Of$;2| (|List| 43) (0 . |concat|) (|Integer|)
              |FORMULA;convert;OfI$;3| (|Void|) (6 . |void|)
              |FORMULA;display;$IV;4| |FORMULA;display;$V;5|
              |FORMULA;prologue;$L;6| |FORMULA;formula;$L;7|
              |FORMULA;epilogue;$L;8| |FORMULA;setPrologue!;$2L;9|
              |FORMULA;setFormula!;$2L;10| |FORMULA;setEpilogue!;$2L;11|
              (10 . |coerce|) |FORMULA;coerce;$Of;12| (|Character|) (|String|)
              (15 . |elt|) (21 . |setelt|) (|List| $) (28 . |split|)
              (|Boolean|) (34 . >) (40 . |concat|) (|List| 24) (45 . |second|)
              (50 . ~=) (56 . |position|) (|List| 28) (62 . |elt|) (68 . ~=)
              (74 . |elt|) (80 . |member?|) (|SingleInteger|) (|HashState|))
           '#(~= 86 |setPrologue!| 92 |setFormula!| 98 |setEpilogue!| 104
              |prologue| 110 |new| 115 |latex| 119 |hashUpdate!| 124 |hash| 130
              |formula| 135 |epilogue| 140 |display| 145 |convert| 156 |coerce|
              162 = 172)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 24))
                        (|makeByteWordVec2| 61
                                            '(2 26 0 0 0 27 0 30 0 31 1 26 24 0
                                              40 2 43 42 0 28 44 3 43 42 0 28
                                              42 45 2 43 46 0 42 47 2 28 48 0 0
                                              49 1 43 0 46 50 1 51 24 0 52 2 43
                                              48 0 0 53 2 26 28 43 0 54 2 55 28
                                              0 28 56 2 28 48 0 0 57 2 26 43 0
                                              28 58 2 26 48 43 0 59 2 0 48 0 0
                                              1 2 0 26 0 26 37 2 0 26 0 26 38 2
                                              0 26 0 26 39 1 0 26 0 34 0 0 0 23
                                              1 0 43 0 1 2 0 61 61 0 1 1 0 60 0
                                              1 1 0 26 0 35 1 0 26 0 36 1 0 30
                                              0 33 2 0 30 0 28 32 2 0 0 24 28
                                              29 1 0 0 24 25 1 0 24 0 41 2 0 48
                                              0 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|ScriptFormulaFormat| 'NILADIC T) 
