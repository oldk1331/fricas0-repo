
(/VERSIONCHECK 2) 

(DEFUN |SYMBOL;writeOMSym| (|dev| |x| $)
  (COND
   ((SPADCALL |x| (QREFELT $ 21))
    (|error| "Cannot convert a scripted symbol to OpenMath"))
   ('T (SPADCALL |dev| |x| (QREFELT $ 25))))) 

(DEFUN |SYMBOL;OMwrite;$S;2| (|x| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|SYMBOL;OMwrite;$S;2|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 27)) (QREFELT $ 29))
                . #1#)
          (SPADCALL |dev| (QREFELT $ 30)) (|SYMBOL;writeOMSym| |dev| |x| $)
          (SPADCALL |dev| (QREFELT $ 31)) (SPADCALL |dev| (QREFELT $ 32))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |SYMBOL;OMwrite;$BS;3| (|x| |wholeObj| $)
  (PROG (|s| |dev| |sp|)
    (RETURN
     (SEQ (LETT |s| "" . #1=(|SYMBOL;OMwrite;$BS;3|))
          (LETT |sp| (OM-STRINGTOSTRINGPTR |s|) . #1#)
          (LETT |dev| (SPADCALL |sp| (SPADCALL (QREFELT $ 27)) (QREFELT $ 29))
                . #1#)
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 30))))
          (|SYMBOL;writeOMSym| |dev| |x| $)
          (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 31))))
          (SPADCALL |dev| (QREFELT $ 32))
          (LETT |s| (OM-STRINGPTRTOSTRING |sp|) . #1#) (EXIT |s|))))) 

(DEFUN |SYMBOL;OMwrite;Omd$V;4| (|dev| |x| $)
  (SEQ (SPADCALL |dev| (QREFELT $ 30)) (|SYMBOL;writeOMSym| |dev| |x| $)
       (EXIT (SPADCALL |dev| (QREFELT $ 31))))) 

(DEFUN |SYMBOL;OMwrite;Omd$BV;5| (|dev| |x| |wholeObj| $)
  (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 30))))
       (|SYMBOL;writeOMSym| |dev| |x| $)
       (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT $ 31))))))) 

(DEFUN |SYMBOL;convert;$If;6| (|s| $) (SPADCALL |s| (QREFELT $ 41))) 

(PUT '|SYMBOL;convert;2$;7| '|SPADreplace| '(XLAM (|s|) |s|)) 

(DEFUN |SYMBOL;convert;2$;7| (|s| $) |s|) 

(DEFUN |SYMBOL;coerce;S$;8| (|s| $) (VALUES (INTERN |s|))) 

(PUT '|SYMBOL;=;2$B;9| '|SPADreplace| 'EQUAL) 

(DEFUN |SYMBOL;=;2$B;9| (|x| |y| $) (EQUAL |x| |y|)) 

(PUT '|SYMBOL;<;2$B;10| '|SPADreplace| '(XLAM (|x| |y|) (GGREATERP |y| |x|))) 

(DEFUN |SYMBOL;<;2$B;10| (|x| |y| $) (GGREATERP |y| |x|)) 

(DEFUN |SYMBOL;coerce;$Of;11| (|x| $) (SPADCALL |x| (QREFELT $ 48))) 

(DEFUN |SYMBOL;subscript;$L$;12| (|sy| |lx| $)
  (SPADCALL |sy| (LIST |lx| NIL NIL NIL NIL) (QREFELT $ 51))) 

(DEFUN |SYMBOL;elt;$L$;13| (|sy| |lx| $) (SPADCALL |sy| |lx| (QREFELT $ 53))) 

(DEFUN |SYMBOL;superscript;$L$;14| (|sy| |lx| $)
  (SPADCALL |sy| (LIST NIL |lx| NIL NIL NIL) (QREFELT $ 51))) 

(DEFUN |SYMBOL;argscript;$L$;15| (|sy| |lx| $)
  (SPADCALL |sy| (LIST NIL NIL NIL NIL |lx|) (QREFELT $ 51))) 

(DEFUN |SYMBOL;patternMatch;$P2Pmr;16| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (QREFELT $ 60))) 

(DEFUN |SYMBOL;patternMatch;$P2Pmr;17| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (QREFELT $ 66))) 

(DEFUN |SYMBOL;convert;$P;18| (|x| $) (SPADCALL |x| (QREFELT $ 69))) 

(DEFUN |SYMBOL;convert;$P;19| (|x| $) (SPADCALL |x| (QREFELT $ 71))) 

(DEFUN |SYMBOL;syprefix| (|sc| $)
  (PROG (#1=#:G1965 |n| #2=#:G1964 |ns|)
    (RETURN
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
         (STRCONC (QREFELT $ 37) (|SYMBOL;istring| (LENGTH (QVELT |sc| 4)) $))
         (PROGN
          (LETT #2# NIL . #3#)
          (SEQ (LETT |n| NIL . #3#) (LETT #1# (NREVERSE |ns|) . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT (LETT #2# (CONS (|SYMBOL;istring| |n| $) #2#) . #3#)))
               (LETT #1# (CDR #1#) . #3#) (GO G190) G191
               (EXIT (NREVERSE #2#)))))
        (QREFELT $ 74))))))) 

(DEFUN |SYMBOL;syscripts| (|sc| $)
  (PROG (|all|)
    (RETURN
     (SEQ (LETT |all| (QVELT |sc| 3) . #1=(|SYMBOL;syscripts|))
          (LETT |all| (SPADCALL (QVELT |sc| 2) |all| (QREFELT $ 75)) . #1#)
          (LETT |all| (SPADCALL (QVELT |sc| 1) |all| (QREFELT $ 75)) . #1#)
          (LETT |all| (SPADCALL (QVELT |sc| 0) |all| (QREFELT $ 75)) . #1#)
          (EXIT (SPADCALL |all| (QVELT |sc| 4) (QREFELT $ 75))))))) 

(DEFUN |SYMBOL;script;$L$;22| (|sy| |ls| $)
  (PROG (|sc|)
    (RETURN
     (SEQ
      (LETT |sc| (VECTOR NIL NIL NIL NIL NIL) . #1=(|SYMBOL;script;$L$;22|))
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
      (EXIT (SPADCALL |sy| |sc| (QREFELT $ 77))))))) 

(DEFUN |SYMBOL;script;$R$;23| (|sy| |sc| $)
  (COND
   ((SPADCALL |sy| (QREFELT $ 21))
    (|error| "Cannot add scripts to a scripted symbol"))
   ('T
    (CONS
     (SPADCALL
      (SPADCALL
       (STRCONC (|SYMBOL;syprefix| |sc| $)
                (SPADCALL (SPADCALL |sy| (QREFELT $ 78)) (QREFELT $ 79)))
       (QREFELT $ 44))
      (QREFELT $ 49))
     (|SYMBOL;syscripts| |sc| $))))) 

(DEFUN |SYMBOL;string;$S;24| (|e| $)
  (COND ((NULL (SPADCALL |e| (QREFELT $ 21))) (PNAME |e|))
        ('T (|error| "Cannot form string from non-atomic symbols.")))) 

(DEFUN |SYMBOL;latex;$S;25| (|e| $)
  (PROG (|s| |sc| |lo| |ss|)
    (RETURN
     (SEQ
      (LETT |s| (PNAME (SPADCALL |e| (QREFELT $ 78)))
            . #1=(|SYMBOL;latex;$S;25|))
      (COND
       ((SPADCALL (QCSIZE |s|) 1 (QREFELT $ 81))
        (COND
         ((SPADCALL (SPADCALL |s| 1 (QREFELT $ 83)) (|STR_to_CHAR| "\\")
                    (QREFELT $ 84))
          (LETT |s| (STRCONC "\\mbox{\\it " (STRCONC |s| "}")) . #1#)))))
      (COND ((NULL (SPADCALL |e| (QREFELT $ 21))) (EXIT |s|)))
      (LETT |ss| (SPADCALL |e| (QREFELT $ 85)) . #1#)
      (LETT |lo| (QVELT |ss| 0) . #1#)
      (COND
       ((NULL (NULL |lo|))
        (SEQ (LETT |sc| "_{" . #1#)
             (SEQ G190
                  (COND ((NULL (COND ((NULL |lo|) 'NIL) ('T 'T))) (GO G191)))
                  (SEQ
                   (LETT |sc|
                         (STRCONC |sc|
                                  (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 86)))
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
                  (COND ((NULL (COND ((NULL |lo|) 'NIL) ('T 'T))) (GO G191)))
                  (SEQ
                   (LETT |sc|
                         (STRCONC |sc|
                                  (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 86)))
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
                  (COND ((NULL (COND ((NULL |lo|) 'NIL) ('T 'T))) (GO G191)))
                  (SEQ
                   (LETT |sc|
                         (STRCONC |sc|
                                  (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 86)))
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
                  (COND ((NULL (COND ((NULL |lo|) 'NIL) ('T 'T))) (GO G191)))
                  (SEQ
                   (LETT |sc|
                         (STRCONC |sc|
                                  (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 86)))
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
                  (COND ((NULL (COND ((NULL |lo|) 'NIL) ('T 'T))) (GO G191)))
                  (SEQ
                   (LETT |sc|
                         (STRCONC |sc|
                                  (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 86)))
                         . #1#)
                   (LETT |lo| (CDR |lo|) . #1#)
                   (EXIT
                    (COND
                     ((NULL (NULL |lo|))
                      (LETT |sc| (STRCONC |sc| ", ") . #1#)))))
                  NIL (GO G190) G191 (EXIT NIL))
             (LETT |sc| (STRCONC |sc| "} \\right)") . #1#)
             (EXIT (LETT |s| (STRCONC |s| |sc|) . #1#)))))
      (EXIT |s|))))) 

(DEFUN |SYMBOL;anyRadix| (|n| |s| $)
  (PROG (#1=#:G2019 |ns| |qr|)
    (RETURN
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
                                        (QREFELT $ 83))
                              |ns| (QREFELT $ 89))
                             . #2#)
                       (EXIT
                        (COND
                         ((ZEROP |n|)
                          (PROGN (LETT #1# |ns| . #2#) (GO #1#))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |SYMBOL;new;$;27| ($)
  (PROG (|sym|)
    (RETURN
     (SEQ
      (LETT |sym|
            (|SYMBOL;anyRadix| (SPADCALL (QREFELT $ 9) (QREFELT $ 90))
                               (QREFELT $ 18) $)
            |SYMBOL;new;$;27|)
      (SPADCALL (QREFELT $ 9) (+ (SPADCALL (QREFELT $ 9) (QREFELT $ 90)) 1)
                (QREFELT $ 91))
      (EXIT (SPADCALL (STRCONC "%" |sym|) (QREFELT $ 44))))))) 

(DEFUN |SYMBOL;new;2$;28| (|x| $)
  (PROG (|xx| |n| |u|)
    (RETURN
     (SEQ
      (LETT |n|
            (SEQ
             (LETT |u| (SPADCALL |x| (QREFELT $ 12) (QREFELT $ 94))
                   . #1=(|SYMBOL;new;2$;28|))
             (EXIT (COND ((QEQCAR |u| 1) 0) (#2='T (+ (QCDR |u|) 1)))))
            . #1#)
      (SPADCALL (QREFELT $ 12) |x| |n| (QREFELT $ 95))
      (LETT |xx|
            (COND
             ((NULL (SPADCALL |x| (QREFELT $ 21)))
              (SPADCALL |x| (QREFELT $ 79)))
             ('T (SPADCALL (SPADCALL |x| (QREFELT $ 78)) (QREFELT $ 79))))
            . #1#)
      (LETT |xx| (STRCONC "%" |xx|) . #1#)
      (LETT |xx|
            (COND
             ((>=
               (SPADCALL
                (SPADCALL |xx| (SPADCALL |xx| (QREFELT $ 96)) (QREFELT $ 83))
                (QREFELT $ 17) (QREFELT $ 97))
               (SPADCALL (QREFELT $ 17) (QREFELT $ 88)))
              (STRCONC |xx| (|SYMBOL;anyRadix| |n| (QREFELT $ 19) $)))
             (#2# (STRCONC |xx| (|SYMBOL;anyRadix| |n| (QREFELT $ 17) $))))
            . #1#)
      (COND
       ((NULL (SPADCALL |x| (QREFELT $ 21)))
        (EXIT (SPADCALL |xx| (QREFELT $ 44)))))
      (EXIT
       (SPADCALL (SPADCALL |xx| (QREFELT $ 44)) (SPADCALL |x| (QREFELT $ 85))
                 (QREFELT $ 77))))))) 

(DEFUN |SYMBOL;resetNew;V;29| ($)
  (PROG (#1=#:G2039 |k|)
    (RETURN
     (SEQ (SPADCALL (QREFELT $ 9) 0 (QREFELT $ 91))
          (SEQ (LETT |k| NIL . #2=(|SYMBOL;resetNew;V;29|))
               (LETT #1# (SPADCALL (QREFELT $ 12) (QREFELT $ 100)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |k| (QREFELT $ 12) (QREFELT $ 101))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (QREFELT $ 102))))))) 

(DEFUN |SYMBOL;scripted?;$B;30| (|sy| $) (COND ((ATOM |sy|) 'NIL) ('T 'T))) 

(DEFUN |SYMBOL;name;2$;31| (|sy| $)
  (PROG (#1=#:G2043 #2=#:G2045 #3=#:G2046 |i| |str|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL (SPADCALL |sy| (QREFELT $ 21))) |sy|)
             ('T
              (SEQ
               (LETT |str|
                     (SPADCALL
                      (SPADCALL (SPADCALL |sy| (QREFELT $ 104))
                                (QREFELT $ 105))
                      (QREFELT $ 79))
                     . #4=(|SYMBOL;name;2$;31|))
               (SEQ
                (EXIT
                 (SEQ (LETT |i| (+ (QREFELT $ 38) 1) . #4#)
                      (LETT #3# (QCSIZE |str|) . #4#) G190
                      (COND ((> |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL
                           (SPADCALL (SPADCALL |str| |i| (QREFELT $ 83))
                                     (QREFELT $ 106)))
                          (PROGN
                           (LETT #1#
                                 (PROGN
                                  (LETT #2#
                                        (SPADCALL
                                         (SPADCALL |str|
                                                   (SPADCALL |i| (QCSIZE |str|)
                                                             (QREFELT $ 108))
                                                   (QREFELT $ 109))
                                         (QREFELT $ 44))
                                        . #4#)
                                  (GO #2#))
                                 . #4#)
                           (GO #1#))))))
                      (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
                #1# (EXIT #1#))
               (EXIT (|error| "Improper scripted symbol"))))))
      #2# (EXIT #2#))))) 

(DEFUN |SYMBOL;scripts;$R;32| (|sy| $)
  (PROG (|allscripts| #1=#:G2060 |a| #2=#:G2059 |i| #3=#:G2058 |n| |m|
         |nscripts| #4=#:G2049 |j| |nstr| |str| |lscripts|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |sy| (QREFELT $ 21))) (VECTOR NIL NIL NIL NIL NIL))
       ('T
        (SEQ (LETT |nscripts| (LIST 0 0 0 0 0) . #5=(|SYMBOL;scripts;$R;32|))
             (LETT |lscripts| (LIST NIL NIL NIL NIL NIL) . #5#)
             (LETT |str|
                   (SPADCALL
                    (SPADCALL (SPADCALL |sy| (QREFELT $ 104)) (QREFELT $ 105))
                    (QREFELT $ 79))
                   . #5#)
             (LETT |nstr| (QCSIZE |str|) . #5#)
             (LETT |m| (SPADCALL |nscripts| (QREFELT $ 111)) . #5#)
             (SEQ (LETT |j| (+ (QREFELT $ 38) 1) . #5#) (LETT |i| |m| . #5#)
                  G190
                  (COND
                   ((OR (> |j| |nstr|)
                        (NULL
                         (SPADCALL (SPADCALL |str| |j| (QREFELT $ 83))
                                   (QREFELT $ 106))))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |nscripts| |i|
                              (PROG1
                                  (LETT #4#
                                        (- (SPADCALL |str| |j| (QREFELT $ 83))
                                           (QREFELT $ 39))
                                        . #5#)
                                (|check_subtype| (>= #4# 0)
                                                 '(|NonNegativeInteger|) #4#))
                              (QREFELT $ 112))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #5#)) . #5#)
                  (GO G190) G191 (EXIT NIL))
             (LETT |nscripts|
                   (SPADCALL (CDR |nscripts|) (|SPADfirst| |nscripts|)
                             (QREFELT $ 113))
                   . #5#)
             (LETT |allscripts|
                   (SPADCALL (SPADCALL |sy| (QREFELT $ 104)) (QREFELT $ 114))
                   . #5#)
             (LETT |m| (SPADCALL |lscripts| (QREFELT $ 115)) . #5#)
             (SEQ (LETT |n| NIL . #5#) (LETT #3# |nscripts| . #5#)
                  (LETT |i| |m| . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |n| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((< (SPADCALL |allscripts| (QREFELT $ 116)) |n|)
                      (|error| "Improper script count in symbol"))
                     ('T
                      (SEQ
                       (SPADCALL |lscripts| |i|
                                 (PROGN
                                  (LETT #2# NIL . #5#)
                                  (SEQ (LETT |a| NIL . #5#)
                                       (LETT #1#
                                             (SPADCALL |allscripts| |n|
                                                       (QREFELT $ 117))
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
                                                (SPADCALL |a| (QREFELT $ 49))
                                                #2#)
                                               . #5#)))
                                       (LETT #1# (CDR #1#) . #5#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 118))
                       (EXIT
                        (LETT |allscripts|
                              (SPADCALL |allscripts| |n| (QREFELT $ 119))
                              . #5#)))))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT #3# (CDR #3#) . #5#)) . #5#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT
              (VECTOR (SPADCALL |lscripts| |m| (QREFELT $ 120))
                      (SPADCALL |lscripts| (+ |m| 1) (QREFELT $ 120))
                      (SPADCALL |lscripts| (+ |m| 2) (QREFELT $ 120))
                      (SPADCALL |lscripts| (+ |m| 3) (QREFELT $ 120))
                      (SPADCALL |lscripts| (+ |m| 4) (QREFELT $ 120))))))))))) 

(DEFUN |SYMBOL;istring| (|n| $)
  (COND
   ((SPADCALL |n| 9 (QREFELT $ 121))
    (|error| "Can have at most 9 scripts of each kind"))
   ('T (QAREF1 (QREFELT $ 16) (+ |n| 0))))) 

(DEFUN |SYMBOL;list;$L;34| (|sy| $)
  (COND
   ((NULL (SPADCALL |sy| (QREFELT $ 21)))
    (|error| "Cannot convert a symbol to a list if it is not subscripted"))
   ('T |sy|))) 

(DEFUN |SYMBOL;sample;$;35| ($) (SPADCALL "aSymbol" (QREFELT $ 44))) 

(DEFUN |Symbol| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G2067)
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
            (COND ((NOT #1#) (HREM |$ConstructorCache| '|Symbol|))))))))))) 

(DEFUN |Symbol;| ()
  (PROG (|dv$| $ |pv$|)
    (RETURN
     (PROGN
      (LETT |dv$| '(|Symbol|) . #1=(|Symbol|))
      (LETT $ (GETREFV 125) . #1#)
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
      (QSETREFV $ 37 "*")
      (QSETREFV $ 38 (QCSIZE (QREFELT $ 37)))
      (QSETREFV $ 39 (|STR_to_CHAR| #2#))
      $)))) 

(MAKEPROP '|Symbol| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|Reference| 6) (0 . |ref|)
              '|count| (|AssociationList| $$ 6) (5 . |empty|) '|xcount|
              (|List| 28) (|PrimitiveArray| 28) (9 . |construct|) '|istrings|
              '|nums| 'ALPHAS '|alphas| (|Boolean|) |SYMBOL;scripted?;$B;30|
              (|Void|) (|Symbol|) (|OpenMathDevice|) (14 . |OMputVariable|)
              (|OpenMathEncoding|) (20 . |OMencodingXML|) (|String|)
              (24 . |OMopenString|) (30 . |OMputObject|)
              (35 . |OMputEndObject|) (40 . |OMclose|) |SYMBOL;OMwrite;$S;2|
              |SYMBOL;OMwrite;$BS;3| |SYMBOL;OMwrite;Omd$V;4|
              |SYMBOL;OMwrite;Omd$BV;5| '|hd| '|lhd| '|ord0| (|InputForm|)
              (45 . |convert|) |SYMBOL;convert;$If;6| |SYMBOL;convert;2$;7|
              |SYMBOL;coerce;S$;8| |SYMBOL;=;2$B;9| |SYMBOL;<;2$B;10|
              (|OutputForm|) (50 . |outputForm|) |SYMBOL;coerce;$Of;11|
              (|List| 52) |SYMBOL;script;$L$;22| (|List| 47)
              |SYMBOL;subscript;$L$;12| |SYMBOL;elt;$L$;13|
              |SYMBOL;superscript;$L$;14| |SYMBOL;argscript;$L$;15|
              (|PatternMatchResult| 6 23) (|Pattern| 6)
              (|PatternMatchSymbol| 6) (55 . |patternMatch|)
              (|PatternMatchResult| 6 $) |SYMBOL;patternMatch;$P2Pmr;16|
              (|PatternMatchResult| (|Float|) 23) (|Pattern| (|Float|))
              (|PatternMatchSymbol| (|Float|)) (62 . |patternMatch|)
              (|PatternMatchResult| (|Float|) $)
              |SYMBOL;patternMatch;$P2Pmr;17| (69 . |coerce|)
              |SYMBOL;convert;$P;18| (74 . |coerce|) |SYMBOL;convert;$P;19|
              (|List| $) (79 . |concat|) (84 . |concat|)
              (|Record| (|:| |sub| 52) (|:| |sup| 52) (|:| |presup| 52)
                        (|:| |presub| 52) (|:| |args| 52))
              |SYMBOL;script;$R$;23| |SYMBOL;name;2$;31| |SYMBOL;string;$S;24|
              (|NonNegativeInteger|) (90 . >) (|Character|) (96 . |elt|)
              (102 . ~=) |SYMBOL;scripts;$R;32| (108 . |latex|)
              |SYMBOL;latex;$S;25| (113 . |minIndex|) (118 . |concat|)
              (124 . |elt|) (129 . |setelt|) |SYMBOL;new;$;27|
              (|Union| 6 '"failed") (135 . |search|) (141 . |setelt|)
              (148 . |maxIndex|) (153 . |position|) |SYMBOL;new;2$;28|
              (|List| $$) (159 . |keys|) (164 . |remove!|) (170 . |void|)
              |SYMBOL;resetNew;V;29| |SYMBOL;list;$L;34| (174 . |first|)
              (179 . |digit?|) (|UniversalSegment| 6) (184 . SEGMENT)
              (190 . |elt|) (|List| 80) (196 . |minIndex|) (201 . |setelt|)
              (208 . |concat|) (214 . |rest|) (219 . |minIndex|) (224 . |#|)
              (229 . |first|) (235 . |setelt|) (242 . |rest|) (248 . |elt|)
              (254 . >)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |SYMBOL;sample;$;35|) $))
              (|SingleInteger|) (|HashState|))
           '#(~= 260 |superscript| 266 |subscript| 272 |string| 278 |smaller?|
              283 |scripts| 289 |scripted?| 294 |script| 299 |sample| 311
              |resetNew| 315 |patternMatch| 319 |new| 333 |name| 342 |min| 347
              |max| 353 |list| 359 |latex| 364 |hashUpdate!| 369 |hash| 375
              |elt| 380 |convert| 386 |coerce| 406 |argscript| 416 |OMwrite|
              422 >= 446 > 452 = 458 <= 464 < 470)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL NIL NIL |SetCategory&| |BasicType&| NIL
                     NIL NIL NIL NIL |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|)
                      (|PatternMatchable| (|Float|)) (|PatternMatchable| 6)
                      (|SetCategory|) (|BasicType|) (|ConvertibleTo| 64)
                      (|ConvertibleTo| 58) (|ConvertibleTo| 23) (|OpenMath|)
                      (|ConvertibleTo| 40) (|PartialOrder|) (|CoercibleTo| 47))
                   (|makeByteWordVec2| 124
                                       '(1 7 0 6 8 0 10 0 11 1 14 0 13 15 2 24
                                         22 0 23 25 0 26 0 27 2 24 0 28 26 29 1
                                         24 22 0 30 1 24 22 0 31 1 24 22 0 32 1
                                         40 0 23 41 1 47 0 23 48 3 59 57 23 58
                                         57 60 3 65 63 23 64 63 66 1 64 0 23 69
                                         1 58 0 23 71 1 28 0 73 74 2 52 0 0 0
                                         75 2 80 20 0 0 81 2 28 82 0 6 83 2 82
                                         20 0 0 84 1 47 28 0 86 1 28 6 0 88 2
                                         28 0 82 0 89 1 7 6 0 90 2 7 6 0 6 91 2
                                         10 93 2 0 94 3 10 6 0 2 6 95 1 28 6 0
                                         96 2 28 6 82 0 97 1 10 99 0 100 2 10
                                         93 2 0 101 0 22 0 102 1 99 2 0 105 1
                                         82 20 0 106 2 107 0 6 6 108 2 28 0 0
                                         107 109 1 110 6 0 111 3 110 80 0 6 80
                                         112 2 110 0 0 80 113 1 99 0 0 114 1 50
                                         6 0 115 1 99 80 0 116 2 99 0 0 80 117
                                         3 50 52 0 6 52 118 2 99 0 0 80 119 2
                                         50 52 0 6 120 2 6 20 0 0 121 2 0 20 0
                                         0 1 2 0 0 0 52 55 2 0 0 0 52 53 1 0 28
                                         0 79 2 0 20 0 0 1 1 0 76 0 85 1 0 20 0
                                         21 2 0 0 0 50 51 2 0 0 0 76 77 0 0 0
                                         122 0 0 22 103 3 0 67 0 64 67 68 3 0
                                         61 0 58 61 62 0 0 0 92 1 0 0 0 98 1 0
                                         0 0 78 2 0 0 0 0 1 2 0 0 0 0 1 1 0 73
                                         0 104 1 0 28 0 87 2 0 124 124 0 1 1 0
                                         123 0 1 2 0 0 0 52 54 1 0 64 0 70 1 0
                                         23 0 43 1 0 58 0 72 1 0 40 0 42 1 0 0
                                         28 44 1 0 47 0 49 2 0 0 0 52 56 3 0 22
                                         24 0 20 36 2 0 28 0 20 34 2 0 22 24 0
                                         35 1 0 28 0 33 2 0 20 0 0 1 2 0 20 0 0
                                         1 2 0 20 0 0 45 2 0 20 0 0 1 2 0 20 0
                                         0 46)))))
           '|lookupComplete|)) 

(MAKEPROP '|Symbol| 'NILADIC T) 
