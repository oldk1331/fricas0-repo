
(SDEFUN |OUTFORM;cons_form| ((|x| $) (|l| |List| $) ($ $))
        (SPADCALL |x| |l| (QREFELT $ 7))) 

(PUT '|OUTFORM;print;$V;2| '|SPADreplace| '|mathprint|) 

(SDEFUN |OUTFORM;print;$V;2| ((|x| $) ($ |Void|)) (|mathprint| |x|)) 

(SDEFUN |OUTFORM;message;S$;3| ((|s| |String|) ($ $))
        (COND ((SPADCALL |s| (QREFELT $ 13)) (SPADCALL (QREFELT $ 14)))
              ('T |s|))) 

(SDEFUN |OUTFORM;messagePrint;SV;4| ((|s| |String|) ($ |Void|))
        (SPADCALL (SPADCALL |s| (QREFELT $ 15)) (QREFELT $ 10))) 

(PUT '|OUTFORM;=;2$B;5| '|SPADreplace| 'EQUAL) 

(SDEFUN |OUTFORM;=;2$B;5| ((|a| $) (|b| $) ($ |Boolean|)) (EQUAL |a| |b|)) 

(SDEFUN |OUTFORM;=;3$;6| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '= $) |a| |b|) (QREFELT $ 19))) 

(PUT '|OUTFORM;coerce;2$;7| '|SPADreplace| '(XLAM (|a|) |a|)) 

(SDEFUN |OUTFORM;coerce;2$;7| ((|a| $) ($ |OutputForm|)) |a|) 

(PUT '|OUTFORM;outputForm;I$;8| '|SPADreplace| '(XLAM (|n|) |n|)) 

(SDEFUN |OUTFORM;outputForm;I$;8| ((|n| |Integer|) ($ $)) |n|) 

(PUT '|OUTFORM;outputForm;S$;9| '|SPADreplace| '(XLAM (|e|) |e|)) 

(SDEFUN |OUTFORM;outputForm;S$;9| ((|e| |Symbol|) ($ $)) |e|) 

(PUT '|OUTFORM;sform| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |OUTFORM;sform| ((|s| |String|) ($ $)) |s|) 

(PUT '|OUTFORM;eform| '|SPADreplace| '(XLAM (|e|) |e|)) 

(SDEFUN |OUTFORM;eform| ((|e| |Symbol|) ($ $)) |e|) 

(PUT '|OUTFORM;iform| '|SPADreplace| '(XLAM (|n|) |n|)) 

(SDEFUN |OUTFORM;iform| ((|n| |Integer|) ($ $)) |n|) 

(SDEFUN |OUTFORM;outputForm;S$;13| ((|s| |String|) ($ $))
        (|OUTFORM;sform|
         (SPADCALL (SPADCALL (QREFELT $ 28))
                   (SPADCALL |s| (SPADCALL (QREFELT $ 28)) (QREFELT $ 29))
                   (QREFELT $ 30))
         $)) 

(PUT '|OUTFORM;width| '|SPADreplace| '|outformWidth|) 

(SDEFUN |OUTFORM;width| ((|a| $) ($ |Integer|)) (|outformWidth| |a|)) 

(PUT '|OUTFORM;width0| '|SPADreplace| '(XLAM NIL $LINELENGTH)) 

(SDEFUN |OUTFORM;width0| (($ |Integer|)) $LINELENGTH) 

(SDEFUN |OUTFORM;center;$I$;16| ((|a| $) (|w| |Integer|) ($ $))
        (SPADCALL
         (SPADCALL (QUOTIENT2 (- |w| (|OUTFORM;width| |a| $)) 2)
                   (QREFELT $ 32))
         |a| (QREFELT $ 33))) 

(SDEFUN |OUTFORM;left;$I$;17| ((|a| $) (|w| |Integer|) ($ $))
        (SPADCALL |a| (SPADCALL (- |w| (|OUTFORM;width| |a| $)) (QREFELT $ 32))
                  (QREFELT $ 33))) 

(SDEFUN |OUTFORM;right;$I$;18| ((|a| $) (|w| |Integer|) ($ $))
        (SPADCALL (SPADCALL (- |w| (|OUTFORM;width| |a| $)) (QREFELT $ 32)) |a|
                  (QREFELT $ 33))) 

(SDEFUN |OUTFORM;center;2$;19| ((|a| $) ($ $))
        (SPADCALL |a| (|OUTFORM;width0| $) (QREFELT $ 34))) 

(SDEFUN |OUTFORM;left;2$;20| ((|a| $) ($ $))
        (SPADCALL |a| (|OUTFORM;width0| $) (QREFELT $ 35))) 

(SDEFUN |OUTFORM;right;2$;21| ((|a| $) ($ $))
        (SPADCALL |a| (|OUTFORM;width0| $) (QREFELT $ 36))) 

(SDEFUN |OUTFORM;vspace;I$;22| ((|n| |Integer|) ($ $))
        (COND ((EQL |n| 0) (SPADCALL (QREFELT $ 14)))
              ('T
               (SPADCALL (|OUTFORM;sform| " " $)
                         (SPADCALL (- |n| 1) (QREFELT $ 40)) (QREFELT $ 41))))) 

(SDEFUN |OUTFORM;hspace;I$;23| ((|n| |Integer|) ($ $))
        (COND ((EQL |n| 0) (SPADCALL (QREFELT $ 14)))
              ('T (|OUTFORM;sform| (|fillerSpaces| |n| " ") $)))) 

(SDEFUN |OUTFORM;rspace;2I$;24| ((|n| |Integer|) (|m| |Integer|) ($ $))
        (COND ((OR (EQL |n| 0) (EQL |m| 0)) (SPADCALL (QREFELT $ 14)))
              ('T
               (SPADCALL (SPADCALL |n| (QREFELT $ 32))
                         (SPADCALL |n| (- |m| 1) (QREFELT $ 42))
                         (QREFELT $ 41))))) 

(SDEFUN |OUTFORM;matrix;L$;25| ((|ll| |List| (|List| $)) ($ $))
        (SPROG ((|lv| (|List| $)) (#1=#:G1647 NIL) (|l| NIL) (#2=#:G1646 NIL))
               (SEQ
                (COND ((NULL |ll|) (SPADCALL NIL (QREFELT $ 43)))
                      ('T
                       (SEQ
                        (LETT |lv|
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |l| NIL) (LETT #1# |ll|) G190
                                    (COND
                                     ((OR (ATOM #1#)
                                          (PROGN (LETT |l| (CAR #1#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (|OUTFORM;cons_form|
                                              (|OUTFORM;eform| 'ROW $) |l| $)
                                             #2#))))
                                    (LETT #1# (CDR #1#)) (GO G190) G191
                                    (EXIT (NREVERSE #2#)))))
                        (EXIT
                         (|OUTFORM;cons_form| (|OUTFORM;eform| 'MATRIX $)
                          (SPADCALL (|OUTFORM;eform| 'NIL $) |lv|
                                    (QREFELT $ 7))
                          $)))))))) 

(SDEFUN |OUTFORM;pile;L$;26| ((|l| |List| $) ($ $))
        (|OUTFORM;cons_form| (|OUTFORM;eform| 'SC $) |l| $)) 

(SDEFUN |OUTFORM;commaSeparate;L$;27| ((|l| |List| $) ($ $))
        (|OUTFORM;cons_form| (|OUTFORM;eform| 'AGGLST $) |l| $)) 

(SDEFUN |OUTFORM;semicolonSeparate;L$;28| ((|l| |List| $) ($ $))
        (|OUTFORM;cons_form| (|OUTFORM;eform| 'AGGSET $) |l| $)) 

(SDEFUN |OUTFORM;blankSeparate;L$;29| ((|l| |List| $) ($ $))
        (SPROG
         ((|l1| (|List| $)) (|l2| (|List| $)) (|uo| (|OutputForm|))
          (#1=#:G1656 NIL) (|u| NIL) (|c| ($)))
         (SEQ (LETT |c| (|OUTFORM;eform| 'CONCATB $)) (LETT |l1| NIL)
              (SEQ (LETT |u| NIL) (LETT #1# (SPADCALL |l| (QREFELT $ 49))) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |uo| |u|)
                        (EXIT
                         (COND
                          ((SPADCALL |uo| 'CONCATB (QREFELT $ 51))
                           (SEQ (LETT |l2| (SPADCALL |uo| (QREFELT $ 53)))
                                (EXIT
                                 (LETT |l1|
                                       (SPADCALL |l2| |l1| (QREFELT $ 54))))))
                          ('T (LETT |l1| (SPADCALL |u| |l1| (QREFELT $ 7)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (|OUTFORM;cons_form| |c| |l1| $))))) 

(SDEFUN |OUTFORM;brace;2$;30| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'BRACE $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;brace;L$;31| ((|l| |List| $) ($ $))
        (SPADCALL (SPADCALL |l| (QREFELT $ 47)) (QREFELT $ 56))) 

(SDEFUN |OUTFORM;bracket;2$;32| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'BRACKET $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;bracket;L$;33| ((|l| |List| $) ($ $))
        (SPADCALL (SPADCALL |l| (QREFELT $ 47)) (QREFELT $ 58))) 

(SDEFUN |OUTFORM;paren;2$;34| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PAREN $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;paren;L$;35| ((|l| |List| $) ($ $))
        (SPADCALL (SPADCALL |l| (QREFELT $ 47)) (QREFELT $ 59))) 

(SDEFUN |OUTFORM;sub;3$;36| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SUB $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;super;3$;37| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'SUPERSUB $) |a| (|OUTFORM;sform| " " $) |b|)
         (QREFELT $ 19))) 

(SDEFUN |OUTFORM;presub;3$;38| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'SUPERSUB $) |a| (|OUTFORM;sform| " " $)
               (|OUTFORM;sform| " " $) (|OUTFORM;sform| " " $) |b|)
         (QREFELT $ 19))) 

(SDEFUN |OUTFORM;presuper;3$;39| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'SUPERSUB $) |a| (|OUTFORM;sform| " " $)
               (|OUTFORM;sform| " " $) |b|)
         (QREFELT $ 19))) 

(SDEFUN |OUTFORM;scripts;$L$;40| ((|a| $) (|l| |List| $) ($ $))
        (COND ((SPADCALL |l| (QREFELT $ 65)) |a|)
              ((SPADCALL (SPADCALL |l| (QREFELT $ 66)) (QREFELT $ 65))
               (SPADCALL |a| (SPADCALL |l| (QREFELT $ 67)) (QREFELT $ 61)))
              ('T
               (|OUTFORM;cons_form| (|OUTFORM;eform| 'SUPERSUB $)
                (SPADCALL |a| |l| (QREFELT $ 7)) $)))) 

(SDEFUN |OUTFORM;supersub;$L$;41| ((|a| $) (|l| |List| $) ($ $))
        (SEQ
         (COND
          ((ODDP (SPADCALL |l| (QREFELT $ 70)))
           (LETT |l|
                 (SPADCALL |l| (LIST (SPADCALL (QREFELT $ 14)))
                           (QREFELT $ 71)))))
         (EXIT
          (|OUTFORM;cons_form| (|OUTFORM;eform| 'ALTSUPERSUB $)
           (SPADCALL |a| |l| (QREFELT $ 7)) $)))) 

(SDEFUN |OUTFORM;hconcat;3$;42| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'CONCAT $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;hconcat;L$;43| ((|l| |List| $) ($ $))
        (|OUTFORM;cons_form| (|OUTFORM;eform| 'CONCAT $) |l| $)) 

(SDEFUN |OUTFORM;vconcat;3$;44| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'VCONCAT $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;vconcat;L$;45| ((|l| |List| $) ($ $))
        (|OUTFORM;cons_form| (|OUTFORM;eform| 'VCONCAT $) |l| $)) 

(SDEFUN |OUTFORM;~=;3$;46| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '~= $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;<;3$;47| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '< $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;>;3$;48| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '> $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;<=;3$;49| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '<= $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;>=;3$;50| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '>= $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;+;3$;51| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '+ $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;-;3$;52| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '- $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;-;2$;53| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '- $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;*;3$;54| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '* $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;/;3$;55| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '/ $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;^;3$;56| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '^ $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;rem;3$;57| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|rem| $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;quo;3$;58| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|quo| $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;exquo;3$;59| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|exquo| $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;and;3$;60| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|and| $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;or;3$;61| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|or| $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;not;2$;62| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|not| $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;SEGMENT;3$;63| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SEGMENT $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;SEGMENT;2$;64| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SEGMENT $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;binomial;3$;65| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'BINOMIAL $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;empty;$;66| (($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'NOTHING $)) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;infix?;$B;67| ((|a| $) ($ |Boolean|))
        (SPROG ((|e| ($)) (#1=#:G1702 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |e|
                        (COND ((IDENTP |a|) |a|) ((STRINGP |a|) (INTERN |a|))
                              (#2='T (PROGN (LETT #1# NIL) (GO #3=#:G1701)))))
                  (EXIT (COND ((GET |e| 'INFIXOP) 'T) (#2# NIL)))))
                #3# (EXIT #1#)))) 

(SDEFUN |OUTFORM;elt;$L$;68| ((|a| $) (|l| |List| $) ($ $))
        (|OUTFORM;cons_form| |a| |l| $)) 

(SDEFUN |OUTFORM;prefix;$L$;69| ((|a| $) (|l| |List| $) ($ $))
        (COND
         ((NULL (SPADCALL |a| (QREFELT $ 95))) (|OUTFORM;cons_form| |a| |l| $))
         ('T
          (SPADCALL |a| (SPADCALL (SPADCALL |l| (QREFELT $ 47)) (QREFELT $ 59))
                    (QREFELT $ 33))))) 

(SDEFUN |OUTFORM;infix;$L$;70| ((|a| $) (|l| |List| $) ($ $))
        (COND ((SPADCALL |l| (QREFELT $ 65)) (SPADCALL (QREFELT $ 14)))
              ((SPADCALL (SPADCALL |l| (QREFELT $ 66)) (QREFELT $ 65))
               (SPADCALL |l| (QREFELT $ 67)))
              ((SPADCALL |a| (QREFELT $ 95)) (|OUTFORM;cons_form| |a| |l| $))
              ('T
               (SPADCALL
                (LIST (SPADCALL |l| (QREFELT $ 67)) |a|
                      (SPADCALL |a| (SPADCALL |l| (QREFELT $ 66))
                                (QREFELT $ 98)))
                (QREFELT $ 73))))) 

(SDEFUN |OUTFORM;infix;4$;71| ((|a| $) (|b| $) (|c| $) ($ $))
        (COND
         ((SPADCALL |a| (QREFELT $ 95))
          (SPADCALL (LIST |a| |b| |c|) (QREFELT $ 19)))
         ('T (SPADCALL (LIST |b| |a| |c|) (QREFELT $ 73))))) 

(SDEFUN |OUTFORM;postfix;3$;72| ((|a| $) (|b| $) ($ $))
        (SPADCALL |b| |a| (QREFELT $ 33))) 

(SDEFUN |OUTFORM;add_prime| ((|a| $) (|s| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PRIME $) |a| |s|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;quote;2$;74| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'QUOTE $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;overbar;2$;75| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'OVERBAR $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;dot;2$;76| ((|a| $) ($ $))
        (SPADCALL |a| (|OUTFORM;sform| "." $) (QREFELT $ 62))) 

(SDEFUN |OUTFORM;prime;2$;77| ((|a| $) ($ $)) (SPADCALL |a| 1 (QREFELT $ 104))) 

(SDEFUN |OUTFORM;dot;$Nni$;78| ((|a| $) (|nn| |NonNegativeInteger|) ($ $))
        (SPROG ((|s| (|String|)))
               (SEQ (LETT |s| (|make_full_CVEC| |nn| (|STR_to_CHAR| ".")))
                    (EXIT
                     (SPADCALL |a| (|OUTFORM;sform| |s| $) (QREFELT $ 62)))))) 

(SDEFUN |OUTFORM;prime;$Nni$;79| ((|a| $) (|nn| |NonNegativeInteger|) ($ $))
        (SPROG ((|s| (|String|)))
               (SEQ (LETT |s| (|make_full_CVEC| |nn| (|STR_to_CHAR| ",")))
                    (EXIT
                     (|OUTFORM;add_prime| |a| (|OUTFORM;sform| |s| $) $))))) 

(SDEFUN |OUTFORM;overlabel;3$;80| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'OVERLABEL $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;box;2$;81| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'BOX $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;zag;3$;82| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'ZAG $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;root;2$;83| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'ROOT $) |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;root;3$;84| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'ROOT $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;over;3$;85| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'OVER $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;slash;3$;86| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SLASH $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;assign;3$;87| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'LET $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;label;3$;88| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'EQUATNUM $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;rarrow;3$;89| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'TAG $) |a| |b|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;differentiate;$Nni$;90|
        ((|a| $) (|nn| |NonNegativeInteger|) ($ $))
        (SPROG ((|s| (|String|)) (|r| (|String|)) (#1=#:G1734 NIL))
               (SEQ
                (COND ((ZEROP |nn|) |a|)
                      ((< |nn| 4) (SPADCALL |a| |nn| (QREFELT $ 104)))
                      ('T
                       (SEQ
                        (LETT |r|
                              (SPADCALL
                               (PROG1 (LETT #1# |nn|)
                                 (|check_subtype2| (> #1# 0)
                                                   '(|PositiveInteger|)
                                                   '(|NonNegativeInteger|)
                                                   #1#))
                               (QREFELT $ 119)))
                        (LETT |s| (SPADCALL |r| (QREFELT $ 120)))
                        (EXIT
                         (|OUTFORM;add_prime| |a|
                          (SPADCALL (|OUTFORM;sform| |s| $) (QREFELT $ 59))
                          $)))))))) 

(SDEFUN |OUTFORM;sum;2$;91| ((|a| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'SIGMA $) (SPADCALL (QREFELT $ 14)) |a|)
         (QREFELT $ 19))) 

(SDEFUN |OUTFORM;sum;3$;92| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SIGMA $) |b| |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;sum;4$;93| ((|a| $) (|b| $) (|c| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SIGMA2 $) |b| |c| |a|)
                  (QREFELT $ 19))) 

(SDEFUN |OUTFORM;prod;2$;94| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PI $) (SPADCALL (QREFELT $ 14)) |a|)
                  (QREFELT $ 19))) 

(SDEFUN |OUTFORM;prod;3$;95| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PI $) |b| |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;prod;4$;96| ((|a| $) (|b| $) (|c| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PI2 $) |b| |c| |a|) (QREFELT $ 19))) 

(SDEFUN |OUTFORM;int;2$;97| ((|a| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'INTSIGN $) (SPADCALL (QREFELT $ 14))
               (SPADCALL (QREFELT $ 14)) |a|)
         (QREFELT $ 19))) 

(SDEFUN |OUTFORM;int;3$;98| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'INTSIGN $) |b| (SPADCALL (QREFELT $ 14)) |a|)
         (QREFELT $ 19))) 

(SDEFUN |OUTFORM;int;4$;99| ((|a| $) (|b| $) (|c| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'INTSIGN $) |b| |c| |a|)
                  (QREFELT $ 19))) 

(SDEFUN |OUTFORM;tensor;3$;100| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'TENSOR $) |a| |b|) (QREFELT $ 19))) 

(DECLAIM (NOTINLINE |OutputForm;|)) 

(DEFUN |OutputForm| ()
  (SPROG NIL
         (PROG (#1=#:G1749)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|OutputForm|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|OutputForm|
                             (LIST (CONS NIL (CONS 1 (|OutputForm;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|OutputForm|)))))))))) 

(DEFUN |OutputForm;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|OutputForm|))
          (LETT $ (GETREFV 134))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|OutputForm| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 (|SExpression|))
          $))) 

(MAKEPROP '|OutputForm| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| $$) (0 . |cons|) '|Rep| (|Void|)
              |OUTFORM;print;$V;2| (|Boolean|) (|String|) (6 . |empty?|)
              |OUTFORM;empty;$;66| |OUTFORM;message;S$;3|
              |OUTFORM;messagePrint;SV;4| |OUTFORM;=;2$B;5| (|List| $)
              (11 . |convert|) |OUTFORM;=;3$;6| (|OutputForm|)
              |OUTFORM;coerce;2$;7| (|Integer|) |OUTFORM;outputForm;I$;8|
              (|Symbol|) |OUTFORM;outputForm;S$;9| (|Character|) (16 . |quote|)
              (20 . |concat|) (26 . |concat|) |OUTFORM;outputForm;S$;13|
              |OUTFORM;hspace;I$;23| |OUTFORM;hconcat;3$;42|
              |OUTFORM;center;$I$;16| |OUTFORM;left;$I$;17|
              |OUTFORM;right;$I$;18| |OUTFORM;center;2$;19|
              |OUTFORM;left;2$;20| |OUTFORM;right;2$;21| |OUTFORM;vspace;I$;22|
              |OUTFORM;vconcat;3$;44| |OUTFORM;rspace;2I$;24|
              |OUTFORM;bracket;L$;33| (|List| 18) |OUTFORM;matrix;L$;25|
              |OUTFORM;pile;L$;26| |OUTFORM;commaSeparate;L$;27|
              |OUTFORM;semicolonSeparate;L$;28| (32 . |reverse|)
              (|OutputFormTools|) (37 . |has_op?|) (|List| 21)
              (43 . |arguments|) (48 . |concat|) |OUTFORM;blankSeparate;L$;29|
              |OUTFORM;brace;2$;30| |OUTFORM;brace;L$;31|
              |OUTFORM;bracket;2$;32| |OUTFORM;paren;2$;34|
              |OUTFORM;paren;L$;35| |OUTFORM;sub;3$;36| |OUTFORM;super;3$;37|
              |OUTFORM;presub;3$;38| |OUTFORM;presuper;3$;39| (54 . |empty?|)
              (59 . |rest|) (64 . |first|) |OUTFORM;scripts;$L$;40|
              (|NonNegativeInteger|) (69 . |#|) (74 . |append|)
              |OUTFORM;supersub;$L$;41| |OUTFORM;hconcat;L$;43|
              |OUTFORM;vconcat;L$;45| |OUTFORM;~=;3$;46| |OUTFORM;<;3$;47|
              |OUTFORM;>;3$;48| |OUTFORM;<=;3$;49| |OUTFORM;>=;3$;50|
              |OUTFORM;+;3$;51| |OUTFORM;-;3$;52| |OUTFORM;-;2$;53|
              |OUTFORM;*;3$;54| |OUTFORM;/;3$;55| |OUTFORM;^;3$;56|
              |OUTFORM;rem;3$;57| |OUTFORM;quo;3$;58| |OUTFORM;exquo;3$;59|
              |OUTFORM;and;3$;60| |OUTFORM;or;3$;61| |OUTFORM;not;2$;62|
              |OUTFORM;SEGMENT;3$;63| |OUTFORM;SEGMENT;2$;64|
              |OUTFORM;binomial;3$;65| |OUTFORM;infix?;$B;67|
              |OUTFORM;elt;$L$;68| |OUTFORM;prefix;$L$;69|
              |OUTFORM;infix;$L$;70| |OUTFORM;infix;4$;71|
              |OUTFORM;postfix;3$;72| |OUTFORM;quote;2$;74|
              |OUTFORM;overbar;2$;75| |OUTFORM;dot;2$;76|
              |OUTFORM;prime;$Nni$;79| |OUTFORM;prime;2$;77|
              |OUTFORM;dot;$Nni$;78| |OUTFORM;overlabel;3$;80|
              |OUTFORM;box;2$;81| |OUTFORM;zag;3$;82| |OUTFORM;root;2$;83|
              |OUTFORM;root;3$;84| |OUTFORM;over;3$;85| |OUTFORM;slash;3$;86|
              |OUTFORM;assign;3$;87| |OUTFORM;label;3$;88|
              |OUTFORM;rarrow;3$;89| (|PositiveInteger|) (|NumberFormats|)
              (80 . |FormatRoman|) (85 . |lowerCase|)
              |OUTFORM;differentiate;$Nni$;90| |OUTFORM;sum;2$;91|
              |OUTFORM;sum;3$;92| |OUTFORM;sum;4$;93| |OUTFORM;prod;2$;94|
              |OUTFORM;prod;3$;95| |OUTFORM;prod;4$;96| |OUTFORM;int;2$;97|
              |OUTFORM;int;3$;98| |OUTFORM;int;4$;99| |OUTFORM;tensor;3$;100|
              (|HashState|) (|SingleInteger|))
           '#(~= 90 |zag| 102 |vspace| 108 |vconcat| 113 |tensor| 124
              |supersub| 130 |super| 136 |sum| 142 |sub| 160 |slash| 166
              |semicolonSeparate| 172 |scripts| 177 |rspace| 183 |root| 189
              |right| 200 |rem| 211 |rarrow| 217 |quote| 223 |quo| 228 |prod|
              234 |print| 252 |prime| 257 |presuper| 268 |presub| 274 |prefix|
              280 |postfix| 286 |pile| 292 |paren| 297 |overlabel| 307
              |overbar| 313 |over| 318 |outputForm| 324 |or| 339 |not| 345
              |messagePrint| 350 |message| 355 |matrix| 360 |left| 365 |latex|
              376 |label| 381 |int| 387 |infix?| 405 |infix| 410 |hspace| 423
              |hconcat| 428 |hashUpdate!| 439 |hash| 445 |exquo| 450 |empty|
              456 |elt| 460 |dot| 466 |differentiate| 477 |commaSeparate| 483
              |coerce| 488 |center| 493 |bracket| 504 |brace| 514 |box| 524
              |blankSeparate| 529 |binomial| 534 |assign| 540 |and| 546 ^ 552
              SEGMENT 558 >= 569 > 575 = 581 <= 593 < 599 / 605 - 611 + 622 *
              628)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 21))
                        (|makeByteWordVec2| 133
                                            '(2 6 0 2 0 7 1 12 11 0 13 1 8 0 18
                                              19 0 27 0 28 2 12 0 0 27 29 2 12
                                              0 27 0 30 1 6 0 0 49 2 50 11 21
                                              25 51 1 50 52 21 53 2 6 0 0 0 54
                                              1 6 11 0 65 1 6 0 0 66 1 6 2 0 67
                                              1 6 69 0 70 2 6 0 0 0 71 1 118 12
                                              117 119 1 12 0 0 120 2 0 0 0 0 75
                                              2 0 11 0 0 1 2 0 0 0 0 109 1 0 0
                                              23 40 1 0 0 18 74 2 0 0 0 0 41 2
                                              0 0 0 0 131 2 0 0 0 18 72 2 0 0 0
                                              0 62 3 0 0 0 0 0 124 1 0 0 0 122
                                              2 0 0 0 0 123 2 0 0 0 0 61 2 0 0
                                              0 0 113 1 0 0 18 48 2 0 0 0 18 68
                                              2 0 0 23 23 42 2 0 0 0 0 111 1 0
                                              0 0 110 1 0 0 0 39 2 0 0 0 23 36
                                              2 0 0 0 0 86 2 0 0 0 0 116 1 0 0
                                              0 101 2 0 0 0 0 87 3 0 0 0 0 0
                                              127 1 0 0 0 125 2 0 0 0 0 126 1 0
                                              9 0 10 2 0 0 0 69 104 1 0 0 0 105
                                              2 0 0 0 0 64 2 0 0 0 0 63 2 0 0 0
                                              18 97 2 0 0 0 0 100 1 0 0 18 46 1
                                              0 0 18 60 1 0 0 0 59 2 0 0 0 0
                                              107 1 0 0 0 102 2 0 0 0 0 112 1 0
                                              0 25 26 1 0 0 12 31 1 0 0 23 24 2
                                              0 0 0 0 90 1 0 0 0 91 1 0 9 12 16
                                              1 0 0 12 15 1 0 0 44 45 1 0 0 0
                                              38 2 0 0 0 23 35 1 0 12 0 1 2 0 0
                                              0 0 115 3 0 0 0 0 0 130 1 0 0 0
                                              128 2 0 0 0 0 129 1 0 11 0 95 3 0
                                              0 0 0 0 99 2 0 0 0 18 98 1 0 0 23
                                              32 1 0 0 18 73 2 0 0 0 0 33 2 0
                                              132 132 0 1 1 0 133 0 1 2 0 0 0 0
                                              88 0 0 0 14 2 0 0 0 18 96 1 0 0 0
                                              103 2 0 0 0 69 106 2 0 0 0 69 121
                                              1 0 0 18 47 1 0 21 0 22 1 0 0 0
                                              37 2 0 0 0 23 34 1 0 0 18 43 1 0
                                              0 0 58 1 0 0 0 56 1 0 0 18 57 1 0
                                              0 0 108 1 0 0 18 55 2 0 0 0 0 94
                                              2 0 0 0 0 114 2 0 0 0 0 89 2 0 0
                                              0 0 85 1 0 0 0 93 2 0 0 0 0 92 2
                                              0 0 0 0 79 2 0 0 0 0 77 2 0 0 0 0
                                              20 2 0 11 0 0 17 2 0 0 0 0 78 2 0
                                              0 0 0 76 2 0 0 0 0 84 1 0 0 0 82
                                              2 0 0 0 0 81 2 0 0 0 0 80 2 0 0 0
                                              0 83)))))
           '|lookupComplete|)) 

(MAKEPROP '|OutputForm| 'NILADIC T) 
