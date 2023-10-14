
(SDEFUN |HTMLFORM;coerce;OfS;1| ((|expr| |OutputForm|) ($ |String|))
        (SEQ
         (|HTMLFORM;outputTree|
          (|HTMLFORM;formatHtml| (|HTMLFORM;precondition| |expr| $)
           (QREFELT $ 8) $)
          $)
         (EXIT " "))) 

(SDEFUN |HTMLFORM;coerceS;OfS;2| ((|expr| |OutputForm|) ($ |String|))
        (SEQ
         (|HTMLFORM;outputTree|
          (|HTMLFORM;formatHtml| (|HTMLFORM;precondition| |expr| $)
           (QREFELT $ 8) $)
          $)
         (EXIT " "))) 

(SDEFUN |HTMLFORM;coerceL;OfS;3| ((|expr| |OutputForm|) ($ |String|))
        (SEQ
         (|HTMLFORM;outputTree|
          (|HTMLFORM;formatHtml| (|HTMLFORM;precondition| |expr| $)
           (QREFELT $ 8) $)
          $)
         (EXIT " "))) 

(SDEFUN |HTMLFORM;display;SV;4| ((|html| |String|) ($ |Void|))
        (SEQ (|sayHtml| |html|) (EXIT (SPADCALL (QREFELT $ 28))))) 

(SDEFUN |HTMLFORM;newNode|
        ((|tag| |String|) (|node| |Tree| (|String|)) ($ |Tree| (|String|)))
        (SPROG ((|t| (|Tree| (|String|))))
               (SEQ
                (LETT |t| (SPADCALL (|String|) (LIST |node|) (QREFELT $ 32))
                      |HTMLFORM;newNode|)
                (SPADCALL |t| |tag| (QREFELT $ 33)) (EXIT |t|)))) 

(SDEFUN |HTMLFORM;newNodes|
        ((|tag| |String|) (|nodes| |List| (|Tree| (|String|)))
         ($ |Tree| (|String|)))
        (SPROG ((|t| (|Tree| (|String|))))
               (SEQ
                (LETT |t| (SPADCALL (|String|) |nodes| (QREFELT $ 32))
                      |HTMLFORM;newNodes|)
                (SPADCALL |t| |tag| (QREFELT $ 33)) (EXIT |t|)))) 

(SDEFUN |HTMLFORM;notTable?| ((|node| |Tree| (|String|)) ($ |Boolean|))
        (SPROG
         ((#1=#:G174 NIL) (#2=#:G175 NIL) (|a| NIL)
          (|c| (|List| (|Tree| (|String|)))))
         (SEQ
          (EXIT
           (COND
            ((OR (SPADCALL |node| (QREFELT $ 35))
                 (SPADCALL |node| (QREFELT $ 36)))
             'T)
            ((SPADCALL "table" (SPADCALL |node| (QREFELT $ 37)) (QREFELT $ 38))
             'NIL)
            ('T
             (SEQ
              (LETT |c| (SPADCALL |node| (QREFELT $ 39))
                    . #3=(|HTMLFORM;notTable?|))
              (SEQ (LETT |a| NIL . #3#) (LETT #2# |c| . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (|HTMLFORM;notTable?| |a| $))
                       (PROGN (LETT #1# 'NIL . #3#) (GO #1#))))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT 'T)))))
          #1# (EXIT #1#)))) 

(SDEFUN |HTMLFORM;argsToString| ((|args| |List| (|OutputForm|)) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|s1| #1=(|String|)) (#2=#:G180 NIL) (|a| NIL)
          (|sop| #1#))
         (SEQ
          (LETT |sop| (SPADCALL (|SPADfirst| |args|) (QREFELT $ 40))
                . #3=(|HTMLFORM;argsToString|))
          (LETT |args| (CDR |args|) . #3#)
          (LETT |s| (SPADCALL (LIST "{" |sop|) (QREFELT $ 41)) . #3#)
          (SEQ (LETT |a| NIL . #3#) (LETT #2# |args| . #3#) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |s1| (SPADCALL |a| (QREFELT $ 40)) . #3#)
                    (EXIT
                     (LETT |s| (SPADCALL (LIST |s| |s1|) (QREFELT $ 41))
                           . #3#)))
               (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
          (EXIT (LETT |s| (SPADCALL (LIST |s| "}") (QREFELT $ 41)) . #3#))))) 

(SDEFUN |HTMLFORM;exprex;OfS;9| ((|expr| |OutputForm|) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|s1| #1=(|String|)) (#2=#:G187 NIL) (|a| NIL)
          (|nargs| (|Integer|)) (|args| (|List| (|OutputForm|))) (|sop| #1#)
          (|op| (|OutputForm|)) (|le| (|List| (|OutputForm|))))
         (SEQ
          (LETT |expr| (|HTMLFORM;precondition| |expr| $)
                . #3=(|HTMLFORM;exprex;OfS;9|))
          (COND
           ((OR (ATOM |expr|)
                (EQUAL (|HTMLFORM;stringify| |expr| $) "NOTHING"))
            (EXIT
             (SPADCALL (LIST "{" (|HTMLFORM;stringify| |expr| $) "}")
                       (QREFELT $ 41)))))
          (LETT |le| |expr| . #3#) (LETT |op| (|SPADfirst| |le|) . #3#)
          (LETT |sop| (SPADCALL |op| (QREFELT $ 40)) . #3#)
          (LETT |args| (CDR |le|) . #3#) (LETT |nargs| (LENGTH |args|) . #3#)
          (LETT |s| (SPADCALL (LIST "{" |sop|) (QREFELT $ 41)) . #3#)
          (COND
           ((SPADCALL |nargs| 0 (QREFELT $ 43))
            (SEQ (LETT |a| NIL . #3#) (LETT #2# |args| . #3#) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#) . #3#) NIL))
                   (GO G191)))
                 (SEQ (LETT |s1| (SPADCALL |a| (QREFELT $ 40)) . #3#)
                      (EXIT
                       (LETT |s| (SPADCALL (LIST |s| |s1|) (QREFELT $ 41))
                             . #3#)))
                 (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))))
          (EXIT (LETT |s| (SPADCALL (LIST |s| "}") (QREFELT $ 41)) . #3#))))) 

(SDEFUN |HTMLFORM;atomize| ((|expr| |OutputForm|) ($ |List| (|OutputForm|)))
        (SPROG
         ((|le| (|List| (|OutputForm|))) (#1=#:G193 NIL) (|a| NIL)
          (|letmp| (|List| (|OutputForm|))))
         (SEQ (LETT |le| NIL . #2=(|HTMLFORM;atomize|))
              (COND
               ((OR (ATOM |expr|)
                    (EQUAL (|HTMLFORM;stringify| |expr| $) "NOTHING"))
                (EXIT
                 (LETT |le| (APPEND |le| (SPADCALL |expr| (QREFELT $ 45)))
                       . #2#))))
              (LETT |letmp| |expr| . #2#)
              (SEQ (LETT |a| NIL . #2#) (LETT #1# |letmp| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |le| (APPEND |le| (|HTMLFORM;atomize| |a| $))
                           . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT |le|)))) 

(SDEFUN |HTMLFORM;outputTree| ((|t| |Tree| (|String|)) ($ |Void|))
        (SPROG
         ((#1=#:G218 NIL) (|c1| NIL) (#2=#:G213 NIL) (|s| (|String|))
          (#3=#:G217 NIL) (|allString| (|Boolean|)) (#4=#:G216 NIL)
          (|b| (|List| (|Boolean|))) (#5=#:G215 NIL) (#6=#:G214 NIL)
          (|enableGrid| (|Boolean|)) (|c| (|List| (|Tree| (|String|))))
          (|tagName| (|String|)) (|tagPos| (|Integer|))
          (|endWithPlus| (|Boolean|)))
         (SEQ
          (EXIT
           (SEQ (LETT |endWithPlus| 'NIL . #7=(|HTMLFORM;outputTree|))
                (COND
                 ((SPADCALL |t| (QREFELT $ 35))
                  (PROGN (LETT #2# (SPADCALL (QREFELT $ 28)) . #7#) (GO #2#))))
                (COND
                 ((SPADCALL |t| (QREFELT $ 36))
                  (SEQ (|sayHtml| (SPADCALL |t| (QREFELT $ 37)))
                       (EXIT
                        (PROGN
                         (LETT #2# (SPADCALL (QREFELT $ 28)) . #7#)
                         (GO #2#))))))
                (LETT |tagName| (COPY-SEQ (SPADCALL |t| (QREFELT $ 37))) . #7#)
                (LETT |tagPos|
                      (SPADCALL (|STR_to_CHAR| " ") |tagName| 1 (QREFELT $ 47))
                      . #7#)
                (COND
                 ((SPADCALL |tagPos| 1 (QREFELT $ 43))
                  (LETT |tagName|
                        (SPADCALL
                         (SPADCALL |tagName| (|STR_to_CHAR| " ")
                                   (QREFELT $ 48))
                         1 (QREFELT $ 50))
                        . #7#)))
                (COND
                 ((SPADCALL (SPADCALL |t| (QREFELT $ 37)) "" (QREFELT $ 51))
                  (|sayHtml|
                   (SPADCALL (LIST "<" (SPADCALL |t| (QREFELT $ 37)) ">")
                             (QREFELT $ 41)))))
                (LETT |c| (SPADCALL |t| (QREFELT $ 39)) . #7#)
                (LETT |enableGrid|
                      (COND
                       ((SPADCALL (LENGTH |c|) 1 (QREFELT $ 43))
                        (COND ((|HTMLFORM;notTable?| |t| $) 'NIL) (#8='T 'T)))
                       (#8# 'NIL))
                      . #7#)
                (COND
                 (|enableGrid|
                  (SEQ
                   (COND
                    ((EQUAL |tagName| "table") (LETT |enableGrid| 'NIL . #7#)))
                   (EXIT
                    (COND
                     ((EQUAL |tagName| "tr")
                      (LETT |enableGrid| 'NIL . #7#)))))))
                (LETT |b|
                      (PROGN
                       (LETT #6# NIL . #7#)
                       (SEQ (LETT |c1| NIL . #7#) (LETT #5# |c| . #7#) G190
                            (COND
                             ((OR (ATOM #5#)
                                  (PROGN (LETT |c1| (CAR #5#) . #7#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #6#
                                    (CONS (SPADCALL |c1| (QREFELT $ 36)) #6#)
                                    . #7#)))
                            (LETT #5# (CDR #5#) . #7#) (GO G190) G191
                            (EXIT (NREVERSE #6#))))
                      . #7#)
                (LETT |allString| 'T . #7#)
                (SEQ (LETT |c1| NIL . #7#) (LETT #4# |c| . #7#) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |c1| (CAR #4#) . #7#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((NULL (SPADCALL |c1| (QREFELT $ 36)))
                         (LETT |allString| 'NIL . #7#)))))
                     (LETT #4# (CDR #4#) . #7#) (GO G190) G191 (EXIT NIL))
                (COND
                 (|allString|
                  (SEQ (LETT |s| "" . #7#)
                       (SEQ (LETT |c1| NIL . #7#) (LETT #3# |c| . #7#) G190
                            (COND
                             ((OR (ATOM #3#)
                                  (PROGN (LETT |c1| (CAR #3#) . #7#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |s|
                                    (STRCONC |s|
                                             (SPADCALL |c1| (QREFELT $ 37)))
                                    . #7#)))
                            (LETT #3# (CDR #3#) . #7#) (GO G190) G191
                            (EXIT NIL))
                       (|sayHtml| |s|)
                       (COND
                        ((SPADCALL (SPADCALL |t| (QREFELT $ 37)) ""
                                   (QREFELT $ 51))
                         (|sayHtml|
                          (SPADCALL (LIST "</" |tagName| ">")
                                    (QREFELT $ 41)))))
                       (EXIT
                        (PROGN
                         (LETT #2# (SPADCALL (QREFELT $ 28)) . #7#)
                         (GO #2#))))))
                (COND
                 (|enableGrid|
                  (SEQ (|sayHtml| "<table border='0'>")
                       (EXIT (|sayHtml| "<tr>")))))
                (SEQ (LETT |c1| NIL . #7#) (LETT #1# |c| . #7#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |c1| (CAR #1#) . #7#) NIL))
                       (GO G191)))
                     (SEQ (COND (|enableGrid| (|sayHtml| "<td>")))
                          (|HTMLFORM;outputTree| |c1| $)
                          (EXIT (COND (|enableGrid| (|sayHtml| "</td>")))))
                     (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
                (COND
                 (|enableGrid|
                  (SEQ (|sayHtml| "</tr>") (EXIT (|sayHtml| "</table>")))))
                (COND
                 ((SPADCALL (SPADCALL |t| (QREFELT $ 37)) "" (QREFELT $ 51))
                  (|sayHtml|
                   (SPADCALL (LIST "</" |tagName| ">") (QREFELT $ 41)))))
                (EXIT (SPADCALL (QREFELT $ 28)))))
          #2# (EXIT #2#)))) 

(PUT '|HTMLFORM;stringify| '|SPADreplace| '|mathObject2String|) 

(SDEFUN |HTMLFORM;stringify| ((|expr| |OutputForm|) ($ |String|))
        (|mathObject2String| |expr|)) 

(PUT '|HTMLFORM;precondition| '|SPADreplace| '|outputTran|) 

(SDEFUN |HTMLFORM;precondition| ((|expr| |OutputForm|) ($ |OutputForm|))
        (|outputTran| |expr|)) 

(SDEFUN |HTMLFORM;formatSC|
        ((|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |Tree| (|String|)))
        (SPROG
         ((|row| (|Tree| (|String|))) (|cells| (|List| (|Tree| (|String|))))
          (#1=#:G226 NIL) (|a| NIL) (#2=#:G225 NIL))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL "formatSC: "
                       (SPADCALL
                        (LIST " args=" (|HTMLFORM;argsToString| |args| $)
                              " prec=" (STRINGIMAGE |prec|))
                        (QREFELT $ 41))
                       (QREFELT $ 52)))))
          (EXIT
           (COND ((NULL |args|) (SPADCALL "" (QREFELT $ 53)))
                 ('T
                  (SEQ
                   (LETT |cells|
                         (PROGN
                          (LETT #2# NIL . #3=(|HTMLFORM;formatSC|))
                          (SEQ (LETT |a| NIL . #3#) (LETT #1# |args| . #3#)
                               G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |a| (CAR #1#) . #3#) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS
                                        (|HTMLFORM;newNode|
                                         "td id='sc' style='border-bottom-style:solid'"
                                         (|HTMLFORM;formatHtml| |a| |prec| $)
                                         $)
                                        #2#)
                                       . #3#)))
                               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         . #3#)
                   (LETT |row| (|HTMLFORM;newNodes| "tr id='sc'" |cells| $)
                         . #3#)
                   (EXIT
                    (|HTMLFORM;newNode| "table border='0' id='sc'" |row|
                     $))))))))) 

(SDEFUN |HTMLFORM;buildOverbar|
        ((|content| |Tree| (|String|)) ($ |Tree| (|String|)))
        (SPROG ((|row| #1=(|Tree| (|String|))) (|cell| #1#))
               (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildOverbar")))
                    (LETT |cell|
                          (|HTMLFORM;newNode|
                           "td id='overbar' style='border-top-style:solid'"
                           |content| $)
                          . #2=(|HTMLFORM;buildOverbar|))
                    (LETT |row| (|HTMLFORM;newNode| "tr id='overbar'" |cell| $)
                          . #2#)
                    (EXIT
                     (|HTMLFORM;newNode| "table border='0' id='overbar'" |row|
                      $))))) 

(SDEFUN |HTMLFORM;buildRoot|
        ((|content| |Tree| (|String|)) ($ |Tree| (|String|)))
        (SPROG
         ((|row| (|Tree| (|String|))) (|cell2| #1=(|Tree| (|String|)))
          (|cell1| #1#) (#2=#:G231 NIL))
         (SEQ
          (EXIT
           (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildRoot")))
                (COND
                 ((SPADCALL |content| (QREFELT $ 36))
                  (PROGN
                   (LETT #2#
                         (|HTMLFORM;newNodes| ""
                          (LIST (SPADCALL "&radic;" (QREFELT $ 53)) |content|)
                          $)
                         . #3=(|HTMLFORM;buildRoot|))
                   (GO #2#))))
                (LETT |cell1|
                      (|HTMLFORM;newNode| "td id='root'"
                       (SPADCALL "&radic;" (QREFELT $ 53)) $)
                      . #3#)
                (LETT |cell2|
                      (|HTMLFORM;newNode|
                       "td id='root' style='border-top-style:solid'" |content|
                       $)
                      . #3#)
                (LETT |row|
                      (|HTMLFORM;newNodes| "tr id='root'"
                       (LIST |cell1| |cell2|) $)
                      . #3#)
                (EXIT
                 (|HTMLFORM;newNode| "table border='0' id='root'" |row| $))))
          #2# (EXIT #2#)))) 

(SDEFUN |HTMLFORM;buildNRoot|
        ((|content| |Tree| (|String|)) (|nth| |Tree| (|String|))
         ($ |Tree| (|String|)))
        (SPROG
         ((|row| #1=(|Tree| (|String|))) (|cell2| #2=(|Tree| (|String|)))
          (|cell1| #1#) (#3=#:G234 NIL) (|power| #2#))
         (SEQ
          (EXIT
           (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildNRoot")))
                (LETT |power| (|HTMLFORM;newNode| "sup" |nth| $)
                      . #4=(|HTMLFORM;buildNRoot|))
                (COND
                 ((SPADCALL |content| (QREFELT $ 36))
                  (PROGN
                   (LETT #3#
                         (|HTMLFORM;newNodes| ""
                          (LIST |power| (SPADCALL "&radic;" (QREFELT $ 53))
                                |content|)
                          $)
                         . #4#)
                   (GO #3#))))
                (LETT |cell1|
                      (|HTMLFORM;newNodes| "td id='nroot'"
                       (LIST |power| (SPADCALL "&radic;" (QREFELT $ 53))) $)
                      . #4#)
                (LETT |cell2|
                      (|HTMLFORM;newNode|
                       "td id='nroot' style='border-top-style:solid'" |content|
                       $)
                      . #4#)
                (LETT |row|
                      (|HTMLFORM;newNodes| "tr id='nroot'"
                       (LIST |cell1| |cell2|) $)
                      . #4#)
                (EXIT
                 (|HTMLFORM;newNode| "table border='0' id='nroot'" |row| $))))
          #3# (EXIT #3#)))) 

(SDEFUN |HTMLFORM;formatSpecial|
        ((|op| |String|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |Tree| (|String|)))
        (SPROG
         ((|tmp| (|Tree| (|String|))) (#1=#:G244 NIL) (|u| NIL) (#2=#:G243 NIL)
          (|prescript| (|Boolean|)))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL "formatSpecial: "
                       (SPADCALL
                        (LIST "op=" |op| " args="
                              (|HTMLFORM;argsToString| |args| $) " prec="
                              (STRINGIMAGE |prec|))
                        (QREFELT $ 41))
                       (QREFELT $ 52)))))
          (LETT |prescript| 'NIL . #3=(|HTMLFORM;formatSpecial|))
          (EXIT
           (COND
            ((EQUAL |op| "theMap") (SPADCALL "theMap(...)" (QREFELT $ 53)))
            ((EQUAL |op| "AGGLST") (|HTMLFORM;formatNary| "," |args| |prec| $))
            ((EQUAL |op| "AGGSET") (|HTMLFORM;formatNary| ";" |args| |prec| $))
            ((EQUAL |op| "TAG")
             (|HTMLFORM;newNodes| ""
              (LIST (|HTMLFORM;formatHtml| (|SPADfirst| |args|) |prec| $)
                    (SPADCALL "&#x02192;" (QREFELT $ 53))
                    (|HTMLFORM;formatHtml| (SPADCALL |args| (QREFELT $ 54))
                     |prec| $))
              $))
            ((EQUAL |op| "SLASH")
             (|HTMLFORM;newNodes| ""
              (LIST (|HTMLFORM;formatHtml| (|SPADfirst| |args|) |prec| $)
                    (SPADCALL "/" (QREFELT $ 53))
                    (|HTMLFORM;formatHtml| (SPADCALL |args| (QREFELT $ 54))
                     |prec| $))
              $))
            ((EQUAL |op| "VCONCAT")
             (|HTMLFORM;newNodes| "table"
              (PROGN
               (LETT #2# NIL . #3#)
               (SEQ (LETT |u| NIL . #3#) (LETT #1# |args| . #3#) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #2#
                            (CONS
                             (|HTMLFORM;newNode| "td"
                              (|HTMLFORM;formatHtml| |u| (QREFELT $ 8) $) $)
                             #2#)
                            . #3#)))
                    (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                    (EXIT (NREVERSE #2#))))
              $))
            ((EQUAL |op| "CONCATB")
             (|HTMLFORM;formatNary| " " |args| |prec| $))
            ((EQUAL |op| "CONCAT")
             (|HTMLFORM;formatNary| "" |args| (QREFELT $ 8) $))
            ((EQUAL |op| "QUOTE")
             (|HTMLFORM;newNodes| ""
              (LIST (SPADCALL "'" (QREFELT $ 53))
                    (|HTMLFORM;formatHtml| (|SPADfirst| |args|) (QREFELT $ 8)
                     $))
              $))
            ((EQUAL |op| "BRACKET")
             (|HTMLFORM;newNodes| ""
              (LIST (SPADCALL "[" (QREFELT $ 53))
                    (|HTMLFORM;formatHtml| (|SPADfirst| |args|) (QREFELT $ 8)
                     $)
                    (SPADCALL "]" (QREFELT $ 53)))
              $))
            ((EQUAL |op| "BRACE")
             (|HTMLFORM;newNodes| ""
              (LIST (SPADCALL "{" (QREFELT $ 53))
                    (|HTMLFORM;formatHtml| (|SPADfirst| |args|) (QREFELT $ 8)
                     $)
                    (SPADCALL "}" (QREFELT $ 53)))
              $))
            ((EQUAL |op| "PAREN")
             (|HTMLFORM;newNodes| ""
              (LIST (SPADCALL "(" (QREFELT $ 53))
                    (|HTMLFORM;formatHtml| (|SPADfirst| |args|) (QREFELT $ 8)
                     $)
                    (SPADCALL ")" (QREFELT $ 53)))
              $))
            ((EQUAL |op| "OVERBAR")
             (COND ((NULL |args|) (SPADCALL "" (QREFELT $ 53)))
                   (#4='T
                    (|HTMLFORM;buildOverbar|
                     (|HTMLFORM;formatHtml| (|SPADfirst| |args|) (QREFELT $ 8)
                      $)
                     $))))
            (#4#
             (SEQ
              (COND
               ((EQUAL |op| "ROOT")
                (COND
                 ((< (LENGTH |args|) 1) (EXIT (SPADCALL "" (QREFELT $ 53)))))))
              (COND
               ((EQUAL |op| "ROOT")
                (COND
                 ((EQL (LENGTH |args|) 1)
                  (EXIT
                   (|HTMLFORM;buildRoot|
                    (|HTMLFORM;formatHtml| (|SPADfirst| |args|) (QREFELT $ 8)
                     $)
                    $))))))
              (COND
               ((EQUAL |op| "ROOT")
                (COND
                 ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 43))
                  (EXIT
                   (|HTMLFORM;buildNRoot|
                    (|HTMLFORM;formatHtml| (|SPADfirst| |args|) (QREFELT $ 8)
                     $)
                    (|HTMLFORM;formatHtml| (SPADCALL |args| (QREFELT $ 54))
                     (QREFELT $ 8) $)
                    $))))))
              (EXIT
               (COND
                ((EQUAL |op| "SEGMENT")
                 (SEQ
                  (LETT |tmp|
                        (|HTMLFORM;newNodes| ""
                         (LIST
                          (|HTMLFORM;formatHtml| (|SPADfirst| |args|)
                           (QREFELT $ 8) $)
                          (SPADCALL ".." (QREFELT $ 53)))
                         $)
                        . #3#)
                  (EXIT
                   (COND ((NULL (CDR |args|)) |tmp|)
                         (#4#
                          (|HTMLFORM;newNodes| ""
                           (LIST |tmp|
                                 (|HTMLFORM;formatHtml|
                                  (|SPADfirst| (CDR |args|)) (QREFELT $ 8) $))
                           $))))))
                ((EQUAL |op| "SC")
                 (|HTMLFORM;formatSC| |args| (QREFELT $ 8) $))
                ((EQUAL |op| "MATRIX")
                 (|HTMLFORM;formatMatrix| (CDR |args|) $))
                ((EQUAL |op| "ZAG")
                 (|HTMLFORM;newNodes| ""
                  (LIST (SPADCALL " \\zag{" (QREFELT $ 53))
                        (|HTMLFORM;formatHtml| (|SPADfirst| |args|)
                         (QREFELT $ 8) $)
                        (SPADCALL "}{" (QREFELT $ 53))
                        (|HTMLFORM;formatHtml| (|SPADfirst| (CDR |args|))
                         (QREFELT $ 8) $)
                        (SPADCALL "}" (QREFELT $ 53)))
                  $))
                (#4#
                 (SPADCALL
                  (SPADCALL "formatSpecial not implemented:" |op|
                            (QREFELT $ 52))
                  (QREFELT $ 53)))))))))))) 

(SDEFUN |HTMLFORM;formatSuperSub|
        ((|expr| |OutputForm|) (|args| |List| (|OutputForm|))
         (|opPrec| |Integer|) ($ |Tree| (|String|)))
        (SPROG
         ((|res| (|Tree| (|String|))) (|commaTest| (|String|))
          (|ndiffs| (|Integer|)) (|commaS| #1=(|String|)) (|bvarS| #1#)
          (|funcS| #1#) (|var| (|OutputForm|)) (|op| #1#)
          (|atomE| (|List| (|OutputForm|))))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL "formatSuperSub: "
                       (SPADCALL
                        (LIST "expr=" (|HTMLFORM;stringify| |expr| $) " args="
                              (|HTMLFORM;argsToString| |args| $) " prec="
                              (STRINGIMAGE |opPrec|))
                        (QREFELT $ 41))
                       (QREFELT $ 52)))))
          (LETT |atomE| (|HTMLFORM;atomize| |expr| $)
                . #2=(|HTMLFORM;formatSuperSub|))
          (LETT |op| (|HTMLFORM;stringify| (|SPADfirst| |atomE|) $) . #2#)
          (EXIT
           (COND
            ((SPADCALL |op| "SUPERSUB" (QREFELT $ 51))
             (SPADCALL "Mistake in formatSuperSub: no SUPERSUB"
                       (QREFELT $ 53)))
            ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 55))
             (SPADCALL "Mistake in SuperSub: #args <> 1" (QREFELT $ 53)))
            ('T
             (SEQ (LETT |var| (|SPADfirst| |args|) . #2#)
                  (LETT |funcS|
                        (|HTMLFORM;stringify| (|SPADfirst| (CDR |atomE|)) $)
                        . #2#)
                  (LETT |bvarS| (|HTMLFORM;stringify| (|SPADfirst| |args|) $)
                        . #2#)
                  (LETT |commaS|
                        (|HTMLFORM;stringify|
                         (|SPADfirst| (CDR (CDR (CDR |atomE|)))) $)
                        . #2#)
                  (LETT |commaTest| "," . #2#) (LETT |ndiffs| 0 . #2#)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL
                           (SPADCALL |commaTest| |commaS| 1 (QREFELT $ 56)) 0
                           (QREFELT $ 43)))
                         (GO G191)))
                       (SEQ (LETT |ndiffs| (+ |ndiffs| 1) . #2#)
                            (EXIT
                             (LETT |commaTest|
                                   (SPADCALL |commaTest| "," (QREFELT $ 52))
                                   . #2#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |res|
                        (|HTMLFORM;newNodes| ""
                         (LIST
                          (SPADCALL
                           (SPADCALL "&#x02146;"
                                     (SPADCALL (STRINGIMAGE |ndiffs|)
                                               (SPADCALL ""
                                                         (SPADCALL |funcS|
                                                                   "&#x02146;"
                                                                   (QREFELT $
                                                                            52))
                                                         (QREFELT $ 52))
                                               (QREFELT $ 52))
                                     (QREFELT $ 52))
                           (QREFELT $ 53))
                          (|HTMLFORM;formatHtml| (|SPADfirst| |args|)
                           (QREFELT $ 8) $)
                          (SPADCALL
                           (SPADCALL ""
                                     (SPADCALL (STRINGIMAGE |ndiffs|)
                                               "&#x02061;" (QREFELT $ 52))
                                     (QREFELT $ 52))
                           (QREFELT $ 53))
                          (|HTMLFORM;formatHtml| (|SPADfirst| |args|)
                           (QREFELT $ 8) $)
                          (SPADCALL ")" (QREFELT $ 53)))
                         $)
                        . #2#)
                  (EXIT |res|)))))))) 

(SDEFUN |HTMLFORM;buildPlex3|
        ((|main| |Tree| (|String|)) (|supsc| |Tree| (|String|))
         (|op| |Tree| (|String|)) (|subsc| |Tree| (|String|))
         ($ |Tree| (|String|)))
        (SPROG
         ((|rows| (|List| #1=(|Tree| (|String|)))) (|m| #1#) (|ssub| #1#)
          (|sop| #1#) (|ssup| #1#))
         (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildPlex")))
              (LETT |ssup| (|HTMLFORM;newNode| "td id='plex'" |supsc| $)
                    . #2=(|HTMLFORM;buildPlex3|))
              (LETT |sop| (|HTMLFORM;newNode| "td id='plex'" |op| $) . #2#)
              (LETT |ssub| (|HTMLFORM;newNode| "td id='plex'" |subsc| $) . #2#)
              (LETT |m|
                    (|HTMLFORM;newNode| "td rowspan='3' id='plex'" |main| $)
                    . #2#)
              (LETT |rows|
                    (LIST
                     (|HTMLFORM;newNodes| "tr id='plex'" (LIST |ssup| |m|) $)
                     (|HTMLFORM;newNode| "tr id='plex'" |sop| $)
                     (|HTMLFORM;newNode| "tr id='plex'" |ssub| $))
                    . #2#)
              (EXIT
               (|HTMLFORM;newNodes| "table border='0' id='plex'" |rows| $))))) 

(SDEFUN |HTMLFORM;buildPlex2|
        ((|main| |Tree| (|String|)) (|supsc| |Tree| (|String|))
         (|op| |Tree| (|String|)) ($ |Tree| (|String|)))
        (SPROG
         ((|rows| (|List| #1=(|Tree| (|String|)))) (|m| #1#) (|sop| #1#)
          (|ssup| #1#))
         (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildPlex")))
              (LETT |ssup| (|HTMLFORM;newNode| "td id='plex'" |supsc| $)
                    . #2=(|HTMLFORM;buildPlex2|))
              (LETT |sop| (|HTMLFORM;newNode| "td id='plex'" |op| $) . #2#)
              (LETT |m|
                    (|HTMLFORM;newNode| "td rowspan='2' id='plex'" |main| $)
                    . #2#)
              (LETT |rows|
                    (LIST
                     (|HTMLFORM;newNodes| "tr id='plex'" (LIST |sop| |m|) $)
                     (|HTMLFORM;newNode| "tr id='plex'" |ssup| $))
                    . #2#)
              (EXIT
               (|HTMLFORM;newNodes| "table border='0' id='plex'" |rows| $))))) 

(SDEFUN |HTMLFORM;formatIntSign|
        ((|args| |List| (|OutputForm|)) (|opPrec| |Integer|)
         ($ |Tree| (|String|)))
        (SEQ
         (COND
          ((QREFELT $ 21)
           (|sayHtml|
            (SPADCALL "formatIntSign: "
                      (SPADCALL
                       (LIST " args=" (|HTMLFORM;argsToString| |args| $)
                             " prec=" (STRINGIMAGE |opPrec|))
                       (QREFELT $ 41))
                      (QREFELT $ 52)))))
         (EXIT
          (COND
           ((EQUAL (|HTMLFORM;stringify| (|SPADfirst| |args|) $) "NOTHING")
            (|HTMLFORM;buildPlex2|
             (|HTMLFORM;formatHtml| (SPADCALL |args| 3 (QREFELT $ 57)) |opPrec|
              $)
             (SPADCALL "&int;" (QREFELT $ 53))
             (|HTMLFORM;formatHtml| (SPADCALL |args| 2 (QREFELT $ 57)) |opPrec|
              $)
             $))
           ('T
            (|HTMLFORM;buildPlex3|
             (|HTMLFORM;formatHtml| (|SPADfirst| |args|) |opPrec| $)
             (|HTMLFORM;formatHtml| (SPADCALL |args| 3 (QREFELT $ 57)) |opPrec|
              $)
             (SPADCALL "&int;" (QREFELT $ 53))
             (|HTMLFORM;formatHtml| (SPADCALL |args| 2 (QREFELT $ 57)) |opPrec|
              $)
             $)))))) 

(SDEFUN |HTMLFORM;formatPlex|
        ((|op| |String|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |Tree| (|String|)))
        (SPROG
         ((#1=#:G265 NIL) (|s| (|Tree| (|String|))) (|checkarg| (|Boolean|))
          (|n| (|Integer|)) (|opPrec| (|Integer|)) (|p| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((QREFELT $ 21)
              (|sayHtml|
               (SPADCALL "formatPlex: "
                         (SPADCALL
                          (LIST "op=" |op| " args="
                                (|HTMLFORM;argsToString| |args| $) " prec="
                                (STRINGIMAGE |prec|))
                          (QREFELT $ 41))
                         (QREFELT $ 52)))))
            (LETT |checkarg| 'NIL . #2=(|HTMLFORM;formatPlex|))
            (LETT |p| (SPADCALL |op| (QREFELT $ 16) (QREFELT $ 58)) . #2#)
            (EXIT
             (COND ((< |p| 1) (|error| "unknown plex op"))
                   ((EQUAL |op| "INTSIGN")
                    (|HTMLFORM;formatIntSign| |args| (QREFELT $ 8) $))
                   (#3='T
                    (SEQ
                     (LETT |opPrec|
                           (SPADCALL (QREFELT $ 17) |p| (QREFELT $ 60)) . #2#)
                     (LETT |n| (LENGTH |args|) . #2#)
                     (COND
                      ((SPADCALL |n| 2 (QREFELT $ 55))
                       (COND
                        ((SPADCALL |n| 3 (QREFELT $ 55))
                         (EXIT
                          (|error| "wrong number of arguments for plex"))))))
                     (LETT |s|
                           (COND
                            ((OR (EQUAL |op| "SIGMA") (EQUAL |op| "SIGMA2"))
                             (SEQ (LETT |checkarg| 'T . #2#)
                                  (EXIT
                                   (SPADCALL "&#x02211;" (QREFELT $ 53)))))
                            ((OR (EQUAL |op| "PI") (EQUAL |op| "PI2"))
                             (SEQ (LETT |checkarg| 'T . #2#)
                                  (EXIT
                                   (SPADCALL "&#x0220F;" (QREFELT $ 53)))))
                            ((OR (EQUAL |op| "INTSIGN")
                                 (EQUAL |op| "INDEFINTEGRAL"))
                             (SPADCALL "&#x0222B;" (QREFELT $ 53)))
                            (#3#
                             (SPADCALL
                              (SPADCALL "formatPlex: unexpected op:" |op|
                                        (QREFELT $ 52))
                              (QREFELT $ 53))))
                           . #2#)
                     (COND
                      ((EQL |n| 2)
                       (PROGN
                        (LETT #1#
                              (|HTMLFORM;buildPlex2|
                               (|HTMLFORM;formatHtml| (|SPADfirst| |args|)
                                (QREFELT $ 8) $)
                               (|HTMLFORM;formatHtml|
                                (SPADCALL |args| 2 (QREFELT $ 57))
                                (QREFELT $ 8) $)
                               |s| $)
                              . #2#)
                        (GO #1#))))
                     (EXIT
                      (|HTMLFORM;buildPlex3|
                       (|HTMLFORM;formatHtml| (|SPADfirst| |args|)
                        (QREFELT $ 8) $)
                       (|HTMLFORM;formatHtml|
                        (SPADCALL |args| 2 (QREFELT $ 57)) (QREFELT $ 8) $)
                       |s|
                       (|HTMLFORM;formatHtml|
                        (SPADCALL |args| 3 (QREFELT $ 57)) (QREFELT $ 8) $)
                       $))))))))
          #1# (EXIT #1#)))) 

(SDEFUN |HTMLFORM;formatMatrixRow|
        ((|op| |String|) (|arg| |OutputForm|) (|prec| |Integer|)
         (|y| |Integer|) (|h| |Integer|) ($ |List| (|Tree| (|String|))))
        (SPROG
         ((|cells| (|List| (|Tree| (|String|)))) (|attrib| (|String|))
          (|x| NIL) (|w| (|Integer|)) (|args| (|List| (|OutputForm|)))
          (|l| (|List| (|OutputForm|))))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL "formatMatrixRow: "
                       (SPADCALL
                        (LIST "op=" |op| " args="
                              (|HTMLFORM;stringify| |arg| $) " prec="
                              (STRINGIMAGE |prec|))
                        (QREFELT $ 41))
                       (QREFELT $ 52)))))
          (EXIT
           (COND
            ((ATOM |arg|)
             (LIST
              (SPADCALL "formatMatrixRow does not contain row"
                        (QREFELT $ 53))))
            ('T
             (SEQ (LETT |l| |arg| . #1=(|HTMLFORM;formatMatrixRow|))
                  (LETT |op| (|HTMLFORM;stringify| (|SPADfirst| |l|) $) . #1#)
                  (LETT |args| (CDR |l|) . #1#)
                  (LETT |w| (LENGTH |args|) . #1#) (LETT |cells| NIL . #1#)
                  (SEQ (LETT |x| 1 . #1#) G190
                       (COND ((|greater_SI| |x| |w|) (GO G191)))
                       (SEQ (LETT |attrib| "td id='mat'" . #1#)
                            (COND
                             ((EQL |x| 1)
                              (LETT |attrib| "td id='matl'" . #1#)))
                            (COND
                             ((EQL |x| |w|)
                              (LETT |attrib| "td id='matr'" . #1#)))
                            (COND
                             ((EQL |y| 1)
                              (LETT |attrib| "td id='matt'" . #1#)))
                            (COND
                             ((EQL |y| |h|)
                              (LETT |attrib| "td id='matb'" . #1#)))
                            (COND
                             ((EQL |x| 1)
                              (COND
                               ((EQL |y| 1)
                                (LETT |attrib| "td id='matlt'" . #1#)))))
                            (COND
                             ((EQL |x| 1)
                              (COND
                               ((EQL |y| |h|)
                                (LETT |attrib| "td id='matlb'" . #1#)))))
                            (COND
                             ((EQL |x| |w|)
                              (COND
                               ((EQL |y| 1)
                                (LETT |attrib| "td id='matrt'" . #1#)))))
                            (COND
                             ((EQL |x| |w|)
                              (COND
                               ((EQL |y| |h|)
                                (LETT |attrib| "td id='matrb'" . #1#)))))
                            (EXIT
                             (LETT |cells|
                                   (APPEND |cells|
                                           (LIST
                                            (|HTMLFORM;newNode| |attrib|
                                             (|HTMLFORM;formatHtml|
                                              (SPADCALL |args| |x|
                                                        (QREFELT $ 57))
                                              |prec| $)
                                             $)))
                                   . #1#)))
                       (LETT |x| (|inc_SI| |x|) . #1#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |cells|)))))))) 

(SDEFUN |HTMLFORM;formatMatrixContent|
        ((|op| |String|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |List| (|Tree| (|String|))))
        (SPROG
         ((|rows| (|List| (|Tree| (|String|)))) (|y| (|Integer|))
          (#1=#:G275 NIL) (|e| NIL) (#2=#:G274 NIL))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL "formatMatrixContent: "
                       (SPADCALL
                        (LIST "op=" |op| " args="
                              (|HTMLFORM;argsToString| |args| $) " prec="
                              (STRINGIMAGE |prec|))
                        (QREFELT $ 41))
                       (QREFELT $ 52)))))
          (LETT |y| 0 . #3=(|HTMLFORM;formatMatrixContent|))
          (LETT |rows|
                (PROGN
                 (LETT #2# NIL . #3#)
                 (SEQ (LETT |e| NIL . #3#) (LETT #1# |args| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (|HTMLFORM;newNodes| "tr id='mat'"
                                (|HTMLFORM;formatMatrixRow| "ROW" |e| |prec|
                                 (LETT |y| (+ |y| 1) . #3#) (LENGTH |args|) $)
                                $)
                               #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT |rows|)))) 

(SDEFUN |HTMLFORM;formatMatrix|
        ((|args| |List| (|OutputForm|)) ($ |Tree| (|String|)))
        (SEQ
         (COND
          ((QREFELT $ 21)
           (|sayHtml|
            (SPADCALL "formatMatrix: "
                      (SPADCALL
                       (LIST "args=" (|HTMLFORM;argsToString| |args| $))
                       (QREFELT $ 41))
                      (QREFELT $ 52)))))
         (EXIT
          (|HTMLFORM;newNodes| "table border='1' id='mat'"
           (|HTMLFORM;formatMatrixContent| "MATRIX" |args| (QREFELT $ 8) $)
           $)))) 

(SDEFUN |HTMLFORM;buildColumnTable|
        ((|elements| |List| (|Tree| (|String|))) ($ |Tree| (|String|)))
        (SPROG
         ((|rows| (|List| (|Tree| (|String|)))) (#1=#:G285 NIL) (|i| NIL)
          (#2=#:G284 NIL) (|cells| (|List| (|Tree| (|String|))))
          (#3=#:G283 NIL) (|j| NIL) (#4=#:G282 NIL))
         (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildColumnTable")))
              (LETT |cells|
                    (PROGN
                     (LETT #4# NIL . #5=(|HTMLFORM;buildColumnTable|))
                     (SEQ (LETT |j| NIL . #5#) (LETT #3# |elements| . #5#) G190
                          (COND
                           ((OR (ATOM #3#)
                                (PROGN (LETT |j| (CAR #3#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS
                                   (|HTMLFORM;newNode| "td id='col'" |j| $)
                                   #4#)
                                  . #5#)))
                          (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #4#))))
                    . #5#)
              (LETT |rows|
                    (PROGN
                     (LETT #2# NIL . #5#)
                     (SEQ (LETT |i| NIL . #5#) (LETT #1# |cells| . #5#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |i| (CAR #1#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (|HTMLFORM;newNode| "tr id='col'" |i| $)
                                   #2#)
                                  . #5#)))
                          (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #5#)
              (EXIT
               (|HTMLFORM;newNodes| "table border='0' id='col'" |rows| $))))) 

(SDEFUN |HTMLFORM;buildSuperscript|
        ((|main| |Tree| (|String|)) (|super| |Tree| (|String|))
         ($ |Tree| (|String|)))
        (SPROG
         ((|rows| (|List| #1=(|Tree| (|String|)))) (|e| #1#) (|su| #1#)
          (|m| #1#))
         (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildSuperscript")))
              (EXIT
               (COND
                ((|HTMLFORM;notTable?| |super| $)
                 (|HTMLFORM;newNodes| ""
                  (LIST |main| (|HTMLFORM;newNode| "sup" |super| $)) $))
                ('T
                 (SEQ
                  (LETT |m|
                        (|HTMLFORM;newNode| "td rowspan='2' id='sup'" |main| $)
                        . #2=(|HTMLFORM;buildSuperscript|))
                  (LETT |su| (|HTMLFORM;newNode| "td id='sup'" |super| $)
                        . #2#)
                  (LETT |e|
                        (|HTMLFORM;newNode| "td id='sup'"
                         (SPADCALL "&nbsp;" (QREFELT $ 53)) $)
                        . #2#)
                  (LETT |rows|
                        (LIST
                         (|HTMLFORM;newNodes| "tr id='sup'" (LIST |m| |su|) $)
                         (|HTMLFORM;newNode| "tr id='sup'" |e| $))
                        . #2#)
                  (EXIT
                   (|HTMLFORM;newNodes| "table border='0' id='sup'" |rows|
                    $))))))))) 

(SDEFUN |HTMLFORM;buildSubscript|
        ((|main| |Tree| (|String|)) (|subsc| |Tree| (|String|))
         ($ |Tree| (|String|)))
        (SPROG
         ((|rows| (|List| #1=(|Tree| (|String|)))) (|e| #1#) (|su| #1#)
          (|m| #1#))
         (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildSubscript")))
              (EXIT
               (COND
                ((|HTMLFORM;notTable?| |subsc| $)
                 (|HTMLFORM;newNodes| ""
                  (LIST |main| (|HTMLFORM;newNode| "sub" |subsc| $)) $))
                ('T
                 (SEQ
                  (LETT |m|
                        (|HTMLFORM;newNode| "td rowspan='2' id='sub'" |main| $)
                        . #2=(|HTMLFORM;buildSubscript|))
                  (LETT |su| (|HTMLFORM;newNode| "td id='sub'" |subsc| $)
                        . #2#)
                  (LETT |e|
                        (|HTMLFORM;newNode| "td id='sub'"
                         (SPADCALL "&nbsp;" (QREFELT $ 53)) $)
                        . #2#)
                  (LETT |rows|
                        (LIST
                         (|HTMLFORM;newNodes| "tr id='sub'" (LIST |m| |e|) $)
                         (|HTMLFORM;newNode| "tr id='sub'" |su| $))
                        . #2#)
                  (EXIT
                   (|HTMLFORM;newNodes| "table border='0' id='sub'" |rows|
                    $))))))))) 

(SDEFUN |HTMLFORM;formatSub|
        ((|expr| |OutputForm|) (|args| |List| (|OutputForm|))
         (|opPrec| |Integer|) ($ |Tree| (|String|)))
        (SPROG
         ((#1=#:G302 NIL) (#2=#:G304 NIL) (|e| NIL) (#3=#:G303 NIL)
          (|op| (|String|)) (|atomE| (|List| (|OutputForm|))))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((QREFELT $ 21)
              (|sayHtml|
               (SPADCALL "formatSub: "
                         (SPADCALL
                          (LIST "expr=" (|HTMLFORM;stringify| |expr| $)
                                " args=" (|HTMLFORM;argsToString| |args| $)
                                " prec=" (STRINGIMAGE |opPrec|))
                          (QREFELT $ 41))
                         (QREFELT $ 52)))))
            (LETT |atomE| (|HTMLFORM;atomize| |expr| $)
                  . #4=(|HTMLFORM;formatSub|))
            (COND
             ((NULL |atomE|)
              (SEQ
               (COND ((QREFELT $ 21) (|sayHtml| "formatSub: expr = empty")))
               (EXIT
                (PROGN
                 (LETT #1# (SPADCALL "formatSub: expr = empty" (QREFELT $ 53))
                       . #4#)
                 (GO #1#))))))
            (LETT |op| (|HTMLFORM;stringify| (|SPADfirst| |atomE|) $) . #4#)
            (EXIT
             (COND
              ((SPADCALL |op| "SUB" (QREFELT $ 51))
               (SEQ (COND ((QREFELT $ 21) (|sayHtml| "formatSub: expr~=SUB")))
                    (EXIT (SPADCALL "formatSub: expr~=SUB" (QREFELT $ 53)))))
              ('T
               (SEQ
                (COND
                 ((< (LENGTH |args|) 2)
                  (SEQ
                   (COND
                    ((QREFELT $ 21)
                     (|sayHtml|
                      (STRCONC "formatSub: num args="
                               (STRINGIMAGE (LENGTH |args|))))))
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (SPADCALL
                            (STRCONC "formatSub: num args="
                                     (STRINGIMAGE (LENGTH |args|)))
                            (QREFELT $ 53))
                           . #4#)
                     (GO #1#))))))
                (COND
                 ((SPADCALL (LENGTH |args|) 2 (QREFELT $ 43))
                  (SEQ
                   (COND
                    ((QREFELT $ 21)
                     (|sayHtml|
                      (STRCONC "formatSub: num args="
                               (STRINGIMAGE (LENGTH |args|))))))
                   (EXIT
                    (PROGN
                     (LETT #1#
                           (|HTMLFORM;buildSubscript|
                            (|HTMLFORM;formatHtml| (|SPADfirst| |args|)
                             |opPrec| $)
                            (|HTMLFORM;newNodes| ""
                             (PROGN
                              (LETT #3# NIL . #4#)
                              (SEQ (LETT |e| NIL . #4#)
                                   (LETT #2# (CDR |args|) . #4#) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN
                                          (LETT |e| (CAR #2#) . #4#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #3#
                                           (CONS
                                            (|HTMLFORM;formatHtml| |e| |opPrec|
                                             $)
                                            #3#)
                                           . #4#)))
                                   (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                                   (EXIT (NREVERSE #3#))))
                             $)
                            $)
                           . #4#)
                     (GO #1#))))))
                (EXIT
                 (|HTMLFORM;buildSubscript|
                  (|HTMLFORM;formatHtml| (|SPADfirst| |args|) |opPrec| $)
                  (|HTMLFORM;formatHtml| (SPADCALL |args| 2 (QREFELT $ 57))
                   |opPrec| $)
                  $))))))))
          #1# (EXIT #1#)))) 

(SDEFUN |HTMLFORM;formatFunction|
        ((|op| |Tree| (|String|)) (|args| |List| (|OutputForm|))
         (|prec| |Integer|) ($ |Tree| (|String|)))
        (SEQ
         (COND
          ((QREFELT $ 21)
           (|sayHtml|
            (SPADCALL "formatFunction: "
                      (SPADCALL
                       (LIST "args=" (|HTMLFORM;argsToString| |args| $)
                             " prec=" (STRINGIMAGE |prec|))
                       (QREFELT $ 41))
                      (QREFELT $ 52)))))
         (EXIT
          (|HTMLFORM;newNodes| ""
           (LIST |op| (SPADCALL "(" (QREFELT $ 53))
                 (|HTMLFORM;formatNary| "," |args| (QREFELT $ 8) $)
                 (SPADCALL ")" (QREFELT $ 53)))
           $)))) 

(SDEFUN |HTMLFORM;formatNullary| ((|op| |String|) ($ |Tree| (|String|)))
        (SEQ
         (COND
          ((QREFELT $ 21)
           (|sayHtml|
            (SPADCALL "formatNullary: "
                      (SPADCALL (LIST "op=" |op|) (QREFELT $ 41))
                      (QREFELT $ 52)))))
         (EXIT
          (COND ((EQUAL |op| "NOTHING") (SPADCALL (QREFELT $ 61)))
                ('T
                 (SPADCALL (SPADCALL |op| "()" (QREFELT $ 52))
                           (QREFELT $ 53))))))) 

(SDEFUN |HTMLFORM;formatUnary|
        ((|op| |String|) (|arg| |OutputForm|) (|prec| |Integer|)
         ($ |Tree| (|String|)))
        (SPROG
         ((|s| (|Tree| (|String|))) (|opPrec| (|Integer|)) (|p| (|Integer|)))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL "formatUnary: "
                       (SPADCALL
                        (LIST "op=" |op| " arg=" (|HTMLFORM;stringify| |arg| $)
                              " prec=" (STRINGIMAGE |prec|))
                        (QREFELT $ 41))
                       (QREFELT $ 52)))))
          (LETT |p| (SPADCALL |op| (QREFELT $ 9) (QREFELT $ 58))
                . #1=(|HTMLFORM;formatUnary|))
          (EXIT
           (COND ((< |p| 1) (|error| "unknown unary op"))
                 (#2='T
                  (SEQ
                   (LETT |opPrec| (SPADCALL (QREFELT $ 10) |p| (QREFELT $ 60))
                         . #1#)
                   (LETT |s|
                         (|HTMLFORM;newNodes| ""
                          (LIST (SPADCALL |op| (QREFELT $ 53))
                                (|HTMLFORM;formatHtml| |arg| |opPrec| $))
                          $)
                         . #1#)
                   (EXIT
                    (COND
                     ((< |opPrec| |prec|)
                      (|HTMLFORM;newNodes| ""
                       (LIST (SPADCALL "(" (QREFELT $ 53)) |s|
                             (SPADCALL ")" (QREFELT $ 53)))
                       $))
                     (#2# |s|)))))))))) 

(SDEFUN |HTMLFORM;buildOver|
        ((|top| |Tree| (|String|)) (|bottom| |Tree| (|String|))
         ($ |Tree| (|String|)))
        (SPROG
         ((|rows| (|List| #1=(|Tree| (|String|)))) (|bottomCell| #1#)
          (|topCell| #1#))
         (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildOver")))
              (LETT |topCell| (|HTMLFORM;newNode| "td" |top| $)
                    . #2=(|HTMLFORM;buildOver|))
              (LETT |bottomCell|
                    (|HTMLFORM;newNode| "td style='border-top-style:solid'"
                     |bottom| $)
                    . #2#)
              (LETT |rows|
                    (LIST (|HTMLFORM;newNode| "tr id='col'" |topCell| $)
                          (|HTMLFORM;newNode| "tr id='col'" |bottomCell| $))
                    . #2#)
              (EXIT
               (|HTMLFORM;newNodes| "table border='0' id='col'" |rows| $))))) 

(SDEFUN |HTMLFORM;formatBinary|
        ((|op| |String|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |Tree| (|String|)))
        (SPROG
         ((|s2| (|Tree| (|String|))) (|s1| (|Tree| (|String|)))
          (|opa| (|String|)) (|la| (|List| (|OutputForm|)))
          (|opPrec| (|Integer|)) (|p| (|Integer|)))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL "formatBinary: "
                       (SPADCALL
                        (LIST "op=" |op| " args="
                              (|HTMLFORM;argsToString| |args| $) " prec="
                              (STRINGIMAGE |prec|))
                        (QREFELT $ 41))
                       (QREFELT $ 52)))))
          (LETT |p| (SPADCALL |op| (QREFELT $ 11) (QREFELT $ 58))
                . #1=(|HTMLFORM;formatBinary|))
          (EXIT
           (COND ((< |p| 1) (|error| "unknown binary op"))
                 (#2='T
                  (SEQ
                   (LETT |opPrec| (SPADCALL (QREFELT $ 12) |p| (QREFELT $ 60))
                         . #1#)
                   (COND
                    ((ATOM (|SPADfirst| |args|))
                     (LETT |opa| (|HTMLFORM;stringify| (|SPADfirst| |args|) $)
                           . #1#))
                    (#2#
                     (SEQ (LETT |la| (|SPADfirst| |args|) . #1#)
                          (EXIT
                           (LETT |opa|
                                 (|HTMLFORM;stringify| (|SPADfirst| |la|) $)
                                 . #1#)))))
                   (COND
                    ((OR
                      (OR (OR (EQUAL |opa| "SIGMA") (EQUAL |opa| "SIGMA2"))
                          (EQUAL |opa| "PI"))
                      (EQUAL |opa| "PI2"))
                     (COND
                      ((EQUAL |op| "^")
                       (LETT |s1|
                             (|HTMLFORM;newNodes| ""
                              (LIST (SPADCALL "(" (QREFELT $ 53))
                                    (|HTMLFORM;formatHtml| (|SPADfirst| |args|)
                                     |opPrec| $)
                                    (SPADCALL ")" (QREFELT $ 53)))
                              $)
                             . #1#))
                      (#2#
                       (LETT |s1|
                             (|HTMLFORM;formatHtml| (|SPADfirst| |args|)
                              |opPrec| $)
                             . #1#))))
                    (#2#
                     (LETT |s1|
                           (|HTMLFORM;formatHtml| (|SPADfirst| |args|) |opPrec|
                            $)
                           . #1#)))
                   (LETT |s2|
                         (|HTMLFORM;formatHtml| (|SPADfirst| (CDR |args|))
                          |opPrec| $)
                         . #1#)
                   (EXIT
                    (COND
                     ((EQUAL |op| "|")
                      (|HTMLFORM;newNodes| ""
                       (LIST |s1| (SPADCALL |op| (QREFELT $ 53)) |s2|) $))
                     ((EQUAL |op| "^")
                      (|HTMLFORM;buildSuperscript| |s1| |s2| $))
                     ((EQUAL |op| "/")
                      (|HTMLFORM;newNodes| ""
                       (LIST |s1| (SPADCALL |op| (QREFELT $ 53)) |s2|) $))
                     ((EQUAL |op| "OVER") (|HTMLFORM;buildOver| |s1| |s2| $))
                     ((EQUAL |op| "+->")
                      (|HTMLFORM;newNodes| ""
                       (LIST |s1| (SPADCALL "|&mdash;&rsaquo;" (QREFELT $ 53))
                             |s2|)
                       $))
                     (#2#
                      (|HTMLFORM;newNodes| ""
                       (LIST |s1| (SPADCALL |op| (QREFELT $ 53)) |s2|)
                       $))))))))))) 

(SDEFUN |HTMLFORM;buildZag|
        ((|top| |Tree| (|String|)) (|lowerLeft| |Tree| (|String|))
         (|lowerRight| |Tree| (|String|)) ($ |Tree| (|String|)))
        (SPROG
         ((|row2| #1=(|Tree| (|String|))) (|row1| #1#)
          (|cellLowerRight| #2=(|Tree| (|String|))) (|cellLowerLeft| #1#)
          (|cellTop| #2#))
         (SEQ (COND ((QREFELT $ 21) (|sayHtml| "buildZag")))
              (LETT |cellTop|
                    (|HTMLFORM;newNode|
                     "td colspan='2' id='zag' style='border-bottom-style:solid'"
                     |top| $)
                    . #3=(|HTMLFORM;buildZag|))
              (LETT |cellLowerLeft|
                    (|HTMLFORM;newNodes| "td id='zag'"
                     (LIST |lowerLeft| (SPADCALL "+" (QREFELT $ 53))) $)
                    . #3#)
              (LETT |cellLowerRight|
                    (|HTMLFORM;newNode| "td id='zag'" |lowerRight| $) . #3#)
              (LETT |row1|
                    (|HTMLFORM;newNodes| "tr id='zag'" (LIST |cellTop|) $)
                    . #3#)
              (LETT |row2|
                    (|HTMLFORM;newNodes| "tr id='zag'"
                     (LIST |cellLowerLeft| |cellLowerRight|) $)
                    . #3#)
              (EXIT
               (|HTMLFORM;newNodes| "table border='0' id='zag'"
                (LIST |row1| |row2|) $))))) 

(SDEFUN |HTMLFORM;formatZag|
        ((|args| |List| (|OutputForm|)) (|nestLevel| |Integer|)
         ($ |Tree| (|String|)))
        (SPROG
         ((|op| (|String|)) (|fontAttrib| (|String|))
          (|tmpZag| (|List| (|OutputForm|))))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL "formatZag: "
                       (SPADCALL
                        (LIST "args=" (|HTMLFORM;argsToString| |args| $))
                        (QREFELT $ 41))
                       (QREFELT $ 52)))))
          (LETT |tmpZag| (|SPADfirst| |args|) . #1=(|HTMLFORM;formatZag|))
          (LETT |fontAttrib|
                (COND ((< |nestLevel| 2) "span style='font-size:16px'")
                      ((EQL |nestLevel| 2) "span style='font-size:14px'")
                      ((EQL |nestLevel| 3) "span style='font-size:12px'")
                      ((EQL |nestLevel| 4) "span style='font-size:10px'")
                      (#2='T "span style='font-size:9px'"))
                . #1#)
          (EXIT
           (COND
            ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 63))
             (|HTMLFORM;newNode| |fontAttrib|
              (|HTMLFORM;buildZag|
               (|HTMLFORM;formatHtml| (|SPADfirst| (CDR |tmpZag|))
                (QREFELT $ 8) $)
               (|HTMLFORM;formatHtml| (|SPADfirst| (CDR (CDR |tmpZag|)))
                (QREFELT $ 8) $)
               (|HTMLFORM;formatZag| (CDR |args|) (+ |nestLevel| 1) $) $)
              $))
            ((SPADCALL (|SPADfirst| |args|) "..." (QREFELT $ 64))
             (SPADCALL "&#x2026;" (QREFELT $ 53)))
            (#2#
             (SEQ
              (LETT |op| (|HTMLFORM;stringify| (|SPADfirst| |args|) $) . #1#)
              (EXIT
               (COND
                ((SPADCALL (SPADCALL "ZAG" |op| 1 (QREFELT $ 56)) 0
                           (QREFELT $ 43))
                 (|HTMLFORM;newNode| |fontAttrib|
                  (|HTMLFORM;buildOver|
                   (|HTMLFORM;formatHtml| (|SPADfirst| (CDR |tmpZag|))
                    (QREFELT $ 8) $)
                   (|HTMLFORM;formatHtml| (|SPADfirst| (CDR (CDR |tmpZag|)))
                    (QREFELT $ 8) $)
                   $)
                  $))
                (#2#
                 (SPADCALL
                  (SPADCALL
                   "formatZag: Last argument in ZAG construct unknown operator: "
                   |op| (QREFELT $ 52))
                  (QREFELT $ 53)))))))))))) 

(SDEFUN |HTMLFORM;neg?| ((|arg| |OutputForm|) ($ |Boolean|))
        (SPROG ((|op| (|String|)) (|l| (|List| (|OutputForm|))))
               (SEQ
                (COND
                 ((QREFELT $ 21)
                  (|sayHtml|
                   (SPADCALL "neg?: "
                             (SPADCALL
                              (LIST "arg="
                                    (|HTMLFORM;argsToString| (LIST |arg|) $))
                              (QREFELT $ 41))
                             (QREFELT $ 52)))))
                (EXIT
                 (COND ((ATOM |arg|) 'NIL)
                       (#1='T
                        (SEQ (LETT |l| |arg| . #2=(|HTMLFORM;neg?|))
                             (LETT |op|
                                   (|HTMLFORM;stringify| (|SPADfirst| |l|) $)
                                   . #2#)
                             (EXIT
                              (COND ((EQUAL |op| "-") 'T) (#1# 'NIL)))))))))) 

(SDEFUN |HTMLFORM;formatNary|
        ((|op| |String|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |Tree| (|String|)))
        (SEQ
         (COND
          ((QREFELT $ 21)
           (|sayHtml|
            (SPADCALL "formatNary: "
                      (SPADCALL
                       (LIST "op=" |op| " args="
                             (|HTMLFORM;argsToString| |args| $) " prec="
                             (STRINGIMAGE |prec|))
                       (QREFELT $ 41))
                      (QREFELT $ 52)))))
         (EXIT (|HTMLFORM;formatNaryNoGroup| |op| |args| |prec| $)))) 

(SDEFUN |HTMLFORM;formatNaryNoGroup|
        ((|op| |String|) (|args| |List| (|OutputForm|)) (|prec| |Integer|)
         ($ |Tree| (|String|)))
        (SPROG
         ((|tags| (|List| (|Tree| (|String|)))) (#1=#:G341 NIL) (|a| NIL)
          (|count| (|Integer|)) (|opPrec| (|Integer|))
          (|l| (|Tree| (|String|))) (|tmpS| (|String|)) (|p| (|Integer|))
          (|checkargs| (|Boolean|)))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL "formatNaryNoGroup: "
                       (SPADCALL
                        (LIST "op=" |op| " args="
                              (|HTMLFORM;argsToString| |args| $) " prec="
                              (STRINGIMAGE |prec|))
                        (QREFELT $ 41))
                       (QREFELT $ 52)))))
          (LETT |checkargs| 'NIL . #2=(|HTMLFORM;formatNaryNoGroup|))
          (EXIT
           (COND ((NULL |args|) (SPADCALL (QREFELT $ 61)))
                 (#3='T
                  (SEQ
                   (LETT |p| (SPADCALL |op| (QREFELT $ 13) (QREFELT $ 58))
                         . #2#)
                   (EXIT
                    (COND ((< |p| 1) (|error| "unknown nary op"))
                          (#3#
                           (SEQ
                            (COND
                             ((SPADCALL (LENGTH |args|) 1 (QREFELT $ 43))
                              (COND
                               ((SPADCALL
                                 (SPADCALL "ZAG"
                                           (|HTMLFORM;stringify|
                                            (|SPADfirst| (CDR |args|)) $)
                                           1 (QREFELT $ 56))
                                 0 (QREFELT $ 43))
                                (EXIT
                                 (SEQ
                                  (LETT |tmpS|
                                        (|HTMLFORM;stringify|
                                         (|SPADfirst| |args|) $)
                                        . #2#)
                                  (EXIT
                                   (COND
                                    ((SPADCALL
                                      (SPADCALL "ZAG" |tmpS| 1 (QREFELT $ 56))
                                      0 (QREFELT $ 43))
                                     (|HTMLFORM;formatZag| |args| 1 $))
                                    (#3#
                                     (|HTMLFORM;newNodes| ""
                                      (LIST
                                       (|HTMLFORM;formatHtml|
                                        (|SPADfirst| |args|) (QREFELT $ 8) $)
                                       (SPADCALL "+" (QREFELT $ 53))
                                       (|HTMLFORM;formatZag| (CDR |args|) 1 $))
                                      $))))))))))
                            (LETT |l| (SPADCALL (QREFELT $ 61)) . #2#)
                            (LETT |opPrec|
                                  (SPADCALL (QREFELT $ 14) |p| (QREFELT $ 60))
                                  . #2#)
                            (LETT |count| 1 . #2#)
                            (COND
                             ((< |opPrec| |prec|)
                              (LETT |tags|
                                    (LIST (SPADCALL "(" (QREFELT $ 53))
                                          (|HTMLFORM;formatHtml|
                                           (SPADCALL |args| 1 (QREFELT $ 57))
                                           |opPrec| $))
                                    . #2#)))
                            (COND
                             ((>= |opPrec| |prec|)
                              (LETT |tags|
                                    (LIST
                                     (|HTMLFORM;formatHtml|
                                      (SPADCALL |args| 1 (QREFELT $ 57))
                                      |opPrec| $))
                                    . #2#)))
                            (SEQ (LETT |a| NIL . #2#)
                                 (LETT #1# (CDR |args|) . #2#) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |a| (CAR #1#) . #2#) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (COND
                                   ((OR (SPADCALL |op| "+" (QREFELT $ 51))
                                        (NULL (|HTMLFORM;neg?| |a| $)))
                                    (LETT |tags|
                                          (APPEND |tags|
                                                  (LIST
                                                   (SPADCALL |op|
                                                             (QREFELT $ 53))))
                                          . #2#)))
                                  (EXIT
                                   (LETT |tags|
                                         (APPEND |tags|
                                                 (LIST
                                                  (|HTMLFORM;formatHtml| |a|
                                                   |opPrec| $)))
                                         . #2#)))
                                 (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                                 (EXIT NIL))
                            (COND
                             ((< |opPrec| |prec|)
                              (LETT |tags|
                                    (APPEND |tags|
                                            (LIST
                                             (SPADCALL ")" (QREFELT $ 53))))
                                    . #2#)))
                            (EXIT (|HTMLFORM;newNodes| "" |tags| $))))))))))))) 

(SDEFUN |HTMLFORM;formatHtml|
        ((|arg| |OutputForm|) (|prec| |Integer|) ($ . #1=(|Tree| (|String|))))
        (SPROG
         ((|op1| #1#) (|nargs| (|Integer|)) (|args| (|List| (|OutputForm|)))
          (|op| #2=(|String|)) (|l| (|List| (|OutputForm|))) (|i| (|Integer|))
          (|str| #2#) (|intSplitLen| (|Integer|)))
         (SEQ
          (COND
           ((QREFELT $ 21)
            (|sayHtml|
             (SPADCALL "formatHtml: "
                       (SPADCALL
                        (LIST "arg=" (|HTMLFORM;argsToString| (LIST |arg|) $)
                              " prec=" (STRINGIMAGE |prec|))
                        (QREFELT $ 41))
                       (QREFELT $ 52)))))
          (LETT |intSplitLen| 20 . #3=(|HTMLFORM;formatHtml|))
          (EXIT
           (COND
            ((ATOM |arg|)
             (SEQ
              (COND
               ((QREFELT $ 21)
                (|sayHtml|
                 (SPADCALL "formatHtml atom: "
                           (SPADCALL
                            (LIST "expr=" (|HTMLFORM;stringify| |arg| $)
                                  " prec=" (STRINGIMAGE |prec|))
                            (QREFELT $ 41))
                           (QREFELT $ 52)))))
              (LETT |str| (|HTMLFORM;stringify| |arg| $) . #3#)
              (LETT |i| (SPADCALL |str| (QREFELT $ 19) (QREFELT $ 58)) . #3#)
              (EXIT
               (COND
                ((SPADCALL |i| 0 (QREFELT $ 43))
                 (SPADCALL (SPADCALL (QREFELT $ 20) |i| (QREFELT $ 50))
                           (QREFELT $ 53)))
                (#4='T (SPADCALL |str| (QREFELT $ 53)))))))
            (#4#
             (SEQ (LETT |l| |arg| . #3#)
                  (EXIT
                   (COND ((NULL |l|) (SPADCALL (QREFELT $ 6) (QREFELT $ 53)))
                         (#4#
                          (SEQ
                           (LETT |op|
                                 (|HTMLFORM;stringify| (|SPADfirst| |l|) $)
                                 . #3#)
                           (LETT |args| (CDR |l|) . #3#)
                           (LETT |nargs| (LENGTH |args|) . #3#)
                           (EXIT
                            (COND
                             ((SPADCALL
                               (SPADCALL "SUPERSUB" |op| 1 (QREFELT $ 56)) 0
                               (QREFELT $ 43))
                              (|HTMLFORM;formatSuperSub| (|SPADfirst| |l|)
                               |args| (QREFELT $ 8) $))
                             ((SPADCALL (SPADCALL "SUB" |op| 1 (QREFELT $ 56))
                                        0 (QREFELT $ 43))
                              (|HTMLFORM;formatSub| (|SPADfirst| |l|) |args|
                               (QREFELT $ 8) $))
                             ((SPADCALL |op| (QREFELT $ 18) (QREFELT $ 65))
                              (|HTMLFORM;formatSpecial| |op| |args| |prec| $))
                             ((SPADCALL |op| (QREFELT $ 16) (QREFELT $ 65))
                              (|HTMLFORM;formatPlex| |op| |args| |prec| $))
                             ((EQL 0 |nargs|)
                              (|HTMLFORM;formatNullary| |op| $))
                             (#4#
                              (SEQ
                               (COND
                                ((EQL 1 |nargs|)
                                 (COND
                                  ((SPADCALL |op| (QREFELT $ 9) (QREFELT $ 65))
                                   (EXIT
                                    (|HTMLFORM;formatUnary| |op|
                                     (|SPADfirst| |args|) |prec| $))))))
                               (COND
                                ((EQL 2 |nargs|)
                                 (COND
                                  ((SPADCALL |op| (QREFELT $ 11)
                                             (QREFELT $ 65))
                                   (EXIT
                                    (|HTMLFORM;formatBinary| |op| |args| |prec|
                                     $))))))
                               (EXIT
                                (COND
                                 ((SPADCALL |op| (QREFELT $ 15) (QREFELT $ 65))
                                  (|HTMLFORM;formatNaryNoGroup| |op| |args|
                                   |prec| $))
                                 ((SPADCALL |op| (QREFELT $ 13) (QREFELT $ 65))
                                  (|HTMLFORM;formatNary| |op| |args| |prec| $))
                                 (#4#
                                  (SEQ
                                   (LETT |op1|
                                         (|HTMLFORM;formatHtml|
                                          (|SPADfirst| |l|) (QREFELT $ 8) $)
                                         . #3#)
                                   (EXIT
                                    (|HTMLFORM;formatFunction| |op1| |args|
                                     |prec| $))))))))))))))))))))) 

(DECLAIM (NOTINLINE |HTMLFormat;|)) 

(DEFUN |HTMLFormat| ()
  (SPROG NIL
         (PROG (#1=#:G356)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|HTMLFormat|)
                    . #2=(|HTMLFormat|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|HTMLFormat|
                             (LIST (CONS NIL (CONS 1 (|HTMLFormat;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|HTMLFormat|)))))))))) 

(DEFUN |HTMLFormat;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|HTMLFormat|) . #1=(|HTMLFormat|))
          (LETT $ (GETREFV 68) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|HTMLFormat| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 " \\  ")
          (QSETREFV $ 7 1000000)
          (QSETREFV $ 8 0)
          (QSETREFV $ 9 (LIST #2="-"))
          (QSETREFV $ 10 '(700))
          (QSETREFV $ 11 (LIST "+->" "|" "^" "/" "<" ">" "=" "OVER"))
          (QSETREFV $ 12 (LIST 0 0 900 700 400 400 400 700))
          (QSETREFV $ 13
                    (LIST #2# "+" "*" (QREFELT $ 6) "," ";" " " #3="ROW" ""
                          " \\cr " #4="&" "/\\" "\\/"))
          (QSETREFV $ 14 (LIST 700 700 800 800 110 110 0 0 0 0 0 600 600))
          (QSETREFV $ 15 (LIST #3# #4#))
          (QSETREFV $ 16
                    (LIST "SIGMA" "SIGMA2" "PI" "PI2" "INTSIGN"
                          "INDEFINTEGRAL"))
          (QSETREFV $ 17 '(700 800 700 800 700 700))
          (QSETREFV $ 18
                    (LIST "MATRIX" "BRACKET" "BRACE" "CONCATB" "VCONCAT"
                          "AGGLST" "CONCAT" "OVERBAR" "ROOT" "SUB" "TAG"
                          "SUPERSUB" "ZAG" "AGGSET" "SC" "PAREN" "SEGMENT"
                          "QUOTE" "theMap" "SLASH"))
          (QSETREFV $ 19
                    (LIST #5="cos" #6="cot" #7="csc" #8="log" #9="sec"
                          #10="sin" #11="tan" #12="cosh" #13="coth" #14="csch"
                          #15="sech" #16="sinh" #17="tanh" "acos" "asin" "atan"
                          #18="erf" "..." #19="$" "infinity" "Gamma" "%pi" "%e"
                          "%i"))
          (QSETREFV $ 20
                    (LIST #5# #6# #7# #8# #9# #10# #11# #12# #13# #14# #15#
                          #16# #17# "arccos" "arcsin" "arctan" #18# "&#x2026;"
                          #19# "&#x221E;" "&#x0413;" "&#x003C0;" "&#x02147;"
                          "&#x02148;"))
          (QSETREFV $ 21 NIL)
          $))) 

(MAKEPROP '|HTMLFormat| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|blank| '|maxPrec| '|minPrec|
              '|unaryOps| '|unaryPrecs| '|binaryOps| '|binaryPrecs| '|naryOps|
              '|naryPrecs| '|naryNGOps| '|plexOps| '|plexPrecs| '|specialOps|
              '|specialStrings| '|specialStringsInHTML| '|debug| (|String|)
              (|OutputForm|) |HTMLFORM;coerce;OfS;1| |HTMLFORM;coerceS;OfS;2|
              |HTMLFORM;coerceL;OfS;3| (|Void|) (0 . |void|)
              |HTMLFORM;display;SV;4| (|List| $) (|Tree| 22) (4 . |tree|)
              (10 . |setvalue!|) (|Boolean|) (16 . |empty?|) (21 . |leaf?|)
              (26 . |value|) (31 . |prefix?|) (37 . |children|)
              |HTMLFORM;exprex;OfS;9| (42 . |concat|) (|Integer|) (47 . >)
              (|List| 23) (53 . |list|) (|Character|) (58 . |position|)
              (65 . |split|) (|List| 22) (71 . |elt|) (77 . ~=) (83 . |elt|)
              (89 . |tree|) (94 . |second|) (99 . ~=) (105 . |position|)
              (112 . |elt|) (118 . |position|) (|List| 42) (124 . |elt|)
              (130 . |empty|) (|NonNegativeInteger|) (134 . >) (140 . =)
              (146 . |member?|) (|SingleInteger|) (|HashState|))
           '#(~= 152 |latex| 158 |hashUpdate!| 163 |hash| 169 |exprex| 174
              |display| 179 |coerceS| 184 |coerceL| 189 |coerce| 194 = 204)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 23))
                        (|makeByteWordVec2| 67
                                            '(0 27 0 28 2 31 0 22 30 32 2 31 22
                                              0 22 33 1 31 34 0 35 1 31 34 0 36
                                              1 31 22 0 37 2 22 34 0 0 38 1 31
                                              30 0 39 1 22 0 30 41 2 42 34 0 0
                                              43 1 44 0 23 45 3 22 42 46 0 42
                                              47 2 22 30 0 46 48 2 49 22 0 42
                                              50 2 22 34 0 0 51 2 22 0 0 0 52 1
                                              31 0 22 53 1 44 23 0 54 2 42 34 0
                                              0 55 3 22 42 0 0 42 56 2 44 23 0
                                              42 57 2 49 42 22 0 58 2 59 42 0
                                              42 60 0 31 0 61 2 62 34 0 0 63 2
                                              23 34 0 0 64 2 49 34 22 0 65 2 0
                                              34 0 0 1 1 0 22 0 1 2 0 67 67 0 1
                                              1 0 66 0 1 1 0 22 23 40 1 0 27 22
                                              29 1 0 22 23 25 1 0 22 23 26 1 0
                                              22 23 24 1 0 23 0 1 2 0 34 0 0
                                              1)))))
           '|lookupComplete|)) 

(MAKEPROP '|HTMLFormat| 'NILADIC T) 
