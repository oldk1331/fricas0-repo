
(SDEFUN |NUMFMT;replaceD| ((|c| |Character|) ($ |Character|))
        (COND ((|eql_SI| |c| (|STR_to_CHAR| "D")) (|STR_to_CHAR| "E"))
              ('T |c|))) 

(SDEFUN |NUMFMT;replaced| ((|c| |Character|) ($ |Character|))
        (COND ((|eql_SI| |c| (|STR_to_CHAR| "d")) (|STR_to_CHAR| "E"))
              ('T |c|))) 

(SDEFUN |NUMFMT;contract| ((|s| |String|) ($ |String|))
        (SPROG ((|ls| (|List| (|String|))))
               (SEQ
                (LETT |s|
                      (SPADCALL (CONS (|function| |NUMFMT;replaceD|) $) |s|
                                (QREFELT $ 8))
                      . #1=(|NUMFMT;contract|))
                (LETT |s|
                      (SPADCALL (CONS (|function| |NUMFMT;replaced|) $) |s|
                                (QREFELT $ 8))
                      . #1#)
                (LETT |ls| (SPADCALL |s| (|STR_to_CHAR| " ") (QREFELT $ 11))
                      . #1#)
                (EXIT (LETT |s| (SPADCALL |ls| (QREFELT $ 12)) . #1#))))) 

(SDEFUN |NUMFMT;check| ((|s| |String|) ($ |Boolean|))
        (COND
         ((NUMBERP (READ-FROM-STRING |s|))
          (COND
           ((SPADCALL (CONS #'|NUMFMT;check!0| $) |s| (QREFELT $ 17))
            (COND
             ((SPADCALL (CONS #'|NUMFMT;check!1| $) |s| (QREFELT $ 17)) 'T)
             (#1='T 'NIL)))
           (#1# 'T)))
         (#1# 'NIL))) 

(SDEFUN |NUMFMT;check!1| ((|c1| NIL) ($ NIL))
        (SPADCALL |c1| (SPADCALL "." (QREFELT $ 13)) (QREFELT $ 15))) 

(SDEFUN |NUMFMT;check!0| ((|c1| NIL) ($ NIL))
        (SPADCALL |c1| (SPADCALL "E" (QREFELT $ 13)) (QREFELT $ 15))) 

(SDEFUN |NUMFMT;ScanFloatIgnoreSpaces;SF;5| ((|s| |String|) ($ |Float|))
        (SPROG ((|f| (|Integer|)) (|sCheck| (|SExpression|)) (|sex| NIL))
               (SEQ
                (LETT |s| (|NUMFMT;contract| |s| $)
                      . #1=(|NUMFMT;ScanFloatIgnoreSpaces;SF;5|))
                (COND
                 ((NULL (|NUMFMT;check| |s| $))
                  (EXIT (|error| "Non-numeric value"))))
                (LETT |sex|
                      (|interpret| (|packageTran| (|ncParseFromString| |s|)))
                      . #1#)
                (LETT |sCheck|
                      (SPADCALL (SPADCALL |sex| (QREFELT $ 23)) (QREFELT $ 23))
                      . #1#)
                (EXIT
                 (COND
                  ((|BooleanEquality|
                    (SPADCALL |sCheck| (QREFELT $ 22) (QREFELT $ 24)) 'T)
                   (LETT |f|
                         (SPADCALL (SPADCALL |sex| (QREFELT $ 25))
                                   (QREFELT $ 25))
                         . #1#))
                  ((|BooleanEquality|
                    (SPADCALL (SPADCALL |sex| (QREFELT $ 25)) (QREFELT $ 26))
                    'T)
                   (SEQ (LETT |f| (SPADCALL |sex| (QREFELT $ 25)) . #1#)
                        (EXIT (SPADCALL |f| (QREFELT $ 29)))))
                  ('T (|error| "Non-numeric value"))))))) 

(SDEFUN |NUMFMT;ScanFloatIgnoreSpacesIfCan;SU;6|
        ((|s| |String|) ($ |Union| (|Float|) "failed"))
        (SPROG ((|f| (|Integer|)) (|sCheck| (|SExpression|)) (|sex| NIL))
               (SEQ
                (LETT |s| (|NUMFMT;contract| |s| $)
                      . #1=(|NUMFMT;ScanFloatIgnoreSpacesIfCan;SU;6|))
                (COND ((NULL (|NUMFMT;check| |s| $)) (EXIT (CONS 1 "failed"))))
                (LETT |sex|
                      (|interpret| (|packageTran| (|ncParseFromString| |s|)))
                      . #1#)
                (LETT |sCheck|
                      (SPADCALL (SPADCALL |sex| (QREFELT $ 23)) (QREFELT $ 23))
                      . #1#)
                (EXIT
                 (COND
                  ((|BooleanEquality|
                    (SPADCALL |sCheck| (QREFELT $ 22) (QREFELT $ 24)) 'T)
                   (LETT |f|
                         (CONS 0
                               (SPADCALL (SPADCALL |sex| (QREFELT $ 25))
                                         (QREFELT $ 25)))
                         . #1#))
                  ((|BooleanEquality|
                    (SPADCALL (SPADCALL |sex| (QREFELT $ 25)) (QREFELT $ 26))
                    'T)
                   (SEQ (LETT |f| (SPADCALL |sex| (QREFELT $ 25)) . #1#)
                        (EXIT (CONS 0 (SPADCALL |f| (QREFELT $ 29))))))
                  ('T (CONS 1 "failed"))))))) 

(PUT '|NUMFMT;FormatArabic;PiS;7| '|SPADreplace| 'STRINGIMAGE) 

(SDEFUN |NUMFMT;FormatArabic;PiS;7| ((|n| |PositiveInteger|) ($ |String|))
        (STRINGIMAGE |n|)) 

(PUT '|NUMFMT;ScanArabic;SPi;8| '|SPADreplace| 'PARSE-INTEGER) 

(SDEFUN |NUMFMT;ScanArabic;SPi;8| ((|s| |String|) ($ |PositiveInteger|))
        (PARSE-INTEGER |s|)) 

(SDEFUN |NUMFMT;FormatRoman;PiS;9| ((|pn| |PositiveInteger|) ($ |String|))
        (SPROG
         ((|s| (|String|)) (|mm| (|String|)) (|j| NIL) (#1=#:G168 NIL)
          (|m0| (|String|)) (|n| (|Integer|)) (|d| (|Integer|)) (|i| NIL)
          (#2=#:G155 NIL))
         (SEQ (LETT |n| |pn| . #3=(|NUMFMT;FormatRoman;PiS;9|))
              (LETT |d| (+ (REM |n| 10) (QREFELT $ 39)) . #3#)
              (LETT |n| (QUOTIENT2 |n| 10) . #3#)
              (LETT |s| (QAREF1 (QREFELT $ 36) |d|) . #3#)
              (EXIT
               (COND ((ZEROP |n|) |s|)
                     (#4='T
                      (SEQ (LETT |d| (+ (REM |n| 10) (QREFELT $ 40)) . #3#)
                           (LETT |n| (QUOTIENT2 |n| 10) . #3#)
                           (LETT |s| (STRCONC (QAREF1 (QREFELT $ 37) |d|) |s|)
                                 . #3#)
                           (EXIT
                            (COND ((ZEROP |n|) |s|)
                                  (#4#
                                   (SEQ
                                    (LETT |d| (+ (REM |n| 10) (QREFELT $ 41))
                                          . #3#)
                                    (LETT |n| (QUOTIENT2 |n| 10) . #3#)
                                    (LETT |s|
                                          (STRCONC (QAREF1 (QREFELT $ 38) |d|)
                                                   |s|)
                                          . #3#)
                                    (EXIT
                                     (COND ((ZEROP |n|) |s|)
                                           (#4#
                                            (SEQ (LETT |d| (REM |n| 10) . #3#)
                                                 (LETT |n| (QUOTIENT2 |n| 10)
                                                       . #3#)
                                                 (LETT |s|
                                                       (STRCONC
                                                        (|make_full_CVEC|
                                                         (PROG1
                                                             (LETT #2# |d|
                                                                   . #3#)
                                                           (|check_subtype|
                                                            (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            #2#))
                                                         (QREFELT $ 43))
                                                        |s|)
                                                       . #3#)
                                                 (EXIT
                                                  (COND ((ZEROP |n|) |s|)
                                                        (#4#
                                                         (SEQ
                                                          (SEQ
                                                           (LETT |i| 2 . #3#)
                                                           G190
                                                           (COND
                                                            ((NULL
                                                              (COND
                                                               ((ZEROP |n|)
                                                                'NIL)
                                                               ('T 'T)))
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |d|
                                                                  (REM |n| 10)
                                                                  . #3#)
                                                            (LETT |n|
                                                                  (QUOTIENT2
                                                                   |n| 10)
                                                                  . #3#)
                                                            (EXIT
                                                             (COND
                                                              ((ZEROP |d|)
                                                               "iterate")
                                                              ('T
                                                               (SEQ
                                                                (LETT |m0|
                                                                      (STRCONC
                                                                       (|make_full_CVEC|
                                                                        |i|
                                                                        (QREFELT
                                                                         $ 44))
                                                                       (STRCONC
                                                                        "I"
                                                                        (|make_full_CVEC|
                                                                         |i|
                                                                         (QREFELT
                                                                          $
                                                                          45))))
                                                                      . #3#)
                                                                (LETT |mm|
                                                                      (SPADCALL
                                                                       (PROGN
                                                                        (LETT
                                                                         #1#
                                                                         NIL
                                                                         . #3#)
                                                                        (SEQ
                                                                         (LETT
                                                                          |j| 1
                                                                          . #3#)
                                                                         G190
                                                                         (COND
                                                                          ((|greater_SI|
                                                                            |j|
                                                                            |d|)
                                                                           (GO
                                                                            G191)))
                                                                         (SEQ
                                                                          (EXIT
                                                                           (LETT
                                                                            #1#
                                                                            (CONS
                                                                             |m0|
                                                                             #1#)
                                                                            . #3#)))
                                                                         (LETT
                                                                          |j|
                                                                          (|inc_SI|
                                                                           |j|)
                                                                          . #3#)
                                                                         (GO
                                                                          G190)
                                                                         G191
                                                                         (EXIT
                                                                          (NREVERSE
                                                                           #1#))))
                                                                       (QREFELT
                                                                        $ 12))
                                                                      . #3#)
                                                                (COND
                                                                 ((SPADCALL
                                                                   (QCSIZE |s|)
                                                                   0
                                                                   (QREFELT $
                                                                            51))
                                                                  (LETT |s|
                                                                        (STRCONC
                                                                         " "
                                                                         |s|)
                                                                        . #3#)))
                                                                (EXIT
                                                                 (LETT |s|
                                                                       (STRCONC
                                                                        |mm|
                                                                        |s|)
                                                                       . #3#)))))))
                                                           (LETT |i|
                                                                 (|inc_SI| |i|)
                                                                 . #3#)
                                                           (GO G190) G191
                                                           (EXIT NIL))
                                                          (EXIT
                                                           |s|)))))))))))))))))))) 

(SDEFUN |NUMFMT;ScanRoman;SPi;10| ((|s| |String|) ($ |PositiveInteger|))
        (SPROG
         ((#1=#:G179 NIL) (|Max| (|Integer|)) (|tot| (|Integer|))
          (|n| (|Integer|)) (#2=#:G171 NIL) (|i| (|Integer|))
          (|c| (|Character|)) (|k| NIL) (|nprens| (|PositiveInteger|)))
         (SEQ
          (LETT |s| (SPADCALL |s| (QREFELT $ 53))
                . #3=(|NUMFMT;ScanRoman;SPi;10|))
          (LETT |tot| 0 . #3#) (LETT |Max| 0 . #3#)
          (LETT |i| (SPADCALL |s| (QREFELT $ 54)) . #3#)
          (SEQ G190
               (COND ((NULL (>= |i| (SPADCALL |s| (QREFELT $ 55)))) (GO G191)))
               (SEQ (LETT |c| (SPADCALL |s| |i| (QREFELT $ 56)) . #3#)
                    (LETT |i| (- |i| 1) . #3#)
                    (LETT |n| (QAREF1 (QREFELT $ 42) |c|) . #3#)
                    (COND
                     ((< |n| 0)
                      (COND
                       ((SPADCALL |c| (QREFELT $ 45) (QREFELT $ 57))
                        (|error|
                         (LIST "Improper character in Roman numeral: "
                               (SPADCALL |c| (QREFELT $ 59)))))
                       ('T
                        (SEQ (LETT |nprens| 1 . #3#)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND
                                      ((|eql_SI| |c| (QREFELT $ 45))
                                       (>= |i| (SPADCALL |s| (QREFELT $ 55))))
                                      ('T 'NIL)))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |c| (SPADCALL |s| |i| (QREFELT $ 56))
                                         . #3#)
                                   (LETT |i| (- |i| 1) . #3#)
                                   (EXIT
                                    (COND
                                     ((|eql_SI| |c| (QREFELT $ 45))
                                      (LETT |nprens| (+ |nprens| 1) . #3#)))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (EXIT
                              (COND
                               ((SPADCALL |c| (QREFELT $ 46) (QREFELT $ 57))
                                (|error| "Improper Roman numeral: (x)"))
                               ('T
                                (SEQ
                                 (SEQ (LETT |k| 1 . #3#) G190
                                      (COND
                                       ((OR (|greater_SI| |k| |nprens|)
                                            (NULL
                                             (>= |i|
                                                 (SPADCALL |s|
                                                           (QREFELT $ 55)))))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SEQ
                                         (LETT |c|
                                               (SPADCALL |s| |i|
                                                         (QREFELT $ 56))
                                               . #3#)
                                         (LETT |i| (- |i| 1) . #3#)
                                         (EXIT
                                          (COND
                                           ((SPADCALL |c| (QREFELT $ 44)
                                                      (QREFELT $ 57))
                                            (PROGN
                                             (LETT #2#
                                                   (|error|
                                                    "Improper Roman numeral: unbalanced ')'")
                                                   . #3#)
                                             (GO #2#)))))))
                                       #2# (EXIT #2#))
                                      (LETT |k| (|inc_SI| |k|) . #3#) (GO G190)
                                      G191 (EXIT NIL))
                                 (EXIT
                                  (LETT |n|
                                        (SPADCALL 10 (+ |nprens| 2)
                                                  (QREFELT $ 60))
                                        . #3#)))))))))))
                    (EXIT
                     (COND ((< |n| |Max|) (LETT |tot| (- |tot| |n|) . #3#))
                           ('T
                            (SEQ (LETT |tot| (+ |tot| |n|) . #3#)
                                 (EXIT (LETT |Max| |n| . #3#)))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((< |tot| 0)
             (|error|
              (LIST "Improper Roman numeral: "
                    (SPADCALL |tot| (QREFELT $ 61)))))
            ('T
             (PROG1 (LETT #1# |tot| . #3#)
               (|check_subtype| (> #1# 0) '(|PositiveInteger|) #1#)))))))) 

(DECLAIM (NOTINLINE |NumberFormats;|)) 

(DEFUN |NumberFormats| ()
  (SPROG NIL
         (PROG (#1=#:G183)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|NumberFormats|)
                    . #2=(|NumberFormats|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|NumberFormats|
                             (LIST (CONS NIL (CONS 1 (|NumberFormats;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|NumberFormats|)))))))))) 

(DEFUN |NumberFormats;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|NumberFormats|) . #1=(|NumberFormats|))
          (LETT $ (GETREFV 63) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|NumberFormats| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 22
                    (SPADCALL (SPADCALL "Float" (QREFELT $ 19))
                              (QREFELT $ 21)))
          (QSETREFV $ 36
                    (SPADCALL
                     (LIST #2="" #3="I" "II" "III" "IV" #4="V" "VI" "VII"
                           "VIII" "IX")
                     (QREFELT $ 35)))
          (QSETREFV $ 37
                    (SPADCALL
                     (LIST #2# #5="X" "XX" "XXX" "XL" #6="L" "LX" "LXX" "LXXX"
                           "XC")
                     (QREFELT $ 35)))
          (QSETREFV $ 38
                    (SPADCALL
                     (LIST #2# #7="C" "CC" "CCC" "CD" #8="D" "DC" "DCC" "DCCC"
                           "CM")
                     (QREFELT $ 35)))
          (QSETREFV $ 39 0)
          (QSETREFV $ 40 0)
          (QSETREFV $ 41 0)
          (QSETREFV $ 42 (MAKEARR1 256 -1))
          (QSETAREF1 (QREFELT $ 42) (|STR_to_CHAR| " ") 0)
          (QSETAREF1 (QREFELT $ 42) (|STR_to_CHAR| #3#) 1)
          (QSETAREF1 (QREFELT $ 42) (|STR_to_CHAR| #4#) 5)
          (QSETAREF1 (QREFELT $ 42) (|STR_to_CHAR| #5#) 10)
          (QSETAREF1 (QREFELT $ 42) (|STR_to_CHAR| #6#) 50)
          (QSETAREF1 (QREFELT $ 42) (|STR_to_CHAR| #7#) 100)
          (QSETAREF1 (QREFELT $ 42) (|STR_to_CHAR| #8#) 500)
          (QSETAREF1 (QREFELT $ 42) (|STR_to_CHAR| #9="M") 1000)
          (QSETREFV $ 43 (|STR_to_CHAR| #9#))
          (QSETREFV $ 44 (|STR_to_CHAR| "("))
          (QSETREFV $ 45 (|STR_to_CHAR| ")"))
          (QSETREFV $ 46 (|STR_to_CHAR| #3#))
          $))) 

(MAKEPROP '|NumberFormats| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Mapping| 10 10) (|String|) (0 . |map|)
              (|List| $) (|Character|) (6 . |split|) (12 . |concat|)
              (17 . |char|) (|Boolean|) (22 . =) (|Mapping| 14 10)
              (28 . |any?|) (|Symbol|) (34 . |coerce|) (|SExpression|)
              (39 . |convert|) '|sexfloat| (44 . |car|) (49 . =) (55 . |cdr|)
              (60 . |integer?|) (|Integer|) (|Float|) (65 . |coerce|)
              |NUMFMT;ScanFloatIgnoreSpaces;SF;5| (|Union| 28 '"failed")
              |NUMFMT;ScanFloatIgnoreSpacesIfCan;SU;6| (|List| 7)
              (|PrimitiveArray| 7) (70 . |construct|) '|units| '|tens| '|hunds|
              '|umin| '|tmin| '|hmin| '|romval| '|thou| '|plen| '|pren|
              '|ichar| (|PositiveInteger|) |NUMFMT;FormatArabic;PiS;7|
              |NUMFMT;ScanArabic;SPi;8| (|NonNegativeInteger|) (75 . >)
              |NUMFMT;FormatRoman;PiS;9| (81 . |upperCase|) (86 . |maxIndex|)
              (91 . |minIndex|) (96 . |elt|) (102 . ~=) (|OutputForm|)
              (108 . |coerce|) (113 . ^) (119 . |coerce|)
              |NUMFMT;ScanRoman;SPi;10|)
           '#(|ScanRoman| 124 |ScanFloatIgnoreSpacesIfCan| 129
              |ScanFloatIgnoreSpaces| 134 |ScanArabic| 139 |FormatRoman| 144
              |FormatArabic| 149)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 62
                                                 '(2 7 0 6 0 8 2 7 9 0 10 11 1
                                                   7 0 9 12 1 10 0 7 13 2 10 14
                                                   0 0 15 2 7 14 16 0 17 1 18 0
                                                   7 19 1 20 0 18 21 1 20 0 0
                                                   23 2 20 14 0 0 24 1 20 0 0
                                                   25 1 20 14 0 26 1 28 0 27 29
                                                   1 34 0 33 35 2 50 14 0 0 51
                                                   1 7 0 0 53 1 7 27 0 54 1 7
                                                   27 0 55 2 7 10 0 27 56 2 10
                                                   14 0 0 57 1 10 58 0 59 2 47
                                                   0 0 47 60 1 27 58 0 61 1 0
                                                   47 7 62 1 0 31 7 32 1 0 28 7
                                                   30 1 0 47 7 49 1 0 7 47 52 1
                                                   0 7 47 48)))))
           '|lookupComplete|)) 

(MAKEPROP '|NumberFormats| 'NILADIC T) 
