
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

(PUT '|OUTFORM;sform| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |OUTFORM;sform| ((|s| |String|) ($ $)) |s|) 

(PUT '|OUTFORM;eform| '|SPADreplace| '(XLAM (|e|) |e|)) 

(SDEFUN |OUTFORM;eform| ((|e| |Symbol|) ($ $)) |e|) 

(PUT '|OUTFORM;iform| '|SPADreplace| '(XLAM (|n|) |n|)) 

(SDEFUN |OUTFORM;iform| ((|n| |Integer|) ($ $)) |n|) 

(SDEFUN |OUTFORM;outputForm;S$;12| ((|s| |String|) ($ $))
        (|OUTFORM;sform|
         (SPADCALL (STR_ELT #1="\" " 0)
                   (SPADCALL |s| (STR_ELT #1# 0) (QREFELT $ 26))
                   (QREFELT $ 27))
         $)) 

(PUT '|OUTFORM;width| '|SPADreplace| '|outformWidth|) 

(SDEFUN |OUTFORM;width| ((|a| $) ($ |Integer|)) (|outformWidth| |a|)) 

(PUT '|OUTFORM;width0| '|SPADreplace| '(XLAM NIL 66)) 

(SDEFUN |OUTFORM;width0| (($ |Integer|)) 66) 

(SDEFUN |OUTFORM;center;$I$;15| ((|a| $) (|w| |Integer|) ($ $))
        (SPADCALL
         (SPADCALL (QUOTIENT2 (- |w| (|OUTFORM;width| |a| $)) 2)
                   (QREFELT $ 29))
         |a| (QREFELT $ 30))) 

(SDEFUN |OUTFORM;left;$I$;16| ((|a| $) (|w| |Integer|) ($ $))
        (SPADCALL |a| (SPADCALL (- |w| (|OUTFORM;width| |a| $)) (QREFELT $ 29))
                  (QREFELT $ 30))) 

(SDEFUN |OUTFORM;right;$I$;17| ((|a| $) (|w| |Integer|) ($ $))
        (SPADCALL (SPADCALL (- |w| (|OUTFORM;width| |a| $)) (QREFELT $ 29)) |a|
                  (QREFELT $ 30))) 

(SDEFUN |OUTFORM;center;2$;18| ((|a| $) ($ $))
        (SPADCALL |a| (|OUTFORM;width0| $) (QREFELT $ 31))) 

(SDEFUN |OUTFORM;left;2$;19| ((|a| $) ($ $))
        (SPADCALL |a| (|OUTFORM;width0| $) (QREFELT $ 32))) 

(SDEFUN |OUTFORM;right;2$;20| ((|a| $) ($ $))
        (SPADCALL |a| (|OUTFORM;width0| $) (QREFELT $ 33))) 

(SDEFUN |OUTFORM;vspace;I$;21| ((|n| |Integer|) ($ $))
        (COND ((EQL |n| 0) (SPADCALL (QREFELT $ 12)))
              ('T
               (SPADCALL (|OUTFORM;sform| " " $)
                         (SPADCALL (- |n| 1) (QREFELT $ 37)) (QREFELT $ 38))))) 

(SDEFUN |OUTFORM;hspace;I$;22| ((|n| |Integer|) ($ $))
        (COND ((EQL |n| 0) (SPADCALL (QREFELT $ 12)))
              ('T (|OUTFORM;sform| (|fillerSpaces| |n| " ") $)))) 

(SDEFUN |OUTFORM;rspace;2I$;23| ((|n| |Integer|) (|m| |Integer|) ($ $))
        (COND ((OR (EQL |n| 0) (EQL |m| 0)) (SPADCALL (QREFELT $ 12)))
              ('T
               (SPADCALL (SPADCALL |n| (QREFELT $ 29))
                         (SPADCALL |n| (- |m| 1) (QREFELT $ 39))
                         (QREFELT $ 38))))) 

(SDEFUN |OUTFORM;matrix;L$;24| ((|ll| |List| (|List| $)) ($ $))
        (SPROG ((|lv| (|List| $)) (#1=#:G1601 NIL) (|l| NIL) (#2=#:G1600 NIL))
               (SEQ
                (LETT |lv|
                      (PROGN
                       (LETT #2# NIL . #3=(|OUTFORM;matrix;L$;24|))
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

(SDEFUN |OUTFORM;pile;L$;25| ((|l| |List| $) ($ $))
        (CONS (|OUTFORM;eform| 'SC $) |l|)) 

(SDEFUN |OUTFORM;commaSeparate;L$;26| ((|l| |List| $) ($ $))
        (CONS (|OUTFORM;eform| 'AGGLST $) |l|)) 

(SDEFUN |OUTFORM;semicolonSeparate;L$;27| ((|l| |List| $) ($ $))
        (CONS (|OUTFORM;eform| 'AGGSET $) |l|)) 

(SDEFUN |OUTFORM;blankSeparate;L$;28| ((|l| |List| $) ($ $))
        (SPROG ((|l1| (|List| $)) (#1=#:G1609 NIL) (|u| NIL) (|c| ($)))
               (SEQ
                (LETT |c| (|OUTFORM;eform| 'CONCATB $)
                      . #2=(|OUTFORM;blankSeparate;L$;28|))
                (LETT |l1| NIL . #2#)
                (SEQ (LETT |u| NIL . #2#)
                     (LETT #1# (SPADCALL |l| (QREFELT $ 46)) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQCAR |u| |c|)
                         (LETT |l1| (SPADCALL (CDR |u|) |l1| (QREFELT $ 47))
                               . #2#))
                        ('T (LETT |l1| (CONS |u| |l1|) . #2#)))))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS |c| |l1|))))) 

(SDEFUN |OUTFORM;brace;2$;29| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'BRACE $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;brace;L$;30| ((|l| |List| $) ($ $))
        (SPADCALL (SPADCALL |l| (QREFELT $ 43)) (QREFELT $ 49))) 

(SDEFUN |OUTFORM;bracket;2$;31| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'BRACKET $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;bracket;L$;32| ((|l| |List| $) ($ $))
        (SPADCALL (SPADCALL |l| (QREFELT $ 43)) (QREFELT $ 51))) 

(SDEFUN |OUTFORM;paren;2$;33| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PAREN $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;paren;L$;34| ((|l| |List| $) ($ $))
        (SPADCALL (SPADCALL |l| (QREFELT $ 43)) (QREFELT $ 53))) 

(SDEFUN |OUTFORM;sub;3$;35| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SUB $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;super;3$;36| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'SUPERSUB $) |a| (|OUTFORM;sform| " " $) |b|)
         (QREFELT $ 17))) 

(SDEFUN |OUTFORM;presub;3$;37| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'SUPERSUB $) |a| (|OUTFORM;sform| " " $)
               (|OUTFORM;sform| " " $) (|OUTFORM;sform| " " $) |b|)
         (QREFELT $ 17))) 

(SDEFUN |OUTFORM;presuper;3$;38| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'SUPERSUB $) |a| (|OUTFORM;sform| " " $)
               (|OUTFORM;sform| " " $) |b|)
         (QREFELT $ 17))) 

(SDEFUN |OUTFORM;scripts;$L$;39| ((|a| $) (|l| |List| $) ($ $))
        (COND ((SPADCALL |l| (QREFELT $ 59)) |a|)
              ((SPADCALL (SPADCALL |l| (QREFELT $ 60)) (QREFELT $ 59))
               (SPADCALL |a| (SPADCALL |l| (QREFELT $ 61)) (QREFELT $ 55)))
              ('T (CONS (|OUTFORM;eform| 'SUPERSUB $) (CONS |a| |l|))))) 

(SDEFUN |OUTFORM;supersub;$L$;40| ((|a| $) (|l| |List| $) ($ $))
        (SEQ
         (COND
          ((ODDP (SPADCALL |l| (QREFELT $ 64)))
           (LETT |l|
                 (SPADCALL |l| (LIST (SPADCALL (QREFELT $ 12))) (QREFELT $ 47))
                 |OUTFORM;supersub;$L$;40|)))
         (EXIT (CONS (|OUTFORM;eform| 'ALTSUPERSUB $) (CONS |a| |l|))))) 

(SDEFUN |OUTFORM;hconcat;3$;41| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'CONCAT $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;hconcat;L$;42| ((|l| |List| $) ($ $))
        (CONS (|OUTFORM;eform| 'CONCAT $) |l|)) 

(SDEFUN |OUTFORM;vconcat;3$;43| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'VCONCAT $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;vconcat;L$;44| ((|l| |List| $) ($ $))
        (CONS (|OUTFORM;eform| 'VCONCAT $) |l|)) 

(SDEFUN |OUTFORM;~=;3$;45| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '~= $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;<;3$;46| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '< $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;>;3$;47| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '> $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;<=;3$;48| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '<= $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;>=;3$;49| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '>= $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;+;3$;50| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '+ $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;-;3$;51| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '- $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;-;2$;52| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '- $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;*;3$;53| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '* $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;/;3$;54| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '/ $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;^;3$;55| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '^ $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;rem;3$;56| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|rem| $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;quo;3$;57| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|quo| $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;exquo;3$;58| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|exquo| $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;and;3$;59| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|and| $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;or;3$;60| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|or| $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;not;2$;61| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| '|not| $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;SEGMENT;3$;62| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SEGMENT $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;SEGMENT;2$;63| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SEGMENT $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;binomial;3$;64| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'BINOMIAL $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;empty;$;65| (($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'NOTHING $)) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;infix?;$B;66| ((|a| $) ($ |Boolean|))
        (SPROG ((|e| ($)) (#1=#:G1654 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |e|
                        (COND ((IDENTP |a|) |a|) ((STRINGP |a|) (INTERN |a|))
                              (#2='T
                               (PROGN
                                (LETT #1# 'NIL . #3=(|OUTFORM;infix?;$B;66|))
                                (GO #4=#:G1653))))
                        . #3#)
                  (EXIT (COND ((GET |e| 'INFIXOP) 'T) (#2# 'NIL)))))
                #4# (EXIT #1#)))) 

(PUT '|OUTFORM;elt;$L$;67| '|SPADreplace| 'CONS) 

(SDEFUN |OUTFORM;elt;$L$;67| ((|a| $) (|l| |List| $) ($ $)) (CONS |a| |l|)) 

(SDEFUN |OUTFORM;prefix;$L$;68| ((|a| $) (|l| |List| $) ($ $))
        (COND ((NULL (SPADCALL |a| (QREFELT $ 88))) (CONS |a| |l|))
              ('T
               (SPADCALL |a|
                         (SPADCALL (SPADCALL |l| (QREFELT $ 43))
                                   (QREFELT $ 53))
                         (QREFELT $ 30))))) 

(SDEFUN |OUTFORM;infix;$L$;69| ((|a| $) (|l| |List| $) ($ $))
        (COND ((SPADCALL |l| (QREFELT $ 59)) (SPADCALL (QREFELT $ 12)))
              ((SPADCALL (SPADCALL |l| (QREFELT $ 60)) (QREFELT $ 59))
               (SPADCALL |l| (QREFELT $ 61)))
              ((SPADCALL |a| (QREFELT $ 88)) (CONS |a| |l|))
              ('T
               (SPADCALL
                (LIST (SPADCALL |l| (QREFELT $ 61)) |a|
                      (SPADCALL |a| (SPADCALL |l| (QREFELT $ 60))
                                (QREFELT $ 91)))
                (QREFELT $ 66))))) 

(SDEFUN |OUTFORM;infix;4$;70| ((|a| $) (|b| $) (|c| $) ($ $))
        (COND
         ((SPADCALL |a| (QREFELT $ 88))
          (SPADCALL (LIST |a| |b| |c|) (QREFELT $ 17)))
         ('T (SPADCALL (LIST |b| |a| |c|) (QREFELT $ 66))))) 

(SDEFUN |OUTFORM;postfix;3$;71| ((|a| $) (|b| $) ($ $))
        (SPADCALL |b| |a| (QREFELT $ 30))) 

(SDEFUN |OUTFORM;add_prime| ((|a| $) (|s| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PRIME $) |a| |s|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;string;2$;73| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'STRING $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;quote;2$;74| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'QUOTE $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;overbar;2$;75| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'OVERBAR $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;dot;2$;76| ((|a| $) ($ $))
        (SPADCALL |a| (|OUTFORM;sform| "." $) (QREFELT $ 56))) 

(SDEFUN |OUTFORM;prime;2$;77| ((|a| $) ($ $)) (SPADCALL |a| 1 (QREFELT $ 98))) 

(SDEFUN |OUTFORM;dot;$Nni$;78| ((|a| $) (|nn| |NonNegativeInteger|) ($ $))
        (SPROG ((|s| (|String|)))
               (SEQ
                (LETT |s| (|make_full_CVEC| |nn| (|STR_to_CHAR| "."))
                      |OUTFORM;dot;$Nni$;78|)
                (EXIT (SPADCALL |a| (|OUTFORM;sform| |s| $) (QREFELT $ 56)))))) 

(SDEFUN |OUTFORM;prime;$Nni$;79| ((|a| $) (|nn| |NonNegativeInteger|) ($ $))
        (SPROG ((|s| (|String|)))
               (SEQ
                (LETT |s| (|make_full_CVEC| |nn| (|STR_to_CHAR| ","))
                      |OUTFORM;prime;$Nni$;79|)
                (EXIT (|OUTFORM;add_prime| |a| (|OUTFORM;sform| |s| $) $))))) 

(SDEFUN |OUTFORM;overlabel;3$;80| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'OVERLABEL $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;box;2$;81| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'BOX $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;zag;3$;82| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'ZAG $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;root;2$;83| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'ROOT $) |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;root;3$;84| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'ROOT $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;over;3$;85| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'OVER $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;slash;3$;86| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SLASH $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;assign;3$;87| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'LET $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;label;3$;88| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'EQUATNUM $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;rarrow;3$;89| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'TAG $) |a| |b|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;differentiate;$Nni$;90|
        ((|a| $) (|nn| |NonNegativeInteger|) ($ $))
        (SPROG ((|s| (|String|)) (|r| (|String|)) (#1=#:G1686 NIL))
               (SEQ
                (COND ((ZEROP |nn|) |a|)
                      ((< |nn| 4) (SPADCALL |a| |nn| (QREFELT $ 98)))
                      ('T
                       (SEQ
                        (LETT |r|
                              (SPADCALL
                               (PROG1
                                   (LETT #1# |nn|
                                         . #2=(|OUTFORM;differentiate;$Nni$;90|))
                                 (|check_subtype2| (> #1# 0)
                                                   '(|PositiveInteger|)
                                                   '(|NonNegativeInteger|)
                                                   #1#))
                               (QREFELT $ 113))
                              . #2#)
                        (LETT |s| (SPADCALL |r| (QREFELT $ 114)) . #2#)
                        (EXIT
                         (|OUTFORM;add_prime| |a|
                          (SPADCALL (|OUTFORM;sform| |s| $) (QREFELT $ 53))
                          $)))))))) 

(SDEFUN |OUTFORM;sum;2$;91| ((|a| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'SIGMA $) (SPADCALL (QREFELT $ 12)) |a|)
         (QREFELT $ 17))) 

(SDEFUN |OUTFORM;sum;3$;92| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SIGMA $) |b| |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;sum;4$;93| ((|a| $) (|b| $) (|c| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'SIGMA2 $) |b| |c| |a|)
                  (QREFELT $ 17))) 

(SDEFUN |OUTFORM;prod;2$;94| ((|a| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PI $) (SPADCALL (QREFELT $ 12)) |a|)
                  (QREFELT $ 17))) 

(SDEFUN |OUTFORM;prod;3$;95| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PI $) |b| |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;prod;4$;96| ((|a| $) (|b| $) (|c| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'PI2 $) |b| |c| |a|) (QREFELT $ 17))) 

(SDEFUN |OUTFORM;int;2$;97| ((|a| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'INTSIGN $) (SPADCALL (QREFELT $ 12))
               (SPADCALL (QREFELT $ 12)) |a|)
         (QREFELT $ 17))) 

(SDEFUN |OUTFORM;int;3$;98| ((|a| $) (|b| $) ($ $))
        (SPADCALL
         (LIST (|OUTFORM;eform| 'INTSIGN $) |b| (SPADCALL (QREFELT $ 12)) |a|)
         (QREFELT $ 17))) 

(SDEFUN |OUTFORM;int;4$;99| ((|a| $) (|b| $) (|c| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'INTSIGN $) |b| |c| |a|)
                  (QREFELT $ 17))) 

(SDEFUN |OUTFORM;tensor;3$;100| ((|a| $) (|b| $) ($ $))
        (SPADCALL (LIST (|OUTFORM;eform| 'TENSOR $) |a| |b|) (QREFELT $ 17))) 

(DECLAIM (NOTINLINE |OutputForm;|)) 

(DEFUN |OutputForm| ()
  (SPROG NIL
         (PROG (#1=#:G1701)
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
          (LETT $ (GETREFV 128) . #1#)
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
              (|Boolean|) (|String|) (0 . |empty?|) |OUTFORM;empty;$;65|
              |OUTFORM;message;S$;2| |OUTFORM;messagePrint;SV;3|
              |OUTFORM;=;2$B;4| (|List| $) (5 . |convert|) |OUTFORM;=;3$;5|
              (|OutputForm|) |OUTFORM;coerce;2$;6| (|Integer|)
              |OUTFORM;outputForm;I$;7| (|Symbol|) |OUTFORM;outputForm;S$;8|
              (|Character|) (10 . |concat|) (16 . |concat|)
              |OUTFORM;outputForm;S$;12| |OUTFORM;hspace;I$;22|
              |OUTFORM;hconcat;3$;41| |OUTFORM;center;$I$;15|
              |OUTFORM;left;$I$;16| |OUTFORM;right;$I$;17|
              |OUTFORM;center;2$;18| |OUTFORM;left;2$;19| |OUTFORM;right;2$;20|
              |OUTFORM;vspace;I$;21| |OUTFORM;vconcat;3$;43|
              |OUTFORM;rspace;2I$;23| (|List| 16) |OUTFORM;matrix;L$;24|
              |OUTFORM;pile;L$;25| |OUTFORM;commaSeparate;L$;26|
              |OUTFORM;semicolonSeparate;L$;27| (|List| $$) (22 . |reverse|)
              (27 . |append|) |OUTFORM;blankSeparate;L$;28|
              |OUTFORM;brace;2$;29| |OUTFORM;brace;L$;30|
              |OUTFORM;bracket;2$;31| |OUTFORM;bracket;L$;32|
              |OUTFORM;paren;2$;33| |OUTFORM;paren;L$;34| |OUTFORM;sub;3$;35|
              |OUTFORM;super;3$;36| |OUTFORM;presub;3$;37|
              |OUTFORM;presuper;3$;38| (33 . |null|) (38 . |rest|)
              (43 . |first|) |OUTFORM;scripts;$L$;39| (|NonNegativeInteger|)
              (48 . |#|) |OUTFORM;supersub;$L$;40| |OUTFORM;hconcat;L$;42|
              |OUTFORM;vconcat;L$;44| |OUTFORM;~=;3$;45| |OUTFORM;<;3$;46|
              |OUTFORM;>;3$;47| |OUTFORM;<=;3$;48| |OUTFORM;>=;3$;49|
              |OUTFORM;+;3$;50| |OUTFORM;-;3$;51| |OUTFORM;-;2$;52|
              |OUTFORM;*;3$;53| |OUTFORM;/;3$;54| |OUTFORM;^;3$;55|
              |OUTFORM;rem;3$;56| |OUTFORM;quo;3$;57| |OUTFORM;exquo;3$;58|
              |OUTFORM;and;3$;59| |OUTFORM;or;3$;60| |OUTFORM;not;2$;61|
              |OUTFORM;SEGMENT;3$;62| |OUTFORM;SEGMENT;2$;63|
              |OUTFORM;binomial;3$;64| |OUTFORM;infix?;$B;66|
              |OUTFORM;elt;$L$;67| |OUTFORM;prefix;$L$;68|
              |OUTFORM;infix;$L$;69| |OUTFORM;infix;4$;70|
              |OUTFORM;postfix;3$;71| |OUTFORM;string;2$;73|
              |OUTFORM;quote;2$;74| |OUTFORM;overbar;2$;75| |OUTFORM;dot;2$;76|
              |OUTFORM;prime;$Nni$;79| |OUTFORM;prime;2$;77|
              |OUTFORM;dot;$Nni$;78| |OUTFORM;overlabel;3$;80|
              |OUTFORM;box;2$;81| |OUTFORM;zag;3$;82| |OUTFORM;root;2$;83|
              |OUTFORM;root;3$;84| |OUTFORM;over;3$;85| |OUTFORM;slash;3$;86|
              |OUTFORM;assign;3$;87| |OUTFORM;label;3$;88|
              |OUTFORM;rarrow;3$;89| (|PositiveInteger|) (|NumberFormats|)
              (53 . |FormatRoman|) (58 . |lowerCase|)
              |OUTFORM;differentiate;$Nni$;90| |OUTFORM;sum;2$;91|
              |OUTFORM;sum;3$;92| |OUTFORM;sum;4$;93| |OUTFORM;prod;2$;94|
              |OUTFORM;prod;3$;95| |OUTFORM;prod;4$;96| |OUTFORM;int;2$;97|
              |OUTFORM;int;3$;98| |OUTFORM;int;4$;99| |OUTFORM;tensor;3$;100|
              (|HashState|) (|SingleInteger|))
           '#(~= 63 |zag| 75 |vspace| 81 |vconcat| 86 |tensor| 97 |supersub|
              103 |super| 109 |sum| 115 |sub| 133 |string| 139 |slash| 144
              |semicolonSeparate| 150 |scripts| 155 |rspace| 161 |root| 167
              |right| 178 |rem| 189 |rarrow| 195 |quote| 201 |quo| 206 |prod|
              212 |print| 230 |prime| 235 |presuper| 246 |presub| 252 |prefix|
              258 |postfix| 264 |pile| 270 |paren| 275 |overlabel| 285
              |overbar| 291 |over| 296 |outputForm| 302 |or| 317 |not| 323
              |messagePrint| 328 |message| 333 |matrix| 338 |left| 343 |latex|
              354 |label| 359 |int| 365 |infix?| 383 |infix| 388 |hspace| 401
              |hconcat| 406 |hashUpdate!| 417 |hash| 423 |exquo| 428 |empty|
              434 |elt| 438 |dot| 444 |differentiate| 455 |commaSeparate| 461
              |coerce| 466 |center| 471 |bracket| 482 |brace| 492 |box| 502
              |blankSeparate| 507 |binomial| 512 |assign| 518 |and| 524 ^ 530
              SEGMENT 536 >= 547 > 553 = 559 <= 571 < 577 / 583 - 589 + 600 *
              606)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 19))
                        (|makeByteWordVec2| 127
                                            '(1 10 9 0 11 1 6 0 16 17 2 10 0 0
                                              25 26 2 10 0 25 0 27 1 45 0 0 46
                                              2 45 0 0 0 47 1 45 9 0 59 1 45 0
                                              0 60 1 45 2 0 61 1 45 63 0 64 1
                                              112 10 111 113 1 10 0 0 114 2 0 0
                                              0 0 68 2 0 9 0 0 1 2 0 0 0 0 103
                                              1 0 0 21 37 1 0 0 16 67 2 0 0 0 0
                                              38 2 0 0 0 0 125 2 0 0 0 16 65 2
                                              0 0 0 0 56 3 0 0 0 0 0 118 1 0 0
                                              0 116 2 0 0 0 0 117 2 0 0 0 0 55
                                              1 0 0 0 94 2 0 0 0 0 107 1 0 0 16
                                              44 2 0 0 0 16 62 2 0 0 21 21 39 1
                                              0 0 0 104 2 0 0 0 0 105 1 0 0 0
                                              36 2 0 0 0 21 33 2 0 0 0 0 79 2 0
                                              0 0 0 110 1 0 0 0 95 2 0 0 0 0 80
                                              3 0 0 0 0 0 121 1 0 0 0 119 2 0 0
                                              0 0 120 1 0 7 0 8 2 0 0 0 63 98 1
                                              0 0 0 99 2 0 0 0 0 58 2 0 0 0 0
                                              57 2 0 0 0 16 90 2 0 0 0 0 93 1 0
                                              0 16 42 1 0 0 16 54 1 0 0 0 53 2
                                              0 0 0 0 101 1 0 0 0 96 2 0 0 0 0
                                              106 1 0 0 23 24 1 0 0 10 28 1 0 0
                                              21 22 2 0 0 0 0 83 1 0 0 0 84 1 0
                                              7 10 14 1 0 0 10 13 1 0 0 40 41 1
                                              0 0 0 35 2 0 0 0 21 32 1 0 10 0 1
                                              2 0 0 0 0 109 3 0 0 0 0 0 124 1 0
                                              0 0 122 2 0 0 0 0 123 1 0 9 0 88
                                              3 0 0 0 0 0 92 2 0 0 0 16 91 1 0
                                              0 21 29 1 0 0 16 66 2 0 0 0 0 30
                                              2 0 126 126 0 1 1 0 127 0 1 2 0 0
                                              0 0 81 0 0 0 12 2 0 0 0 16 89 1 0
                                              0 0 97 2 0 0 0 63 100 2 0 0 0 63
                                              115 1 0 0 16 43 1 0 19 0 20 1 0 0
                                              0 34 2 0 0 0 21 31 1 0 0 16 52 1
                                              0 0 0 51 1 0 0 0 49 1 0 0 16 50 1
                                              0 0 0 102 1 0 0 16 48 2 0 0 0 0
                                              87 2 0 0 0 0 108 2 0 0 0 0 82 2 0
                                              0 0 0 78 1 0 0 0 86 2 0 0 0 0 85
                                              2 0 0 0 0 72 2 0 0 0 0 70 2 0 0 0
                                              0 18 2 0 9 0 0 15 2 0 0 0 0 71 2
                                              0 0 0 0 69 2 0 0 0 0 77 1 0 0 0
                                              75 2 0 0 0 0 74 2 0 0 0 0 73 2 0
                                              0 0 0 76)))))
           '|lookupComplete|)) 

(MAKEPROP '|OutputForm| 'NILADIC T) 
