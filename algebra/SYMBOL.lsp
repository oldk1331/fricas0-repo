
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
        (SPROG
         ((|d| (|InputForm|)) (G (|List| (|InputForm|))) (#1=#:G1995 NIL)
          (F NIL) (#2=#:G1994 NIL) (FF (|List| (|List| (|InputForm|))))
          (#3=#:G1993 NIL) (|e| NIL) (#4=#:G1992 NIL) (|b| #5=(|InputForm|))
          (|a| #5#) (E (|List| (|InputForm|))) (#6=#:G1991 NIL)
          (#7=#:G1990 NIL) (D (|List| (|InputForm|))) (#8=#:G1989 NIL)
          (#9=#:G1988 NIL) (C (|List| (|InputForm|))) (#10=#:G1987 NIL)
          (#11=#:G1986 NIL) (B (|List| (|InputForm|))) (#12=#:G1985 NIL)
          (#13=#:G1984 NIL) (A (|List| (|InputForm|))) (#14=#:G1983 NIL)
          (#15=#:G1982 NIL)
          (|ls|
           (|Record| (|:| |sub| (|List| (|OutputForm|)))
                     (|:| |sup| (|List| (|OutputForm|)))
                     (|:| |presup| (|List| (|OutputForm|)))
                     (|:| |presub| (|List| (|OutputForm|)))
                     (|:| |args| (|List| (|OutputForm|)))))
          (|n| (|InputForm|)))
         (SEQ (LETT |n| (SPADCALL |s| (QREFELT $ 32)))
              (COND ((NULL (SPADCALL |s| (QREFELT $ 21))) (EXIT |n|)))
              (LETT |ls| (SPADCALL |s| (QREFELT $ 34)))
              (LETT A
                    (PROGN
                     (LETT #15# NIL)
                     (SEQ (LETT |e| NIL) (LETT #14# (QVELT |ls| 0)) G190
                          (COND
                           ((OR (ATOM #14#) (PROGN (LETT |e| (CAR #14#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #15#
                                  (CONS (SPADCALL |e| (QREFELT $ 37)) #15#))))
                          (LETT #14# (CDR #14#)) (GO G190) G191
                          (EXIT (NREVERSE #15#)))))
              (LETT B
                    (PROGN
                     (LETT #13# NIL)
                     (SEQ (LETT |e| NIL) (LETT #12# (QVELT |ls| 1)) G190
                          (COND
                           ((OR (ATOM #12#) (PROGN (LETT |e| (CAR #12#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #13#
                                  (CONS (SPADCALL |e| (QREFELT $ 37)) #13#))))
                          (LETT #12# (CDR #12#)) (GO G190) G191
                          (EXIT (NREVERSE #13#)))))
              (LETT C
                    (PROGN
                     (LETT #11# NIL)
                     (SEQ (LETT |e| NIL) (LETT #10# (QVELT |ls| 2)) G190
                          (COND
                           ((OR (ATOM #10#) (PROGN (LETT |e| (CAR #10#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #11#
                                  (CONS (SPADCALL |e| (QREFELT $ 37)) #11#))))
                          (LETT #10# (CDR #10#)) (GO G190) G191
                          (EXIT (NREVERSE #11#)))))
              (LETT D
                    (PROGN
                     (LETT #9# NIL)
                     (SEQ (LETT |e| NIL) (LETT #8# (QVELT |ls| 3)) G190
                          (COND
                           ((OR (ATOM #8#) (PROGN (LETT |e| (CAR #8#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #9#
                                  (CONS (SPADCALL |e| (QREFELT $ 37)) #9#))))
                          (LETT #8# (CDR #8#)) (GO G190) G191
                          (EXIT (NREVERSE #9#)))))
              (LETT E
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |e| NIL) (LETT #6# (QVELT |ls| 4)) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |e| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS (SPADCALL |e| (QREFELT $ 37)) #7#))))
                          (LETT #6# (CDR #6#)) (GO G190) G191
                          (EXIT (NREVERSE #7#)))))
              (LETT |a| (SPADCALL '|script| (QREFELT $ 38)))
              (LETT |b| (SPADCALL '|construct| (QREFELT $ 38)))
              (LETT FF
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |e| NIL) (LETT #3# (LIST A B C D E)) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |e| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT #4# (CONS (CONS |b| |e|) #4#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (LETT G
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT F NIL) (LETT #1# FF) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT F (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL F (QREFELT $ 40)) #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (LETT |d| (SPADCALL (CONS |b| G) (QREFELT $ 40)))
              (EXIT (SPADCALL (LIST |a| |n| |d|) (QREFELT $ 40)))))) 

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
          (|sl| (|List| (|OutputForm|))) (|se| (|OutputForm|)) (#1=#:G2010 NIL)
          (|si| NIL) (|rsl| (|List| (|List| (|OutputForm|))))
          (|ss|
           (|Record| (|:| |sub| (|List| (|OutputForm|)))
                     (|:| |sup| (|List| (|OutputForm|)))
                     (|:| |presup| (|List| (|OutputForm|)))
                     (|:| |presub| (|List| (|OutputForm|)))
                     (|:| |args| (|List| (|OutputForm|))))))
         (SEQ
          (COND
           ((NULL (SPADCALL |x| (QREFELT $ 21))) (SPADCALL |x| (QREFELT $ 49)))
           ('T
            (SEQ (LETT |ss| (SPADCALL |x| (QREFELT $ 34)))
                 (LETT |rsl|
                       (LIST (QVELT |ss| 3) (QVELT |ss| 2) (QVELT |ss| 1)
                             (QVELT |ss| 0)))
                 (LETT |sl| NIL)
                 (SEQ (LETT |si| NIL) (LETT #1# |rsl|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |si| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (COND
                        ((NULL |sl|) (COND ((NULL |si|) (EXIT "iterate")))))
                       (LETT |se|
                             (COND ((EQL (LENGTH |si|) 1) (|SPADfirst| |si|))
                                   ('T (SPADCALL |si| (QREFELT $ 50)))))
                       (EXIT (LETT |sl| (CONS |se| |sl|))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (LETT |x0|
                       (SPADCALL
                        (SPADCALL (SPADCALL |x| (QREFELT $ 32)) (QREFELT $ 49))
                        |sl| (QREFELT $ 51)))
                 (LETT |a| (QVELT |ss| 4))
                 (EXIT
                  (COND ((NULL |a|) |x0|)
                        ('T (SPADCALL |x0| |a| (QREFELT $ 52))))))))))) 

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
         ((#1=#:G2024 NIL) (|n| NIL) (#2=#:G2023 NIL)
          (|ns| (|List| (|Integer|))))
         (SEQ
          (LETT |ns|
                (LIST (LENGTH (QVELT |sc| 0)) (LENGTH (QVELT |sc| 1))
                      (LENGTH (QVELT |sc| 2)) (LENGTH (QVELT |sc| 3))))
          (EXIT
           (SPADCALL
            (CONS
             (STRCONC (QREFELT $ 29)
                      (|SYMBOL;istring| (LENGTH (QVELT |sc| 4)) $))
             (PROGN
              (LETT #2# NIL)
              (SEQ (LETT |n| NIL) (LETT #1# |ns|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT #2# (CONS (|SYMBOL;istring| |n| $) #2#))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT (NREVERSE #2#)))))
            (QREFELT $ 77)))))) 

(SDEFUN |SYMBOL;syscripts|
        ((|sc| |Record| (|:| |sub| (|List| (|OutputForm|)))
          (|:| |sup| (|List| (|OutputForm|)))
          (|:| |presup| (|List| (|OutputForm|)))
          (|:| |presub| #1=(|List| (|OutputForm|)))
          (|:| |args| (|List| (|OutputForm|))))
         ($ |List| (|OutputForm|)))
        (SPROG ((|all| #1#))
               (SEQ (LETT |all| (QVELT |sc| 3))
                    (LETT |all| (SPADCALL (QVELT |sc| 2) |all| (QREFELT $ 78)))
                    (LETT |all| (SPADCALL (QVELT |sc| 1) |all| (QREFELT $ 78)))
                    (LETT |all| (SPADCALL (QVELT |sc| 0) |all| (QREFELT $ 78)))
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
         (SEQ (LETT |sc| (VECTOR NIL NIL NIL NIL NIL))
              (COND
               ((NULL (NULL |ls|))
                (SEQ (QSETVELT |sc| 0 (|SPADfirst| |ls|))
                     (EXIT (LETT |ls| (CDR |ls|))))))
              (COND
               ((NULL (NULL |ls|))
                (SEQ (QSETVELT |sc| 1 (|SPADfirst| |ls|))
                     (EXIT (LETT |ls| (CDR |ls|))))))
              (COND
               ((NULL (NULL |ls|))
                (SEQ (QSETVELT |sc| 2 (|SPADfirst| |ls|))
                     (EXIT (LETT |ls| (CDR |ls|))))))
              (COND
               ((NULL (NULL |ls|))
                (SEQ (QSETVELT |sc| 3 (|SPADfirst| |ls|))
                     (EXIT (LETT |ls| (CDR |ls|))))))
              (COND
               ((NULL (NULL |ls|))
                (SEQ (QSETVELT |sc| 4 (|SPADfirst| |ls|))
                     (EXIT (LETT |ls| (CDR |ls|))))))
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
                      (SPADCALL (SPADCALL |sy| (QREFELT $ 32)) (QREFELT $ 80)))
             (QREFELT $ 44))
            (QREFELT $ 53))
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
         (SEQ (LETT |s| (PNAME (SPADCALL |e| (QREFELT $ 32))))
              (COND
               ((> (QCSIZE |s|) 1)
                (COND
                 ((SPADCALL (SPADCALL |s| 1 (QREFELT $ 82))
                            (|STR_to_CHAR| "\\") (QREFELT $ 83))
                  (LETT |s| (STRCONC "\\mbox{\\it " (STRCONC |s| "}")))))))
              (COND ((NULL (SPADCALL |e| (QREFELT $ 21))) (EXIT |s|)))
              (LETT |ss| (SPADCALL |e| (QREFELT $ 34)))
              (LETT |lo| (QVELT |ss| 0))
              (COND
               ((NULL (NULL |lo|))
                (SEQ (LETT |sc| "_{")
                     (SEQ G190 (COND ((NULL (NULL (NULL |lo|))) (GO G191)))
                          (SEQ
                           (LETT |sc|
                                 (STRCONC |sc|
                                          (SPADCALL (|SPADfirst| |lo|)
                                                    (QREFELT $ 84))))
                           (LETT |lo| (CDR |lo|))
                           (EXIT
                            (COND
                             ((NULL (NULL |lo|))
                              (LETT |sc| (STRCONC |sc| ", "))))))
                          NIL (GO G190) G191 (EXIT NIL))
                     (LETT |sc| (STRCONC |sc| "}"))
                     (EXIT (LETT |s| (STRCONC |s| |sc|))))))
              (LETT |lo| (QVELT |ss| 1))
              (COND
               ((NULL (NULL |lo|))
                (SEQ (LETT |sc| "^{")
                     (SEQ G190 (COND ((NULL (NULL (NULL |lo|))) (GO G191)))
                          (SEQ
                           (LETT |sc|
                                 (STRCONC |sc|
                                          (SPADCALL (|SPADfirst| |lo|)
                                                    (QREFELT $ 84))))
                           (LETT |lo| (CDR |lo|))
                           (EXIT
                            (COND
                             ((NULL (NULL |lo|))
                              (LETT |sc| (STRCONC |sc| ", "))))))
                          NIL (GO G190) G191 (EXIT NIL))
                     (LETT |sc| (STRCONC |sc| "}"))
                     (EXIT (LETT |s| (STRCONC |s| |sc|))))))
              (LETT |lo| (QVELT |ss| 2))
              (COND
               ((NULL (NULL |lo|))
                (SEQ (LETT |sc| "{}^{")
                     (SEQ G190 (COND ((NULL (NULL (NULL |lo|))) (GO G191)))
                          (SEQ
                           (LETT |sc|
                                 (STRCONC |sc|
                                          (SPADCALL (|SPADfirst| |lo|)
                                                    (QREFELT $ 84))))
                           (LETT |lo| (CDR |lo|))
                           (EXIT
                            (COND
                             ((NULL (NULL |lo|))
                              (LETT |sc| (STRCONC |sc| ", "))))))
                          NIL (GO G190) G191 (EXIT NIL))
                     (LETT |sc| (STRCONC |sc| "}"))
                     (EXIT (LETT |s| (STRCONC |sc| |s|))))))
              (LETT |lo| (QVELT |ss| 3))
              (COND
               ((NULL (NULL |lo|))
                (SEQ (LETT |sc| "{}_{")
                     (SEQ G190 (COND ((NULL (NULL (NULL |lo|))) (GO G191)))
                          (SEQ
                           (LETT |sc|
                                 (STRCONC |sc|
                                          (SPADCALL (|SPADfirst| |lo|)
                                                    (QREFELT $ 84))))
                           (LETT |lo| (CDR |lo|))
                           (EXIT
                            (COND
                             ((NULL (NULL |lo|))
                              (LETT |sc| (STRCONC |sc| ", "))))))
                          NIL (GO G190) G191 (EXIT NIL))
                     (LETT |sc| (STRCONC |sc| "}"))
                     (EXIT (LETT |s| (STRCONC |sc| |s|))))))
              (LETT |lo| (QVELT |ss| 4))
              (COND
               ((NULL (NULL |lo|))
                (SEQ (LETT |sc| "\\left( {")
                     (SEQ G190 (COND ((NULL (NULL (NULL |lo|))) (GO G191)))
                          (SEQ
                           (LETT |sc|
                                 (STRCONC |sc|
                                          (SPADCALL (|SPADfirst| |lo|)
                                                    (QREFELT $ 84))))
                           (LETT |lo| (CDR |lo|))
                           (EXIT
                            (COND
                             ((NULL (NULL |lo|))
                              (LETT |sc| (STRCONC |sc| ", "))))))
                          NIL (GO G190) G191 (EXIT NIL))
                     (LETT |sc| (STRCONC |sc| "} \\right)"))
                     (EXIT (LETT |s| (STRCONC |s| |sc|))))))
              (EXIT |s|)))) 

(SDEFUN |SYMBOL;anyRadix| ((|n| |Integer|) (|s| |String|) ($ |String|))
        (SPROG
         ((#1=#:G2084 NIL) (|ns| (|String|))
          (|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|)))))
         (SEQ
          (EXIT
           (SEQ (LETT |ns| "")
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |qr| (DIVIDE2 |n| (QCSIZE |s|)))
                           (LETT |n| (QCAR |qr|))
                           (LETT |ns|
                                 (SPADCALL
                                  (SPADCALL |s|
                                            (+ (QCDR |qr|)
                                               (SPADCALL |s| (QREFELT $ 86)))
                                            (QREFELT $ 82))
                                  |ns| (QREFELT $ 87)))
                           (EXIT
                            (COND
                             ((ZEROP |n|)
                              (PROGN (LETT #1# |ns|) (GO #2=#:G2083))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |SYMBOL;new;$;25| (($ $))
        (SPROG ((|sym| (|String|)))
               (SEQ
                (LETT |sym|
                      (|SYMBOL;anyRadix|
                       (SPADCALL (QREFELT $ 9) (QREFELT $ 88)) (QREFELT $ 18)
                       $))
                (SPADCALL (QREFELT $ 9)
                          (+ (SPADCALL (QREFELT $ 9) (QREFELT $ 88)) 1)
                          (QREFELT $ 89))
                (EXIT (SPADCALL (STRCONC "%" |sym|) (QREFELT $ 44)))))) 

(SDEFUN |SYMBOL;new;2$;26| ((|x| $) ($ $))
        (SPROG
         ((|xx| (|String|)) (|n| (|Integer|))
          (|u| (|Union| (|Integer|) "failed")))
         (SEQ
          (LETT |n|
                (SEQ (LETT |u| (SPADCALL |x| (QREFELT $ 12) (QREFELT $ 92)))
                     (EXIT
                      (COND ((QEQCAR |u| 1) 0) (#1='T (+ (QCDR |u|) 1))))))
          (SPADCALL (QREFELT $ 12) |x| |n| (QREFELT $ 93))
          (LETT |xx|
                (COND
                 ((NULL (SPADCALL |x| (QREFELT $ 21)))
                  (SPADCALL |x| (QREFELT $ 80)))
                 ('T (SPADCALL (SPADCALL |x| (QREFELT $ 32)) (QREFELT $ 80)))))
          (LETT |xx| (STRCONC "%" |xx|))
          (LETT |xx|
                (COND
                 ((>=
                   (SPADCALL
                    (SPADCALL |xx| (SPADCALL |xx| (QREFELT $ 94))
                              (QREFELT $ 82))
                    (QREFELT $ 17) (QREFELT $ 95))
                   (SPADCALL (QREFELT $ 17) (QREFELT $ 86)))
                  (STRCONC |xx| (|SYMBOL;anyRadix| |n| (QREFELT $ 19) $)))
                 (#1#
                  (STRCONC |xx| (|SYMBOL;anyRadix| |n| (QREFELT $ 17) $)))))
          (COND
           ((NULL (SPADCALL |x| (QREFELT $ 21)))
            (EXIT (SPADCALL |xx| (QREFELT $ 44)))))
          (EXIT
           (SPADCALL (SPADCALL |xx| (QREFELT $ 44))
                     (SPADCALL |x| (QREFELT $ 34)) (QREFELT $ 79)))))) 

(SDEFUN |SYMBOL;resetNew;V;27| (($ |Void|))
        (SPROG ((#1=#:G2106 NIL) (|k| NIL))
               (SEQ (SPADCALL (QREFELT $ 9) 0 (QREFELT $ 89))
                    (SEQ (LETT |k| NIL)
                         (LETT #1# (SPADCALL (QREFELT $ 12) (QREFELT $ 98)))
                         G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT (SPADCALL |k| (QREFELT $ 12) (QREFELT $ 99))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL (QREFELT $ 100)))))) 

(SDEFUN |SYMBOL;scripted?;$B;28| ((|sy| $) ($ |Boolean|)) (NULL (ATOM |sy|))) 

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
                                        (QREFELT $ 80)))
                        (LETT |si| (+ (+ (QREFELT $ 30) 4) 2))
                        (EXIT
                         (SPADCALL
                          (SPADCALL |str|
                                    (SPADCALL |si| (QCSIZE |str|)
                                              (QREFELT $ 103))
                                    (QREFELT $ 104))
                          (QREFELT $ 44))))))))) 

(SDEFUN |SYMBOL;scripts;$R;31|
        ((|sy| $)
         ($ |Record| (|:| |sub| (|List| (|OutputForm|)))
          (|:| |sup| (|List| (|OutputForm|)))
          (|:| |presup| (|List| (|OutputForm|)))
          (|:| |presub| (|List| (|OutputForm|)))
          (|:| |args| (|List| (|OutputForm|)))))
        (SPROG
         ((|allscripts| (|List| (|OutputForm|))) (|i| NIL) (#1=#:G2122 NIL)
          (|n| NIL) (|m| (|Integer|))
          (|nscripts| (|List| (|NonNegativeInteger|))) (#2=#:G2114 NIL)
          (#3=#:G2121 NIL) (|j| NIL) (|nstr| (|NonNegativeInteger|))
          (|str| (|String|)) (|lscripts| (|List| (|List| (|OutputForm|)))))
         (SEQ
          (COND
           ((NULL (SPADCALL |sy| (QREFELT $ 21))) (VECTOR NIL NIL NIL NIL NIL))
           ('T
            (SEQ (LETT |nscripts| (LIST 0 0 0 0 0))
                 (LETT |lscripts| (LIST NIL NIL NIL NIL NIL))
                 (LETT |str|
                       (SPADCALL (|SPADfirst| (|SYMBOL;of_list| |sy| $))
                                 (QREFELT $ 80)))
                 (LETT |nstr| (QCSIZE |str|)) (LETT |m| (PROGN |nscripts| 1))
                 (SEQ (LETT |j| (+ (QREFELT $ 30) 1))
                      (LETT #3# (+ (+ (QREFELT $ 30) 4) 1)) (LETT |i| |m|) G190
                      (COND ((> |j| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |nscripts| |i|
                                  (PROG1
                                      (LETT #2#
                                            (-
                                             (SPADCALL |str| |j|
                                                       (QREFELT $ 82))
                                             (QREFELT $ 31)))
                                    (|check_subtype2| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #2#))
                                  (QREFELT $ 107))))
                      (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1))))
                      (GO G190) G191 (EXIT NIL))
                 (LETT |nscripts|
                       (SPADCALL (CDR |nscripts|) (|SPADfirst| |nscripts|)
                                 (QREFELT $ 108)))
                 (LETT |allscripts| (CDR (|SYMBOL;of_list| |sy| $)))
                 (LETT |m| (PROGN |lscripts| 1))
                 (SEQ (LETT |n| NIL) (LETT #1# |nscripts|) (LETT |i| |m|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((< (LENGTH |allscripts|) |n|)
                          (|error| "Improper script count in symbol"))
                         ('T
                          (SEQ
                           (SPADCALL |lscripts| |i|
                                     (SPADCALL |allscripts| |n|
                                               (QREFELT $ 109))
                                     (QREFELT $ 110))
                           (EXIT
                            (LETT |allscripts|
                                  (SPADCALL |allscripts| |n|
                                            (QREFELT $ 111)))))))))
                      (LETT |i| (PROG1 (+ |i| 1) (LETT #1# (CDR #1#))))
                      (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (VECTOR (SPADCALL |lscripts| |m| (QREFELT $ 112))
                          (SPADCALL |lscripts| (+ |m| 1) (QREFELT $ 112))
                          (SPADCALL |lscripts| (+ |m| 2) (QREFELT $ 112))
                          (SPADCALL |lscripts| (+ |m| 3) (QREFELT $ 112))
                          (SPADCALL |lscripts| (+ |m| 4)
                                    (QREFELT $ 112)))))))))) 

(SDEFUN |SYMBOL;istring| ((|n| |Integer|) ($ |String|))
        (COND ((> |n| 9) (|error| "Can have at most 9 scripts of each kind"))
              ('T (QAREF1 (QREFELT $ 16) (+ |n| (PROGN (QREFELT $ 16) 0)))))) 

(SDEFUN |SYMBOL;sample;$;33| (($ $)) (SPADCALL "aSymbol" (QREFELT $ 44))) 

(DECLAIM (NOTINLINE |Symbol;|)) 

(DEFUN |Symbol| ()
  (SPROG NIL
         (PROG (#1=#:G2126)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Symbol|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Symbol|
                             (LIST (CONS NIL (CONS 1 (|Symbol;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Symbol|)))))))))) 

(DEFUN |Symbol;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Symbol|))
          (LETT $ (GETREFV 115))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Symbol| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 9 (SPADCALL 0 (QREFELT $ 8)))
          (QSETREFV $ 12 (SPADCALL (QREFELT $ 11)))
          (QSETREFV $ 16
                    (SPADCALL (LIST #1="0" "1" "2" "3" "4" "5" "6" "7" "8" "9")
                              (QREFELT $ 15)))
          (QSETREFV $ 17 "0123456789")
          (QSETREFV $ 18 "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
          (QSETREFV $ 19 "abcdefghijklmnopqrstuvwxyz")
          (QSETREFV $ 29 "*")
          (QSETREFV $ 30 (QCSIZE (QREFELT $ 29)))
          (QSETREFV $ 31 (|STR_to_CHAR| #1#))
          $))) 

(MAKEPROP '|Symbol| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|Reference| 6) (0 . |ref|)
              '|count| (|AssociationList| $$ 6) (5 . |empty|) '|xcount|
              (|List| 43) (|PrimitiveArray| 43) (9 . |construct|) '|istrings|
              '|nums| 'ALPHAS '|alphas| (|Boolean|) |SYMBOL;scripted?;$B;28|
              (|Void|) (|Symbol|) (|OpenMathDevice|) (14 . |OMputVariable|)
              (20 . |OMputObject|) (25 . |OMputEndObject|)
              |SYMBOL;OMwrite;Omd$BV;2| '|hd| '|lhd| '|ord0|
              |SYMBOL;name;2$;30|
              (|Record| (|:| |sub| 56) (|:| |sup| 56) (|:| |presup| 56)
                        (|:| |presub| 56) (|:| |args| 56))
              |SYMBOL;scripts;$R;31| (|InputForm|) (|OutputForm|)
              (30 . |convert|) (35 . |convert|) (|List| $) (40 . |convert|)
              |SYMBOL;convert;$If;3| |SYMBOL;convert;2$;4| (|String|)
              |SYMBOL;coerce;S$;5| |SYMBOL;=;2$B;6| (|HashState|)
              |SYMBOL;hashUpdate!;Hs$Hs;7| |SYMBOL;<;2$B;8| (45 . |outputForm|)
              (50 . |commaSeparate|) (55 . |scripts|) (61 . |prefix|)
              |SYMBOL;coerce;$Of;9| (|List| 56) |SYMBOL;script;$L$;20|
              (|List| 36) |SYMBOL;subscript;$L$;10| |SYMBOL;elt;$L$;11|
              |SYMBOL;superscript;$L$;12| |SYMBOL;argscript;$L$;13|
              (|PatternMatchResult| 6 23) (|Pattern| 6)
              (|PatternMatchSymbol| 6) (67 . |patternMatch|)
              (|PatternMatchResult| 6 $) |SYMBOL;patternMatch;$P2Pmr;14|
              (|PatternMatchResult| (|Float|) 23) (|Pattern| (|Float|))
              (|PatternMatchSymbol| (|Float|)) (74 . |patternMatch|)
              (|PatternMatchResult| (|Float|) $)
              |SYMBOL;patternMatch;$P2Pmr;15| (81 . |coerce|)
              |SYMBOL;convert;$P;16| (86 . |coerce|) |SYMBOL;convert;$P;17|
              (91 . |concat|) (96 . |concat|) |SYMBOL;script;$R$;21|
              |SYMBOL;string;$S;22| (|Character|) (102 . |elt|) (108 . ~=)
              (114 . |latex|) |SYMBOL;latex;$S;23| (119 . |minIndex|)
              (124 . |concat|) (130 . |elt|) (135 . |setelt!|)
              |SYMBOL;new;$;25| (|Union| 6 '"failed") (141 . |search|)
              (147 . |setelt!|) (154 . |maxIndex|) (159 . |position|)
              |SYMBOL;new;2$;26| (|List| $$) (165 . |keys|) (170 . |remove!|)
              (176 . |void|) |SYMBOL;resetNew;V;27| (|UniversalSegment| 6)
              (180 . SEGMENT) (186 . |elt|) (|NonNegativeInteger|) (|List| 105)
              (192 . |setelt!|) (199 . |concat|) (205 . |first|)
              (211 . |setelt!|) (218 . |rest|) (224 . |elt|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |SYMBOL;sample;$;33|) $))
              (|SingleInteger|))
           '#(~= 230 |superscript| 236 |subscript| 242 |string| 248 |smaller?|
              253 |scripts| 259 |scripted?| 264 |script| 269 |sample| 281
              |resetNew| 285 |patternMatch| 289 |new| 303 |name| 312 |min| 317
              |max| 323 |latex| 329 |hashUpdate!| 334 |hash| 340 |elt| 345
              |convert| 351 |coerce| 371 |argscript| 381 |OMwrite| 387 >= 411 >
              417 = 423 <= 429 < 435)
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
                      (|ConvertibleTo| 35) (|PartialOrder|) (|CoercibleTo| 36))
                   (|makeByteWordVec2| 114
                                       '(1 7 0 6 8 0 10 0 11 1 14 0 13 15 2 24
                                         22 0 23 25 1 24 22 0 26 1 24 22 0 27 1
                                         36 35 0 37 1 35 0 23 38 1 35 0 39 40 1
                                         36 0 23 49 1 36 0 39 50 2 36 0 0 39 51
                                         2 36 0 0 39 52 3 63 61 23 62 61 64 3
                                         69 67 23 68 67 70 1 68 0 23 73 1 62 0
                                         23 75 1 43 0 39 77 2 56 0 0 0 78 2 43
                                         81 0 6 82 2 81 20 0 0 83 1 36 43 0 84
                                         1 43 6 0 86 2 43 0 81 0 87 1 7 6 0 88
                                         2 7 6 0 6 89 2 10 91 2 0 92 3 10 6 0 2
                                         6 93 1 43 6 0 94 2 43 6 81 0 95 1 10
                                         97 0 98 2 10 91 2 0 99 0 22 0 100 2
                                         102 0 6 6 103 2 43 0 0 102 104 3 106
                                         105 0 6 105 107 2 106 0 0 105 108 2 56
                                         0 0 105 109 3 54 56 0 6 56 110 2 56 0
                                         0 105 111 2 54 56 0 6 112 2 0 20 0 0 1
                                         2 0 0 0 56 59 2 0 0 0 56 57 1 0 43 0
                                         80 2 0 20 0 0 1 1 0 33 0 34 1 0 20 0
                                         21 2 0 0 0 33 79 2 0 0 0 54 55 0 0 0
                                         113 0 0 22 101 3 0 71 0 68 71 72 3 0
                                         65 0 62 65 66 1 0 0 0 96 0 0 0 90 1 0
                                         0 0 32 2 0 0 0 0 1 2 0 0 0 0 1 1 0 43
                                         0 85 2 0 46 46 0 47 1 0 114 0 1 2 0 0
                                         0 56 58 1 0 62 0 76 1 0 68 0 74 1 0 23
                                         0 42 1 0 35 0 41 1 0 0 43 44 1 0 36 0
                                         53 2 0 0 0 56 60 3 0 22 24 0 20 28 2 0
                                         43 0 20 1 2 0 22 24 0 1 1 0 43 0 1 2 0
                                         20 0 0 1 2 0 20 0 0 1 2 0 20 0 0 45 2
                                         0 20 0 0 1 2 0 20 0 0 48)))))
           '|lookupComplete|)) 

(MAKEPROP '|Symbol| 'NILADIC T) 
