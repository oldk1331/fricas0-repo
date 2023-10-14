
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
        (SPADCALL |x| (QREFELT $ 43))) 

(SDEFUN |SYMBOL;subscript;$L$;10| ((|sy| $) (|lx| |List| (|OutputForm|)) ($ $))
        (SPADCALL |sy| (LIST |lx| NIL NIL NIL NIL) (QREFELT $ 48))) 

(SDEFUN |SYMBOL;elt;$L$;11| ((|sy| $) (|lx| |List| (|OutputForm|)) ($ $))
        (SPADCALL |sy| |lx| (QREFELT $ 50))) 

(SDEFUN |SYMBOL;superscript;$L$;12|
        ((|sy| $) (|lx| |List| (|OutputForm|)) ($ $))
        (SPADCALL |sy| (LIST NIL |lx| NIL NIL NIL) (QREFELT $ 48))) 

(SDEFUN |SYMBOL;argscript;$L$;13| ((|sy| $) (|lx| |List| (|OutputForm|)) ($ $))
        (SPADCALL |sy| (LIST NIL NIL NIL NIL |lx|) (QREFELT $ 48))) 

(SDEFUN |SYMBOL;patternMatch;$P2Pmr;14|
        ((|x| $) (|p| |Pattern| #1=(|Integer|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 57))) 

(SDEFUN |SYMBOL;patternMatch;$P2Pmr;15|
        ((|x| $) (|p| |Pattern| #1=(|Float|))
         (|l| |PatternMatchResult| #1# . #2=($))
         ($ |PatternMatchResult| #1# . #2#))
        (SPADCALL |x| |p| |l| (QREFELT $ 63))) 

(SDEFUN |SYMBOL;convert;$P;16| ((|x| $) ($ |Pattern| (|Float|)))
        (SPADCALL |x| (QREFELT $ 66))) 

(SDEFUN |SYMBOL;convert;$P;17| ((|x| $) ($ |Pattern| (|Integer|)))
        (SPADCALL |x| (QREFELT $ 68))) 

(SDEFUN |SYMBOL;syprefix|
        ((|sc| |Record| (|:| |sub| (|List| (|OutputForm|)))
          (|:| |sup| (|List| (|OutputForm|)))
          (|:| |presup| (|List| (|OutputForm|)))
          (|:| |presub| (|List| (|OutputForm|)))
          (|:| |args| (|List| (|OutputForm|))))
         ($ |String|))
        (SPROG
         ((#1=#:G1921 NIL) (|n| NIL) (#2=#:G1920 NIL)
          (|ns| (|List| (|Integer|))))
         (SEQ
          (LETT |ns|
                (LIST (LENGTH (QVELT |sc| 3)) (LENGTH (QVELT |sc| 2))
                      (LENGTH (QVELT |sc| 1)) (LENGTH (QVELT |sc| 0)))
                . #3=(|SYMBOL;syprefix|))
          (SEQ G190
               (COND
                ((NULL
                  (COND ((>= (LENGTH |ns|) 2) (ZEROP (|SPADfirst| |ns|)))
                        ('T 'NIL)))
                 (GO G191)))
               (SEQ (EXIT (LETT |ns| (CDR |ns|) . #3#))) NIL (GO G190) G191
               (EXIT NIL))
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
            (QREFELT $ 71)))))) 

(SDEFUN |SYMBOL;syscripts|
        ((|sc| |Record| (|:| |sub| (|List| (|OutputForm|)))
          (|:| |sup| (|List| (|OutputForm|)))
          (|:| |presup| (|List| (|OutputForm|)))
          (|:| |presub| #1=(|List| (|OutputForm|)))
          (|:| |args| (|List| (|OutputForm|))))
         ($ |List| (|OutputForm|)))
        (SPROG ((|all| #1#))
               (SEQ (LETT |all| (QVELT |sc| 3) . #2=(|SYMBOL;syscripts|))
                    (LETT |all| (SPADCALL (QVELT |sc| 2) |all| (QREFELT $ 72))
                          . #2#)
                    (LETT |all| (SPADCALL (QVELT |sc| 1) |all| (QREFELT $ 72))
                          . #2#)
                    (LETT |all| (SPADCALL (QVELT |sc| 0) |all| (QREFELT $ 72))
                          . #2#)
                    (EXIT (SPADCALL |all| (QVELT |sc| 4) (QREFELT $ 72)))))) 

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
          (EXIT (SPADCALL |sy| |sc| (QREFELT $ 74)))))) 

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
                      (SPADCALL (SPADCALL |sy| (QREFELT $ 75)) (QREFELT $ 76)))
             (QREFELT $ 37))
            (QREFELT $ 44))
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
          (LETT |s| (PNAME (SPADCALL |e| (QREFELT $ 75)))
                . #1=(|SYMBOL;latex;$S;23|))
          (COND
           ((SPADCALL (QCSIZE |s|) 1 (QREFELT $ 78))
            (COND
             ((SPADCALL (SPADCALL |s| 1 (QREFELT $ 80)) (|STR_to_CHAR| "\\")
                        (QREFELT $ 81))
              (LETT |s| (STRCONC "\\mbox{\\it " (STRCONC |s| "}")) . #1#)))))
          (COND ((NULL (SPADCALL |e| (QREFELT $ 21))) (EXIT |s|)))
          (LETT |ss| (SPADCALL |e| (QREFELT $ 82)) . #1#)
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
                                                (QREFELT $ 83)))
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
                                                (QREFELT $ 83)))
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
                                                (QREFELT $ 83)))
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
                                                (QREFELT $ 83)))
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
                                                (QREFELT $ 83)))
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
         ((#1=#:G1976 NIL) (|ns| (|String|))
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
                                               (SPADCALL |s| (QREFELT $ 85)))
                                            (QREFELT $ 80))
                                  |ns| (QREFELT $ 86))
                                 . #2#)
                           (EXIT
                            (COND
                             ((ZEROP |n|)
                              (PROGN (LETT #1# |ns| . #2#) (GO #3=#:G1975))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #3# (EXIT #1#)))) 

(SDEFUN |SYMBOL;new;$;25| (($ $))
        (SPROG ((|sym| (|String|)))
               (SEQ
                (LETT |sym|
                      (|SYMBOL;anyRadix|
                       (SPADCALL (QREFELT $ 9) (QREFELT $ 87)) (QREFELT $ 18)
                       $)
                      |SYMBOL;new;$;25|)
                (SPADCALL (QREFELT $ 9)
                          (+ (SPADCALL (QREFELT $ 9) (QREFELT $ 87)) 1)
                          (QREFELT $ 88))
                (EXIT (SPADCALL (STRCONC "%" |sym|) (QREFELT $ 37)))))) 

(SDEFUN |SYMBOL;new;2$;26| ((|x| $) ($ $))
        (SPROG
         ((|xx| (|String|)) (|n| (|Integer|))
          (|u| (|Union| (|Integer|) "failed")))
         (SEQ
          (LETT |n|
                (SEQ
                 (LETT |u| (SPADCALL |x| (QREFELT $ 12) (QREFELT $ 91))
                       . #1=(|SYMBOL;new;2$;26|))
                 (EXIT (COND ((QEQCAR |u| 1) 0) (#2='T (+ (QCDR |u|) 1)))))
                . #1#)
          (SPADCALL (QREFELT $ 12) |x| |n| (QREFELT $ 92))
          (LETT |xx|
                (COND
                 ((NULL (SPADCALL |x| (QREFELT $ 21)))
                  (SPADCALL |x| (QREFELT $ 76)))
                 ('T (SPADCALL (SPADCALL |x| (QREFELT $ 75)) (QREFELT $ 76))))
                . #1#)
          (LETT |xx| (STRCONC "%" |xx|) . #1#)
          (LETT |xx|
                (COND
                 ((>=
                   (SPADCALL
                    (SPADCALL |xx| (SPADCALL |xx| (QREFELT $ 93))
                              (QREFELT $ 80))
                    (QREFELT $ 17) (QREFELT $ 94))
                   (SPADCALL (QREFELT $ 17) (QREFELT $ 85)))
                  (STRCONC |xx| (|SYMBOL;anyRadix| |n| (QREFELT $ 19) $)))
                 (#2# (STRCONC |xx| (|SYMBOL;anyRadix| |n| (QREFELT $ 17) $))))
                . #1#)
          (COND
           ((NULL (SPADCALL |x| (QREFELT $ 21)))
            (EXIT (SPADCALL |xx| (QREFELT $ 37)))))
          (EXIT
           (SPADCALL (SPADCALL |xx| (QREFELT $ 37))
                     (SPADCALL |x| (QREFELT $ 82)) (QREFELT $ 74)))))) 

(SDEFUN |SYMBOL;resetNew;V;27| (($ |Void|))
        (SPROG ((#1=#:G1998 NIL) (|k| NIL))
               (SEQ (SPADCALL (QREFELT $ 9) 0 (QREFELT $ 88))
                    (SEQ (LETT |k| NIL . #2=(|SYMBOL;resetNew;V;27|))
                         (LETT #1# (SPADCALL (QREFELT $ 12) (QREFELT $ 96))
                               . #2#)
                         G190
                         (COND
                          ((OR (ATOM #1#)
                               (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT (SPADCALL |k| (QREFELT $ 12) (QREFELT $ 97))))
                         (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL (QREFELT $ 98)))))) 

(SDEFUN |SYMBOL;scripted?;$B;28| ((|sy| $) ($ |Boolean|))
        (COND ((ATOM |sy|) 'NIL) ('T 'T))) 

(SDEFUN |SYMBOL;name;2$;29| ((|sy| $) ($ $))
        (SPROG
         ((#1=#:G2005 NIL) (#2=#:G2006 NIL) (#3=#:G2007 NIL) (|i| NIL)
          (|str| (|String|)))
         (SEQ
          (EXIT
           (COND ((NULL (SPADCALL |sy| (QREFELT $ 21))) |sy|)
                 ('T
                  (SEQ
                   (LETT |str|
                         (SPADCALL
                          (SPADCALL (SPADCALL |sy| (QREFELT $ 100))
                                    (QREFELT $ 101))
                          (QREFELT $ 76))
                         . #4=(|SYMBOL;name;2$;29|))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |i| (+ (QREFELT $ 30) 1) . #4#)
                          (LETT #3# (QCSIZE |str|) . #4#) G190
                          (COND ((> |i| #3#) (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((NULL
                               (SPADCALL (SPADCALL |str| |i| (QREFELT $ 80))
                                         (QREFELT $ 102)))
                              (PROGN
                               (LETT #1#
                                     (PROGN
                                      (LETT #2#
                                            (SPADCALL
                                             (SPADCALL |str|
                                                       (SPADCALL |i|
                                                                 (QCSIZE |str|)
                                                                 (QREFELT $
                                                                          104))
                                                       (QREFELT $ 105))
                                             (QREFELT $ 37))
                                            . #4#)
                                      (GO #5=#:G2004))
                                     . #4#)
                               (GO #6=#:G2002))))))
                          (LETT |i| (+ |i| 1) . #4#) (GO G190) G191
                          (EXIT NIL)))
                    #6# (EXIT #1#))
                   (EXIT (|error| "Improper scripted symbol"))))))
          #5# (EXIT #2#)))) 

(SDEFUN |SYMBOL;scripts;$R;30|
        ((|sy| $)
         ($ |Record| (|:| |sub| (|List| (|OutputForm|)))
          (|:| |sup| (|List| (|OutputForm|)))
          (|:| |presup| (|List| (|OutputForm|)))
          (|:| |presub| (|List| (|OutputForm|)))
          (|:| |args| (|List| (|OutputForm|)))))
        (SPROG
         ((|allscripts| (|List| $)) (#1=#:G2020 NIL) (|a| NIL) (#2=#:G2019 NIL)
          (|i| NIL) (#3=#:G2018 NIL) (|n| NIL) (|m| (|Integer|))
          (|nscripts| (|List| (|NonNegativeInteger|))) (#4=#:G2010 NIL)
          (|j| NIL) (|nstr| (|NonNegativeInteger|)) (|str| (|String|))
          (|lscripts| (|List| (|List| (|OutputForm|)))))
         (SEQ
          (COND
           ((NULL (SPADCALL |sy| (QREFELT $ 21))) (VECTOR NIL NIL NIL NIL NIL))
           ('T
            (SEQ
             (LETT |nscripts| (LIST 0 0 0 0 0) . #5=(|SYMBOL;scripts;$R;30|))
             (LETT |lscripts| (LIST NIL NIL NIL NIL NIL) . #5#)
             (LETT |str|
                   (SPADCALL
                    (SPADCALL (SPADCALL |sy| (QREFELT $ 100)) (QREFELT $ 101))
                    (QREFELT $ 76))
                   . #5#)
             (LETT |nstr| (QCSIZE |str|) . #5#)
             (LETT |m| (SPADCALL |nscripts| (QREFELT $ 107)) . #5#)
             (SEQ (LETT |j| (+ (QREFELT $ 30) 1) . #5#) (LETT |i| |m| . #5#)
                  G190
                  (COND
                   ((OR (> |j| |nstr|)
                        (NULL
                         (SPADCALL (SPADCALL |str| |j| (QREFELT $ 80))
                                   (QREFELT $ 102))))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |nscripts| |i|
                              (PROG1
                                  (LETT #4#
                                        (- (SPADCALL |str| |j| (QREFELT $ 80))
                                           (QREFELT $ 31))
                                        . #5#)
                                (|check_subtype2| (>= #4# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #4#))
                              (QREFELT $ 108))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #5#)) . #5#)
                  (GO G190) G191 (EXIT NIL))
             (LETT |nscripts|
                   (SPADCALL (CDR |nscripts|) (|SPADfirst| |nscripts|)
                             (QREFELT $ 109))
                   . #5#)
             (LETT |allscripts|
                   (SPADCALL (SPADCALL |sy| (QREFELT $ 100)) (QREFELT $ 110))
                   . #5#)
             (LETT |m| (SPADCALL |lscripts| (QREFELT $ 111)) . #5#)
             (SEQ (LETT |n| NIL . #5#) (LETT #3# |nscripts| . #5#)
                  (LETT |i| |m| . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |n| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((< (SPADCALL |allscripts| (QREFELT $ 112)) |n|)
                      (|error| "Improper script count in symbol"))
                     ('T
                      (SEQ
                       (SPADCALL |lscripts| |i|
                                 (PROGN
                                  (LETT #2# NIL . #5#)
                                  (SEQ (LETT |a| NIL . #5#)
                                       (LETT #1#
                                             (SPADCALL |allscripts| |n|
                                                       (QREFELT $ 113))
                                             . #5#)
                                       G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |a| (CAR #1#) . #5#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (SPADCALL |a| (QREFELT $ 44))
                                                #2#)
                                               . #5#)))
                                       (LETT #1# (CDR #1#) . #5#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 114))
                       (EXIT
                        (LETT |allscripts|
                              (SPADCALL |allscripts| |n| (QREFELT $ 115))
                              . #5#)))))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT #3# (CDR #3#) . #5#)) . #5#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT
              (VECTOR (SPADCALL |lscripts| |m| (QREFELT $ 116))
                      (SPADCALL |lscripts| (+ |m| 1) (QREFELT $ 116))
                      (SPADCALL |lscripts| (+ |m| 2) (QREFELT $ 116))
                      (SPADCALL |lscripts| (+ |m| 3) (QREFELT $ 116))
                      (SPADCALL |lscripts| (+ |m| 4) (QREFELT $ 116)))))))))) 

(SDEFUN |SYMBOL;istring| ((|n| |Integer|) ($ |String|))
        (COND
         ((SPADCALL |n| 9 (QREFELT $ 117))
          (|error| "Can have at most 9 scripts of each kind"))
         ('T (QAREF1 (QREFELT $ 16) (+ |n| 0))))) 

(SDEFUN |SYMBOL;list;$L;32| ((|sy| $) ($ |List| $))
        (COND
         ((NULL (SPADCALL |sy| (QREFELT $ 21)))
          (|error|
           "Cannot convert a symbol to a list if it is not subscripted"))
         ('T |sy|))) 

(SDEFUN |SYMBOL;sample;$;33| (($ $)) (SPADCALL "aSymbol" (QREFELT $ 37))) 

(DECLAIM (NOTINLINE |Symbol;|)) 

(DEFUN |Symbol| ()
  (SPROG NIL
         (PROG (#1=#:G2027)
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
          (LETT $ (GETREFV 120) . #1#)
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
              (35 . |outputForm|) |SYMBOL;coerce;$Of;9| (|List| $$)
              (40 . |nil|) (|List| 49) |SYMBOL;script;$L$;20| (|List| 42)
              |SYMBOL;subscript;$L$;10| |SYMBOL;elt;$L$;11|
              |SYMBOL;superscript;$L$;12| |SYMBOL;argscript;$L$;13|
              (|PatternMatchResult| 6 23) (|Pattern| 6)
              (|PatternMatchSymbol| 6) (44 . |patternMatch|)
              (|PatternMatchResult| 6 $) |SYMBOL;patternMatch;$P2Pmr;14|
              (|PatternMatchResult| (|Float|) 23) (|Pattern| (|Float|))
              (|PatternMatchSymbol| (|Float|)) (51 . |patternMatch|)
              (|PatternMatchResult| (|Float|) $)
              |SYMBOL;patternMatch;$P2Pmr;15| (58 . |coerce|)
              |SYMBOL;convert;$P;16| (63 . |coerce|) |SYMBOL;convert;$P;17|
              (|List| $) (68 . |concat|) (73 . |concat|)
              (|Record| (|:| |sub| 49) (|:| |sup| 49) (|:| |presup| 49)
                        (|:| |presub| 49) (|:| |args| 49))
              |SYMBOL;script;$R$;21| |SYMBOL;name;2$;29| |SYMBOL;string;$S;22|
              (|NonNegativeInteger|) (79 . >) (|Character|) (85 . |elt|)
              (91 . ~=) |SYMBOL;scripts;$R;30| (97 . |latex|)
              |SYMBOL;latex;$S;23| (102 . |minIndex|) (107 . |concat|)
              (113 . |elt|) (118 . |setelt!|) |SYMBOL;new;$;25|
              (|Union| 6 '"failed") (124 . |search|) (130 . |setelt!|)
              (137 . |maxIndex|) (142 . |position|) |SYMBOL;new;2$;26|
              (148 . |keys|) (153 . |remove!|) (159 . |void|)
              |SYMBOL;resetNew;V;27| |SYMBOL;list;$L;32| (163 . |first|)
              (168 . |digit?|) (|UniversalSegment| 6) (173 . SEGMENT)
              (179 . |elt|) (|List| 77) (185 . |minIndex|) (190 . |setelt!|)
              (197 . |concat|) (203 . |rest|) (208 . |minIndex|) (213 . |#|)
              (218 . |first|) (224 . |setelt!|) (231 . |rest|) (237 . |elt|)
              (243 . >)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |SYMBOL;sample;$;33|) $))
              (|SingleInteger|))
           '#(~= 249 |superscript| 255 |subscript| 261 |string| 267 |smaller?|
              272 |scripts| 278 |scripted?| 283 |script| 288 |sample| 300
              |resetNew| 304 |patternMatch| 308 |new| 322 |name| 331 |min| 336
              |max| 342 |list| 348 |latex| 353 |hashUpdate!| 358 |hash| 364
              |elt| 369 |convert| 375 |coerce| 395 |argscript| 405 |OMwrite|
              411 >= 435 > 441 = 447 <= 453 < 459)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL NIL NIL |SetCategory&| |BasicType&| NIL
                     NIL NIL |OpenMath&| NIL |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|)
                      (|PatternMatchable| (|Float|)) (|PatternMatchable| 6)
                      (|SetCategory|) (|BasicType|) (|ConvertibleTo| 61)
                      (|ConvertibleTo| 55) (|ConvertibleTo| 23) (|OpenMath|)
                      (|ConvertibleTo| 32) (|PartialOrder|) (|CoercibleTo| 42))
                   (|makeByteWordVec2| 119
                                       '(1 7 0 6 8 0 10 0 11 1 14 0 13 15 2 24
                                         22 0 23 25 1 24 22 0 26 1 24 22 0 27 1
                                         32 0 23 33 1 42 0 23 43 0 45 0 46 3 56
                                         54 23 55 54 57 3 62 60 23 61 60 63 1
                                         61 0 23 66 1 55 0 23 68 1 36 0 70 71 2
                                         49 0 0 0 72 2 77 20 0 0 78 2 36 79 0 6
                                         80 2 79 20 0 0 81 1 42 36 0 83 1 36 6
                                         0 85 2 36 0 79 0 86 1 7 6 0 87 2 7 6 0
                                         6 88 2 10 90 2 0 91 3 10 6 0 2 6 92 1
                                         36 6 0 93 2 36 6 79 0 94 1 10 45 0 96
                                         2 10 90 2 0 97 0 22 0 98 1 45 2 0 101
                                         1 79 20 0 102 2 103 0 6 6 104 2 36 0 0
                                         103 105 1 106 6 0 107 3 106 77 0 6 77
                                         108 2 106 0 0 77 109 1 45 0 0 110 1 47
                                         6 0 111 1 45 77 0 112 2 45 0 0 77 113
                                         3 47 49 0 6 49 114 2 45 0 0 77 115 2
                                         47 49 0 6 116 2 6 20 0 0 117 2 0 20 0
                                         0 1 2 0 0 0 49 52 2 0 0 0 49 50 1 0 36
                                         0 76 2 0 20 0 0 1 1 0 73 0 82 1 0 20 0
                                         21 2 0 0 0 47 48 2 0 0 0 73 74 0 0 0
                                         118 0 0 22 99 3 0 64 0 61 64 65 3 0 58
                                         0 55 58 59 0 0 0 89 1 0 0 0 95 1 0 0 0
                                         75 2 0 0 0 0 1 2 0 0 0 0 1 1 0 70 0
                                         100 1 0 36 0 84 2 0 39 39 0 40 1 0 119
                                         0 1 2 0 0 0 49 51 1 0 61 0 67 1 0 23 0
                                         35 1 0 55 0 69 1 0 32 0 34 1 0 0 36 37
                                         1 0 42 0 44 2 0 0 0 49 53 3 0 22 24 0
                                         20 28 2 0 36 0 20 1 2 0 22 24 0 1 1 0
                                         36 0 1 2 0 20 0 0 1 2 0 20 0 0 1 2 0
                                         20 0 0 38 2 0 20 0 0 1 2 0 20 0 0
                                         41)))))
           '|lookupComplete|)) 

(MAKEPROP '|Symbol| 'NILADIC T) 
