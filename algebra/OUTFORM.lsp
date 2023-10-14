
(PUT '|OUTFORM;print;$V;1| '|SPADreplace| '|mathprint|) 

(SDEFUN |OUTFORM;print;$V;1| ((|x| $) ($ |Void|)) (|mathprint| |x|)) 

(SDEFUN |OUTFORM;message;S$;2| ((|s| |String|) ($ $))
        (COND ((SPADCALL |s| (QREFELT $ 11)) (SPADCALL (QREFELT $ 12)))
              ('T |s|))) 

(SDEFUN |OUTFORM;messagePrint;SV;3| ((|s| |String|) ($ |Void|))
        (SPADCALL (SPADCALL |s| (QREFELT $ 13)) (QREFELT $ 8))) 

(PUT '|OUTFORM;=;2$B;4| '|SPADreplace| 'EQUAL) 

(SDEFUN |OUTFORM;=;2$B;4| ((|a| $) (|b| $) ($ |Boolean|)) (EQUAL |a| |b|)) 

(SDEFUN |OUTFORM;=;3$;5| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '= $) |a| |b|) (QREFELT $ 17))) 

(PUT '|OUTFORM;coerce;2$;6| '|SPADreplace| '(XLAM (|a|) |a|)) 

(SDEFUN |OUTFORM;coerce;2$;6| ((|a| $) ($ |OutputForm|)) |a|) 

(PUT '|OUTFORM;outputForm;I$;7| '|SPADreplace| '(XLAM (|n|) |n|)) 

(SDEFUN |OUTFORM;outputForm;I$;7| ((|n| |Integer|) ($ $)) |n|) 

(PUT '|OUTFORM;outputForm;S$;8| '|SPADreplace| '(XLAM (|e|) |e|)) 

(SDEFUN |OUTFORM;outputForm;S$;8| ((|e| |Symbol|) ($ $)) |e|) 

(PUT '|OUTFORM;outputForm;Df$;9| '|SPADreplace| '(XLAM (|f|) |f|)) 

(SDEFUN |OUTFORM;outputForm;Df$;9| ((|f| |DoubleFloat|) ($ $)) |f|) 

(PUT '|OUTFORM;sform| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |OUTFORM;sform| ((|s| |String|) ($ $)) |s|) 

(PUT '|OUTFORM;eform| '|SPADreplace| '(XLAM (|e|) |e|)) 

(SDEFUN |OUTFORM;eform| ((|e| |Symbol|) ($ $)) |e|) 

(PUT '|OUTFORM;iform| '|SPADreplace| '(XLAM (|n|) |n|)) 

(SDEFUN |OUTFORM;iform| ((|n| |Integer|) ($ $)) |n|) 

(SDEFUN |OUTFORM;outputForm;S$;13| ((|s| |String|) ($ $))
        (|OUTFORM;sform|
         (SPADCALL (STR_ELT #1="\" " 0)
                   (SPADCALL |s| (STR_ELT #1# 0) (QREFELT $ 28))
                   (QREFELT $ 29))
         $)) 

(PUT '|OUTFORM;width;$I;14| '|SPADreplace| '|outformWidth|) 

(SDEFUN |OUTFORM;width;$I;14| ((|a| $) ($ |Integer|)) (|outformWidth| |a|)) 

(PUT '|OUTFORM;height;$I;15| '|SPADreplace| '|height|) 

(SDEFUN |OUTFORM;height;$I;15| ((|a| $) ($ |Integer|)) (|height| |a|)) 

(PUT '|OUTFORM;subHeight;$I;16| '|SPADreplace| '|subspan|) 

(SDEFUN |OUTFORM;subHeight;$I;16| ((|a| $) ($ |Integer|)) (|subspan| |a|)) 

(PUT '|OUTFORM;superHeight;$I;17| '|SPADreplace| '|superspan|) 

(SDEFUN |OUTFORM;superHeight;$I;17| ((|a| $) ($ |Integer|)) (|superspan| |a|)) 

(PUT '|OUTFORM;height;I;18| '|SPADreplace| '(XLAM NIL 20)) 

(SDEFUN |OUTFORM;height;I;18| (($ |Integer|)) 20) 

(PUT '|OUTFORM;width;I;19| '|SPADreplace| '(XLAM NIL 66)) 

(SDEFUN |OUTFORM;width;I;19| (($ |Integer|)) 66) 

(SDEFUN |OUTFORM;center;$I$;20| ((|a| $) (|w| |Integer|) ($ $))
        (SPADCALL
         (SPADCALL (QUOTIENT2 (- |w| (SPADCALL |a| (QREFELT $ 31))) 2)
                   (QREFELT $ 37))
         |a| (QREFELT $ 38))) 

(SDEFUN |OUTFORM;left;$I$;21| ((|a| $) (|w| |Integer|) ($ $))
        (SPADCALL |a|
                  (SPADCALL (- |w| (SPADCALL |a| (QREFELT $ 31)))
                            (QREFELT $ 37))
                  (QREFELT $ 38))) 

(SDEFUN |OUTFORM;right;$I$;22| ((|a| $) (|w| |Integer|) ($ $))
        (SPADCALL
         (SPADCALL (- |w| (SPADCALL |a| (QREFELT $ 31))) (QREFELT $ 37)) |a|
         (QREFELT $ 38))) 

(SDEFUN |OUTFORM;center;2$;23| ((|a| $) ($ $))
        (SPADCALL |a| (SPADCALL (QREFELT $ 36)) (QREFELT $ 39))) 

(SDEFUN |OUTFORM;left;2$;24| ((|a| $) ($ $))
        (SPADCALL |a| (SPADCALL (QREFELT $ 36)) (QREFELT $ 40))) 

(SDEFUN |OUTFORM;right;2$;25| ((|a| $) ($ $))
        (SPADCALL |a| (SPADCALL (QREFELT $ 36)) (QREFELT $ 41))) 

(SDEFUN |OUTFORM;vspace;I$;26| ((|n| |Integer|) ($ $))
        (COND ((EQL |n| 0) (SPADCALL (QREFELT $ 12)))
              ('T
               (SPADCALL (|OUTFORM;sform| " " $)
                         (SPADCALL (- |n| 1) (QREFELT $ 45)) (QREFELT $ 46))))) 

(SDEFUN |OUTFORM;hspace;I$;27| ((|n| |Integer|) ($ $))
        (COND ((EQL |n| 0) (SPADCALL (QREFELT $ 12)))
              ('T (|OUTFORM;sform| (|fillerSpaces| |n| " ") $)))) 

(SDEFUN |OUTFORM;rspace;2I$;28| ((|n| |Integer|) (|m| |Integer|) ($ $))
        (COND ((OR (EQL |n| 0) (EQL |m| 0)) (SPADCALL (QREFELT $ 12)))
              ('T
               (SPADCALL (SPADCALL |n| (QREFELT $ 37))
                         (SPADCALL |n| (- |m| 1) (QREFELT $ 47))
                         (QREFELT $ 46))))) 

(SDEFUN |OUTFORM;matrix;L$;29| ((|ll| |List| (|List| $)) ($ $))
        (SPROG ((|lv| (|List| $)) (#1=#:G1629 NIL) (|l| NIL) (#2=#:G1628 NIL))
               (SEQ
                (LETT |lv|
                      (PROGN
                       (LETT #2# NIL . #3=(|OUTFORM;matrix;L$;29|))
                       (SEQ (LETT |l| NIL . #3#) (LETT #1# |ll| . #3#) G190
                            (COND
                             ((OR (ATOM #1#)
                                  (PROGN (LETT |l| (CAR #1#) . #3#) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT (LETT #2# (CONS (LIST2VEC |l|) #2#) . #3#)))
                            (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      . #3#)
                (EXIT (CONS (|OUTFORM;eform| 'MATRIX $) (LIST2VEC |lv|)))))) 

(SDEFUN |OUTFORM;pile;L$;30| ((|l| |List| $) ($ $))
        (CONS (|OUTFORM;eform| 'SC $) |l|)) 

(SDEFUN |OUTFORM;commaSeparate;L$;31| ((|l| |List| $) ($ $))
        (CONS (|OUTFORM;eform| 'AGGLST $) |l|)) 

(SDEFUN |OUTFORM;semicolonSeparate;L$;32| ((|l| |List| $) ($ $))
        (CONS (|OUTFORM;eform| 'AGGSET $) |l|)) 

(SDEFUN |OUTFORM;blankSeparate;L$;33| ((|l| |List| $) ($ $))
        (SPROG ((|l1| (|List| $)) (#1=#:G1637 NIL) (|u| NIL) (|c| ($)))
               (SEQ
                (LETT |c| (|OUTFORM;eform| 'CONCATB $)
                      . #2=(|OUTFORM;blankSeparate;L$;33|))
                (LETT |l1| NIL . #2#)
                (SEQ (LETT |u| NIL . #2#)
                     (LETT #1# (SPADCALL |l| (QREFELT $ 54)) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQCAR |u| |c|)
                         (LETT |l1| (SPADCALL (CDR |u|) |l1| (QREFELT $ 55))
                               . #2#))
                        ('T (LETT |l1| (CONS |u| |l1|) . #2#)))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS |c| |l1|))))) 

(SDEFUN |OUTFORM;brace;2$;34| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'BRACE $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;brace;L$;35| ((|l| |List| $) ($ $))
        (SPADCALL (SPADCALL |l| (QREFELT $ 51)) (QREFELT $ 57))) 

(SDEFUN |OUTFORM;bracket;2$;36| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'BRACKET $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;bracket;L$;37| ((|l| |List| $) ($ $))
        (SPADCALL (SPADCALL |l| (QREFELT $ 51)) (QREFELT $ 59))) 

(SDEFUN |OUTFORM;paren;2$;38| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PAREN $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;paren;L$;39| ((|l| |List| $) ($ $))
        (SPADCALL (SPADCALL |l| (QREFELT $ 51)) (QREFELT $ 61))) 

(SDEFUN |OUTFORM;sub;3$;40| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SUB $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;super;3$;41| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'SUPERSUB $) |a| (|OUTFORM;sform| " " $) |b|)
         (QREFELT $ 17))) 

(SDEFUN |OUTFORM;presub;3$;42| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'SUPERSUB $) |a| (|OUTFORM;sform| " " $)
               (|OUTFORM;sform| " " $) (|OUTFORM;sform| " " $) |b|)
         (QREFELT $ 17))) 

(SDEFUN |OUTFORM;presuper;3$;43| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'SUPERSUB $) |a| (|OUTFORM;sform| " " $)
               (|OUTFORM;sform| " " $) |b|)
         (QREFELT $ 17))) 

(SDEFUN |OUTFORM;scripts;$L$;44| ((|a| $) (|l| |List| $) ($ $))
        (COND ((SPADCALL |l| (QREFELT $ 67)) |a|)
              ((SPADCALL (SPADCALL |l| (QREFELT $ 68)) (QREFELT $ 67))
               (SPADCALL |a| (SPADCALL |l| (QREFELT $ 69)) (QREFELT $ 63)))
              ('T (CONS (|OUTFORM;eform| 'SUPERSUB $) (CONS |a| |l|))))) 

(SDEFUN |OUTFORM;supersub;$L$;45| ((|a| $) (|l| |List| $) ($ $))
        (SEQ
         (COND
          ((ODDP (SPADCALL |l| (QREFELT $ 72)))
           (LETT |l|
                 (SPADCALL |l| (LIST (SPADCALL (QREFELT $ 12))) (QREFELT $ 55))
                 |OUTFORM;supersub;$L$;45|)))
         (EXIT (CONS (|OUTFORM;eform| 'ALTSUPERSUB $) (CONS |a| |l|))))) 

(SDEFUN |OUTFORM;hconcat;3$;46| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'CONCAT $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;hconcat;L$;47| ((|l| |List| $) ($ $))
        (CONS (|OUTFORM;eform| 'CONCAT $) |l|)) 

(SDEFUN |OUTFORM;vconcat;3$;48| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'VCONCAT $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;vconcat;L$;49| ((|l| |List| $) ($ $))
        (CONS (|OUTFORM;eform| 'VCONCAT $) |l|)) 

(SDEFUN |OUTFORM;~=;3$;50| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '~= $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;<;3$;51| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '< $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;>;3$;52| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '> $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;<=;3$;53| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '<= $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;>=;3$;54| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '>= $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;+;3$;55| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '+ $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;-;3$;56| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '- $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;-;2$;57| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '- $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;*;3$;58| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '* $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;/;3$;59| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '/ $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;^;3$;60| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '^ $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;rem;3$;61| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|rem| $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;quo;3$;62| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|quo| $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;exquo;3$;63| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|exquo| $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;and;3$;64| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|and| $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;or;3$;65| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|or| $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;not;2$;66| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|not| $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;SEGMENT;3$;67| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SEGMENT $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;SEGMENT;2$;68| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SEGMENT $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;binomial;3$;69| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'BINOMIAL $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;empty;$;70| (($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'NOTHING $)) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;infix?;$B;71| ((|a| $) ($ |Boolean|))
        (SPROG ((|e| ($)) (#1=#:G1682 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |e|
                        (COND ((IDENTP |a|) |a|) ((STRINGP |a|) (INTERN |a|))
                              (#2='T
                               (PROGN
                                (LETT #1# 'NIL . #3=(|OUTFORM;infix?;$B;71|))
                                (GO #4=#:G1681))))
                        . #3#)
                  (EXIT (COND ((GET |e| 'INFIXOP) 'T) (#2# 'NIL)))))
                #4# (EXIT #1#)))) 

(PUT '|OUTFORM;elt;$L$;72| '|SPADreplace| 'CONS) 

(SDEFUN |OUTFORM;elt;$L$;72| ((|a| $) (|l| |List| $) ($ $)) (CONS |a| |l|)) 

(SDEFUN |OUTFORM;prefix;$L$;73| ((|a| $) (|l| |List| $) ($ $))
        (COND ((NULL (SPADCALL |a| (QREFELT $ 96))) (CONS |a| |l|))
              ('T
               (SPADCALL |a|
                         (SPADCALL (SPADCALL |l| (QREFELT $ 51))
                                   (QREFELT $ 61))
                         (QREFELT $ 38))))) 

(SDEFUN |OUTFORM;infix;$L$;74| ((|a| $) (|l| |List| $) ($ $))
        (COND ((SPADCALL |l| (QREFELT $ 67)) (SPADCALL (QREFELT $ 12)))
              ((SPADCALL (SPADCALL |l| (QREFELT $ 68)) (QREFELT $ 67))
               (SPADCALL |l| (QREFELT $ 69)))
              ((SPADCALL |a| (QREFELT $ 96)) (CONS |a| |l|))
              ('T
               (SPADCALL
                (LIST (SPADCALL |l| (QREFELT $ 69)) |a|
                      (SPADCALL |a| (SPADCALL |l| (QREFELT $ 68))
                                (QREFELT $ 99)))
                (QREFELT $ 74))))) 

(SDEFUN |OUTFORM;infix;4$;75| ((|a| $) (|b| $) (|c| $) ($ $))
        (COND
         ((SPADCALL |a| (QREFELT $ 96))
          (SPADCALL (LIST |a| |b| |c|) (QREFELT $ 17)))
         ('T (SPADCALL (LIST |b| |a| |c|) (QREFELT $ 74))))) 

(SDEFUN |OUTFORM;postfix;3$;76| ((|a| $) (|b| $) ($ $))
        (SPADCALL |b| |a| (QREFELT $ 38))) 

(SDEFUN |OUTFORM;add_prime| ((|a| $) (|s| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PRIME $) |a| |s|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;string;2$;78| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'STRING $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;quote;2$;79| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'QUOTE $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;overbar;2$;80| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'OVERBAR $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;dot;2$;81| ((|a| $) ($ $))
        (SPADCALL |a| (|OUTFORM;sform| "." $) (QREFELT $ 64))) 

(SDEFUN |OUTFORM;prime;2$;82| ((|a| $) ($ $)) (SPADCALL |a| 1 (QREFELT $ 106))) 

(SDEFUN |OUTFORM;dot;$Nni$;83| ((|a| $) (|nn| |NonNegativeInteger|) ($ $))
        (SPROG ((|s| (|String|)))
               (SEQ
                (LETT |s| (|make_full_CVEC| |nn| (|STR_to_CHAR| "."))
                      |OUTFORM;dot;$Nni$;83|)
                (EXIT (SPADCALL |a| (|OUTFORM;sform| |s| $) (QREFELT $ 64)))))) 

(SDEFUN |OUTFORM;prime;$Nni$;84| ((|a| $) (|nn| |NonNegativeInteger|) ($ $))
        (SPROG ((|s| (|String|)))
               (SEQ
                (LETT |s| (|make_full_CVEC| |nn| (|STR_to_CHAR| ","))
                      |OUTFORM;prime;$Nni$;84|)
                (EXIT (|OUTFORM;add_prime| |a| (|OUTFORM;sform| |s| $) $))))) 

(SDEFUN |OUTFORM;overlabel;3$;85| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'OVERLABEL $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;box;2$;86| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'BOX $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;zag;3$;87| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'ZAG $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;root;2$;88| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'ROOT $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;root;3$;89| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'ROOT $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;over;3$;90| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'OVER $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;slash;3$;91| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SLASH $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;assign;3$;92| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'LET $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;label;3$;93| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'EQUATNUM $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;rarrow;3$;94| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'TAG $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;differentiate;$Nni$;95|
        ((|a| $) (|nn| |NonNegativeInteger|) ($ $))
        (SPROG ((|s| (|String|)) (|r| (|String|)) (#1=#:G1714 NIL))
               (SEQ
                (COND ((ZEROP |nn|) |a|)
                      ((< |nn| 4) (SPADCALL |a| |nn| (QREFELT $ 106)))
                      ('T
                       (SEQ
                        (LETT |r|
                              (SPADCALL
                               (PROG1
                                   (LETT #1# |nn|
                                         . #2=(|OUTFORM;differentiate;$Nni$;95|))
                                 (|check_subtype| (> #1# 0)
                                                  '(|PositiveInteger|) #1#))
                               (QREFELT $ 121))
                              . #2#)
                        (LETT |s| (SPADCALL |r| (QREFELT $ 122)) . #2#)
                        (EXIT
                         (|OUTFORM;add_prime| |a|
                          (SPADCALL (|OUTFORM;sform| |s| $) (QREFELT $ 61))
                          $)))))))) 

(SDEFUN |OUTFORM;sum;2$;96| ((|a| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'SIGMA $) (SPADCALL (QREFELT $ 12)) |a|)
         (QREFELT $ 17))) 

(SDEFUN |OUTFORM;sum;3$;97| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SIGMA $) |b| |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;sum;4$;98| ((|a| $) (|b| $) (|c| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SIGMA2 $) |b| |c| |a|)
                  (QREFELT $ 17))) 

(SDEFUN |OUTFORM;prod;2$;99| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PI $) (SPADCALL (QREFELT $ 12)) |a|)
                  (QREFELT $ 17))) 

(SDEFUN |OUTFORM;prod;3$;100| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PI $) |b| |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;prod;4$;101| ((|a| $) (|b| $) (|c| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PI2 $) |b| |c| |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;int;2$;102| ((|a| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'INTSIGN $) (SPADCALL (QREFELT $ 12))
               (SPADCALL (QREFELT $ 12)) |a|)
         (QREFELT $ 17))) 

(SDEFUN |OUTFORM;int;3$;103| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'INTSIGN $) |b| (SPADCALL (QREFELT $ 12)) |a|)
         (QREFELT $ 17))) 

(SDEFUN |OUTFORM;int;4$;104| ((|a| $) (|b| $) (|c| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'INTSIGN $) |b| |c| |a|)
                  (QREFELT $ 17))) 

(SDEFUN |OUTFORM;tensor;3$;105| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'TENSOR $) |a| |b|) (QREFELT $ 17))) 

(DECLAIM (NOTINLINE |OutputForm;|)) 

(DEFUN |OutputForm| ()
  (SPROG NIL
         (PROG (#1=#:G1729)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|OutputForm|)
                    . #2=(|OutputForm|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|OutputForm|
                             (LIST (CONS NIL (CONS 1 (|OutputForm;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|OutputForm|)))))))))) 

(DEFUN |OutputForm;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|OutputForm|) . #1=(|OutputForm|))
          (LETT $ (GETREFV 136) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|OutputForm| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 6 (|SExpression|))
          $))) 

(MAKEPROP '|OutputForm| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Void|) |OUTFORM;print;$V;1|
              (|Boolean|) (|String|) (0 . |empty?|) |OUTFORM;empty;$;70|
              |OUTFORM;message;S$;2| |OUTFORM;messagePrint;SV;3|
              |OUTFORM;=;2$B;4| (|List| $) (5 . |convert|) |OUTFORM;=;3$;5|
              (|OutputForm|) |OUTFORM;coerce;2$;6| (|Integer|)
              |OUTFORM;outputForm;I$;7| (|Symbol|) |OUTFORM;outputForm;S$;8|
              (|DoubleFloat|) |OUTFORM;outputForm;Df$;9| (|Character|)
              (10 . |concat|) (16 . |concat|) |OUTFORM;outputForm;S$;13|
              |OUTFORM;width;$I;14| |OUTFORM;height;$I;15|
              |OUTFORM;subHeight;$I;16| |OUTFORM;superHeight;$I;17|
              |OUTFORM;height;I;18| |OUTFORM;width;I;19| |OUTFORM;hspace;I$;27|
              |OUTFORM;hconcat;3$;46| |OUTFORM;center;$I$;20|
              |OUTFORM;left;$I$;21| |OUTFORM;right;$I$;22|
              |OUTFORM;center;2$;23| |OUTFORM;left;2$;24| |OUTFORM;right;2$;25|
              |OUTFORM;vspace;I$;26| |OUTFORM;vconcat;3$;48|
              |OUTFORM;rspace;2I$;28| (|List| 16) |OUTFORM;matrix;L$;29|
              |OUTFORM;pile;L$;30| |OUTFORM;commaSeparate;L$;31|
              |OUTFORM;semicolonSeparate;L$;32| (|List| $$) (22 . |reverse|)
              (27 . |append|) |OUTFORM;blankSeparate;L$;33|
              |OUTFORM;brace;2$;34| |OUTFORM;brace;L$;35|
              |OUTFORM;bracket;2$;36| |OUTFORM;bracket;L$;37|
              |OUTFORM;paren;2$;38| |OUTFORM;paren;L$;39| |OUTFORM;sub;3$;40|
              |OUTFORM;super;3$;41| |OUTFORM;presub;3$;42|
              |OUTFORM;presuper;3$;43| (33 . |null|) (38 . |rest|)
              (43 . |first|) |OUTFORM;scripts;$L$;44| (|NonNegativeInteger|)
              (48 . |#|) |OUTFORM;supersub;$L$;45| |OUTFORM;hconcat;L$;47|
              |OUTFORM;vconcat;L$;49| |OUTFORM;~=;3$;50| |OUTFORM;<;3$;51|
              |OUTFORM;>;3$;52| |OUTFORM;<=;3$;53| |OUTFORM;>=;3$;54|
              |OUTFORM;+;3$;55| |OUTFORM;-;3$;56| |OUTFORM;-;2$;57|
              |OUTFORM;*;3$;58| |OUTFORM;/;3$;59| |OUTFORM;^;3$;60|
              |OUTFORM;rem;3$;61| |OUTFORM;quo;3$;62| |OUTFORM;exquo;3$;63|
              |OUTFORM;and;3$;64| |OUTFORM;or;3$;65| |OUTFORM;not;2$;66|
              |OUTFORM;SEGMENT;3$;67| |OUTFORM;SEGMENT;2$;68|
              |OUTFORM;binomial;3$;69| |OUTFORM;infix?;$B;71|
              |OUTFORM;elt;$L$;72| |OUTFORM;prefix;$L$;73|
              |OUTFORM;infix;$L$;74| |OUTFORM;infix;4$;75|
              |OUTFORM;postfix;3$;76| |OUTFORM;string;2$;78|
              |OUTFORM;quote;2$;79| |OUTFORM;overbar;2$;80| |OUTFORM;dot;2$;81|
              |OUTFORM;prime;$Nni$;84| |OUTFORM;prime;2$;82|
              |OUTFORM;dot;$Nni$;83| |OUTFORM;overlabel;3$;85|
              |OUTFORM;box;2$;86| |OUTFORM;zag;3$;87| |OUTFORM;root;2$;88|
              |OUTFORM;root;3$;89| |OUTFORM;over;3$;90| |OUTFORM;slash;3$;91|
              |OUTFORM;assign;3$;92| |OUTFORM;label;3$;93|
              |OUTFORM;rarrow;3$;94| (|PositiveInteger|) (|NumberFormats|)
              (53 . |FormatRoman|) (58 . |lowerCase|)
              |OUTFORM;differentiate;$Nni$;95| |OUTFORM;sum;2$;96|
              |OUTFORM;sum;3$;97| |OUTFORM;sum;4$;98| |OUTFORM;prod;2$;99|
              |OUTFORM;prod;3$;100| |OUTFORM;prod;4$;101| |OUTFORM;int;2$;102|
              |OUTFORM;int;3$;103| |OUTFORM;int;4$;104| |OUTFORM;tensor;3$;105|
              (|HashState|) (|SingleInteger|))
           '#(~= 63 |zag| 75 |width| 81 |vspace| 90 |vconcat| 95 |tensor| 106
              |supersub| 112 |superHeight| 118 |super| 123 |sum| 129
              |subHeight| 147 |sub| 152 |string| 158 |slash| 163
              |semicolonSeparate| 169 |scripts| 174 |rspace| 180 |root| 186
              |right| 197 |rem| 208 |rarrow| 214 |quote| 220 |quo| 225 |prod|
              231 |print| 249 |prime| 254 |presuper| 265 |presub| 271 |prefix|
              277 |postfix| 283 |pile| 289 |paren| 294 |overlabel| 304
              |overbar| 310 |over| 315 |outputForm| 321 |or| 341 |not| 347
              |messagePrint| 352 |message| 357 |matrix| 362 |left| 367 |latex|
              378 |label| 383 |int| 389 |infix?| 407 |infix| 412 |hspace| 425
              |height| 430 |hconcat| 439 |hashUpdate!| 450 |hash| 456 |exquo|
              461 |empty| 467 |elt| 471 |dot| 477 |differentiate| 488
              |commaSeparate| 494 |coerce| 499 |center| 504 |bracket| 515
              |brace| 525 |box| 535 |blankSeparate| 540 |binomial| 545 |assign|
              551 |and| 557 ^ 563 SEGMENT 569 >= 580 > 586 = 592 <= 604 < 610 /
              616 - 622 + 633 * 639)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 19))
                        (|makeByteWordVec2| 135
                                            '(1 10 9 0 11 1 6 0 16 17 2 10 0 0
                                              27 28 2 10 0 27 0 29 1 53 0 0 54
                                              2 53 0 0 0 55 1 53 9 0 67 1 53 0
                                              0 68 1 53 2 0 69 1 53 71 0 72 1
                                              120 10 119 121 1 10 0 0 122 2 0 0
                                              0 0 76 2 0 9 0 0 1 2 0 0 0 0 111
                                              0 0 21 36 1 0 21 0 31 1 0 0 21 45
                                              1 0 0 16 75 2 0 0 0 0 46 2 0 0 0
                                              0 133 2 0 0 0 16 73 1 0 21 0 34 2
                                              0 0 0 0 64 3 0 0 0 0 0 126 1 0 0
                                              0 124 2 0 0 0 0 125 1 0 21 0 33 2
                                              0 0 0 0 63 1 0 0 0 102 2 0 0 0 0
                                              115 1 0 0 16 52 2 0 0 0 16 70 2 0
                                              0 21 21 47 1 0 0 0 112 2 0 0 0 0
                                              113 1 0 0 0 44 2 0 0 0 21 41 2 0
                                              0 0 0 87 2 0 0 0 0 118 1 0 0 0
                                              103 2 0 0 0 0 88 2 0 0 0 0 128 3
                                              0 0 0 0 0 129 1 0 0 0 127 1 0 7 0
                                              8 2 0 0 0 71 106 1 0 0 0 107 2 0
                                              0 0 0 66 2 0 0 0 0 65 2 0 0 0 16
                                              98 2 0 0 0 0 101 1 0 0 16 50 1 0
                                              0 0 61 1 0 0 16 62 2 0 0 0 0 109
                                              1 0 0 0 104 2 0 0 0 0 114 1 0 0
                                              10 30 1 0 0 25 26 1 0 0 21 22 1 0
                                              0 23 24 2 0 0 0 0 91 1 0 0 0 92 1
                                              0 7 10 14 1 0 0 10 13 1 0 0 48 49
                                              1 0 0 0 43 2 0 0 0 21 40 1 0 10 0
                                              1 2 0 0 0 0 117 2 0 0 0 0 131 3 0
                                              0 0 0 0 132 1 0 0 0 130 1 0 9 0
                                              96 2 0 0 0 16 99 3 0 0 0 0 0 100
                                              1 0 0 21 37 0 0 21 35 1 0 21 0 32
                                              1 0 0 16 74 2 0 0 0 0 38 2 0 134
                                              134 0 1 1 0 135 0 1 2 0 0 0 0 89
                                              0 0 0 12 2 0 0 0 16 97 1 0 0 0
                                              105 2 0 0 0 71 108 2 0 0 0 71 123
                                              1 0 0 16 51 1 0 19 0 20 1 0 0 0
                                              42 2 0 0 0 21 39 1 0 0 16 60 1 0
                                              0 0 59 1 0 0 16 58 1 0 0 0 57 1 0
                                              0 0 110 1 0 0 16 56 2 0 0 0 0 95
                                              2 0 0 0 0 116 2 0 0 0 0 90 2 0 0
                                              0 0 86 1 0 0 0 94 2 0 0 0 0 93 2
                                              0 0 0 0 80 2 0 0 0 0 78 2 0 0 0 0
                                              18 2 0 9 0 0 15 2 0 0 0 0 79 2 0
                                              0 0 0 77 2 0 0 0 0 85 2 0 0 0 0
                                              82 1 0 0 0 83 2 0 0 0 0 81 2 0 0
                                              0 0 84)))))
           '|lookupComplete|)) 

(MAKEPROP '|OutputForm| 'NILADIC T) 
