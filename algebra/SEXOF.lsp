
(/VERSIONCHECK 2) 

(DEFUN |SEXOF;coerce;$Of;1| (|b| $)
  (PROG (|l1| #1=#:G148 |l| |b1| #2=#:G147 |r|)
    (RETURN
     (SEQ
      (COND ((SPADCALL |b| (QREFELT $ 13)) (SPADCALL NIL (QREFELT $ 16)))
            ((SPADCALL |b| (QREFELT $ 17)) |b|)
            ('T
             (SEQ (LETT |r| |b| . #3=(|SEXOF;coerce;$Of;1|))
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((SPADCALL |r| (QREFELT $ 17)) 'NIL) ('T 'T)))
                         (GO G191)))
                       (SEQ
                        (EXIT (LETT |r| (SPADCALL |r| (QREFELT $ 18)) . #3#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |l1|
                        (PROGN
                         (LETT #2# NIL . #3#)
                         (SEQ (LETT |b1| NIL . #3#)
                              (LETT #1#
                                    (LETT |l| (SPADCALL |b| (QREFELT $ 19))
                                          . #3#)
                                    . #3#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |b1| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |b1| (QREFELT $ 20)) #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))
                        . #3#)
                  (COND
                   ((NULL (SPADCALL |r| (QREFELT $ 13)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL |l1|
                                 (LIST (QREFELT $ 11)
                                       (SPADCALL |r| (QREFELT $ 20)))
                                 (QREFELT $ 22))
                       (QREFELT $ 23))
                      (QREFELT $ 24)))))
                  (COND
                   ((EQL (SPADCALL |l| (QREFELT $ 27)) 2)
                    (COND
                     ((SPADCALL (|SPADfirst| |l1|) 'QUOTE (QREFELT $ 28))
                      (EXIT
                       (SPADCALL (|SPADfirst| (CDR |l1|)) (QREFELT $ 29)))))))
                  (EXIT
                   (SPADCALL (SPADCALL |l1| (QREFELT $ 23))
                             (QREFELT $ 24)))))))))) 

(PUT '|SEXOF;=;2$B;2| '|SPADreplace| 'EQUAL) 

(DEFUN |SEXOF;=;2$B;2| (|b1| |b2| $) (EQUAL |b1| |b2|)) 

(PUT '|SEXOF;eq;2$B;3| '|SPADreplace| 'EQ) 

(DEFUN |SEXOF;eq;2$B;3| (|b1| |b2| $) (EQ |b1| |b2|)) 

(PUT '|SEXOF;null?;$B;4| '|SPADreplace| 'NULL) 

(DEFUN |SEXOF;null?;$B;4| (|b| $) (NULL |b|)) 

(PUT '|SEXOF;atom?;$B;5| '|SPADreplace| 'ATOM) 

(DEFUN |SEXOF;atom?;$B;5| (|b| $) (ATOM |b|)) 

(PUT '|SEXOF;pair?;$B;6| '|SPADreplace| 'PAIRP) 

(DEFUN |SEXOF;pair?;$B;6| (|b| $) (PAIRP |b|)) 

(DEFUN |SEXOF;list?;$B;7| (|b| $) (COND ((PAIRP |b|) 'T) ('T (NULL |b|)))) 

(PUT '|SEXOF;string?;$B;8| '|SPADreplace| 'STRINGP) 

(DEFUN |SEXOF;string?;$B;8| (|b| $) (STRINGP |b|)) 

(PUT '|SEXOF;symbol?;$B;9| '|SPADreplace| 'IDENTP) 

(DEFUN |SEXOF;symbol?;$B;9| (|b| $) (IDENTP |b|)) 

(PUT '|SEXOF;integer?;$B;10| '|SPADreplace| 'INTEGERP) 

(DEFUN |SEXOF;integer?;$B;10| (|b| $) (INTEGERP |b|)) 

(PUT '|SEXOF;float?;$B;11| '|SPADreplace| 'FLOATP) 

(DEFUN |SEXOF;float?;$B;11| (|b| $) (FLOATP |b|)) 

(DEFUN |SEXOF;destruct;$L;12| (|b| $)
  (COND ((SPADCALL |b| (QREFELT $ 33)) |b|) ('T (|error| "Non-list")))) 

(DEFUN |SEXOF;string;$Str;13| (|b| $)
  (COND ((STRINGP |b|) |b|) ('T (|error| "Non-string")))) 

(DEFUN |SEXOF;symbol;$Sym;14| (|b| $)
  (COND ((IDENTP |b|) |b|) ('T (|error| "Non-symbol")))) 

(DEFUN |SEXOF;float;$Flt;15| (|b| $)
  (COND ((FLOATP |b|) |b|) ('T (|error| "Non-float")))) 

(DEFUN |SEXOF;integer;$Int;16| (|b| $)
  (COND ((INTEGERP |b|) |b|) ('T (|error| "Non-integer")))) 

(PUT '|SEXOF;expr;$Expr;17| '|SPADreplace| '(XLAM (|b|) |b|)) 

(DEFUN |SEXOF;expr;$Expr;17| (|b| $) |b|) 

(PUT '|SEXOF;convert;L$;18| '|SPADreplace| '(XLAM (|l|) |l|)) 

(DEFUN |SEXOF;convert;L$;18| (|l| $) |l|) 

(PUT '|SEXOF;convert;Str$;19| '|SPADreplace| '(XLAM (|st|) |st|)) 

(DEFUN |SEXOF;convert;Str$;19| (|st| $) |st|) 

(PUT '|SEXOF;convert;Sym$;20| '|SPADreplace| '(XLAM (|sy|) |sy|)) 

(DEFUN |SEXOF;convert;Sym$;20| (|sy| $) |sy|) 

(PUT '|SEXOF;convert;Int$;21| '|SPADreplace| '(XLAM (|n|) |n|)) 

(DEFUN |SEXOF;convert;Int$;21| (|n| $) |n|) 

(PUT '|SEXOF;convert;Flt$;22| '|SPADreplace| '(XLAM (|f|) |f|)) 

(DEFUN |SEXOF;convert;Flt$;22| (|f| $) |f|) 

(PUT '|SEXOF;convert;Expr$;23| '|SPADreplace| '(XLAM (|e|) |e|)) 

(DEFUN |SEXOF;convert;Expr$;23| (|e| $) |e|) 

(PUT '|SEXOF;car;2$;24| '|SPADreplace| 'CAR) 

(DEFUN |SEXOF;car;2$;24| (|b| $) (CAR |b|)) 

(PUT '|SEXOF;cdr;2$;25| '|SPADreplace| 'CDR) 

(DEFUN |SEXOF;cdr;2$;25| (|b| $) (CDR |b|)) 

(PUT '|SEXOF;#;$I;26| '|SPADreplace| 'LENGTH) 

(DEFUN |SEXOF;#;$I;26| (|b| $) (LENGTH |b|)) 

(DEFUN |SEXOF;elt;$I$;27| (|b| |i| $)
  (SPADCALL (SPADCALL |b| (QREFELT $ 19)) |i| (QREFELT $ 52))) 

(DEFUN |SEXOF;elt;$L$;28| (|b| |li| $)
  (PROG (#1=#:G184 |i|)
    (RETURN
     (SEQ
      (SEQ (LETT |i| NIL . #2=(|SEXOF;elt;$L$;28|)) (LETT #1# |li| . #2#) G190
           (COND
            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL)) (GO G191)))
           (SEQ
            (EXIT
             (LETT |b|
                   (SPADCALL (SPADCALL |b| (QREFELT $ 19)) |i| (QREFELT $ 52))
                   . #2#)))
           (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
      (EXIT |b|))))) 

(DEFUN |SExpressionOf| (&REST #1=#:G185)
  (PROG ()
    (RETURN
     (PROG (#2=#:G186)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|SExpressionOf|)
                                           '|domainEqualList|)
                . #3=(|SExpressionOf|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |SExpressionOf;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|SExpressionOf|))))))))))) 

(DEFUN |SExpressionOf;| (|#1| |#2| |#3| |#4| |#5|)
  (PROG (|pv$| $ |dv$| DV$5 DV$4 DV$3 DV$2 DV$1)
    (RETURN
     (PROGN
      (LETT DV$1 (|devaluate| |#1|) . #1=(|SExpressionOf|))
      (LETT DV$2 (|devaluate| |#2|) . #1#)
      (LETT DV$3 (|devaluate| |#3|) . #1#)
      (LETT DV$4 (|devaluate| |#4|) . #1#)
      (LETT DV$5 (|devaluate| |#5|) . #1#)
      (LETT |dv$| (LIST '|SExpressionOf| DV$1 DV$2 DV$3 DV$4 DV$5) . #1#)
      (LETT $ (GETREFV 58) . #1#)
      (QSETREFV $ 0 |dv$|)
      (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
      (|haddProp| |$ConstructorCache| '|SExpressionOf|
                  (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
      (|stuffDomainSlots| $)
      (QSETREFV $ 6 |#1|)
      (QSETREFV $ 7 |#2|)
      (QSETREFV $ 8 |#3|)
      (QSETREFV $ 9 |#4|)
      (QSETREFV $ 10 |#5|)
      (SETF |pv$| (QREFELT $ 3))
      (QSETREFV $ 11 (INTERN "."))
      $)))) 

(MAKEPROP '|SExpressionOf| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) '|dotex| (|Boolean|)
              |SEXOF;null?;$B;4| (|List| $) (|OutputForm|) (0 . |paren|)
              |SEXOF;atom?;$B;5| |SEXOF;cdr;2$;25| |SEXOF;destruct;$L;12|
              |SEXOF;coerce;$Of;1| (|List| 15) (5 . |concat!|)
              (11 . |blankSeparate|) (16 . |paren|) (|NonNegativeInteger|)
              (|List| $$) (21 . |#|) (26 . =) (32 . |quote|) |SEXOF;=;2$B;2|
              |SEXOF;eq;2$B;3| |SEXOF;pair?;$B;6| |SEXOF;list?;$B;7|
              |SEXOF;string?;$B;8| |SEXOF;symbol?;$B;9| |SEXOF;integer?;$B;10|
              |SEXOF;float?;$B;11| |SEXOF;string;$Str;13|
              |SEXOF;symbol;$Sym;14| |SEXOF;float;$Flt;15|
              |SEXOF;integer;$Int;16| |SEXOF;expr;$Expr;17|
              |SEXOF;convert;L$;18| |SEXOF;convert;Str$;19|
              |SEXOF;convert;Sym$;20| |SEXOF;convert;Int$;21|
              |SEXOF;convert;Flt$;22| |SEXOF;convert;Expr$;23|
              |SEXOF;car;2$;24| (|Integer|) |SEXOF;#;$I;26| (37 . |elt|)
              |SEXOF;elt;$I$;27| (|List| 50) |SEXOF;elt;$L$;28| (|String|)
              (|SingleInteger|))
           '#(~= 43 |symbol?| 49 |symbol| 54 |string?| 59 |string| 64 |pair?|
              69 |null?| 74 |list?| 79 |latex| 84 |integer?| 89 |integer| 94
              |hash| 99 |float?| 104 |float| 109 |expr| 114 |eq| 119 |elt| 125
              |destruct| 137 |convert| 142 |coerce| 172 |cdr| 177 |car| 182
              |atom?| 187 = 192 |#| 198)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(NIL |SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SExpressionCategory| 6 7 8 9 10) (|SetCategory|)
                           (|BasicType|) (|CoercibleTo| 15))
                        (|makeByteWordVec2| 57
                                            '(1 15 0 14 16 2 21 0 0 0 22 1 15 0
                                              14 23 1 15 0 0 24 1 26 25 0 27 2
                                              15 12 0 0 28 1 15 0 0 29 2 26 2 0
                                              50 52 2 0 12 0 0 1 1 0 12 0 35 1
                                              0 7 0 39 1 0 12 0 34 1 0 6 0 38 1
                                              0 12 0 32 1 0 12 0 13 1 0 12 0 33
                                              1 0 56 0 1 1 0 12 0 36 1 0 8 0 41
                                              1 0 57 0 1 1 0 12 0 37 1 0 9 0 40
                                              1 0 10 0 42 2 0 12 0 0 31 2 0 0 0
                                              54 55 2 0 0 0 50 53 1 0 14 0 19 1
                                              0 0 9 47 1 0 0 10 48 1 0 0 7 45 1
                                              0 0 8 46 1 0 0 14 43 1 0 0 6 44 1
                                              0 15 0 20 1 0 0 0 18 1 0 0 0 49 1
                                              0 12 0 17 2 0 12 0 0 30 1 0 50 0
                                              51)))))
           '|lookupComplete|)) 
