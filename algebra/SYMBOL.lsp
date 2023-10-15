
(SDEFUN |SYMBOL;writeOMSym| ((|dev| |OpenMathDevice|) (|x| $) ($ |Void|))
        (COND
         ((SPADCALL |x| (QREFELT $ 21))
          (|error| "Cannot convert a scripted symbol to OpenMath"))
         ('T (SPADCALL |dev| |x| (QREFELT $ 25))))) 

(SDEFUN |SYMBOL;OMwrite;Omd$BV;2|
        ((|dev| |OpenMathDevice|) (|x| $) (|wholeObj| |Boolean|) ($ |Void|))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 26))))
             (|SYMBOL;writeOMSym| |dev| |x| $)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 27))))))) 

(SDEFUN |SYMBOL;convert;$If;3| ((|s| $) ($ |InputForm|))
        (SPADCALL |s| (QREFELT $ 33))) 

(PUT '|SYMBOL;convert;2$;4| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |SYMBOL;convert;2$;4| ((|s| $) ($ |Symbol|)) |s|) 

(SDEFUN |SYMBOL;coerce;S$;5| ((|s| |String|) ($ $)) (VALUES (INTERN |s|))) 

(PUT '|SYMBOL;=;2$B;6| '|SPADreplace| 'EQUAL) 

(SDEFUN |SYMBOL;=;2$B;6| ((|x| $) (|y| $) ($ |Boolean|)) (EQUAL |x| |y|)) 

(SDEFUN |SYMBOL;hashUpdate!;Hs$Hs;7|
        ((|hs| . #1=(|HashState|)) (|s| $) ($ . #1#))
        (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(PUT '|SYMBOL;<;2$B;8| '|SPADreplace| '(XLAM (|x| |y|) (GGREATERP |y| |x|))) 

(SDEFUN |SYMBOL;<;2$B;8| ((|x| $) (|y| $) ($ |Boolean|)) (GGREATERP |y| |x|)) 

(SDEFUN |SYMBOL;coerce;$Of;9| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|a| (|List| (|OutputForm|))) (|x0| (|OutputForm|))
          (|sl| (|List| (|OutputForm|))) (|se| (|OutputForm|)) (#1=#:G1935 NIL)
          (|si| NIL) (|rsl| (|List| (|List| (|OutputForm|))))
          (|ss|
           (|Record| (|:| |sub| (|List| (|OutputForm|)))
                     (|:| |sup| (|List| (|OutputForm|)))
                     (|:| |presup| (|List| (|OutputForm|)))
                     (|:| |presub| (|List| (|OutputForm|)))
                     (|:| |args| (|List| (|OutputForm|))))))
         (SEQ
          (COND
           ((NULL (SPADCALL |x| (QREFELT $ 21))) (SPADCALL |x| (QREFELT $ 43)))
           ('T
            (SEQ
             (LETT |ss| (SPADCALL |x| (QREFELT $ 45))
                   . #2=(|SYMBOL;coerce;$Of;9|))
             (LETT |rsl|
                   (LIST (QVELT |ss| 3) (QVELT |ss| 2) (QVELT |ss| 1)
                         (QVELT |ss| 0))
                   . #2#)
             (LETT |sl| NIL . #2#)
             (SEQ (LETT |si| NIL . #2#) (LETT #1# |rsl| . #2#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |si| (CAR #1#) . #2#) NIL))
                    (GO G191)))
                  (SEQ
                   (COND ((NULL |sl|) (COND ((NULL |si|) (EXIT "iterate")))))
                   (LETT |se|
                         (COND ((EQL (LENGTH |si|) 1) (|SPADfirst| |si|))
                               ('T (SPADCALL |si| (QREFELT $ 47))))
                         . #2#)
                   (EXIT (LETT |sl| (CONS |se| |sl|) . #2#)))
                  (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
             (LETT |x0|
                   (SPADCALL
                    (SPADCALL (SPADCALL |x| (QREFELT $ 48)) (QREFELT $ 43))
                    |sl| (QREFELT $ 49))
                   . #2#)
             (LETT |a| (QVELT |ss| 4) . #2#)
             (EXIT
              (COND ((NULL |a|) |x0|)
                    ('T (SPADCALL |x0| |a| (QREFELT $ 50))))))))))) 

(SDEFUN |SYMBOL;subscript;$L$;10| ((|sy| $) (|lx| |List| (|OutputForm|)) ($ $))
        (SPADCALL |sy| (LIST |lx| NIL NIL NIL NIL) (QREFELT $ 55))) 

(SDEFUN |SYMBOL;elt;$L$;11| ((|sy| $) (|lx| |List| (|OutputForm|)) ($ $))
        (SPADCALL |sy| |lx| (QREFELT $ 57))) 

(SDEFUN |SYMBOL;superscript;$L$;12|
        ((|sy| $) (|lx| |List| (|OutputForm|)) ($ $))
        (SPADCALL |sy| (LIST NIL |lx| NIL NIL NIL) (QREFELT $ 55))) 

(SDEFUN |SYMBOL;argscript;$L$;13| ((|sy| $) (|lx| |List| (|OutputForm|)) ($ $))
        (SPADCALL |sy| (LIST NIL NIL NIL NIL |lx|) (QREFELT $ 55))) 

(SDEFUN |SYMBOL;patternMatch;$P2Pmr;14|
        ((|x| $) (|p| |Pattern| #1=(|Integer|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 64))) 

(SDEFUN |SYMBOL;patternMatch;$P2Pmr;15|
        ((|x| $) (|p| |Pattern| #1=(|Float|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 70))) 

(SDEFUN |SYMBOL;convert;$P;16| ((|x| $) ($ |Pattern| (|Float|)))
        (SPADCALL |x| (QREFELT $ 73))) 

(SDEFUN |SYMBOL;convert;$P;17| ((|x| $) ($ |Pattern| (|Integer|)))
        (SPADCALL |x| (QREFELT $ 75))) 

(SDEFUN |SYMBOL;syprefix|
        ((|sc| |Record| (|:| |sub| (|List| (|OutputForm|)))
          (|:| |sup| (|List| (|OutputForm|)))
          (|:| |presup| (|List| (|OutputForm|)))
          (|:| |presub| (|List| (|OutputForm|)))
          (|:| |args| (|List| (|OutputForm|))))
         ($ |String|))
        (SPROG
         ((#1=#:G1949 NIL) (|n| NIL) (#2=#:G1948 NIL)
          (|ns| (|List| (|Integer|))))
         (SEQ
          (LETT |ns|
                (LIST (LENGTH (QVELT |sc| 3)) (LENGTH (QVELT |sc| 2))
                      (LENGTH (QVELT |sc| 1)) (LENGTH (QVELT |sc| 0)))
                . #3=(|SYMBOL;syprefix|))
          (EXIT
           (SPADCALL
            (CONS
             (STRCONC (QREFELT $ 29)
                      (|SYMBOL;istring| (LENGTH (QVELT |sc| 4)) $))
             (PROGN
              (LETT #2# NIL . #3#)
              (SEQ (LETT |n| NIL . #3#) (LETT #1# (NREVERSE |ns|) . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT #2# (CONS (|SYMBOL;istring| |n| $) #2#) . #3#)))
                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                   (EXIT (NREVERSE #2#)))))
            (QREFELT $ 77)))))) 

(SDEFUN |SYMBOL;syscripts|
        ((|sc| |Record| (|:| |sub| (|List| (|OutputForm|)))
          (|:| |sup| (|List| (|OutputForm|)))
          (|:| |presup| (|List| (|OutputForm|)))
          (|:| |presub| #1=(|List| (|OutputForm|)))
          (|:| |args| (|List| (|OutputForm|))))
         ($ |List| (|OutputForm|)))
        (SPROG ((|all| #1#))
               (SEQ (LETT |all| (QVELT |sc| 3) . #2=(|SYMBOL;syscripts|))
                    (LETT |all| (SPADCALL (QVELT |sc| 2) |all| (QREFELT $ 78))
                          . #2#)
                    (LETT |all| (SPADCALL (QVELT |sc| 1) |all| (QREFELT $ 78))
                          . #2#)
                    (LETT |all| (SPADCALL (QVELT |sc| 0) |all| (QREFELT $ 78))
                          . #2#)
                    (EXIT (SPADCALL |all| (QVELT |sc| 4) (QREFELT $ 78)))))) 

(SDEFUN |SYMBOL;script;$L$;20|
        ((|sy| $) (|ls| |List| (|List| (|OutputForm|))) ($ $))
        (SPROG
         ((|sc|
           (|Record| (|:| |sub| (|List| (|OutputForm|)))
                     (|:| |sup| (|List| (|OutputForm|)))
                     (|:| |presup| (|List| (|OutputForm|)))
                     (|:| |presub| (|List| (|OutputForm|)))
                     (|:| |args| (|List| (|OutputForm|))))))
         (SEQ
          (LETT |sc| (VECTOR NIL NIL NIL NIL NIL)
                . #1=(|SYMBOL;script;$L$;20|))
          (COND
           ((NULL (NULL |ls|))
            (SEQ (QSETVELT |sc| 0 (|SPADfirst| |ls|))
                 (EXIT (LETT |ls| (CDR |ls|) . #1#)))))
          (COND
           ((NULL (NULL |ls|))
            (SEQ (QSETVELT |sc| 1 (|SPADfirst| |ls|))
                 (EXIT (LETT |ls| (CDR |ls|) . #1#)))))
          (COND
           ((NULL (NULL |ls|))
            (SEQ (QSETVELT |sc| 2 (|SPADfirst| |ls|))
                 (EXIT (LETT |ls| (CDR |ls|) . #1#)))))
          (COND
           ((NULL (NULL |ls|))
            (SEQ (QSETVELT |sc| 3 (|SPADfirst| |ls|))
                 (EXIT (LETT |ls| (CDR |ls|) . #1#)))))
          (COND
           ((NULL (NULL |ls|))
            (SEQ (QSETVELT |sc| 4 (|SPADfirst| |ls|))
                 (EXIT (LETT |ls| (CDR |ls|) . #1#)))))
          (EXIT (SPADCALL |sy| |sc| (QREFELT $ 79)))))) 

(SDEFUN |SYMBOL;script;$R$;21|
        ((|sy| $)
         (|sc| |Record| (|:| |sub| (|List| (|OutputForm|)))
          (|:| |sup| (|List| (|OutputForm|)))
          (|:| |presup| (|List| (|OutputForm|)))
          (|:| |presub| (|List| (|OutputForm|)))
          (|:| |args| (|List| (|OutputForm|))))
         ($ $))
        (COND
         ((SPADCALL |sy| (QREFELT $ 21))
          (|error| "Cannot add scripts to a scripted symbol"))
         ('T
          (CONS
           (SPADCALL
            (SPADCALL
             (STRCONC (|SYMBOL;syprefix| |sc| $)
                      (SPADCALL (SPADCALL |sy| (QREFELT $ 48)) (QREFELT $ 80)))
             (QREFELT $ 37))
            (QREFELT $ 51))
           (|SYMBOL;syscripts| |sc| $))))) 

(SDEFUN |SYMBOL;string;$S;22| ((|e| $) ($ |String|))
        (COND ((NULL (SPADCALL |e| (QREFELT $ 21))) (PNAME |e|))
              ('T (|error| "Cannot form string from non-atomic symbols.")))) 

(SDEFUN |SYMBOL;latex;$S;23| ((|e| $) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|sc| (|String|)) (|lo| (|List| (|OutputForm|)))
          (|ss|
           (|Record| (|:| |sub| (|List| (|OutputForm|)))
                     (|:| |sup| (|List| (|OutputForm|)))
                     (|:| |presup| (|List| (|OutputForm|)))
                     (|:| |presub| (|List| (|OutputForm|)))
                     (|:| |args| (|List| (|OutputForm|))))))
         (SEQ
          (LETT |s| (PNAME (SPADCALL |e| (QREFELT $ 48)))
                . #1=(|SYMBOL;latex;$S;23|))
          (COND
           ((SPADCALL (QCSIZE |s|) 1 (QREFELT $ 82))
            (COND
             ((SPADCALL (SPADCALL |s| 1 (QREFELT $ 84)) (|STR_to_CHAR| "\\")
                        (QREFELT $ 85))
              (LETT |s| (STRCONC "\\mbox{\\it " (STRCONC |s| "}")) . #1#)))))
          (COND ((NULL (SPADCALL |e| (QREFELT $ 21))) (EXIT |s|)))
          (LETT |ss| (SPADCALL |e| (QREFELT $ 45)) . #1#)
          (LETT |lo| (QVELT |ss| 0) . #1#)
          (COND
           ((NULL (NULL |lo|))
            (SEQ (LETT |sc| "_{" . #1#)
                 (SEQ G190
                      (COND
                       ((NULL (COND ((NULL |lo|) 'NIL) ('T 'T))) (GO G191)))
                      (SEQ
                       (LETT |sc|
                             (STRCONC |sc|
                                      (SPADCALL (|SPADfirst| |lo|)
                                                (QREFELT $ 86)))
                             . #1#)
                       (LETT |lo| (CDR |lo|) . #1#)
                       (EXIT
                        (COND
                         ((NULL (NULL |lo|))
                          (LETT |sc| (STRCONC |sc| ", ") . #1#)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |sc| (STRCONC |sc| "}") . #1#)
                 (EXIT (LETT |s| (STRCONC |s| |sc|) . #1#)))))
          (LETT |lo| (QVELT |ss| 1) . #1#)
          (COND
           ((NULL (NULL |lo|))
            (SEQ (LETT |sc| "^{" . #1#)
                 (SEQ G190
                      (COND
                       ((NULL (COND ((NULL |lo|) 'NIL) ('T 'T))) (GO G191)))
                      (SEQ
                       (LETT |sc|
                             (STRCONC |sc|
                                      (SPADCALL (|SPADfirst| |lo|)
                                                (QREFELT $ 86)))
                             . #1#)
                       (LETT |lo| (CDR |lo|) . #1#)
                       (EXIT
                        (COND
                         ((NULL (NULL |lo|))
                          (LETT |sc| (STRCONC |sc| ", ") . #1#)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |sc| (STRCONC |sc| "}") . #1#)
                 (EXIT (LETT |s| (STRCONC |s| |sc|) . #1#)))))
          (LETT |lo| (QVELT |ss| 2) . #1#)
          (COND
           ((NULL (NULL |lo|))
            (SEQ (LETT |sc| "{}^{" . #1#)
                 (SEQ G190
                      (COND
                       ((NULL (COND ((NULL |lo|) 'NIL) ('T 'T))) (GO G191)))
                      (SEQ
                       (LETT |sc|
                             (STRCONC |sc|
                                      (SPADCALL (|SPADfirst| |lo|)
                                                (QREFELT $ 86)))
                             . #1#)
                       (LETT |lo| (CDR |lo|) . #1#)
                       (EXIT
                        (COND
                         ((NULL (NULL |lo|))
                          (LETT |sc| (STRCONC |sc| ", ") . #1#)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |sc| (STRCONC |sc| "}") . #1#)
                 (EXIT (LETT |s| (STRCONC |sc| |s|) . #1#)))))
          (LETT |lo| (QVELT |ss| 3) . #1#)
          (COND
           ((NULL (NULL |lo|))
            (SEQ (LETT |sc| "{}_{" . #1#)
                 (SEQ G190
                      (COND
                       ((NULL (COND ((NULL |lo|) 'NIL) ('T 'T))) (GO G191)))
                      (SEQ
                       (LETT |sc|
                             (STRCONC |sc|
                                      (SPADCALL (|SPADfirst| |lo|)
                                                (QREFELT $ 86)))
                             . #1#)
                       (LETT |lo| (CDR |lo|) . #1#)
                       (EXIT
                        (COND
                         ((NULL (NULL |lo|))
                          (LETT |sc| (STRCONC |sc| ", ") . #1#)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |sc| (STRCONC |sc| "}") . #1#)
                 (EXIT (LETT |s| (STRCONC |sc| |s|) . #1#)))))
          (LETT |lo| (QVELT |ss| 4) . #1#)
          (COND
           ((NULL (NULL |lo|))
            (SEQ (LETT |sc| "\\left( {" . #1#)
                 (SEQ G190
                      (COND
                       ((NULL (COND ((NULL |lo|) 'NIL) ('T 'T))) (GO G191)))
                      (SEQ
                       (LETT |sc|
                             (STRCONC |sc|
                                      (SPADCALL (|SPADfirst| |lo|)
                                                (QREFELT $ 86)))
                             . #1#)
                       (LETT |lo| (CDR |lo|) . #1#)
                       (EXIT
                        (COND
                         ((NULL (NULL |lo|))
                          (LETT |sc| (STRCONC |sc| ", ") . #1#)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |sc| (STRCONC |sc| "} \\right)") . #1#)
                 (EXIT (LETT |s| (STRCONC |s| |sc|) . #1#)))))
          (EXIT |s|)))) 

(SDEFUN |SYMBOL;anyRadix| ((|n| |Integer|) (|s| |String|) ($ |String|))
        (SPROG
         ((#1=#:G2004 NIL) (|ns| (|String|))
          (|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|)))))
         (SEQ
          (EXIT
           (SEQ (LETT |ns| "" . #2=(|SYMBOL;anyRadix|))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |qr| (DIVIDE2 |n| (QCSIZE |s|)) . #2#)
                           (LETT |n| (QCAR |qr|) . #2#)
                           (LETT |ns|
                                 (SPADCALL
                                  (SPADCALL |s|
                                            (+ (QCDR |qr|)
                                               (SPADCALL |s| (QREFELT $ 88)))
                                            (QREFELT $ 84))
                                  |ns| (QREFELT $ 89))
                                 . #2#)
                           (EXIT
                            (COND
                             ((ZEROP |n|)
                              (PROGN (LETT #1# |ns| . #2#) (GO #3=#:G2003))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

(SDEFUN |SYMBOL;new;$;25| (($ $))
        (SPROG ((|sym| (|String|)))
               (SEQ
                (LETT |sym|
                      (|SYMBOL;anyRadix|
                       (SPADCALL (QREFELT $ 9) (QREFELT $ 90)) (QREFELT $ 18)
                       $)
                      |SYMBOL;new;$;25|)
                (SPADCALL (QREFELT $ 9)
                          (+ (SPADCALL (QREFELT $ 9) (QREFELT $ 90)) 1)
                          (QREFELT $ 91))
                (EXIT (SPADCALL (STRCONC "%" |sym|) (QREFELT $ 37)))))) 

(SDEFUN |SYMBOL;new;2$;26| ((|x| $) ($ $))
        (SPROG
         ((|xx| (|String|)) (|n| (|Integer|))
          (|u| (|Union| (|Integer|) "failed")))
         (SEQ
          (LETT |n|
                (SEQ
                 (LETT |u| (SPADCALL |x| (QREFELT $ 12) (QREFELT $ 94))
                       . #1=(|SYMBOL;new;2$;26|))
                 (EXIT (COND ((QEQCAR |u| 1) 0) (#2='T (+ (QCDR |u|) 1)))))
                . #1#)
          (SPADCALL (QREFELT $ 12) |x| |n| (QREFELT $ 95))
          (LETT |xx|
                (COND
                 ((NULL (SPADCALL |x| (QREFELT $ 21)))
                  (SPADCALL |x| (QREFELT $ 80)))
                 ('T (SPADCALL (SPADCALL |x| (QREFELT $ 48)) (QREFELT $ 80))))
                . #1#)
          (LETT |xx| (STRCONC "%" |xx|) . #1#)
          (LETT |xx|
                (COND
                 ((>=
                   (SPADCALL
                    (SPADCALL |xx| (SPADCALL |xx| (QREFELT $ 96))
                              (QREFELT $ 84))
                    (QREFELT $ 17) (QREFELT $ 97))
                   (SPADCALL (QREFELT $ 17) (QREFELT $ 88)))
                  (STRCONC |xx| (|SYMBOL;anyRadix| |n| (QREFELT $ 19) $)))
                 (#2# (STRCONC |xx| (|SYMBOL;anyRadix| |n| (QREFELT $ 17) $))))
                . #1#)
          (COND
           ((NULL (SPADCALL |x| (QREFELT $ 21)))
            (EXIT (SPADCALL |xx| (QREFELT $ 37)))))
          (EXIT
           (SPADCALL (SPADCALL |xx| (QREFELT $ 37))
                     (SPADCALL |x| (QREFELT $ 45)) (QREFELT $ 79)))))) 

(SDEFUN |SYMBOL;resetNew;V;27| (($ |Void|))
        (SPROG ((#1=#:G2026 NIL) (|k| NIL))
               (SEQ (SPADCALL (QREFELT $ 9) 0 (QREFELT $ 91))
                    (SEQ (LETT |k| NIL . #2=(|SYMBOL;resetNew;V;27|))
                         (LETT #1# (SPADCALL (QREFELT $ 12) (QREFELT $ 99))
                               . #2#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT (SPADCALL |k| (QREFELT $ 12) (QREFELT $ 100))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL (QREFELT $ 101)))))) 

(SDEFUN |SYMBOL;scripted?;$B;28| ((|sy| $) ($ |Boolean|))
        (COND ((ATOM |sy|) 'NIL) ('T 'T))) 

(PUT '|SYMBOL;of_list| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SYMBOL;of_list| ((|x| $) ($ |List| (|OutputForm|))) |x|) 

(SDEFUN |SYMBOL;name;2$;30| ((|sy| $) ($ $))
        (SPROG ((|si| (|NonNegativeInteger|)) (|str| (|String|)))
               (SEQ
                (COND ((NULL (SPADCALL |sy| (QREFELT $ 21))) |sy|)
                      ('T
                       (SEQ
                        (LETT |str|
                              (SPADCALL (|SPADfirst| (|SYMBOL;of_list| |sy| $))
                                        (QREFELT $ 80))
                              . #1=(|SYMBOL;name;2$;30|))
                        (LETT |si| (+ (+ (QREFELT $ 30) 4) 2) . #1#)
                        (EXIT
                         (SPADCALL
                          (SPADCALL |str|
                                    (SPADCALL |si| (QCSIZE |str|)
                                              (QREFELT $ 104))
                                    (QREFELT $ 105))
                          (QREFELT $ 37))))))))) 

(SDEFUN |SYMBOL;scripts;$R;31|
        ((|sy| $)
         ($ |Record| (|:| |sub| (|List| (|OutputForm|)))
          (|:| |sup| (|List| (|OutputForm|)))
          (|:| |presup| (|List| (|OutputForm|)))
          (|:| |presub| (|List| (|OutputForm|)))
          (|:| |args| (|List| (|OutputForm|)))))
        (SPROG
         ((|allscripts| (|List| (|OutputForm|))) (|i| NIL) (#1=#:G2042 NIL)
          (|n| NIL) (|m| (|Integer|))
          (|nscripts| (|List| (|NonNegativeInteger|))) (#2=#:G2034 NIL)
          (#3=#:G2041 NIL) (|j| NIL) (|nstr| (|NonNegativeInteger|))
          (|str| (|String|)) (|lscripts| (|List| (|List| (|OutputForm|)))))
         (SEQ
          (COND
           ((NULL (SPADCALL |sy| (QREFELT $ 21))) (VECTOR NIL NIL NIL NIL NIL))
           ('T
            (SEQ
             (LETT |nscripts| (LIST 0 0 0 0 0) . #4=(|SYMBOL;scripts;$R;31|))
             (LETT |lscripts| (LIST NIL NIL NIL NIL NIL) . #4#)
             (LETT |str|
                   (SPADCALL (|SPADfirst| (|SYMBOL;of_list| |sy| $))
                             (QREFELT $ 80))
                   . #4#)
             (LETT |nstr| (QCSIZE |str|) . #4#)
             (LETT |m| (SPADCALL |nscripts| (QREFELT $ 107)) . #4#)
             (SEQ (LETT |j| (+ (QREFELT $ 30) 1) . #4#)
                  (LETT #3# (+ (+ (QREFELT $ 30) 4) 1) . #4#)
                  (LETT |i| |m| . #4#) G190 (COND ((> |j| #3#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |nscripts| |i|
                              (PROG1
                                  (LETT #2#
                                        (- (SPADCALL |str| |j| (QREFELT $ 84))
                                           (QREFELT $ 31))
                                        . #4#)
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#))
                              (QREFELT $ 108))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #4#)) . #4#)
                  (GO G190) G191 (EXIT NIL))
             (LETT |nscripts|
                   (SPADCALL (CDR |nscripts|) (|SPADfirst| |nscripts|)
                             (QREFELT $ 109))
                   . #4#)
             (LETT |allscripts| (CDR (|SYMBOL;of_list| |sy| $)) . #4#)
             (LETT |m| (SPADCALL |lscripts| (QREFELT $ 110)) . #4#)
             (SEQ (LETT |n| NIL . #4#) (LETT #1# |nscripts| . #4#)
                  (LETT |i| |m| . #4#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #4#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((< (LENGTH |allscripts|) |n|)
                      (|error| "Improper script count in symbol"))
                     ('T
                      (SEQ
                       (SPADCALL |lscripts| |i|
                                 (SPADCALL |allscripts| |n| (QREFELT $ 111))
                                 (QREFELT $ 112))
                       (EXIT
                        (LETT |allscripts|
                              (SPADCALL |allscripts| |n| (QREFELT $ 113))
                              . #4#)))))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT #1# (CDR #1#) . #4#)) . #4#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT
              (VECTOR (SPADCALL |lscripts| |m| (QREFELT $ 114))
                      (SPADCALL |lscripts| (+ |m| 1) (QREFELT $ 114))
                      (SPADCALL |lscripts| (+ |m| 2) (QREFELT $ 114))
                      (SPADCALL |lscripts| (+ |m| 3) (QREFELT $ 114))
                      (SPADCALL |lscripts| (+ |m| 4) (QREFELT $ 114)))))))))) 

(SDEFUN |SYMBOL;istring| ((|n| |Integer|) ($ |String|))
        (COND
         ((SPADCALL |n| 9 (QREFELT $ 115))
          (|error| "Can have at most 9 scripts of each kind"))
         ('T (QAREF1 (QREFELT $ 16) (+ |n| 0))))) 

(SDEFUN |SYMBOL;sample;$;33| (($ $)) (SPADCALL "aSymbol" (QREFELT $ 37))) 

(DECLAIM (NOTINLINE |Symbol;|)) 

(DEFUN |Symbol| ()
  (SPROG NIL
         (PROG (#1=#:G2046)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Symbol|) . #2=(|Symbol|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Symbol|
                             (LIST (CONS NIL (CONS 1 (|Symbol;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Symbol|)))))))))) 

(DEFUN |Symbol;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Symbol|) . #1=(|Symbol|))
          (LETT $ (GETREFV 118) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|Symbol| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (SPADCALL 0 (QREFELT $ 8)))
          (QSETREFV $ 12 (SPADCALL (QREFELT $ 11)))
          (QSETREFV $ 16
                    (SPADCALL (LIST #2="0" "1" "2" "3" "4" "5" "6" "7" "8" "9")
                              (QREFELT $ 15)))
          (QSETREFV $ 17 "0123456789")
          (QSETREFV $ 18 "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
          (QSETREFV $ 19 "abcdefghijklmnopqrstuvwxyz")
          (QSETREFV $ 29 "*")
          (QSETREFV $ 30 (QCSIZE (QREFELT $ 29)))
          (QSETREFV $ 31 (|STR_to_CHAR| #2#))
          $))) 

(MAKEPROP '|Symbol| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|Reference| 6) (0 . |ref|)
              '|count| (|AssociationList| $$ 6) (5 . |empty|) '|xcount|
              (|List| 36) (|PrimitiveArray| 36) (9 . |construct|) '|istrings|
              '|nums| 'ALPHAS '|alphas| (|Boolean|) |SYMBOL;scripted?;$B;28|
              (|Void|) (|Symbol|) (|OpenMathDevice|) (14 . |OMputVariable|)
              (20 . |OMputObject|) (25 . |OMputEndObject|)
              |SYMBOL;OMwrite;Omd$BV;2| '|hd| '|lhd| '|ord0| (|InputForm|)
              (30 . |convert|) |SYMBOL;convert;$If;3| |SYMBOL;convert;2$;4|
              (|String|) |SYMBOL;coerce;S$;5| |SYMBOL;=;2$B;6| (|HashState|)
              |SYMBOL;hashUpdate!;Hs$Hs;7| |SYMBOL;<;2$B;8| (|OutputForm|)
              (35 . |outputForm|)
              (|Record| (|:| |sub| 56) (|:| |sup| 56) (|:| |presup| 56)
                        (|:| |presub| 56) (|:| |args| 56))
              |SYMBOL;scripts;$R;31| (|List| $) (40 . |commaSeparate|)
              |SYMBOL;name;2$;30| (45 . |scripts|) (51 . |prefix|)
              |SYMBOL;coerce;$Of;9| (|List| $$) (57 . |nil|) (|List| 56)
              |SYMBOL;script;$L$;20| (|List| 42) |SYMBOL;subscript;$L$;10|
              |SYMBOL;elt;$L$;11| |SYMBOL;superscript;$L$;12|
              |SYMBOL;argscript;$L$;13| (|PatternMatchResult| 6 23)
              (|Pattern| 6) (|PatternMatchSymbol| 6) (61 . |patternMatch|)
              (|PatternMatchResult| 6 $) |SYMBOL;patternMatch;$P2Pmr;14|
              (|PatternMatchResult| (|Float|) 23) (|Pattern| (|Float|))
              (|PatternMatchSymbol| (|Float|)) (68 . |patternMatch|)
              (|PatternMatchResult| (|Float|) $)
              |SYMBOL;patternMatch;$P2Pmr;15| (75 . |coerce|)
              |SYMBOL;convert;$P;16| (80 . |coerce|) |SYMBOL;convert;$P;17|
              (85 . |concat|) (90 . |concat|) |SYMBOL;script;$R$;21|
              |SYMBOL;string;$S;22| (|NonNegativeInteger|) (96 . >)
              (|Character|) (102 . |elt|) (108 . ~=) (114 . |latex|)
              |SYMBOL;latex;$S;23| (119 . |minIndex|) (124 . |concat|)
              (130 . |elt|) (135 . |setelt!|) |SYMBOL;new;$;25|
              (|Union| 6 '"failed") (141 . |search|) (147 . |setelt!|)
              (154 . |maxIndex|) (159 . |position|) |SYMBOL;new;2$;26|
              (165 . |keys|) (170 . |remove!|) (176 . |void|)
              |SYMBOL;resetNew;V;27| (|UniversalSegment| 6) (180 . SEGMENT)
              (186 . |elt|) (|List| 81) (192 . |minIndex|) (197 . |setelt!|)
              (204 . |concat|) (210 . |minIndex|) (215 . |first|)
              (221 . |setelt!|) (228 . |rest|) (234 . |elt|) (240 . >)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |SYMBOL;sample;$;33|) $))
              (|SingleInteger|))
           '#(~= 246 |superscript| 252 |subscript| 258 |string| 264 |smaller?|
              269 |scripts| 275 |scripted?| 280 |script| 285 |sample| 297
              |resetNew| 301 |patternMatch| 305 |new| 319 |name| 328 |min| 333
              |max| 339 |latex| 345 |hashUpdate!| 350 |hash| 356 |elt| 361
              |convert| 367 |coerce| 387 |argscript| 397 |OMwrite| 403 >= 427 >
              433 = 439 <= 445 < 451)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL NIL NIL |SetCategory&| |BasicType&| NIL
                     NIL NIL |OpenMath&| NIL |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|)
                      (|PatternMatchable| (|Float|)) (|PatternMatchable| 6)
                      (|SetCategory|) (|BasicType|) (|ConvertibleTo| 68)
                      (|ConvertibleTo| 62) (|ConvertibleTo| 23) (|OpenMath|)
                      (|ConvertibleTo| 32) (|PartialOrder|) (|CoercibleTo| 42))
                   (|makeByteWordVec2| 117
                                       '(1 7 0 6 8 0 10 0 11 1 14 0 13 15 2 24
                                         22 0 23 25 1 24 22 0 26 1 24 22 0 27 1
                                         32 0 23 33 1 42 0 23 43 1 42 0 46 47 2
                                         42 0 0 46 49 2 42 0 0 46 50 0 52 0 53
                                         3 63 61 23 62 61 64 3 69 67 23 68 67
                                         70 1 68 0 23 73 1 62 0 23 75 1 36 0 46
                                         77 2 56 0 0 0 78 2 81 20 0 0 82 2 36
                                         83 0 6 84 2 83 20 0 0 85 1 42 36 0 86
                                         1 36 6 0 88 2 36 0 83 0 89 1 7 6 0 90
                                         2 7 6 0 6 91 2 10 93 2 0 94 3 10 6 0 2
                                         6 95 1 36 6 0 96 2 36 6 83 0 97 1 10
                                         52 0 99 2 10 93 2 0 100 0 22 0 101 2
                                         103 0 6 6 104 2 36 0 0 103 105 1 106 6
                                         0 107 3 106 81 0 6 81 108 2 106 0 0 81
                                         109 1 54 6 0 110 2 56 0 0 81 111 3 54
                                         56 0 6 56 112 2 56 0 0 81 113 2 54 56
                                         0 6 114 2 6 20 0 0 115 2 0 20 0 0 1 2
                                         0 0 0 56 59 2 0 0 0 56 57 1 0 36 0 80
                                         2 0 20 0 0 1 1 0 44 0 45 1 0 20 0 21 2
                                         0 0 0 44 79 2 0 0 0 54 55 0 0 0 116 0
                                         0 22 102 3 0 71 0 68 71 72 3 0 65 0 62
                                         65 66 1 0 0 0 98 0 0 0 92 1 0 0 0 48 2
                                         0 0 0 0 1 2 0 0 0 0 1 1 0 36 0 87 2 0
                                         39 39 0 40 1 0 117 0 1 2 0 0 0 56 58 1
                                         0 62 0 76 1 0 68 0 74 1 0 23 0 35 1 0
                                         32 0 34 1 0 0 36 37 1 0 42 0 51 2 0 0
                                         0 56 60 3 0 22 24 0 20 28 2 0 36 0 20
                                         1 2 0 22 24 0 1 1 0 36 0 1 2 0 20 0 0
                                         1 2 0 20 0 0 1 2 0 20 0 0 38 2 0 20 0
                                         0 1 2 0 20 0 0 41)))))
           '|lookupComplete|)) 

(MAKEPROP '|Symbol| 'NILADIC T) 
