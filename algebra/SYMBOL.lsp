
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
         ((|a| (|List| (|OutputForm|))) (|x1| (|OutputForm|))
          (|x0| (|OutputForm|)) (|sl| (|List| (|OutputForm|)))
          (|se| (|OutputForm|)) (#1=#:G1937 NIL) (|si| NIL)
          (|rsl| (|List| (|List| (|OutputForm|))))
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
             (LETT |x0| (SPADCALL (SPADCALL |x| (QREFELT $ 48)) (QREFELT $ 43))
                   . #2#)
             (LETT |x1|
                   (COND
                    ((EQL (LENGTH |sl|) 1)
                     (SPADCALL |x0| (|SPADfirst| |sl|) (QREFELT $ 49)))
                    (#3='T (SPADCALL |x0| |sl| (QREFELT $ 50))))
                   . #2#)
             (LETT |a| (QVELT |ss| 4) . #2#)
             (EXIT
              (COND ((NULL |a|) |x1|)
                    (#3# (SPADCALL |x1| |a| (QREFELT $ 51))))))))))) 

(SDEFUN |SYMBOL;subscript;$L$;10| ((|sy| $) (|lx| |List| (|OutputForm|)) ($ $))
        (SPADCALL |sy| (LIST |lx| NIL NIL NIL NIL) (QREFELT $ 56))) 

(SDEFUN |SYMBOL;elt;$L$;11| ((|sy| $) (|lx| |List| (|OutputForm|)) ($ $))
        (SPADCALL |sy| |lx| (QREFELT $ 58))) 

(SDEFUN |SYMBOL;superscript;$L$;12|
        ((|sy| $) (|lx| |List| (|OutputForm|)) ($ $))
        (SPADCALL |sy| (LIST NIL |lx| NIL NIL NIL) (QREFELT $ 56))) 

(SDEFUN |SYMBOL;argscript;$L$;13| ((|sy| $) (|lx| |List| (|OutputForm|)) ($ $))
        (SPADCALL |sy| (LIST NIL NIL NIL NIL |lx|) (QREFELT $ 56))) 

(SDEFUN |SYMBOL;patternMatch;$P2Pmr;14|
        ((|x| $) (|p| |Pattern| #1=(|Integer|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 65))) 

(SDEFUN |SYMBOL;patternMatch;$P2Pmr;15|
        ((|x| $) (|p| |Pattern| #1=(|Float|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 71))) 

(SDEFUN |SYMBOL;convert;$P;16| ((|x| $) ($ |Pattern| (|Float|)))
        (SPADCALL |x| (QREFELT $ 74))) 

(SDEFUN |SYMBOL;convert;$P;17| ((|x| $) ($ |Pattern| (|Integer|)))
        (SPADCALL |x| (QREFELT $ 76))) 

(SDEFUN |SYMBOL;syprefix|
        ((|sc| |Record| (|:| |sub| (|List| (|OutputForm|)))
          (|:| |sup| (|List| (|OutputForm|)))
          (|:| |presup| (|List| (|OutputForm|)))
          (|:| |presub| (|List| (|OutputForm|)))
          (|:| |args| (|List| (|OutputForm|))))
         ($ |String|))
        (SPROG
         ((#1=#:G1951 NIL) (|n| NIL) (#2=#:G1950 NIL)
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
            (QREFELT $ 78)))))) 

(SDEFUN |SYMBOL;syscripts|
        ((|sc| |Record| (|:| |sub| (|List| (|OutputForm|)))
          (|:| |sup| (|List| (|OutputForm|)))
          (|:| |presup| (|List| (|OutputForm|)))
          (|:| |presub| #1=(|List| (|OutputForm|)))
          (|:| |args| (|List| (|OutputForm|))))
         ($ |List| (|OutputForm|)))
        (SPROG ((|all| #1#))
               (SEQ (LETT |all| (QVELT |sc| 3) . #2=(|SYMBOL;syscripts|))
                    (LETT |all| (SPADCALL (QVELT |sc| 2) |all| (QREFELT $ 79))
                          . #2#)
                    (LETT |all| (SPADCALL (QVELT |sc| 1) |all| (QREFELT $ 79))
                          . #2#)
                    (LETT |all| (SPADCALL (QVELT |sc| 0) |all| (QREFELT $ 79))
                          . #2#)
                    (EXIT (SPADCALL |all| (QVELT |sc| 4) (QREFELT $ 79)))))) 

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
          (EXIT (SPADCALL |sy| |sc| (QREFELT $ 80)))))) 

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
                      (SPADCALL (SPADCALL |sy| (QREFELT $ 48)) (QREFELT $ 81)))
             (QREFELT $ 37))
            (QREFELT $ 52))
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
           ((SPADCALL (QCSIZE |s|) 1 (QREFELT $ 83))
            (COND
             ((SPADCALL (SPADCALL |s| 1 (QREFELT $ 85)) (|STR_to_CHAR| "\\")
                        (QREFELT $ 86))
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
                                                (QREFELT $ 87)))
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
                                                (QREFELT $ 87)))
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
                                                (QREFELT $ 87)))
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
                                                (QREFELT $ 87)))
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
                                                (QREFELT $ 87)))
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
         ((#1=#:G2006 NIL) (|ns| (|String|))
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
                                               (SPADCALL |s| (QREFELT $ 89)))
                                            (QREFELT $ 85))
                                  |ns| (QREFELT $ 90))
                                 . #2#)
                           (EXIT
                            (COND
                             ((ZEROP |n|)
                              (PROGN (LETT #1# |ns| . #2#) (GO #3=#:G2005))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

(SDEFUN |SYMBOL;new;$;25| (($ $))
        (SPROG ((|sym| (|String|)))
               (SEQ
                (LETT |sym|
                      (|SYMBOL;anyRadix|
                       (SPADCALL (QREFELT $ 9) (QREFELT $ 91)) (QREFELT $ 18)
                       $)
                      |SYMBOL;new;$;25|)
                (SPADCALL (QREFELT $ 9)
                          (+ (SPADCALL (QREFELT $ 9) (QREFELT $ 91)) 1)
                          (QREFELT $ 92))
                (EXIT (SPADCALL (STRCONC "%" |sym|) (QREFELT $ 37)))))) 

(SDEFUN |SYMBOL;new;2$;26| ((|x| $) ($ $))
        (SPROG
         ((|xx| (|String|)) (|n| (|Integer|))
          (|u| (|Union| (|Integer|) "failed")))
         (SEQ
          (LETT |n|
                (SEQ
                 (LETT |u| (SPADCALL |x| (QREFELT $ 12) (QREFELT $ 95))
                       . #1=(|SYMBOL;new;2$;26|))
                 (EXIT (COND ((QEQCAR |u| 1) 0) (#2='T (+ (QCDR |u|) 1)))))
                . #1#)
          (SPADCALL (QREFELT $ 12) |x| |n| (QREFELT $ 96))
          (LETT |xx|
                (COND
                 ((NULL (SPADCALL |x| (QREFELT $ 21)))
                  (SPADCALL |x| (QREFELT $ 81)))
                 ('T (SPADCALL (SPADCALL |x| (QREFELT $ 48)) (QREFELT $ 81))))
                . #1#)
          (LETT |xx| (STRCONC "%" |xx|) . #1#)
          (LETT |xx|
                (COND
                 ((>=
                   (SPADCALL
                    (SPADCALL |xx| (SPADCALL |xx| (QREFELT $ 97))
                              (QREFELT $ 85))
                    (QREFELT $ 17) (QREFELT $ 98))
                   (SPADCALL (QREFELT $ 17) (QREFELT $ 89)))
                  (STRCONC |xx| (|SYMBOL;anyRadix| |n| (QREFELT $ 19) $)))
                 (#2# (STRCONC |xx| (|SYMBOL;anyRadix| |n| (QREFELT $ 17) $))))
                . #1#)
          (COND
           ((NULL (SPADCALL |x| (QREFELT $ 21)))
            (EXIT (SPADCALL |xx| (QREFELT $ 37)))))
          (EXIT
           (SPADCALL (SPADCALL |xx| (QREFELT $ 37))
                     (SPADCALL |x| (QREFELT $ 45)) (QREFELT $ 80)))))) 

(SDEFUN |SYMBOL;resetNew;V;27| (($ |Void|))
        (SPROG ((#1=#:G2028 NIL) (|k| NIL))
               (SEQ (SPADCALL (QREFELT $ 9) 0 (QREFELT $ 92))
                    (SEQ (LETT |k| NIL . #2=(|SYMBOL;resetNew;V;27|))
                         (LETT #1# (SPADCALL (QREFELT $ 12) (QREFELT $ 100))
                               . #2#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT (SPADCALL |k| (QREFELT $ 12) (QREFELT $ 101))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL (QREFELT $ 102)))))) 

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
                                        (QREFELT $ 81))
                              . #1=(|SYMBOL;name;2$;30|))
                        (LETT |si| (+ (+ (QREFELT $ 30) 4) 2) . #1#)
                        (EXIT
                         (SPADCALL
                          (SPADCALL |str|
                                    (SPADCALL |si| (QCSIZE |str|)
                                              (QREFELT $ 105))
                                    (QREFELT $ 106))
                          (QREFELT $ 37))))))))) 

(SDEFUN |SYMBOL;scripts;$R;31|
        ((|sy| $)
         ($ |Record| (|:| |sub| (|List| (|OutputForm|)))
          (|:| |sup| (|List| (|OutputForm|)))
          (|:| |presup| (|List| (|OutputForm|)))
          (|:| |presub| (|List| (|OutputForm|)))
          (|:| |args| (|List| (|OutputForm|)))))
        (SPROG
         ((|allscripts| (|List| (|OutputForm|))) (|i| NIL) (#1=#:G2044 NIL)
          (|n| NIL) (|m| (|Integer|))
          (|nscripts| (|List| (|NonNegativeInteger|))) (#2=#:G2036 NIL)
          (#3=#:G2043 NIL) (|j| NIL) (|nstr| (|NonNegativeInteger|))
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
                             (QREFELT $ 81))
                   . #4#)
             (LETT |nstr| (QCSIZE |str|) . #4#)
             (LETT |m| (SPADCALL |nscripts| (QREFELT $ 108)) . #4#)
             (SEQ (LETT |j| (+ (QREFELT $ 30) 1) . #4#)
                  (LETT #3# (+ (+ (QREFELT $ 30) 4) 1) . #4#)
                  (LETT |i| |m| . #4#) G190 (COND ((> |j| #3#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |nscripts| |i|
                              (PROG1
                                  (LETT #2#
                                        (- (SPADCALL |str| |j| (QREFELT $ 85))
                                           (QREFELT $ 31))
                                        . #4#)
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#))
                              (QREFELT $ 109))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #4#)) . #4#)
                  (GO G190) G191 (EXIT NIL))
             (LETT |nscripts|
                   (SPADCALL (CDR |nscripts|) (|SPADfirst| |nscripts|)
                             (QREFELT $ 110))
                   . #4#)
             (LETT |allscripts| (CDR (|SYMBOL;of_list| |sy| $)) . #4#)
             (LETT |m| (SPADCALL |lscripts| (QREFELT $ 111)) . #4#)
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
                                 (SPADCALL |allscripts| |n| (QREFELT $ 112))
                                 (QREFELT $ 113))
                       (EXIT
                        (LETT |allscripts|
                              (SPADCALL |allscripts| |n| (QREFELT $ 114))
                              . #4#)))))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT #1# (CDR #1#) . #4#)) . #4#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT
              (VECTOR (SPADCALL |lscripts| |m| (QREFELT $ 115))
                      (SPADCALL |lscripts| (+ |m| 1) (QREFELT $ 115))
                      (SPADCALL |lscripts| (+ |m| 2) (QREFELT $ 115))
                      (SPADCALL |lscripts| (+ |m| 3) (QREFELT $ 115))
                      (SPADCALL |lscripts| (+ |m| 4) (QREFELT $ 115)))))))))) 

(SDEFUN |SYMBOL;istring| ((|n| |Integer|) ($ |String|))
        (COND
         ((SPADCALL |n| 9 (QREFELT $ 116))
          (|error| "Can have at most 9 scripts of each kind"))
         ('T (QAREF1 (QREFELT $ 16) (+ |n| 0))))) 

(SDEFUN |SYMBOL;sample;$;33| (($ $)) (SPADCALL "aSymbol" (QREFELT $ 37))) 

(DECLAIM (NOTINLINE |Symbol;|)) 

(DEFUN |Symbol| ()
  (SPROG NIL
         (PROG (#1=#:G2048)
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
          (LETT $ (GETREFV 119) . #1#)
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
              (|Record| (|:| |sub| 57) (|:| |sup| 57) (|:| |presup| 57)
                        (|:| |presub| 57) (|:| |args| 57))
              |SYMBOL;scripts;$R;31| (|List| $) (40 . |commaSeparate|)
              |SYMBOL;name;2$;30| (45 . |sub|) (51 . |scripts|) (57 . |prefix|)
              |SYMBOL;coerce;$Of;9| (|List| $$) (63 . |nil|) (|List| 57)
              |SYMBOL;script;$L$;20| (|List| 42) |SYMBOL;subscript;$L$;10|
              |SYMBOL;elt;$L$;11| |SYMBOL;superscript;$L$;12|
              |SYMBOL;argscript;$L$;13| (|PatternMatchResult| 6 23)
              (|Pattern| 6) (|PatternMatchSymbol| 6) (67 . |patternMatch|)
              (|PatternMatchResult| 6 $) |SYMBOL;patternMatch;$P2Pmr;14|
              (|PatternMatchResult| (|Float|) 23) (|Pattern| (|Float|))
              (|PatternMatchSymbol| (|Float|)) (74 . |patternMatch|)
              (|PatternMatchResult| (|Float|) $)
              |SYMBOL;patternMatch;$P2Pmr;15| (81 . |coerce|)
              |SYMBOL;convert;$P;16| (86 . |coerce|) |SYMBOL;convert;$P;17|
              (91 . |concat|) (96 . |concat|) |SYMBOL;script;$R$;21|
              |SYMBOL;string;$S;22| (|NonNegativeInteger|) (102 . >)
              (|Character|) (108 . |elt|) (114 . ~=) (120 . |latex|)
              |SYMBOL;latex;$S;23| (125 . |minIndex|) (130 . |concat|)
              (136 . |elt|) (141 . |setelt!|) |SYMBOL;new;$;25|
              (|Union| 6 '"failed") (147 . |search|) (153 . |setelt!|)
              (160 . |maxIndex|) (165 . |position|) |SYMBOL;new;2$;26|
              (171 . |keys|) (176 . |remove!|) (182 . |void|)
              |SYMBOL;resetNew;V;27| (|UniversalSegment| 6) (186 . SEGMENT)
              (192 . |elt|) (|List| 82) (198 . |minIndex|) (203 . |setelt!|)
              (210 . |concat|) (216 . |minIndex|) (221 . |first|)
              (227 . |setelt!|) (234 . |rest|) (240 . |elt|) (246 . >)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |SYMBOL;sample;$;33|) $))
              (|SingleInteger|))
           '#(~= 252 |superscript| 258 |subscript| 264 |string| 270 |smaller?|
              275 |scripts| 281 |scripted?| 286 |script| 291 |sample| 303
              |resetNew| 307 |patternMatch| 311 |new| 325 |name| 334 |min| 339
              |max| 345 |latex| 351 |hashUpdate!| 356 |hash| 362 |elt| 367
              |convert| 373 |coerce| 393 |argscript| 403 |OMwrite| 409 >= 433 >
              439 = 445 <= 451 < 457)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL NIL NIL |SetCategory&| |BasicType&| NIL
                     NIL NIL |OpenMath&| NIL |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|)
                      (|PatternMatchable| (|Float|)) (|PatternMatchable| 6)
                      (|SetCategory|) (|BasicType|) (|ConvertibleTo| 69)
                      (|ConvertibleTo| 63) (|ConvertibleTo| 23) (|OpenMath|)
                      (|ConvertibleTo| 32) (|PartialOrder|) (|CoercibleTo| 42))
                   (|makeByteWordVec2| 118
                                       '(1 7 0 6 8 0 10 0 11 1 14 0 13 15 2 24
                                         22 0 23 25 1 24 22 0 26 1 24 22 0 27 1
                                         32 0 23 33 1 42 0 23 43 1 42 0 46 47 2
                                         42 0 0 0 49 2 42 0 0 46 50 2 42 0 0 46
                                         51 0 53 0 54 3 64 62 23 63 62 65 3 70
                                         68 23 69 68 71 1 69 0 23 74 1 63 0 23
                                         76 1 36 0 46 78 2 57 0 0 0 79 2 82 20
                                         0 0 83 2 36 84 0 6 85 2 84 20 0 0 86 1
                                         42 36 0 87 1 36 6 0 89 2 36 0 84 0 90
                                         1 7 6 0 91 2 7 6 0 6 92 2 10 94 2 0 95
                                         3 10 6 0 2 6 96 1 36 6 0 97 2 36 6 84
                                         0 98 1 10 53 0 100 2 10 94 2 0 101 0
                                         22 0 102 2 104 0 6 6 105 2 36 0 0 104
                                         106 1 107 6 0 108 3 107 82 0 6 82 109
                                         2 107 0 0 82 110 1 55 6 0 111 2 57 0 0
                                         82 112 3 55 57 0 6 57 113 2 57 0 0 82
                                         114 2 55 57 0 6 115 2 6 20 0 0 116 2 0
                                         20 0 0 1 2 0 0 0 57 60 2 0 0 0 57 58 1
                                         0 36 0 81 2 0 20 0 0 1 1 0 44 0 45 1 0
                                         20 0 21 2 0 0 0 44 80 2 0 0 0 55 56 0
                                         0 0 117 0 0 22 103 3 0 72 0 69 72 73 3
                                         0 66 0 63 66 67 1 0 0 0 99 0 0 0 93 1
                                         0 0 0 48 2 0 0 0 0 1 2 0 0 0 0 1 1 0
                                         36 0 88 2 0 39 39 0 40 1 0 118 0 1 2 0
                                         0 0 57 59 1 0 63 0 77 1 0 69 0 75 1 0
                                         23 0 35 1 0 32 0 34 1 0 0 36 37 1 0 42
                                         0 52 2 0 0 0 57 61 3 0 22 24 0 20 28 2
                                         0 36 0 20 1 2 0 22 24 0 1 1 0 36 0 1 2
                                         0 20 0 0 1 2 0 20 0 0 1 2 0 20 0 0 38
                                         2 0 20 0 0 1 2 0 20 0 0 41)))))
           '|lookupComplete|)) 

(MAKEPROP '|Symbol| 'NILADIC T) 
