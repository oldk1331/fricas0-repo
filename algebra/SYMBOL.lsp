
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

(DEFUN |SYMBOL;hashUpdate!;Hs$Hs;10| (|hs| |s| $)
  (HASHSTATEUPDATE |hs| (SXHASH |s|))) 

(PUT '|SYMBOL;<;2$B;11| '|SPADreplace| '(XLAM (|x| |y|) (GGREATERP |y| |x|))) 

(DEFUN |SYMBOL;<;2$B;11| (|x| |y| $) (GGREATERP |y| |x|)) 

(DEFUN |SYMBOL;coerce;$Of;12| (|x| $) (SPADCALL |x| (QREFELT $ 50))) 

(DEFUN |SYMBOL;subscript;$L$;13| (|sy| |lx| $)
  (SPADCALL |sy| (LIST |lx| NIL NIL NIL NIL) (QREFELT $ 55))) 

(DEFUN |SYMBOL;elt;$L$;14| (|sy| |lx| $) (SPADCALL |sy| |lx| (QREFELT $ 57))) 

(DEFUN |SYMBOL;superscript;$L$;15| (|sy| |lx| $)
  (SPADCALL |sy| (LIST NIL |lx| NIL NIL NIL) (QREFELT $ 55))) 

(DEFUN |SYMBOL;argscript;$L$;16| (|sy| |lx| $)
  (SPADCALL |sy| (LIST NIL NIL NIL NIL |lx|) (QREFELT $ 55))) 

(DEFUN |SYMBOL;patternMatch;$P2Pmr;17| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (QREFELT $ 64))) 

(DEFUN |SYMBOL;patternMatch;$P2Pmr;18| (|x| |p| |l| $)
  (SPADCALL |x| |p| |l| (QREFELT $ 70))) 

(DEFUN |SYMBOL;convert;$P;19| (|x| $) (SPADCALL |x| (QREFELT $ 73))) 

(DEFUN |SYMBOL;convert;$P;20| (|x| $) (SPADCALL |x| (QREFELT $ 75))) 

(DEFUN |SYMBOL;syprefix| (|sc| $)
  (PROG (#1=#:G1947 |n| #2=#:G1946 |ns|)
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
        (QREFELT $ 78))))))) 

(DEFUN |SYMBOL;syscripts| (|sc| $)
  (PROG (|all|)
    (RETURN
     (SEQ (LETT |all| (QVELT |sc| 3) . #1=(|SYMBOL;syscripts|))
          (LETT |all| (SPADCALL (QVELT |sc| 2) |all| (QREFELT $ 79)) . #1#)
          (LETT |all| (SPADCALL (QVELT |sc| 1) |all| (QREFELT $ 79)) . #1#)
          (LETT |all| (SPADCALL (QVELT |sc| 0) |all| (QREFELT $ 79)) . #1#)
          (EXIT (SPADCALL |all| (QVELT |sc| 4) (QREFELT $ 79))))))) 

(DEFUN |SYMBOL;script;$L$;23| (|sy| |ls| $)
  (PROG (|sc|)
    (RETURN
     (SEQ
      (LETT |sc| (VECTOR NIL NIL NIL NIL NIL) . #1=(|SYMBOL;script;$L$;23|))
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
      (EXIT (SPADCALL |sy| |sc| (QREFELT $ 81))))))) 

(DEFUN |SYMBOL;script;$R$;24| (|sy| |sc| $)
  (COND
   ((SPADCALL |sy| (QREFELT $ 21))
    (|error| "Cannot add scripts to a scripted symbol"))
   ('T
    (CONS
     (SPADCALL
      (SPADCALL
       (STRCONC (|SYMBOL;syprefix| |sc| $)
                (SPADCALL (SPADCALL |sy| (QREFELT $ 82)) (QREFELT $ 83)))
       (QREFELT $ 44))
      (QREFELT $ 51))
     (|SYMBOL;syscripts| |sc| $))))) 

(DEFUN |SYMBOL;string;$S;25| (|e| $)
  (COND ((NULL (SPADCALL |e| (QREFELT $ 21))) (PNAME |e|))
        ('T (|error| "Cannot form string from non-atomic symbols.")))) 

(DEFUN |SYMBOL;latex;$S;26| (|e| $)
  (PROG (|s| |sc| |lo| |ss|)
    (RETURN
     (SEQ
      (LETT |s| (PNAME (SPADCALL |e| (QREFELT $ 82)))
            . #1=(|SYMBOL;latex;$S;26|))
      (COND
       ((SPADCALL (QCSIZE |s|) 1 (QREFELT $ 85))
        (COND
         ((SPADCALL (SPADCALL |s| 1 (QREFELT $ 87)) (|STR_to_CHAR| "\\")
                    (QREFELT $ 88))
          (LETT |s| (STRCONC "\\mbox{\\it " (STRCONC |s| "}")) . #1#)))))
      (COND ((NULL (SPADCALL |e| (QREFELT $ 21))) (EXIT |s|)))
      (LETT |ss| (SPADCALL |e| (QREFELT $ 89)) . #1#)
      (LETT |lo| (QVELT |ss| 0) . #1#)
      (COND
       ((NULL (NULL |lo|))
        (SEQ (LETT |sc| "_{" . #1#)
             (SEQ G190
                  (COND ((NULL (COND ((NULL |lo|) 'NIL) ('T 'T))) (GO G191)))
                  (SEQ
                   (LETT |sc|
                         (STRCONC |sc|
                                  (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 90)))
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
                                  (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 90)))
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
                                  (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 90)))
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
                                  (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 90)))
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
                                  (SPADCALL (|SPADfirst| |lo|) (QREFELT $ 90)))
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
  (PROG (#1=#:G2001 |ns| |qr|)
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
                                           (SPADCALL |s| (QREFELT $ 92)))
                                        (QREFELT $ 87))
                              |ns| (QREFELT $ 93))
                             . #2#)
                       (EXIT
                        (COND
                         ((ZEROP |n|)
                          (PROGN (LETT #1# |ns| . #2#) (GO #1#))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
      #1# (EXIT #1#))))) 

(DEFUN |SYMBOL;new;$;28| ($)
  (PROG (|sym|)
    (RETURN
     (SEQ
      (LETT |sym|
            (|SYMBOL;anyRadix| (SPADCALL (QREFELT $ 9) (QREFELT $ 94))
                               (QREFELT $ 18) $)
            |SYMBOL;new;$;28|)
      (SPADCALL (QREFELT $ 9) (+ (SPADCALL (QREFELT $ 9) (QREFELT $ 94)) 1)
                (QREFELT $ 95))
      (EXIT (SPADCALL (STRCONC "%" |sym|) (QREFELT $ 44))))))) 

(DEFUN |SYMBOL;new;2$;29| (|x| $)
  (PROG (|xx| |n| |u|)
    (RETURN
     (SEQ
      (LETT |n|
            (SEQ
             (LETT |u| (SPADCALL |x| (QREFELT $ 12) (QREFELT $ 98))
                   . #1=(|SYMBOL;new;2$;29|))
             (EXIT (COND ((QEQCAR |u| 1) 0) (#2='T (+ (QCDR |u|) 1)))))
            . #1#)
      (SPADCALL (QREFELT $ 12) |x| |n| (QREFELT $ 99))
      (LETT |xx|
            (COND
             ((NULL (SPADCALL |x| (QREFELT $ 21)))
              (SPADCALL |x| (QREFELT $ 83)))
             ('T (SPADCALL (SPADCALL |x| (QREFELT $ 82)) (QREFELT $ 83))))
            . #1#)
      (LETT |xx| (STRCONC "%" |xx|) . #1#)
      (LETT |xx|
            (COND
             ((>=
               (SPADCALL
                (SPADCALL |xx| (SPADCALL |xx| (QREFELT $ 100)) (QREFELT $ 87))
                (QREFELT $ 17) (QREFELT $ 101))
               (SPADCALL (QREFELT $ 17) (QREFELT $ 92)))
              (STRCONC |xx| (|SYMBOL;anyRadix| |n| (QREFELT $ 19) $)))
             (#2# (STRCONC |xx| (|SYMBOL;anyRadix| |n| (QREFELT $ 17) $))))
            . #1#)
      (COND
       ((NULL (SPADCALL |x| (QREFELT $ 21)))
        (EXIT (SPADCALL |xx| (QREFELT $ 44)))))
      (EXIT
       (SPADCALL (SPADCALL |xx| (QREFELT $ 44)) (SPADCALL |x| (QREFELT $ 89))
                 (QREFELT $ 81))))))) 

(DEFUN |SYMBOL;resetNew;V;30| ($)
  (PROG (#1=#:G2023 |k|)
    (RETURN
     (SEQ (SPADCALL (QREFELT $ 9) 0 (QREFELT $ 95))
          (SEQ (LETT |k| NIL . #2=(|SYMBOL;resetNew;V;30|))
               (LETT #1# (SPADCALL (QREFELT $ 12) (QREFELT $ 103)) . #2#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |k| (QREFELT $ 12) (QREFELT $ 104))))
               (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL (QREFELT $ 105))))))) 

(DEFUN |SYMBOL;scripted?;$B;31| (|sy| $) (COND ((ATOM |sy|) 'NIL) ('T 'T))) 

(DEFUN |SYMBOL;name;2$;32| (|sy| $)
  (PROG (#1=#:G2027 #2=#:G2029 #3=#:G2030 |i| |str|)
    (RETURN
     (SEQ
      (EXIT
       (COND ((NULL (SPADCALL |sy| (QREFELT $ 21))) |sy|)
             ('T
              (SEQ
               (LETT |str|
                     (SPADCALL
                      (SPADCALL (SPADCALL |sy| (QREFELT $ 107))
                                (QREFELT $ 108))
                      (QREFELT $ 83))
                     . #4=(|SYMBOL;name;2$;32|))
               (SEQ
                (EXIT
                 (SEQ (LETT |i| (+ (QREFELT $ 38) 1) . #4#)
                      (LETT #3# (QCSIZE |str|) . #4#) G190
                      (COND ((> |i| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((NULL
                           (SPADCALL (SPADCALL |str| |i| (QREFELT $ 87))
                                     (QREFELT $ 109)))
                          (PROGN
                           (LETT #1#
                                 (PROGN
                                  (LETT #2#
                                        (SPADCALL
                                         (SPADCALL |str|
                                                   (SPADCALL |i| (QCSIZE |str|)
                                                             (QREFELT $ 111))
                                                   (QREFELT $ 112))
                                         (QREFELT $ 44))
                                        . #4#)
                                  (GO #2#))
                                 . #4#)
                           (GO #1#))))))
                      (LETT |i| (+ |i| 1) . #4#) (GO G190) G191 (EXIT NIL)))
                #1# (EXIT #1#))
               (EXIT (|error| "Improper scripted symbol"))))))
      #2# (EXIT #2#))))) 

(DEFUN |SYMBOL;scripts;$R;33| (|sy| $)
  (PROG (|allscripts| #1=#:G2043 |a| #2=#:G2042 |i| #3=#:G2041 |n| |m|
         |nscripts| #4=#:G2033 |j| |nstr| |str| |lscripts|)
    (RETURN
     (SEQ
      (COND
       ((NULL (SPADCALL |sy| (QREFELT $ 21))) (VECTOR NIL NIL NIL NIL NIL))
       ('T
        (SEQ (LETT |nscripts| (LIST 0 0 0 0 0) . #5=(|SYMBOL;scripts;$R;33|))
             (LETT |lscripts| (LIST NIL NIL NIL NIL NIL) . #5#)
             (LETT |str|
                   (SPADCALL
                    (SPADCALL (SPADCALL |sy| (QREFELT $ 107)) (QREFELT $ 108))
                    (QREFELT $ 83))
                   . #5#)
             (LETT |nstr| (QCSIZE |str|) . #5#)
             (LETT |m| (SPADCALL |nscripts| (QREFELT $ 114)) . #5#)
             (SEQ (LETT |j| (+ (QREFELT $ 38) 1) . #5#) (LETT |i| |m| . #5#)
                  G190
                  (COND
                   ((OR (> |j| |nstr|)
                        (NULL
                         (SPADCALL (SPADCALL |str| |j| (QREFELT $ 87))
                                   (QREFELT $ 109))))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |nscripts| |i|
                              (PROG1
                                  (LETT #4#
                                        (- (SPADCALL |str| |j| (QREFELT $ 87))
                                           (QREFELT $ 39))
                                        . #5#)
                                (|check_subtype| (>= #4# 0)
                                                 '(|NonNegativeInteger|) #4#))
                              (QREFELT $ 115))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1) . #5#)) . #5#)
                  (GO G190) G191 (EXIT NIL))
             (LETT |nscripts|
                   (SPADCALL (CDR |nscripts|) (|SPADfirst| |nscripts|)
                             (QREFELT $ 116))
                   . #5#)
             (LETT |allscripts|
                   (SPADCALL (SPADCALL |sy| (QREFELT $ 107)) (QREFELT $ 117))
                   . #5#)
             (LETT |m| (SPADCALL |lscripts| (QREFELT $ 118)) . #5#)
             (SEQ (LETT |n| NIL . #5#) (LETT #3# |nscripts| . #5#)
                  (LETT |i| |m| . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |n| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (COND
                     ((< (SPADCALL |allscripts| (QREFELT $ 119)) |n|)
                      (|error| "Improper script count in symbol"))
                     ('T
                      (SEQ
                       (SPADCALL |lscripts| |i|
                                 (PROGN
                                  (LETT #2# NIL . #5#)
                                  (SEQ (LETT |a| NIL . #5#)
                                       (LETT #1#
                                             (SPADCALL |allscripts| |n|
                                                       (QREFELT $ 120))
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
                                                (SPADCALL |a| (QREFELT $ 51))
                                                #2#)
                                               . #5#)))
                                       (LETT #1# (CDR #1#) . #5#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 121))
                       (EXIT
                        (LETT |allscripts|
                              (SPADCALL |allscripts| |n| (QREFELT $ 122))
                              . #5#)))))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT #3# (CDR #3#) . #5#)) . #5#)
                  (GO G190) G191 (EXIT NIL))
             (EXIT
              (VECTOR (SPADCALL |lscripts| |m| (QREFELT $ 123))
                      (SPADCALL |lscripts| (+ |m| 1) (QREFELT $ 123))
                      (SPADCALL |lscripts| (+ |m| 2) (QREFELT $ 123))
                      (SPADCALL |lscripts| (+ |m| 3) (QREFELT $ 123))
                      (SPADCALL |lscripts| (+ |m| 4) (QREFELT $ 123))))))))))) 

(DEFUN |SYMBOL;istring| (|n| $)
  (COND
   ((SPADCALL |n| 9 (QREFELT $ 124))
    (|error| "Can have at most 9 scripts of each kind"))
   ('T (QAREF1 (QREFELT $ 16) (+ |n| 0))))) 

(DEFUN |SYMBOL;list;$L;35| (|sy| $)
  (COND
   ((NULL (SPADCALL |sy| (QREFELT $ 21)))
    (|error| "Cannot convert a symbol to a list if it is not subscripted"))
   ('T |sy|))) 

(DEFUN |SYMBOL;sample;$;36| ($) (SPADCALL "aSymbol" (QREFELT $ 44))) 

(DECLAIM (NOTINLINE |Symbol;|)) 

(DEFUN |Symbol| ()
  (PROG ()
    (RETURN
     (PROG (#1=#:G2050)
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
      (LETT $ (GETREFV 127) . #1#)
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
              '|nums| 'ALPHAS '|alphas| (|Boolean|) |SYMBOL;scripted?;$B;31|
              (|Void|) (|Symbol|) (|OpenMathDevice|) (14 . |OMputVariable|)
              (|OpenMathEncoding|) (20 . |OMencodingXML|) (|String|)
              (24 . |OMopenString|) (30 . |OMputObject|)
              (35 . |OMputEndObject|) (40 . |OMclose|) |SYMBOL;OMwrite;$S;2|
              |SYMBOL;OMwrite;$BS;3| |SYMBOL;OMwrite;Omd$V;4|
              |SYMBOL;OMwrite;Omd$BV;5| '|hd| '|lhd| '|ord0| (|InputForm|)
              (45 . |convert|) |SYMBOL;convert;$If;6| |SYMBOL;convert;2$;7|
              |SYMBOL;coerce;S$;8| |SYMBOL;=;2$B;9| (|HashState|)
              |SYMBOL;hashUpdate!;Hs$Hs;10| |SYMBOL;<;2$B;11| (|OutputForm|)
              (50 . |outputForm|) |SYMBOL;coerce;$Of;12| (|List| $$)
              (55 . |nil|) (|List| 56) |SYMBOL;script;$L$;23| (|List| 49)
              |SYMBOL;subscript;$L$;13| |SYMBOL;elt;$L$;14|
              |SYMBOL;superscript;$L$;15| |SYMBOL;argscript;$L$;16|
              (|PatternMatchResult| 6 23) (|Pattern| 6)
              (|PatternMatchSymbol| 6) (59 . |patternMatch|)
              (|PatternMatchResult| 6 $) |SYMBOL;patternMatch;$P2Pmr;17|
              (|PatternMatchResult| (|Float|) 23) (|Pattern| (|Float|))
              (|PatternMatchSymbol| (|Float|)) (66 . |patternMatch|)
              (|PatternMatchResult| (|Float|) $)
              |SYMBOL;patternMatch;$P2Pmr;18| (73 . |coerce|)
              |SYMBOL;convert;$P;19| (78 . |coerce|) |SYMBOL;convert;$P;20|
              (|List| $) (83 . |concat|) (88 . |concat|)
              (|Record| (|:| |sub| 56) (|:| |sup| 56) (|:| |presup| 56)
                        (|:| |presub| 56) (|:| |args| 56))
              |SYMBOL;script;$R$;24| |SYMBOL;name;2$;32| |SYMBOL;string;$S;25|
              (|NonNegativeInteger|) (94 . >) (|Character|) (100 . |elt|)
              (106 . ~=) |SYMBOL;scripts;$R;33| (112 . |latex|)
              |SYMBOL;latex;$S;26| (117 . |minIndex|) (122 . |concat|)
              (128 . |elt|) (133 . |setelt|) |SYMBOL;new;$;28|
              (|Union| 6 '"failed") (139 . |search|) (145 . |setelt|)
              (152 . |maxIndex|) (157 . |position|) |SYMBOL;new;2$;29|
              (163 . |keys|) (168 . |remove!|) (174 . |void|)
              |SYMBOL;resetNew;V;30| |SYMBOL;list;$L;35| (178 . |first|)
              (183 . |digit?|) (|UniversalSegment| 6) (188 . SEGMENT)
              (194 . |elt|) (|List| 84) (200 . |minIndex|) (205 . |setelt|)
              (212 . |concat|) (218 . |rest|) (223 . |minIndex|) (228 . |#|)
              (233 . |first|) (239 . |setelt|) (246 . |rest|) (252 . |elt|)
              (258 . >)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |SYMBOL;sample;$;36|) $))
              (|SingleInteger|))
           '#(~= 264 |superscript| 270 |subscript| 276 |string| 282 |smaller?|
              287 |scripts| 293 |scripted?| 298 |script| 303 |sample| 315
              |resetNew| 319 |patternMatch| 323 |new| 337 |name| 346 |min| 351
              |max| 357 |list| 363 |latex| 368 |hashUpdate!| 373 |hash| 379
              |elt| 384 |convert| 390 |coerce| 410 |argscript| 420 |OMwrite|
              426 >= 450 > 456 = 462 <= 468 < 474)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL NIL NIL |SetCategory&| |BasicType&| NIL
                     NIL NIL NIL NIL |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|)
                      (|PatternMatchable| (|Float|)) (|PatternMatchable| 6)
                      (|SetCategory|) (|BasicType|) (|ConvertibleTo| 68)
                      (|ConvertibleTo| 62) (|ConvertibleTo| 23) (|OpenMath|)
                      (|ConvertibleTo| 40) (|PartialOrder|) (|CoercibleTo| 49))
                   (|makeByteWordVec2| 126
                                       '(1 7 0 6 8 0 10 0 11 1 14 0 13 15 2 24
                                         22 0 23 25 0 26 0 27 2 24 0 28 26 29 1
                                         24 22 0 30 1 24 22 0 31 1 24 22 0 32 1
                                         40 0 23 41 1 49 0 23 50 0 52 0 53 3 63
                                         61 23 62 61 64 3 69 67 23 68 67 70 1
                                         68 0 23 73 1 62 0 23 75 1 28 0 77 78 2
                                         56 0 0 0 79 2 84 20 0 0 85 2 28 86 0 6
                                         87 2 86 20 0 0 88 1 49 28 0 90 1 28 6
                                         0 92 2 28 0 86 0 93 1 7 6 0 94 2 7 6 0
                                         6 95 2 10 97 2 0 98 3 10 6 0 2 6 99 1
                                         28 6 0 100 2 28 6 86 0 101 1 10 52 0
                                         103 2 10 97 2 0 104 0 22 0 105 1 52 2
                                         0 108 1 86 20 0 109 2 110 0 6 6 111 2
                                         28 0 0 110 112 1 113 6 0 114 3 113 84
                                         0 6 84 115 2 113 0 0 84 116 1 52 0 0
                                         117 1 54 6 0 118 1 52 84 0 119 2 52 0
                                         0 84 120 3 54 56 0 6 56 121 2 52 0 0
                                         84 122 2 54 56 0 6 123 2 6 20 0 0 124
                                         2 0 20 0 0 1 2 0 0 0 56 59 2 0 0 0 56
                                         57 1 0 28 0 83 2 0 20 0 0 1 1 0 80 0
                                         89 1 0 20 0 21 2 0 0 0 54 55 2 0 0 0
                                         80 81 0 0 0 125 0 0 22 106 3 0 71 0 68
                                         71 72 3 0 65 0 62 65 66 0 0 0 96 1 0 0
                                         0 102 1 0 0 0 82 2 0 0 0 0 1 2 0 0 0 0
                                         1 1 0 77 0 107 1 0 28 0 91 2 0 46 46 0
                                         47 1 0 126 0 1 2 0 0 0 56 58 1 0 68 0
                                         74 1 0 23 0 43 1 0 62 0 76 1 0 40 0 42
                                         1 0 0 28 44 1 0 49 0 51 2 0 0 0 56 60
                                         3 0 22 24 0 20 36 2 0 28 0 20 34 2 0
                                         22 24 0 35 1 0 28 0 33 2 0 20 0 0 1 2
                                         0 20 0 0 1 2 0 20 0 0 45 2 0 20 0 0 1
                                         2 0 20 0 0 48)))))
           '|lookupComplete|)) 

(MAKEPROP '|Symbol| 'NILADIC T) 
