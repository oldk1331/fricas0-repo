
(/VERSIONCHECK 2) 

(DEFUN |DERHAM;totalDifferential;E$;1| (|f| $)
  (PROG (|divs| #1=#:G133 |i| #2=#:G132)
    (RETURN
     (SEQ
      (LETT |divs|
            (PROGN
             (LETT #2# NIL . #3=(|DERHAM;totalDifferential;E$;1|))
             (SEQ (LETT |i| 1 . #3#) (LETT #1# (QREFELT $ 9) . #3#) G190
                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2#
                          (CONS
                           (SPADCALL
                            (SPADCALL |f|
                                      (SPADCALL (QREFELT $ 7) |i|
                                                (QREFELT $ 13))
                                      (QREFELT $ 15))
                            (SPADCALL |i| (QREFELT $ 17)) (QREFELT $ 18))
                           #2#)
                          . #3#)))
                  (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            . #3#)
      (EXIT (SPADCALL (ELT $ 19) |divs| (QREFELT $ 22))))))) 

(DEFUN |DERHAM;termDiff| (|r| |e| $)
  (SPADCALL (SPADCALL |r| (QREFELT $ 23)) |e| (QREFELT $ 24))) 

(DEFUN |DERHAM;exteriorDifferential;2$;3| (|x| $)
  (COND
   ((SPADCALL |x| (|spadConstant| $ 25) (QREFELT $ 28)) (|spadConstant| $ 25))
   ('T
    (SPADCALL
     (|DERHAM;termDiff| (SPADCALL |x| (QREFELT $ 29))
      (SPADCALL |x| (QREFELT $ 30)) $)
     (SPADCALL (SPADCALL |x| (QREFELT $ 31)) (QREFELT $ 32)) (QREFELT $ 19))))) 

(DEFUN |DERHAM;displayList| (|x| $)
  (PROG (#1=#:G143 |i| #2=#:G142 |le|)
    (RETURN
     (SEQ (LETT |le| (SPADCALL |x| (QREFELT $ 39)) . #3=(|DERHAM;displayList|))
          (EXIT
           (SPADCALL (ELT $ 41)
                     (PROGN
                      (LETT #2# NIL . #3#)
                      (SEQ (LETT |i| 1 . #3#) (LETT #1# (QREFELT $ 9) . #3#)
                           G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((EQL (SPADCALL |le| |i| (QREFELT $ 42)) 1)
                               (LETT #2#
                                     (CONS
                                      (SPADCALL
                                       (SPADCALL (QREFELT $ 36) |i|
                                                 (QREFELT $ 13))
                                       (QREFELT $ 43))
                                      #2#)
                                     . #3#)))))
                           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 46))))))) 

(DEFUN |DERHAM;makeTerm| (|r| |x| $)
  (COND
   ((SPADCALL |x| (SPADCALL (QREFELT $ 9) (QREFELT $ 47)) (QREFELT $ 48))
    (SPADCALL |r| (QREFELT $ 49)))
   ((SPADCALL |r| (|spadConstant| $ 52) (QREFELT $ 53))
    (|DERHAM;displayList| |x| $))
   ('T
    (SPADCALL (SPADCALL |r| (QREFELT $ 49)) (|DERHAM;displayList| |x| $)
              (QREFELT $ 41))))) 

(PUT '|DERHAM;terms| '|SPADreplace| '(XLAM (|a|) |a|)) 

(DEFUN |DERHAM;terms| (|a| $) |a|) 

(DEFUN |DERHAM;coerce;$Of;7| (|a| $)
  (PROG (#1=#:G155 |t| #2=#:G154 |ta|)
    (RETURN
     (SEQ
      (COND
       ((SPADCALL |a| (|spadConstant| $ 54) (QREFELT $ 28))
        (SPADCALL 0 (QREFELT $ 55)))
       (#3='T
        (SEQ (LETT |ta| (|DERHAM;terms| |a| $) . #4=(|DERHAM;coerce;$Of;7|))
             (EXIT
              (COND
               ((NULL (CDR |ta|))
                (|DERHAM;makeTerm| (QCDR (|SPADfirst| |ta|))
                 (QCAR (|SPADfirst| |ta|)) $))
               (#3#
                (SPADCALL (ELT $ 56)
                          (PROGN
                           (LETT #2# NIL . #4#)
                           (SEQ (LETT |t| NIL . #4#) (LETT #1# |ta| . #4#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |t| (CAR #1#) . #4#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (|DERHAM;makeTerm| (QCDR |t|)
                                          (QCAR |t|) $)
                                         #2#)
                                        . #4#)))
                                (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 46)))))))))))) 

(DEFUN |DeRhamComplex| (&REST #1=#:G165)
  (PROG ()
    (RETURN
     (PROG (#2=#:G166)
       (RETURN
        (COND
         ((LETT #2#
                (|lassocShiftWithFunction| (|devaluateList| #1#)
                                           (HGET |$ConstructorCache|
                                                 '|DeRhamComplex|)
                                           '|domainEqualList|)
                . #3=(|DeRhamComplex|))
          (|CDRwithIncrement| #2#))
         ('T
          (UNWIND-PROTECT
              (PROG1 (APPLY (|function| |DeRhamComplex;|) #1#)
                (LETT #2# T . #3#))
            (COND
             ((NOT #2#) (HREM |$ConstructorCache| '|DeRhamComplex|))))))))))) 

(DEFUN |DeRhamComplex;| (|#1| |#2|)
  (PROG (#1=#:G164 |liv| #2=#:G163 |pv$| $ |dv$| DV$2 DV$1)
    (RETURN
     (SEQ
      (PROGN
       (LETT DV$1 (|devaluate| |#1|) . #3=(|DeRhamComplex|))
       (LETT DV$2 (|devaluate| |#2|) . #3#)
       (LETT |dv$| (LIST '|DeRhamComplex| DV$1 DV$2) . #3#)
       (LETT $ (GETREFV 63) . #3#)
       (QSETREFV $ 0 |dv$|)
       (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #3#))
       (|haddProp| |$ConstructorCache| '|DeRhamComplex| (LIST DV$1 DV$2)
                   (CONS 1 $))
       (|stuffDomainSlots| $)
       (QSETREFV $ 6 |#1|)
       (QSETREFV $ 7 |#2|)
       (SETF |pv$| (QREFELT $ 3))
       (QSETREFV $ 8 (|AntiSymm| (|Expression| |#1|) |#2|))
       (QSETREFV $ 9 (LENGTH |#2|))
       (QSETREFV $ 36
                 (PROGN
                  (LETT #2# NIL . #3#)
                  (SEQ (LETT |liv| NIL . #3#) (LETT #1# |#2| . #3#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |liv| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL
                                 (STRCONC "d" (SPADCALL |liv| (QREFELT $ 34)))
                                 (QREFELT $ 35))
                                #2#)
                               . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#)))))
       $))))) 

(MAKEPROP '|DeRhamComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|AntiSymm| 14 7) (|local| |#1|)
              (|local| |#2|) '|Rep| '|dim| (|Symbol|) (|Integer|) (|List| 10)
              (0 . |elt|) (|Expression| 6) (6 . |differentiate|)
              (|NonNegativeInteger|) (12 . |generator|) (17 . *) (23 . +)
              (|Mapping| $$ $$ $$) (|List| $$) (29 . |reduce|)
              |DERHAM;totalDifferential;E$;1| (35 . *) (41 . |Zero|)
              (45 . |Zero|) (|Boolean|) (49 . =) (55 . |leadingCoefficient|)
              (60 . |leadingBasisTerm|) (65 . |reductum|)
              |DERHAM;exteriorDifferential;2$;3| (|String|) (70 . |string|)
              (75 . |coerce|) '|lv| (|List| 11) (|ExtAlgBasis|)
              (80 . |exponents|) (|OutputForm|) (85 . *) (91 . |elt|)
              (97 . |coerce|) (|Mapping| 40 40 40) (|List| 40) (102 . |reduce|)
              (108 . |Nul|) (113 . =) (119 . |coerce|) (124 . |One|)
              (128 . |One|) (132 . |One|) (136 . =) (142 . |Zero|)
              (146 . |coerce|) (151 . +) |DERHAM;coerce;$Of;7|
              (|Mapping| 14 14) (|Union| 14 '"failed") (|Union| $ '"failed")
              (|PositiveInteger|) (|SingleInteger|))
           '#(~= 157 |zero?| 163 |totalDifferential| 168 |subtractIfCan| 173
              |sample| 179 |retractable?| 183 |retractIfCan| 188 |retract| 193
              |reductum| 198 |recip| 203 |one?| 208 |map| 213
              |leadingCoefficient| 219 |leadingBasisTerm| 224 |latex| 229
              |homogeneous?| 234 |hash| 239 |generator| 244
              |exteriorDifferential| 249 |degree| 254 |coerce| 259
              |coefficient| 274 |characteristic| 280 ^ 284 |Zero| 296 |One| 300
              = 304 - 310 + 321 * 327)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|LeftAlgebra&| |Ring&| NIL NIL NIL |AbelianGroup&| NIL NIL
                     |AbelianMonoid&| |Monoid&| NIL |SemiGroup&|
                     |AbelianSemiGroup&| |SetCategory&| |RetractableTo&| NIL
                     |BasicType&| NIL)
                  (CONS
                   '#((|LeftAlgebra| (|Expression| 6)) (|Ring|) (|Rng|)
                      (|LeftModule| (|Expression| 6)) (|LeftModule| $$)
                      (|AbelianGroup|) (|CancellationAbelianMonoid|)
                      (|SemiRing|) (|AbelianMonoid|) (|Monoid|) (|SemiRng|)
                      (|SemiGroup|) (|AbelianSemiGroup|) (|SetCategory|)
                      (|RetractableTo| (|Expression| 6)) (|unitsKnown|)
                      (|BasicType|) (|CoercibleTo| 40))
                   (|makeByteWordVec2| 62
                                       '(2 12 10 0 11 13 2 14 0 0 10 15 1 5 0
                                         16 17 2 0 0 14 0 18 2 0 0 0 0 19 2 21
                                         2 20 0 22 2 0 0 0 0 24 0 0 0 25 0 6 0
                                         26 2 0 27 0 0 28 1 8 14 0 29 1 0 0 0
                                         30 1 0 0 0 31 1 10 33 0 34 1 10 0 33
                                         35 1 38 37 0 39 2 40 0 0 0 41 2 37 11
                                         0 11 42 1 10 40 0 43 2 45 40 44 0 46 1
                                         38 0 16 47 2 38 27 0 0 48 1 14 40 0 49
                                         0 0 0 50 0 6 0 51 0 14 0 52 2 14 27 0
                                         0 53 0 8 0 54 1 11 40 0 55 2 40 0 0 0
                                         56 2 0 27 0 0 1 1 0 27 0 1 1 0 0 14 23
                                         2 0 60 0 0 1 0 0 0 1 1 0 27 0 1 1 0 59
                                         0 1 1 0 14 0 1 1 0 0 0 31 1 0 60 0 1 1
                                         0 27 0 1 2 0 0 58 0 1 1 0 14 0 1 1 0 0
                                         0 30 1 0 33 0 1 1 0 27 0 1 1 0 62 0 1
                                         1 0 0 16 1 1 0 0 0 32 1 0 11 0 1 1 0 0
                                         14 1 1 0 0 11 1 1 0 40 0 57 2 0 14 0 0
                                         1 0 0 16 1 2 0 0 0 16 1 2 0 0 0 61 1 0
                                         0 0 25 0 0 0 50 2 0 27 0 0 28 2 0 0 0
                                         0 1 1 0 0 0 1 2 0 0 0 0 19 2 0 0 14 0
                                         18 2 0 0 0 0 24 2 0 0 11 0 1 2 0 0 16
                                         0 1 2 0 0 61 0 1)))))
           '|lookupComplete|)) 
